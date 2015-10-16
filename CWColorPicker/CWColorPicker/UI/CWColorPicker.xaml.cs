using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;
using CWColorPicker.Event;
using System.Diagnostics;
using Windows.UI.Xaml.Media.Imaging;
using CWColorPicker.Core;
using Windows.UI.Xaml.Resources;
using Windows.Storage;
using System.Reflection;
// The User Control item template is documented at http://go.microsoft.com/fwlink/?LinkId=234236

namespace CWColorPicker.UI
{
    public sealed partial class CWColorPicker : UserControl
    {

        /// <summary>
        /// current selected color
        /// </summary>
        public Color Color
        {
            get { return (Color)GetValue(ColorProperty); }
            set { SetValue(ColorProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Color.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ColorProperty =
            DependencyProperty.Register("Color", typeof(Color), typeof(CWColorPicker), new PropertyMetadata(0));



        /// <summary>
        /// current ponit in color picker
        /// </summary>
        public Point ColorPoint
        {
            get { return (Point)GetValue(ColorPointProperty); }
            set { SetValue(ColorPointProperty, value); }
        }

        // Using a DependencyProperty as the backing store for ColorPoint.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ColorPointProperty =
            DependencyProperty.Register("ColorPoint", typeof(Point), typeof(CWColorPicker), new PropertyMetadata(0));




        /// <summary>
        /// ColorSelected Event
        /// </summary>
        public event EventHandler<CWColorSelectedArgs> ColorSelected;

        private void ColorChange(float[] hsb)
        {
            if (ColorSelected != null)
            {
                ColorSelected(this, new CWColorSelectedArgs(CWColorService.ColorFromRGB(CWColorService.HSBToRGB(hsb))));
            }
        }

        private void ColorChange(Color color)
        {
            if (ColorSelected != null)
            {
                ColorSelected(this, new CWColorSelectedArgs(color));
            }
        }



        public CWColorPicker()
        {
            this.InitializeComponent();
            initPanelImage();

        }

        /// <summary>
        /// load resource image from dll
        /// </summary>
        private async void initPanelImage()
        {
            var panel = new BitmapImage();
            var imageStream = Assembly.Load(new AssemblyName("CWColorPicker")).GetManifestResourceStream("CWColorPicker.Resource.color-pan.png");
            await panel.SetSourceAsync(imageStream.AsRandomAccessStream());
            this.ColorImage.Source = panel;
        }


        /// <summary>
        /// calculate the color according to the touch point
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ColorImage_PointerPressed(object sender, PointerRoutedEventArgs e)
        {
            // Debug.WriteLine("pressed");
            //  Debug.WriteLine(e.GetCurrentPoint(this.ColorPanel).Position);

            var position = e.GetCurrentPoint(this.ColorImage).Position;
            var hsb = new float[3];
            hsb[2] = 1.0f;
            hsb[0] = (float)(int)(position.X / this.ColorImage.ActualWidth * 360);
            hsb[1] = float.Parse((position.Y / this.ColorImage.ActualHeight).ToString("0.00"));
            this.Color = CWColorService.ColorFromRGB(CWColorService.HSBToRGB(hsb));
            this.ColorPoint = position;
            ColorChange(this.Color);
        }


    }
}
