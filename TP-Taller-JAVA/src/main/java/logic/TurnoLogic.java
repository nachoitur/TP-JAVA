package logic;

import java.util.LinkedList;
import data.DataTurno;
import entities.Turno;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Comparator;

public class TurnoLogic {
	
	private DataTurno dataT = new DataTurno();

	public LinkedList<Turno> getAll(){
		LinkedList<Turno> shiftlist = dataT.getAll();
		shiftlist.sort(Comparator.comparing(Turno::getFecha).reversed());
		return shiftlist;
	}
	
	public Turno getByKeys(LocalDate fecha, LocalTime hora, int idVehiculo) {
		return dataT.getByKeys(fecha, hora, idVehiculo);
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
	public LinkedList<Turno> obtenerTrabajosFinalizadosPorTipo(int idV, String tipoT){
		return dataT.getByCarIdAndJobType(idV, tipoT);
	}
}