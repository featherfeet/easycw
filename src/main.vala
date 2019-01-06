using Gtk;

public class Application : Gtk.Window {
	private SenderReceiver senderreceiver;

	public Application() {
		// Create the window.
		this.title = "EasyCW";
		this.set_default_size(500, 500);
		this.destroy.connect(Gtk.main_quit);

		// Create the grid layout.
		Gtk.Grid grid = new Gtk.Grid();
		grid.column_homogeneous = true;
		this.add(grid);

		// Create the widgets.
		Gtk.Label receiveLabel = new Gtk.Label("Receive:");
		receiveLabel.halign = Gtk.Align.START;
		Gtk.LevelBar audioLevelBar = new Gtk.LevelBar.for_interval(0.0, 1.0);
		grid.attach(receiveLabel, 0, 0, 1, 1);
		grid.attach(audioLevelBar, 0, 1, 3, 1);

		// Start the audio processor.
		senderreceiver = new SenderReceiver(44100.0, audioLevelBar);
	}

	public static int main(string[] args) {
		Gtk.init(ref args);
		
		Application app = new Application();
		app.show_all();
		Gtk.main();

		return 0;
	}
}
