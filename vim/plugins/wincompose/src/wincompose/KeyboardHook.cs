﻿//
//  WinCompose — a compose key for Windows — http://wincompose.info/
//
//  Copyright © 2013—2021 Sam Hocevar <sam@hocevar.net>
//              2014—2015 Benjamin Litzelmann
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

using System;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.Threading;
using System.Windows.Threading;

namespace WinCompose
{

static class KeyboardHook
{
    public static void Init()
    {
        var thread = new Thread(KeyboardThread);
        thread.IsBackground = true;
        thread.SetApartmentState(ApartmentState.STA);
        thread.Start();
    }

    public static void Fini()
    {
        m_check_timer?.Stop();
        m_check_timer = null;
        CheckHook(must_reinstall: false);
        Dispatcher.CurrentDispatcher.InvokeShutdown();
    }

    private static void KeyboardThread()
    {
        // Since the Composer uses a DispatcherTimer, we need to be the ones
        // initialising that class from our STA thread.
        Composer.Init();

        if (Environment.OSVersion.Platform == PlatformID.Win32NT
             || Environment.OSVersion.Platform == PlatformID.Win32S
             || Environment.OSVersion.Platform == PlatformID.Win32Windows
             || Environment.OSVersion.Platform == PlatformID.WinCE)
        {
            CheckHook(must_reinstall: true);

            // Create a timer to regularly check our hook
            m_check_timer = new DispatcherTimer() { Interval = TimeSpan.FromSeconds(5) };
            m_check_timer.Tick += (o, e) => CheckHook(must_reinstall: true);
            m_check_timer.Start();
        }

        Dispatcher.Run();
        Composer.Fini();
    }

    private static void CheckHook(bool must_reinstall)
    {
        HOOK old_hook = m_hook;

        // Reinstall the hook in case Windows disabled it without telling us. It’s
        // OK to have two hooks installed for a short time, because we check for
        // recursive calls to ourselves in OnKey().
        if (must_reinstall)
        {
            m_hook = NativeMethods.SetWindowsHookEx(WH.KEYBOARD_LL, m_callback,
                                   NativeMethods.LoadLibrary("user32.dll"), 0);
            if (m_hook == HOOK.INVALID)
            {
                Logger.Warn(new Win32Exception(Marshal.GetLastWin32Error()),
                            "Unable to install hook");
            }
        }
        else
        {
            m_hook = HOOK.INVALID;
        }

        if (old_hook != HOOK.INVALID)
        {
            // XXX: this will crash if the hook is not removed from the same
            // thread that installed it.
            int ret = NativeMethods.UnhookWindowsHookEx(old_hook);

            if (ret == 0)
            {
                Logger.Warn(new Win32Exception(Marshal.GetLastWin32Error()),
                            "Unable to uninstall hook");
            }
        }
    }

    private static DispatcherTimer m_check_timer;

    // Keep an explicit reference on the CALLBACK object created because
    // SetWindowsHookEx will not prevent it from being GCed.
    private static CALLBACK m_callback = new CALLBACK(OnKey);

    private static HOOK m_hook = HOOK.INVALID;

    /// <summary>
    /// Check whether OnKey is called twice for the same event. This may
    /// happen when two hooks are installed.
    /// </summary>
    private static int m_duplicate = 0;

    /// <summary>
    /// Check whether OnKey is called from itself. This may happen when
    /// configured to accept injected keys and outputing a very long sequence.
    /// </summary>
    private static int m_recursive = 0;

    private static int OnKey(HC nCode, WM wParam, IntPtr lParam)
    {
        bool is_key = (wParam == WM.KEYDOWN || wParam == WM.SYSKEYDOWN
                        || wParam == WM.KEYUP || wParam == WM.SYSKEYUP);

        if (m_duplicate != 0)
        {
            // Do nothing. We can only get here if a key is pressed during
            // the very short time where we have two hooks installed, i.e.
            // practically never, but it’s better to handle this properly.
        }
        else if (nCode == HC.ACTION && is_key)
        {
            // Retrieve key event data from native structure
            var data = (KBDLLHOOKSTRUCT)Marshal.PtrToStructure(lParam,
                                                      typeof(KBDLLHOOKSTRUCT));
            bool is_injected = (data.flags & LLKHF.INJECTED) != 0;
            bool accept = !is_injected || (Settings.AllowInjected.Value && m_recursive == 0);

            Logger.Debug("{0}{1}: OnKey(HC.{2}, WM.{3}, [vk:0x{4:X02} ({7}) sc:0x{5:X02} flags:{6}])",
                         accept ? "" : "Ignored ", is_injected ? "Injected Event" : "Event",
                         nCode, wParam, (int)data.vk, (int)data.sc, data.flags, new Key(data.vk));

            if (accept)
            {
                ++m_recursive;
                bool processed = Composer.OnKey(wParam, data.vk, data.sc, data.flags);
                --m_recursive;

                if (processed)
                    return -1; // Do not process further: that key was for us.
            }
        }
        else
        {
            Logger.Debug("Ignored Event: OnKey({0}, {1})", nCode, wParam);
        }

        // Call next hook but guard against re-doing our own work in case we
        // were installed twice.
        ++m_duplicate;
        int ret = NativeMethods.CallNextHookEx(m_hook, nCode, wParam, lParam);
        --m_duplicate;

        return ret;
    }

    private static NLog.ILogger Logger = NLog.LogManager.GetCurrentClassLogger();
}

}
