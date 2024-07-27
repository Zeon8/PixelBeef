namespace PixelBeef.Core;

public class EntityComponent
{
    public Entity Entity { get; internal set; }

    public bool IsEnabled { get; set; } = true;

    public virtual void Start() { }

    public virtual void Draw() { }

    public virtual void Update() { }

}