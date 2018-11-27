[indent=4]

uses Gtk
uses PortAudio

init
    Gtk.init(ref args)
    var AppWindow = new MainAppWindow()
    AppWindow.show_all()
    Gtk.main()

class MainAppWindow : Window
    init
        title = "EasyCW"
        default_height = 500
        default_width = 500
        window_position = WindowPosition.CENTER

        destroy.connect(Gtk.main_quit)
