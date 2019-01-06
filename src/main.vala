public class Application : Gtk.Window {
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
		Gtk.LevelBar audioLevelBar = new Gtk.LevelBar.for_interval(0.0, 100.0);
		grid.attach(receiveLabel, 0, 0, 1, 1);
		grid.attach(audioLevelBar, 0, 1, 3, 1);
	}

	public static int main(string[] args) {
		SenderReceiver senderreceiver = new SenderReceiver(44100.0);

		Gtk.init(ref args);
		
		Application app = new Application();
		app.show_all();
		Gtk.main();

		return 0;
	}
}
