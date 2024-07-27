using raylib_beef;
using PixelBeef.Core;
namespace PixelBeef.Components;

public class SpriteComponent : EntityComponent
{
    public Sprite Sprite { get; set; }

    public this(Sprite sprite) => Sprite = sprite;

    public override void Draw()
    {
        Raylib.DrawTextureRec(Sprite.Texture, Sprite.Rect, Entity.Transform.Position, Sprite.Tint);
    }
}