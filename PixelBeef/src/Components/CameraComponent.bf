using PixelBeef.Core;
using raylib_beef.Types;
using raylib_beef.Enums;
using raylib_beef;
namespace PixelBeef.Components;

class CameraComponent : EntityComponent
{
	public float Zoom { get; set; } = 1f;

	internal ref Camera2D Camera { get; private set; }

	public override void Start()
	{
		var transform = Entity.Transform;
		var offset = Vector2(Game.Window.Width / 2f, Game.Window.Height / 2f);
		Camera = Camera2D(offset, transform.Position, transform.Rotation, Zoom);
	}

	public override void Update()
	{
		Camera.target = Entity.Transform.Position;
	}
}