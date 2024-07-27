using System.Numerics;
using raylib_beef.Types;
using System.Collections;
using PixelBeef.Core;
namespace PixelBeef.Components;

public class TransformComponent : EntityComponent
{
    public Vector2 Position
    {
        get => Parent == null ? LocalPosition : LocalPosition + Parent.Position;
        set => LocalPosition = Parent == null ? value : value - Parent.Position;
    }

    public Vector2 LocalPosition { get; set; }

    public List<TransformComponent> Children { get; } = new .() ~ delete _;

    public TransformComponent Parent 
    {
        get => _parent;
        set
        {
            if (_parent == value)
                return;

            _parent?.Children.Remove(this);
            value?.Children.Add(this);
            _parent = value;
        }
    }

    private TransformComponent _parent;

    public this(Entity entity) => Entity = entity;
}