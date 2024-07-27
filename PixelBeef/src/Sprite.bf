using System;
using System.Text;
using System.Threading.Tasks;
using raylib_beef.Types;

namespace PixelBeef
{
    struct Sprite
    {
        public Texture2D Texture { get; }

        public Rectangle Rect { get; }

        public Color Tint { get; } = Color.WHITE;

        public this(Texture2D texture, Rectangle rect)
        {
            Texture = texture;
            Rect = rect;
        }

        public this(Texture2D texture, Rectangle rect, Color tint)
            : this(texture, rect) => Tint = tint;
    }
}
