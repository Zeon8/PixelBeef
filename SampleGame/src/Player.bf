using PixelBeef.Core;
using raylib_beef.Types;
using PixelBeef.Components;
using PixelBeef;
namespace TestGame;

class Player : Entity
{
	public this(Sprite sprite) : base()
	{
		Components.Add(new SpriteComponent(sprite));
		Components.Add(new PlayerMovement(sprite));

		var childEntity = new Entity(Vector2(50,50));
		childEntity.Components.Add(new SpriteComponent(sprite));
		childEntity.Transform.Parent = Transform;
	}
}