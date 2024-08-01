using System.Diagnostics;
using raylib_beef;
using raylib_beef.Enums;
using raylib_beef.Types;
using PixelBeef.Core;
using System;
using internal PixelBeef;
using internal PixelBeef.Core;
using internal PixelBeef.Components;
namespace PixelBeef;

public class Game : IGame
{
    public Scene Scene { get; set; }

	public GameWindow Window { get; set; } = new GameWindow() ~ delete _;

	public World World { get; } = new World() ~ delete _;

	public Simulation Simulation { get; } = new Simulation(World) ~ delete _;

    public void Launch()
    {
		Window.Initialize();
		Scene.StartInternal(this);
        while (!Raylib.WindowShouldClose())
        {
            var fps = Raylib.GetFPS();
            Scene.Update();
			Simulation.Update();

            Raylib.BeginDrawing();
            Raylib.ClearBackground(Color.GRAY);

			if(Scene.Camera != null)
			{
				Raylib.BeginMode2D(Scene.Camera.Camera);
				Scene.Draw();
				Raylib.EndMode2D();
			}

            Raylib.DrawText(scope $"Entities: {Scene.Entities.Count}", 10, 10, 14, Color.WHITE);
            Raylib.DrawText(scope $"FPS: {fps}", 10, 30, 14, Color.WHITE);
            Raylib.EndDrawing();
        }
        Raylib.CloseWindow();
    }
}