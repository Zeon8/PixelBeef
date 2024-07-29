using System.Numerics;
using raylib_beef.Types;
using System.Collections;
using PixelBeef.Core;
using System;
using raylib_beef;
namespace PixelBeef.Components;

public class TransformComponent : EntityComponent
{
	public List<TransformComponent> Children { get; } = new .() ~ delete _;

	public Vector2 LocalPosition { get; set; } = Vector2.Zero;

	public float LocalRotation
	{
		get => _localRotation;
		set => _localRotation = value % 360f;
	}

	public Vector2 LocalScale { get; set; } = Vector2.One;

    public Vector2 Position
    {
        get => Parent == null ? LocalPosition : LocalPosition.Rotate(Rotation) + Parent.Position;
        set => LocalPosition = Parent == null ? value : value.Rotate(-Rotation) - Parent.Position;
    }

	public float Rotation
	{
		get => Parent == null ? LocalRotation : LocalRotation + Parent.Rotation;
		set => LocalRotation = Parent == null ? value : value - Parent.Rotation;
	}
	
	public Vector2 Scale
	{
		get => Parent == null ? LocalScale : LocalScale * Parent.Scale;
		set => LocalScale = Parent == null ? value : value / Parent.Scale;
	}

	public Vector2 Up => Vector2.UnitY.Rotate(Rotation);
	public Vector2 Right => Vector2.UnitX.Rotate(Rotation);
	public Vector2 Down => -Up;
	public Vector2 Left => -Right;

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

	private float _localRotation;
    private TransformComponent _parent;

    public this(Entity entity) => Entity = entity;
}