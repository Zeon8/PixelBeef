using PixelBeef.Core;
namespace PixelBeef;

interface IGame
{
	public Scene Scene { get; set; }

	public GameWindow Window { get; }

	public World World { get; }

	public Simulation Simulation { get; }
}