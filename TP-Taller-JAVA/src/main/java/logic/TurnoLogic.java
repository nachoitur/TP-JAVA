package logic;

import java.util.LinkedList;
import data.DataTurno;
import entities.Turno;

public class TurnoLogic {
	
	private DataTurno dataT = new DataTurno();

	public LinkedList<Turno> getAll(){
		return dataT.getAll();
	}
	
	public Turno getById(int id) {
		return dataT.getById(id);
	}
	
	public void altaTurno(Turno t) {
		dataT.add(t);
	}
	
	public void modificarTurno(Turno t) {
		dataT.update(t);
	}
	
	public void bajaTurno(Turno t) {
		dataT.remove(t);
	}
}