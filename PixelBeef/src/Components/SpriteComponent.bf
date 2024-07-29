using raylib_beef;
using PixelBeef.Core;
using raylib_beef.Types;
namespace PixelBeef.Components;

public class SpriteComponent : EntityComponent
{
    public Sprite Sprite { get; set; }

    public this(Sprite sprite) => Sprite = sprite;

    public override void Draw()
    {
		Vector2 position = Entity.Transform.Position;
		Vector2 scale = Entity.Transform.Scale;
		float rotation = Entity.Transform.Rotation;

		// Converts world position to screen position 
		var destinationRect = Rectangle(position.x, position.y,
			scale.x * Sprite.Rect.width, scale.y * Sprite.Rect.height);
        Raylib.DrawTexturePro(Sprite.Texture, Sprite.Rect, destinationRect, Sprite.Origin * scale, rotation, Sprite.Tint);
    }
}