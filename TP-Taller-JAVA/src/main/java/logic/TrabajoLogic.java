package logic;

import java.util.LinkedList;
import data.DataTrabajo;
import entities.Trabajo;

public class TrabajoLogic {
	
	private DataTrabajo dataT = new DataTrabajo();

	public LinkedList<Trabajo> getAll(){
		return dataT.getAll();
	}
	
	public Trabajo getById(int id) {
		return dataT.getById(id);
	}
	
	public void altaTrabajo(Trabajo t) {
		dataT.add(t);
	}
	
	public void modificarTrabajo(Trabajo t) {
		dataT.update(t);
	}
	
	public void bajaTrabajo(Trabajo t) {
		dataT.remove(t);
	}
}