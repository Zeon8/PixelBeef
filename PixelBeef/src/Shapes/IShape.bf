using Box2DBeef;
namespace PixelBeef.Shapes;

interface IShape
{
	b2Polygon Create();
}