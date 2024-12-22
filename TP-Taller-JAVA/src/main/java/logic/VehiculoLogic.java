package logic;

import java.util.LinkedList;
import data.DataVehiculo;
import entities.Vehiculo;

public class VehiculoLogic {
	
	private DataVehiculo dataV = new DataVehiculo();

	public LinkedList<Vehiculo> getAll(){
		return dataV.getAllVehiculos();
	}
	
	public Vehiculo getById(int id) {
		return dataV.getVehiculoById(id);
	}
	
	public void altaVehicle(Vehiculo v) {
		dataV.addVehiculo(v);
	}
	
	public void modificarVehicle(Vehiculo v) {
		dataV.updateVehiculo(v);
	}
	
	public void bajaVehicle(Vehiculo v) {
		dataV.removeVehiculo(v);
	}
}