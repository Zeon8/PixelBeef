using System.Diagnostics;
using raylib_beef;
using raylib_beef.Enums;
using raylib_beef.Types;
using PixelBeef.Core;
using internal PixelBeef.Core;
namespace PixelBeef;
public class Game
{
    public Scene Scene { get; set; }

    public void Initialize()
    {
        Raylib.SetConfigFlags(ConfigFlag.FLAG_WINDOW_RESIZABLE);
        Raylib.InitWindow(800, 600, "Hello world");
        Raylib.SetTargetFPS(60);
    }

    public void Launch()
    {
        while (!Raylib.WindowShouldClose())
        {
            var fps = Raylib.GetFPS();
            Scene.Update();

            Raylib.BeginDrawing();
            Raylib.ClearBackground(Color.GRAY);
            Raylib.DrawText(scope $"Entities: {Scene.Entities.Count}", 10, 10, 14, Color.WHITE);
            Raylib.DrawText(scope $"FPS: {fps}", 10, 30, 14, Color.WHITE);
            Scene.Draw();
            Raylib.EndDrawing();
        }
        Raylib.CloseWindow();
    }
}