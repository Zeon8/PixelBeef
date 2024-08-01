using PixelBeef;
using raylib_beef;
using raylib_beef.Types;
using raylib_beef.Enums;
using PixelBeef.Core;
using PixelBeef.Components;
using System;
using Box2DBeef;
namespace SampleGame;

class PlayerMovement : EntityComponent
{
	private Sprite _sprite;
	private PhysicBodyComponent _body;

	public this(Sprite sprite)
	{
		_sprite = sprite;
	}

	public override void Start()
	{
		_body = Entity.Get<PhysicBodyComponent>();
	}

    public override void Update()
    {
		Vector2 velocity = _body.Velocity;
        if (Raylib.IsKeyDown(KeyboardKey.KEY_D))
        {
			velocity.x = 10;
        }
        if (Raylib.IsKeyDown(KeyboardKey.KEY_A))
        {
			velocity.x = -10;
        }
		_body.Velocity = velocity;

		if(Raylib.IsKeyReleased(KeyboardKey.KEY_SPACE))
		{
			var entity = new Entity();
			entity.Components.Add(new SpriteComponent(_sprite));
			entity.Components.Add(new TestComponent());
			entity.Transform.Position = Entity.Transform.Position;
			entity.Transform.Rotation = Entity.Transform.Rotation;
			entity.Scene = Entity.Scene;
		}
    }

	public override void Draw()
	{
		Raylib.DrawText(scope $"Position: {Entity.Transform.Position}", 10, 60, 14, Color.WHITE);
	}

}