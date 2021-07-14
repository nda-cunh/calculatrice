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
	bool is_grid_sp_depli = false;
	var window = builder.get_object ("window") as Gtk.Window;
	var window_grid = builder.get_object ("window_grid") as Gtk.Grid;
	var window_grid_sp = builder.get_object ("window_grid_sp") as Gtk.Grid;
	var button_lux = builder.get_object ("button_lux") as Gtk.Button;
	var label_resolve = builder.get_object ("label_resolve") as Gtk.Label;
	var label_result = builder.get_object ("label_result") as Gtk.Label;

	Calculator calculator = new Calculator(ref label_resolve, ref label_result);
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
	var button_egal = builder.get_object ("button_egal") as Gtk.Button;

	var button_suprr = builder.get_object ("button_suprr") as Gtk.Button;
	var button_AC = builder.get_object ("button_AC") as Gtk.Button;
	var button_dott = builder.get_object ("button_dott") as Gtk.Button;
	var button_percent = builder.get_object ("button_percent") as Gtk.Button;

	var button_depli = builder.get_object ("button_depli") as Gtk.Button;
	var button_depli_label = builder.get_object ("button_depli_label") as Gtk.Label;
	
	//button special

	var button_cos = builder.get_object ("button_cos") as Gtk.Button;
	var button_sin = builder.get_object ("button_sin") as Gtk.Button;
	var button_log = builder.get_object ("button_log") as Gtk.Button;
	var button_tan = builder.get_object ("button_tan") as Gtk.Button;
	var button_racine = builder.get_object ("button_racine") as Gtk.Button;
	var button_ln = builder.get_object ("button_ln") as Gtk.Button;
	var button_par1 = builder.get_object ("button_par1") as Gtk.Button;
	var button_par2 = builder.get_object ("button_par2") as Gtk.Button;
	var button_pi = builder.get_object ("button_pi") as Gtk.Button;
	var button_e = builder.get_object ("button_e") as Gtk.Button;

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
			calculator.add_buffer("*");
			calculator.refresh();
			});
	button_divi.clicked.connect(() =>{
			calculator.add_buffer("/");
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
			calculator.add_buffer(".");
			calculator.refresh();
			});
	button_percent.clicked.connect(() =>{
			calculator.add_buffer("%");
			calculator.refresh();
			});
	button_egal.clicked.connect(() =>{
			calculator.resolve();
			});

	button_lux.clicked.connect(() =>{
			if(is_theme_black == true){
			css_provider.load_from_path ("styleW.css");	
			is_theme_black = false;
			}
			else{
			css_provider.load_from_path ("styleB.css");	
			is_theme_black = true;
			}
			});

	button_depli.clicked.connect(() =>{
		if(is_grid_sp_depli == true)
		{
			window_grid_sp.hide();
			is_grid_sp_depli = false;
			button_depli_label.set_label("⯇ ⯈");
		}
		else
		{
			window_grid_sp.show();
			is_grid_sp_depli = true;
			button_depli_label.set_label("⯈⯇");
		}
	});
	//signal buton special
	button_cos.clicked.connect(() =>{
			calculator.add_buffer("c(");
			calculator.refresh();
			});
	button_sin.clicked.connect(() =>{
			calculator.add_buffer("s(");
			calculator.refresh();
			});
	button_log.clicked.connect(() =>{
			calculator.add_buffer("l(");
			calculator.refresh();
			});
	button_tan.clicked.connect(() =>{
			calculator.add_buffer("t(");
			calculator.refresh();
			});
	button_racine.clicked.connect(() =>{
			calculator.add_buffer("sqrt(");
			calculator.refresh();
			});
	button_e.clicked.connect(() =>{
			calculator.add_buffer("e(");
			calculator.refresh();
			});
	button_pi.clicked.connect(() =>{
			calculator.add_buffer("3.1415");
			calculator.refresh();
			});
	button_ln.clicked.connect(() =>{
			calculator.add_buffer("ln(");
			calculator.refresh();
			});
	button_par1.clicked.connect(() =>{
			calculator.add_buffer("(");
			calculator.refresh();
			});
	button_par2.clicked.connect(() =>{
			calculator.add_buffer(")");
			calculator.refresh();
			});


	window.remove(window_grid);
	window.show_all ();
	
	window_grid_sp.hide();
	
	Gtk.main ();


	Gtk.main_quit();
	return 0;
}
