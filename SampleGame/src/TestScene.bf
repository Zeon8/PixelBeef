using PixelBeef.Core;
using raylib_beef;
using PixelBeef;
using raylib_beef.Types;
using PixelBeef.Components;
using PixelBeef.Shapes;
namespace SampleGame;

class TestScene : Scene
{
	public override void Start()
	{
		var texture = Raylib.LoadTexture("Assets/character.png");
		var sprite = Sprite(texture);

		Camera = new CameraComponent();
		var camera = new Entity();
		camera.Scene = this;
		camera.Components.Add(Camera);

		var entity = new Player(sprite);
		entity.Transform.Position = Vector2(10, 10);
		entity.Scene = this;

		var ground = new Entity();
		ground.Scene = this;
		ground.Transform.Position = Vector2(10,0);
		ground.Add(new PhysicBodyComponent(BodyType.StaticBody, new BoxShape(10f, 1f)));
	}
}