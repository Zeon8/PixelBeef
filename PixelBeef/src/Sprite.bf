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

        public Color Tint { get; set mut; } = Color.WHITE;

		public this(Texture texture, Rectangle rect, Vector2 origin)
		{
			Texture = texture;
			Rect = rect;
			Origin = origin;
		}

		public this(Texture texture, Rectangle rect)
			: this(texture, rect, Vector2(rect.width/2, rect.height / 2)){}

		public this(Texture texture)
			: this(texture, Rectangle(0, 0, texture.width, texture.height)){}

    }
}
