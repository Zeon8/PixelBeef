using PixelBeef;
using raylib_beef;
using raylib_beef.Types;
using raylib_beef.Enums;
using PixelBeef.Core;
using PixelBeef.Components;
using System;
namespace TestGame;

class PlayerMovement : EntityComponent
{
	private Sprite _sprite;

	public this(Sprite sprite)
	{
		_sprite = sprite;
	}

    public override void Update()
    {
        if (Raylib.IsKeyDown(KeyboardKey.KEY_W))
        {
            Entity.Transform.Position -= Entity.Transform.Up;
        }
        if (Raylib.IsKeyDown(KeyboardKey.KEY_S))
        {
            Entity.Transform.Position -= Entity.Transform.Down;
        }
        if (Raylib.IsKeyDown(KeyboardKey.KEY_D))
        {
            Entity.Transform.Rotation += 5f;
        }
        if (Raylib.IsKeyDown(KeyboardKey.KEY_A))
        {
            Entity.Transform.Rotation -= 5f;
        }
		if(Raylib.IsKeyReleased(KeyboardKey.KEY_SPACE))
		{
			var entity = new Entity(Entity.Transform.Position);
			entity.Scene = Entity.Scene;
			entity.Components.Add(new SpriteComponent(_sprite));
			entity.Components.Add(new TestComponent());
		}
    }

}