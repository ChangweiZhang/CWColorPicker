using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI;

namespace CWColorPicker.Core
{
    public class CWColorService
    {
        /// <summary>
        /// Convert HSB value to RGB value
        /// </summary>
        /// <param name="hsb">HSB value</param>
        /// <returns>RGB value</returns>
        public static int[] HSBToRGB(float[] hsb)
        {
            var rgb = new float[3];
            var hValue = hsb[0];
            /*

            Firstly, we need to calculate RGB value, when the HSB value is (h,100%,100%).

                H         Color     Value
              ----------------------------
               0-60         G       0->255
               60-120       R       255->0
               120-180      B       0->255
               180-240      G       255->0
               240-360      R       0->255
               300-360      B       255->0
            */
            if (hValue <= 60)
            {
                rgb[0] = 255;
                rgb[1] = hValue / 60.0f * 255;
            }
            else if (hValue <= 120)
            {
                hValue -= 60;
                rgb[1] = 255;
                rgb[0] = (1 - hValue / 60.0f) * 255;
            }
            else if (hValue <= 180)
            {
                hValue -= 120;
                rgb[1] = 255;
                rgb[2] = hValue / 60.0f * 255;
            }
            else if (hValue <= 240)
            {
                rgb[2] = 255;
                hValue -= 180;
                rgb[1] = (1 - hValue / 60.0f) * 255;
            }
            else if (hValue <= 300)
            {
                rgb[2] = 255;
                hValue -= 240;
                rgb[0] = hValue / 60.0f * 255;
            }
            else
            {
                hValue -= 300;
                rgb[0] = 255;
                rgb[2] = (1 - hValue / 60.0f) * 255;
            }
            /*
            Secondly, acorrding to the value of staturation, we can calculate the rgb value, when the value of hsb is (h,s,100%) 
            -------------------------
            r"= r'+ (255 - r') * s
            g"= g'+ (255 - g') * s
            b"= b'+ (255 - b') * s
            */
            for (int i = 0; i < 3; i++)
            {
                rgb[i] += (255 - rgb[i]) * hsb[1];
            }
            var result = new int[3];
            /*
            Finally, we need to calculate the real value of rgb, according to the value of brightness
            r = r" * br
            g = g" * br
            b = g" * br
            */
            for (int i = 0; i < 3; i++)
            {
                rgb[i] *= hsb[2];
                result[i] = (int)(rgb[i] + 0.5);
            }
            return result;
        }

        /// <summary>
        /// Convert RGB value to HSB value
        /// </summary>
        /// <param name="rgb">RGB Value</param>
        /// <returns></returns>
        public static float[] RGBToHSB(int[] rgb)
        {
            var result = new float[3];
            return result;
        }

        /// <summary>
        /// get color from rgb value
        /// </summary>
        /// <param name="r"></param>
        /// <param name="g"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        public static Color ColorFromRGB(int r,int g,int b)
        {
            var color = Color.FromArgb(255, (byte)r, (byte)g, (byte)b);
            return color;
        }
        public static Color ColorFromRGB(int[] rgb)
        {
            var color = ColorFromRGB(rgb[0], rgb[1], rgb[2]);
            return color;
        }
    }
}
