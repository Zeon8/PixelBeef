using PixelBeef;
using raylib_beef;
using raylib_beef.Types;
using raylib_beef.Enums;
using PixelBeef.Core;
using PixelBeef.Components;
namespace TestGame;

class PlayerMovement : EntityComponent
{
	private Entity _child;
	private Texture2D _texture;

	public this(Entity child, Texture2D texture)
	{
		_child = child;
		_texture = texture;
	}

    public override void Update()
    {
        if (Raylib.IsKeyDown(KeyboardKey.KEY_W))
        {
            Entity.Transform.Position -= Vector2.UnitY;
        }
        if (Raylib.IsKeyDown(KeyboardKey.KEY_S))
        {
            Entity.Transform.Position += Vector2.UnitY;
        }
        if (Raylib.IsKeyDown(KeyboardKey.KEY_D))
        {
            Entity.Transform.Position += Vector2.UnitX;
        }
        if (Raylib.IsKeyDown(KeyboardKey.KEY_A))
        {
            Entity.Transform.Position -= Vector2.UnitX;
        }
		if(Raylib.IsKeyReleased(KeyboardKey.KEY_SPACE))
		{
			var entity = new Entity(Entity.Transform.Position);
			entity.Scene = Entity.Scene;
			entity.Components.Add(new SpriteComponent(Sprite(_texture, Rectangle(0,0,24, 24))));
			entity.Components.Add(new TestComponent());
		}
    }

}