using raylib_beef;
using raylib_beef.Enums;
namespace PixelBeef;

class GameWindow
{
	public int Width { get; set; } = 800;

	public int Height { get; set; } = 600;

	public int TargetFPS { get; set; } = 60;

	public ConfigFlag ConfigFlag { get; set; } = .FLAG_WINDOW_RESIZABLE;

	internal void Initialize()
	{
		Raylib.SetConfigFlags(ConfigFlag);
		Raylib.InitWindow(800, 600, "Hello world");
		Raylib.SetTargetFPS(60);
	}
}