//
//  WinCompose — a compose key for Windows — http://wincompose.info/
//
//  Copyright © 2013—2019 Sam Hocevar <sam@hocevar.net>
//              2014—2015 Benjamin Litzelmann
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Reflection;
using System.Windows.Data;
using System.Windows.Markup;

namespace WinCompose
{
    public abstract class ValueConverter<T> : MarkupExtension, IValueConverter where T : class, new()
    {
        private static T instance;

        public abstract object Convert(object value, Type targetType, object parameter, CultureInfo culture);

        public abstract object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture);

        public override object ProvideValue(IServiceProvider serviceProvider)
        {
            return instance ?? (instance = new T());
        }
    }

    public abstract class OneWayValueConverter<T> : ValueConverter<T> where T : class, new()
    {
        public sealed override object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotSupportedException();
        }
    }

    public class UnicodeCategoryConverter : OneWayValueConverter<UnicodeCategoryConverter>
    {
        private static readonly IDictionary<UnicodeCategory, string> m_lut
            = new Dictionary<UnicodeCategory, string>();

        static UnicodeCategoryConverter()
        {
            foreach (var value in Enum.GetValues(typeof(UnicodeCategory)))
            {
                var name = value.ToString();
                var prop = typeof(unicode.Category).GetProperty(name, BindingFlags.Static | BindingFlags.Public);
                var desc = prop.GetValue(null, null);
                m_lut.Add((UnicodeCategory)value, (string)desc);
            }
        }

        public override object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var cat = (UnicodeCategory)value;
            return m_lut.TryGetValue(cat, out var result) ? result : "";
        }
    }
}
