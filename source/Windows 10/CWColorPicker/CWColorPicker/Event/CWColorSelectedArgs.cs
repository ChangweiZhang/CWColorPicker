using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI;

namespace CWColorPicker.Event
{
    public class CWColorSelectedArgs
    {
        public Color Rsult { get; set; }
        public int[] RGB { get; set; }
        public float[] HSB { get; set; }

        /// <summary>
        /// color selected event args
        /// </summary>
        /// <param name="color">selected color</param>
        /// <param name="rgb">rgb value</param>
        /// <param name="hsb">hsb value</param>
        public CWColorSelectedArgs(Color color,int[] rgb,float[] hsb )
        {
            this.Rsult = color;
            this.RGB = rgb;
            this.HSB = hsb;
        }
        public CWColorSelectedArgs(Color color)
        {
            this.Rsult = color;
        }
    }
}
