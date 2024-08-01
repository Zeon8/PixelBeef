namespace PixelBeef.Shapes;
using Box2DBeef;

class BoxShape : IShape
{
	public float Width { get; }

	public float Height { get; }

	public this(float width, float height)
	{
		Width = width;
		Height = height;
	}

	public b2Polygon Create()
	{
		return b2MakeBox(Width, Height);
	}
}