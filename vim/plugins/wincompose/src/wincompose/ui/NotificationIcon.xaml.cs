﻿//
//  WinCompose — a compose key for Windows — http://wincompose.info/
//
//  Copyright © 2013—2021 Sam Hocevar <sam@hocevar.net>
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Threading;

using Hardcodet.Wpf.TaskbarNotification;

namespace WinCompose
{
    /// <summary>
    /// All possible commands that the notification area menu can execute
    /// </summary>
    public enum MenuCommand
    {
        ShowSequences,
        ShowOptions,
        About,
        DebugWindow,
        VisitWebsite,
        DonationPage,
        Download,
        Exit,
    }

    /// <summary>
    /// Interaction logic for NotificationIcon.xaml
    /// </summary>
    public partial class NotificationIcon : TaskbarIcon, INotifyPropertyChanged, IDisposable
    {
        public NotificationIcon()
        {
            InitializeComponent();
            Loaded += OnLoaded;
        }

        private void OnLoaded(object sender, RoutedEventArgs args)
        {
            Application.RemoteControl.ExitEvent += OnExitEvent;
            Application.RemoteControl.OpenEvent += OnOpenEvent;

            TrayMouseDoubleClick += NotifyiconDoubleclicked;

            // Opt-in only, as this feature is a bit controversial
            if (Settings.KeepIconVisible.Value)
                NotificationArea.AlwaysShow("wincompose[.]exe");

            // This one is a bit safer
            m_cleanup_timer = new DispatcherTimer() { Interval = TimeSpan.FromSeconds(30) };
            m_cleanup_timer.Tick += (o, e) => CleanupNotificationArea();
            m_cleanup_timer.Start();
            CleanupNotificationArea();

            Settings.DisableIcon.ValueChanged += MarkIconDirty;
            Composer.Changed += MarkIconDirty;
            Updater.Changed += MarkIconDirty;
            MarkIconDirty();

            Updater.Changed += UpdaterStateChanged;
            UpdaterStateChanged();

            CompositionTarget.Rendering += UpdateNotificationIcon;
        }

        public new void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
            base.Dispose();
        }

        protected virtual void Dispose(bool disposing)
        {
            CompositionTarget.Rendering -= UpdateNotificationIcon;

            Composer.Changed -= MarkIconDirty;
            Updater.Changed -= MarkIconDirty;
            Updater.Changed -= UpdaterStateChanged;

            Application.RemoteControl.ExitEvent -= OnExitEvent;
            Application.RemoteControl.OpenEvent -= OnOpenEvent;

            Visibility = Visibility.Collapsed;

            m_cleanup_timer?.Stop();
            m_cleanup_timer = null;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        public ICommand MenuItemCommand
        {
            get { return m_menu_item_command ?? (m_menu_item_command = new DelegateCommand(OnCommand)); }
        }

        private DelegateCommand m_menu_item_command;

        private void OnCommand(object o)
        {
            switch (o as MenuCommand?)
            {
                case MenuCommand.ShowSequences:
                    m_sequencewindow = m_sequencewindow ?? new SequenceWindow();
                    m_sequencewindow.Show();
                    m_sequencewindow.Activate();
                    break;

                case MenuCommand.ShowOptions:
                    m_optionswindow = m_optionswindow ?? new SettingsWindow();
                    m_optionswindow.Show();
                    m_optionswindow.Activate();
                    break;

                case MenuCommand.DebugWindow:
                    m_debugwindow = m_debugwindow ?? new DebugWindow();
                    m_debugwindow.Show();
                    m_debugwindow.Activate();
                    break;

                case MenuCommand.About:
                    m_about_box = m_about_box ?? new AboutBox();
                    m_about_box.Show();
                    m_about_box.Activate();
                    break;

                case MenuCommand.Download:
                    var url = Utils.IsInstalled ? Updater.Get("Installer")
                                                : Updater.Get("Portable");
                    Process.Start(url);
                    break;

                case MenuCommand.VisitWebsite:
                    Process.Start("http://wincompose.info/");
                    break;

                case MenuCommand.DonationPage:
                    Process.Start("http://wincompose.info/donate/");
                    break;

                case MenuCommand.Exit:
                    Application.Current.Shutdown();
                    break;
            }
        }

        private DispatcherTimer m_cleanup_timer;

        private void CleanupNotificationArea()
        {
            // Disable this feature after 60 seconds of user inactivity
            if (Stfu.User.IdleTime.TotalSeconds > 60)
                return;

            // Parse the window hierarchy to find the notification area and
            // send mouse move events to get rid of zombie icons.
            string[] classes = { "Shell_TrayWnd", "TrayNotifyWnd", "SysPager" };
            string[] names = { "User Promoted Notification Area", "Notification Area" };

            IntPtr window = IntPtr.Zero;
            foreach (var win_class in classes)
                window = NativeMethods.FindWindowEx(window, IntPtr.Zero, win_class, "");

            foreach (var win_name in names)
            {
                var area = NativeMethods.FindWindowEx(window, IntPtr.Zero,
                                                  "ToolbarWindow32", win_name);
                if (area == IntPtr.Zero)
                    continue;

                RECT rect;
                NativeMethods.GetClientRect(area, out rect);
                for (int y = rect.Top + 4; y < rect.Bottom; y += 8)
                    for (int x = rect.Left + 4; x < rect.Right; x += 8)
                        NativeMethods.PostMessage(area, (uint)WM.MOUSEMOVE, 0, (y << 16) | x);
                NativeMethods.PostMessage(area, (uint)WM.MOUSELEAVE, 0, 0);
            }
        }

        private SequenceWindow m_sequencewindow;
        private SettingsWindow m_optionswindow;
        private DebugWindow m_debugwindow;
        private AboutBox m_about_box;

        private System.Drawing.Icon GetCurrentIcon()
        {
            return GetIcon((Composer.IsComposing?    0x1 : 0x0) |
                           (Updater.HasNewerVersion? 0x2 : 0x0));
        }

        public static System.Drawing.Icon GetIcon(int index)
        {
            if (m_icon_cache == null)
                m_icon_cache = new System.Drawing.Icon[8];

            if (m_icon_cache[index] == null)
            {
                bool is_composing = (index & 0x1) != 0;
                bool has_update = (index & 0x2) != 0;

                // XXX: if you create new bitmap images here instead of using bitmaps from
                // resources, make sure the DPI settings match. Our PNGs are 72 DPI whereas
                // new Bitmap objects appear to use 96 by default (even if copy-constructed).
                // A reasonable workaround might be to use Clone().
                using (Bitmap bitmap = Properties.Resources.KeyEmpty)
                using (Graphics canvas = Graphics.FromImage(bitmap))
                {
                    // LED status: on or off
                    canvas.DrawImage(is_composing ? Properties.Resources.DecalActive
                                                  : Properties.Resources.DecalIdle, 0, 0);

                    // Tiny yellow exclamation mark to advertise updates
                    if (has_update)
                        canvas.DrawImage(Properties.Resources.DecalUpdate, 0, 0);

                    canvas.Save();
                    m_icon_cache[index] = System.Drawing.Icon.FromHandle(bitmap.GetHicon());
                }
            }

            return m_icon_cache[index];
        }

        private static System.Drawing.Icon[] m_icon_cache;

        private AtomicFlag m_dirty;

        private void MarkIconDirty() => m_dirty.Set();

        private void UpdateNotificationIcon(object o, EventArgs e)
        {
            if (m_dirty.Get())
            {
                Visibility = Settings.DisableIcon.Value ? Visibility.Collapsed : Visibility.Visible;
                Icon = GetCurrentIcon();
                ToolTipText = GetCurrentToolTip();
            }
        }

        private static string GetCurrentToolTip()
        {
            var ret = string.Format(i18n.Text.TrayToolTip,
                                    Settings.ComposeKeys.Value.FriendlyName,
                                    Settings.SequenceCount,
                                    Settings.Version);

            if (Updater.HasNewerVersion)
                ret += "\n" + i18n.Text.UpdatesToolTip;

            return ret;
        }

        private void NotifyiconDoubleclicked(object sender, EventArgs e)
        {
            m_sequencewindow = m_sequencewindow ?? new SequenceWindow();

            if (m_sequencewindow.IsVisible)
            {
                m_sequencewindow.Hide();
            }
            else
            {
                m_sequencewindow.Show();
                m_sequencewindow.Activate();
            }
        }

        public bool HasNewerVersion => Updater.HasNewerVersion;
        public string DownloadHeader => string.Format(i18n.Text.Download, Updater.Get("Latest") ?? "");

        private void UpdaterStateChanged()
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(HasNewerVersion)));
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(DownloadHeader)));
        }

        private void OnExitEvent() => Application.Current.Shutdown();

        private void OnOpenEvent(MenuCommand cmd) => OnCommand(cmd);
    }
}
