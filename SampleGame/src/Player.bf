using PixelBeef.Core;
using raylib_beef.Types;
using PixelBeef.Components;
using PixelBeef;
using PixelBeef.Shapes;
namespace SampleGame;

class Player : Entity
{
	public this(Sprite sprite) : base()
	{
		this.Add(new PhysicBodyComponent(BodyType.DynamicBody, new BoxShape(1f, 1f)));
		this.Add(new SpriteComponent(sprite));
		this.Add(new PlayerMovement(sprite));

		var childEntity = new Entity(Vector2(50,50));
		childEntity.Add(new SpriteComponent(sprite));
		childEntity.Transform.Parent = Transform;
	}
}