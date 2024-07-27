using System.Numerics;
using System.Collections;
using System;
using raylib_beef.Types;
using PixelBeef.Components;

namespace PixelBeef.Core;

public class Entity
{
    public TransformComponent Transform { get; }

    public ObservableCollection<EntityComponent> Components { get; } = new .() ~ DeleteContainerAndItems!(_);

    private readonly List<EntityComponent> _startComponents = new .() ~ delete _;

    public Scene Scene
    {
        get => this.FindRoot()._scene;
        set
        {
            if (Transform.Parent != null)
            {
                Transform.Parent = null;
                return;
            }

			if (_scene == value)
				return;

            _scene?.Entities.Remove(this);
            value?.Entities.Add(this);
            _scene = value;
        }
    }

    private Scene _scene;

    public this()
    {
        Components.CollectionChanged.Add(new (sender, e) =>
        {
            if (e.AddedItem != null)
			{
				e.AddedItem.[Friend]Entity = this;
            	Scene?.StartComponent(e.AddedItem);
			}
        });
		Transform = new TransformComponent(this);
		Components.Add(Transform);
    }

    public this(Vector2 position) : this()
    {
        Transform.Position = position;
    }

	public ~this()
	{
		for(var child in Transform.Children)
			delete child.Entity;
	}

    internal void Start()
    {
		for(EntityComponent component in Components)
			Scene.StartComponent(component);

		for (var child in Transform.Children)
			child.Entity.Start();
    }

    internal void Draw()
    {
        for (var component in Components)
        {
            if(component.IsEnabled)
                component.Draw();
        }

        for (var child in Transform.Children)
            child.Entity.Draw();
    }

    internal void Update()
    {
        for (var component in Components)
        {
            if (component.IsEnabled)
                component.Update();
        }

        for (var child in Transform.Children)
            child.Entity.Update();
    }

	public T Get<T>() where T : EntityComponent
	{
	    for (var component in Components)
	    {
	        if (component is T)
	            return (T)component;
	    }
	    return null;
	}

	public Entity FindRoot()
	{
		var entity = this;
	    while (entity.Transform.Parent != null)
	        entity = entity.Transform.Parent.Entity;
	    return entity;
	}

	public void Destroy()
	{
		Scene.DeleteEntity(this);
	}
}