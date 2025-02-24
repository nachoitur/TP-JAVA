package logic;

import java.util.LinkedList;
import data.DataRepuesto;
import entities.Repuesto;

public class RepuestoLogic {
	
	private DataRepuesto dataT = new DataRepuesto();

	public LinkedList<Repuesto> getAll(){
		return dataT.getAllRepuestos();
	}
	
	public Repuesto getById(int id) {
		return dataT.getRepuestoById(id);
	}
	
	public void altaRepuesto(Repuesto r) {
		dataT.addRepuesto(r);
	}
	
	public void modificarRepuesto(Repuesto r) {
		dataT.updateRepuesto(r);
	}
	
	public void bajaRepuesto(Repuesto r) {
		dataT.removeRepuesto(r);
	}
	
	public Repuesto getRepuestoByDescripcion(String de) {
		return dataT.getByDesc(de);
	}
}