public class Calculator{
	public Calculator(ref Gtk.Label label, ref Gtk.Label labelResult){
		BUFFER = "";
		m_label = label;
		m_label_result = labelResult;
		BUFFER_RESULT = "";
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
		//enleve que le dernier caractere
		BUFFER = BUFFER;
	}
	public void resolve(){
		// resous BUFFER  et envoie le resultat dans BUFFER_RESULT, puis efface BUFFER sans refresh
		string result = "";
		Posix.system(@"echo \"$(BUFFER)\" | bc -l > result.tmp");
		File file = File.new_for_path ("result.tmp");
		try {
			FileInputStream @is = file.read ();
			DataInputStream dis = new DataInputStream (@is);
			string line;

			line = dis.read_line();
			if(line == null)
			{
				m_label.set_label("ERREUR");
				m_label_result.set_label("");
				BUFFER_RESULT = "";
				BUFFER = "";
				return;
			}
			result = line;
		} catch (Error e) {
			print ("Error: %s\n", e.message);
		}
		if(BUFFER_RESULT == result)
		{
			if(BUFFER_RESULT in "0")
				return;
			BUFFER = BUFFER_RESULT;
			BUFFER_RESULT = "";
			m_label.set_label(result.to_string());
			m_label_result.set_label("");
			return;
		}
		BUFFER_RESULT = result;
		m_label_result.set_label(result);
	}

	private string BUFFER;
	private string BUFFER_RESULT;
	private Gtk.Label m_label;
	private Gtk.Label m_label_result;
}
