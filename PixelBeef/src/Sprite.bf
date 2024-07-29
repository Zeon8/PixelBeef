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

		public Vector2 Origin { get; }

        public Color Tint { get; }

		public this(Texture texture, Rectangle rect, Vector2 origin, Color tint = Color.WHITE)
		{
			Texture = texture;
			Rect = rect;
			Origin = origin;
			Tint = tint;
		}

		public this(Texture texture, Rectangle rect, Color tint = Color.WHITE)
			: this(texture, rect, Vector2(rect.width/2, rect.height / 2), tint){}

		public this(Texture texture, Color tint = Color.WHITE)
			: this(texture, Rectangle(0, 0, texture.width, texture.height), tint){}

    }
}
