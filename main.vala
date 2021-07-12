public class Calculator{
	public Calculator(ref Gtk.Label label){
		BUFFER = "";
		m_label = label;
	}
	public void add_buffer(string c){
		BUFFER = BUFFER + c;
	}
	public string get_buffer(){
		return BUFFER;
	}
	public void refresh(){
		if(BUFFER == "")
			m_label.set_label("Calculatrice");
		else
			m_label.set_label(BUFFER);
	}
	public void reset(){
		BUFFER = "";
	}
	public void remove(){
		BUFFER = BUFFER;
	}
	private string BUFFER;
	private Gtk.Label m_label;
}

int main (string[] args) {
	// initialisation
	Gtk.init (ref args);

	Gtk.CssProvider css_provider = new Gtk.CssProvider ();
	css_provider.load_from_path ("styleB.css");
	Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

	var builder = new Gtk.Builder ();
	builder.add_from_file ("calc.glade");
	builder.connect_signals (null);
	// GTK FENETRE
	bool is_theme_black = true;
	var window = builder.get_object ("window") as Gtk.Window;
	var window_grid = builder.get_object ("window_grid") as Gtk.Grid;
	var button_lux = builder.get_object ("button_lux") as Gtk.Button;
	var label_resolve = builder.get_object ("label_resolve") as Gtk.Label;
	
	Calculator calculator = new Calculator(ref label_resolve);
	calculator.refresh();
	//button SIMPLE CALCULATRICE	
	var button_0 = builder.get_object ("button_0") as Gtk.Button;
	var button_1 = builder.get_object ("button_1") as Gtk.Button;
	var button_2 = builder.get_object ("button_2") as Gtk.Button;
	var button_3 = builder.get_object ("button_3") as Gtk.Button;
	var button_4 = builder.get_object ("button_4") as Gtk.Button;
	var button_5 = builder.get_object ("button_5") as Gtk.Button;
	var button_6 = builder.get_object ("button_6") as Gtk.Button;
	var button_7 = builder.get_object ("button_7") as Gtk.Button;
	var button_8 = builder.get_object ("button_8") as Gtk.Button;
	var button_9 = builder.get_object ("button_9") as Gtk.Button;
	//operateur
	var button_plus = builder.get_object ("button_plus") as Gtk.Button;
	var button_moin = builder.get_object ("button_moin") as Gtk.Button;
	var button_fois = builder.get_object ("button_fois") as Gtk.Button;
	var button_divi = builder.get_object ("button_divi") as Gtk.Button;
	
	var button_suprr = builder.get_object ("button_suprr") as Gtk.Button;
	var button_AC = builder.get_object ("button_AC") as Gtk.Button;
	var button_dott = builder.get_object ("button_dott") as Gtk.Button;
	var button_percent = builder.get_object ("button_percent") as Gtk.Button;

	//button numpad
	button_0.clicked.connect(() =>{
		calculator.add_buffer("0");
		calculator.refresh();
	});
	button_1.clicked.connect(() =>{
		calculator.add_buffer("1");
		calculator.refresh();
	});
	button_2.clicked.connect(() =>{
		calculator.add_buffer("2");
		calculator.refresh();
	});
	button_3.clicked.connect(() =>{
		calculator.add_buffer("3");
		calculator.refresh();
	});
	button_4.clicked.connect(() =>{
		calculator.add_buffer("4");
		calculator.refresh();
	});
	button_5.clicked.connect(() =>{
		calculator.add_buffer("5");
		calculator.refresh();
	});
	button_6.clicked.connect(() =>{
		calculator.add_buffer("6");
		calculator.refresh();
	});
	button_7.clicked.connect(() =>{
		calculator.add_buffer("7");
		calculator.refresh();
	});
	button_8.clicked.connect(() =>{
		calculator.add_buffer("8");
		calculator.refresh();
	});
	button_9.clicked.connect(() =>{
		calculator.add_buffer("9");
		calculator.refresh();
	});
	
	// operator simple
	button_plus.clicked.connect(() =>{
		calculator.add_buffer("+");
		calculator.refresh();
	});
	button_moin.clicked.connect(() =>{
		calculator.add_buffer("-");
		calculator.refresh();
	});
	button_fois.clicked.connect(() =>{
		calculator.add_buffer("x");
		calculator.refresh();
	});
	button_divi.clicked.connect(() =>{
		calculator.add_buffer("÷");
		calculator.refresh();
	});
	
	button_AC.clicked.connect(() =>{
		calculator.reset();
		calculator.refresh();
	});
	
	button_divi.clicked.connect(() =>{
		calculator.remove();
		calculator.refresh();
	});
	button_dott.clicked.connect(() =>{
		calculator.add_buffer(",");
		calculator.refresh();
	});
	button_percent.clicked.connect(() =>{
		calculator.add_buffer("%");
		calculator.refresh();
	});
	
	button_lux.clicked.connect(() =>{
		print("LUMIERE");
		if(is_theme_black == true){
			css_provider.load_from_path ("styleW.css");	
			is_theme_black = false;
		}
		else{
			css_provider.load_from_path ("styleB.css");	
			is_theme_black = true;
		}
	});
	window.remove(window_grid);
	window.show_all ();
	Gtk.main ();


	Gtk.main_quit();
	return 0;
}
