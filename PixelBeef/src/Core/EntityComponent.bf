namespace PixelBeef.Core;

public class EntityComponent
{
    public Entity Entity { get; internal set; }

    public bool IsEnabled
	{
		get => _enabled;
		set
		{
			_enabled = value;
			if(value)
				OnEnable();
			else
				OnDisable();
		}
	}

	private bool _enabled = true;

	protected IGame Game { get; private set; }

	internal void StartInternal(IGame game)
	{
		Game = game;
		Start();
	}

    public virtual void Start() { }

    public virtual void Draw() { }

    public virtual void Update() { }

	public virtual void OnEnable() { }

	public virtual void OnDisable() { }

}