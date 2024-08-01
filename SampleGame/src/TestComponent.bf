using PixelBeef.Core;
using raylib_beef;
using raylib_beef.Enums;
namespace SampleGame;

class TestComponent : EntityComponent
{
	public override void Update()
	{
		if(Raylib.IsKeyReleased(KeyboardKey.KEY_DELETE))
			Entity.Destroy();
	}
}