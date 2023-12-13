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
using System.Runtime.InteropServices;

namespace WinCompose
{

/* Enums from winuser.h */
internal enum HC : int
{
    ACTION      = 0,
    GETNEXT     = 1,
    SKIP        = 2,
    NOREMOVE    = 3,
    NOREM       = 3,
    SYSMODALON  = 4,
    SYSMODALOFF = 5,
};

internal enum WH : int
{
    KEYBOARD    = 2,
    KEYBOARD_LL = 13,
};

internal enum WM : int
{
    INPUTLANGCHANGEREQUEST = 0x50,
    KEYDOWN    = 0x100,
    KEYUP      = 0x101,
    CHAR       = 0x102,
    SYSKEYDOWN = 0x104,
    SYSKEYUP   = 0x105,
    MOUSEMOVE  = 0x200,
    MOUSELEAVE = 0x2A3,
};

public enum VK : int
{
    NONE       = 0x00,
    LBUTTON    = 0x01,
    RBUTTON    = 0x02,
    CANCEL     = 0x03,
    MBUTTON    = 0x04,
    XBUTTON1   = 0x05,
    XBUTTON2   = 0x06,
    /* 0x07: undefined */
    BACK       = 0x08,
    TAB        = 0x09,
    /* 0x0a … 0x0b: reserved */
    CLEAR      = 0x0c,
    RETURN     = 0x0d,
    /* 0x0e … 0x0f: undefined */
    SHIFT      = 0x10,
    CONTROL    = 0x11,
    MENU       = 0x12,
    PAUSE      = 0x13,
    CAPITAL    = 0x14,
    KANA       = 0x15,
    HANGUL     = 0x15,
    HANGUEL    = 0x15,
    /* 0x16: undefined */
    JUNJA      = 0x17,
    FINAL      = 0x18,
    HANJA      = 0x19,
    KANJI      = 0x19,
    /* 0x1a: undefined */
    ESCAPE     = 0x1b,
    CONVERT    = 0x1c,
    NONCONVERT = 0x1d,
    ACCEPT     = 0x1e,
    MODECHANGE = 0x1f,
    SPACE      = 0x20,
    PRIOR      = 0x21,
    NEXT       = 0x22,
    END        = 0x23,
    HOME       = 0x24,
    LEFT       = 0x25,
    UP         = 0x26,
    RIGHT      = 0x27,
    DOWN       = 0x28,
    SELECT     = 0x29,
    PRINT      = 0x2a,
    EXECUTE    = 0x2b,
    SNAPSHOT   = 0x2c,
    INSERT     = 0x2d,
    DELETE     = 0x2e,
    HELP       = 0x2f,
    NUMROW0    = 0x30,
    NUMROW1    = 0x31,
    NUMROW2    = 0x32,
    NUMROW3    = 0x33,
    NUMROW4    = 0x34,
    NUMROW5    = 0x35,
    NUMROW6    = 0x36,
    NUMROW7    = 0x37,
    NUMROW8    = 0x38,
    NUMROW9    = 0x39,
    /* 0x3a … 0x40: undefined */
    A          = 0x41,
    B          = 0x42,
    C          = 0x43,
    D          = 0x44,
    E          = 0x45,
    F          = 0x46,
    G          = 0x47,
    H          = 0x48,
    I          = 0x49,
    J          = 0x4a,
    K          = 0x4b,
    L          = 0x4c,
    M          = 0x4d,
    N          = 0x4e,
    O          = 0x4f,
    P          = 0x50,
    Q          = 0x51,
    R          = 0x52,
    S          = 0x53,
    T          = 0x54,
    U          = 0x55,
    V          = 0x56,
    W          = 0x57,
    X          = 0x58,
    Y          = 0x59,
    Z          = 0x5a,
    LWIN       = 0x5b,
    RWIN       = 0x5c,
    APPS       = 0x5d,
    /* 0x5e: reserved */
    SLEEP      = 0x5f,
    NUMPAD0    = 0x60,
    NUMPAD1    = 0x61,
    NUMPAD2    = 0x62,
    NUMPAD3    = 0x63,
    NUMPAD4    = 0x64,
    NUMPAD5    = 0x65,
    NUMPAD6    = 0x66,
    NUMPAD7    = 0x67,
    NUMPAD8    = 0x68,
    NUMPAD9    = 0x69,
    MULTIPLY   = 0x6a,
    ADD        = 0x6b,
    SEPARATOR  = 0x6c,
    SUBTRACT   = 0x6d,
    DECIMAL    = 0x6e,
    DIVIDE     = 0x6f,
    F1         = 0x70,
    F2         = 0x71,
    F3         = 0x72,
    F4         = 0x73,
    F5         = 0x74,
    F6         = 0x75,
    F7         = 0x76,
    F8         = 0x77,
    F9         = 0x78,
    F10        = 0x79,
    F11        = 0x7a,
    F12        = 0x7b,
    F13        = 0x7c,
    F14        = 0x7d,
    F15        = 0x7e,
    F16        = 0x7f,
    F17        = 0x80,
    F18        = 0x81,
    F19        = 0x82,
    F20        = 0x83,
    F21        = 0x84,
    F22        = 0x85,
    F23        = 0x86,
    F24        = 0x87,
    /* 0x88 … 0x8f: unassigned */
    NUMLOCK    = 0x90,
    SCROLL     = 0x91,
    /* 0x92 … 0x96: OEM specific */
    LSHIFT     = 0xa0,
    RSHIFT     = 0xa1,
    LCONTROL   = 0xa2,
    RCONTROL   = 0xa3,
    LMENU      = 0xa4,
    RMENU      = 0xa5,
    BROWSER_BACK        = 0xa6,
    BROWSER_FORWARD     = 0xa7,
    BROWSER_REFRESH     = 0xa8,
    BROWSER_STOP        = 0xa9,
    BROWSER_SEARCH      = 0xaa,
    BROWSER_FAVORITES   = 0xab,
    BROWSER_HOME        = 0xac,
    VOLUME_MUTE         = 0xad,
    VOLUME_DOWN         = 0xae,
    VOLUME_UP           = 0xaf,
    MEDIA_NEXT_TRACK    = 0xb0,
    MEDIA_PREV_TRACK    = 0xb1,
    MEDIA_STOP          = 0xb2,
    MEDIA_PLAY_PAUSE    = 0xb3,
    LAUNCH_MAIL         = 0xb4,
    LAUNCH_MEDIA_SELECT = 0xb5,
    LAUNCH_APP1         = 0xb6,
    LAUNCH_APP2         = 0xb7,
    /* 0xb8 … 0xb9: reserved */
    OEM_1      = 0xba, // the ;: key (US keyboard)
    OEM_PLUS   = 0xbb,
    OEM_COMMA  = 0xbc,
    OEM_MINUS  = 0xbd,
    OEM_PERIOD = 0xbe,
    OEM_2      = 0xbf, // the /? key (US keyboard)
    OEM_3      = 0xc0, // the `~ key (US keyboard)
    /* 0xc1 … 0xd7: reserved */
    /* 0xd8 … 0xda: unassigned */
    OEM_4      = 0xdb, // the [{ key (US keyboard)
    OEM_5      = 0xdc, // the \| key (US keyboard)
    OEM_6      = 0xdd, // the ]} key (US keyboard)
    OEM_7      = 0xde, // the '" key (US keyboard)
    OEM_8      = 0xdf,
    /* 0xe0: reserved */
    /* 0xe1: OEM specific */
    OEM_102    = 0xe2,
    /* 0xe3 … 0xe4: OEM specific */
    PROCESSKEY = 0xe5,
    /* 0xe6: OEM specific */
    PACKET     = 0xe7,
    /* 0xe8: unassigned */
    /* 0xe9 … 0xf5: OEM specific */
    ATTN       = 0xf6,
    CRSEL      = 0xf7,
    EXSEL      = 0xf8,
    EREOF      = 0xf9,
    PLAY       = 0xfa,
    ZOOM       = 0xfb,
    NONAME     = 0xfc,
    PA1        = 0xfd,
    OEM_CLEAR  = 0xfe,

    /* This is for internal WinCompose use only */
    COMPOSE    = 0x100,
    DISABLED   = 0x101,
};

internal enum SC : uint
{
    // Not needed
};

internal enum LANG : uint
{
    ENGLISH  = 0x09,
    JAPANESE = 0x11,
};

internal enum SUBLANG : uint
{
    NEUTRAL        = 0x00,
    DEFAULT        = 0x01,
    JAPANESE_JAPAN = 0x01,
};

[Flags]
internal enum DDD : uint
{
    RAW_TARGET_PATH       = 0x00000001,
    REMOVE_DEFINITION     = 0x00000002,
    EXACT_MATCH_ON_REMOVE = 0x00000004,
    NO_BROADCAST_SYSTEM   = 0x00000008,
};

internal enum IOCTL : uint
{
    // ControlCode(FILE_DEVICE_KEYBOARD, 0x0002, METHOD_BUFFERED, FILE_ANY_ACCESS
    KEYBOARD_SET_INDICATORS   = 0x000b0008,
    // ControlCode(FILE_DEVICE_KEYBOARD, 0x0010, METHOD_BUFFERED, FILE_ANY_ACCESS
    KEYBOARD_QUERY_INDICATORS = 0x000b0040,
};

[Flags]
internal enum KEYBOARD : ushort
{
    SCROLL_LOCK_ON = 0x0001,
    NUM_LOCK_ON    = 0x0002,
    CAPS_LOCK_ON   = 0x0004,
    KANA_LOCK_ON   = 0x0008,
    SHADOW         = 0x4000,
    LED_INJECTED   = 0x8000,
};

internal struct KEYBOARD_INDICATOR_PARAMETERS
{
    public ushort UnitId;
    public KEYBOARD LedFlags;
};

// This can’t be an enum because of IntPtr
public static class HKL
{
    public static IntPtr PREV = (IntPtr)0;
    public static IntPtr NEXT = (IntPtr)1;
};

public static class HWND
{
    public static IntPtr BROADCAST = (IntPtr)0xffff;
}

[StructLayout(LayoutKind.Sequential)]
public struct RECT
{
    public int Left, Top, Right, Bottom;
};

/// <summary>
/// Represents possible dialogbox command id values by the MB_GetString function.
/// </summary>
internal enum DialogBoxCommandID : int
{
    IDOK       = 0,
    IDCANCEL   = 1,
    IDABORT    = 2,
    IDRETRY    = 3,
    IDIGNORE   = 4,
    IDYES      = 5,
    IDNO       = 6,
    IDCLOSE    = 7,
    IDHELP     = 8,
    IDTRYAGAIN = 9,
    IDCONTINUE = 10,
}

[Flags]
internal enum LLKHF : uint
{
    EXTENDED          = 0x01,
    LOWER_IL_INJECTED = 0x02,
    INJECTED          = 0x10,
    ALTDOWN           = 0x20,
    UP                = 0x80,
};

internal enum EINPUT : uint
{
    MOUSE    = 0,
    KEYBOARD = 1,
    HARDWARE = 2,
}

[Flags]
internal enum KEYEVENTF : uint
{
    EXTENDEDKEY = 0x0001,
    KEYUP       = 0x0002,
    UNICODE     = 0x0004,
    SCANCODE    = 0x0008,
}

[Flags]
internal enum MOUSEEVENTF : uint
{
    // Not needed
}

internal enum VirtualKeyShort : short
{
}

internal enum ScanCodeShort : short
{
}

[StructLayout(LayoutKind.Sequential)]
internal struct INPUT
{
    internal EINPUT type;
    internal UINPUT U;
}

[StructLayout(LayoutKind.Explicit)]
internal struct UINPUT
{
    // All union members need to be included, because they contribute
    // to the final size of struct INPUT.
    [FieldOffset(0)]
    internal MOUSEINPUT mi;
    [FieldOffset(0)]
    internal KEYBDINPUT ki;
    [FieldOffset(0)]
    internal HARDWAREINPUT hi;
}

[StructLayout(LayoutKind.Sequential)]
internal struct MOUSEINPUT
{
    internal int dx, dy, mouseData;
    internal MOUSEEVENTF dwFlags;
    internal uint time;
    internal UIntPtr dwExtraInfo;
}

[StructLayout(LayoutKind.Sequential)]
internal struct KEYBDINPUT
{
    internal VirtualKeyShort wVk;
    internal ScanCodeShort wScan;
    internal KEYEVENTF dwFlags;
    internal int time;
    internal UIntPtr dwExtraInfo;
}

[StructLayout(LayoutKind.Sequential)]
internal struct HARDWAREINPUT
{
    internal int uMsg;
    internal short wParamL, wParamH;
}

/* Low-level keyboard input event.
 *   http://msdn.microsoft.com/en-us/library/windows/desktop/ms644967%28v=vs.85%29.aspx
 */
[StructLayout(LayoutKind.Sequential)]
internal struct KBDLLHOOKSTRUCT
{
    internal VK vk;
    public SC sc;
    public LLKHF flags;
    public int time;
    public IntPtr dwExtraInfo;
}

internal enum HOOK : int
{
    INVALID = 0,
};

internal delegate int CALLBACK(HC nCode, WM wParam, IntPtr lParam);

/* Enums from winerror.h */
internal enum HRESULT : uint
{
    S_FALSE = 0x0001,
    S_OK = 0x0000,
    E_INVALIDARG = 0x80070057,
    E_OUTOFMEMORY = 0x8007000e,
};

/* Enums from shlwapi.h */
internal enum ASSOCF : int
{
    NONE                 = 0x00000000,
    INIT_NOREMAPCLSID    = 0x00000001,
    INIT_BYEXENAME       = 0x00000002,
    OPEN_BYEXENAME       = 0x00000002,
    INIT_DEFAULTTOSTAR   = 0x00000004,
    INIT_DEFAULTTOFOLDER = 0x00000008,
    NOUSERSETTINGS       = 0x00000010,
    NOTRUNCATE           = 0x00000020,
    VERIFY               = 0x00000040,
    REMAPRUNDLL          = 0x00000080,
    NOFIXUPS             = 0x00000100,
    IGNOREBASECLASS      = 0x00000200,
    INIT_IGNOREUNKNOWN   = 0x00000400,
    INIT_FIXED_PROGID    = 0x00000800,
    IS_PROTOCOL          = 0x00001000,
    INIT_FOR_FILE        = 0x00002000,
};

internal enum ASSOCSTR : int
{
    COMMAND = 1,
    EXECUTABLE,
    FRIENDLYDOCNAME,
    FRIENDLYAPPNAME,
    NOOPEN,
    SHELLNEWVALUE,
    DDECOMMAND,
    DDEIFEXEC,
    DDEAPPLICATION,
    DDETOPIC,
    INFOTIP,
    QUICKTIP,
    TILEINFO,
    CONTENTTYPE,
    DEFAULTICON,
    SHELLEXTENSION,
    DROPTARGET,
    DELEGATEEXECUTE,
    SUPPORTED_URI_PROTOCOLS,
    PROGID,
    APPID,
    APPPUBLISHER,
    APPICONREFERENCE,
    MAX,
};

[Flags]
internal enum MSGFLT : uint
{
    ADD = 1,
    REMOVE = 2,
};

}
