package entities;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;

public class Turno {
	private LocalDate fecha;
	private LocalTime hora;
	private int km_actuales;
	private String estado;
	private String medio_pago;
	private float total;
	private Vehiculo vehiculo;
	private LinkedList<Trabajo> trabajos =  new LinkedList<Trabajo>();
	
	public Turno(LocalDate fecha, LocalTime hora, int km_actuales, String estado, String medio_pago,
			float total, Vehiculo vehiculo) {
		super();
		this.fecha = fecha;
		this.hora = hora;
		this.km_actuales = km_actuales;
		this.estado = estado;
		this.medio_pago = medio_pago;
		this.total = total;
		this.vehiculo = vehiculo;
	}
	
	public Turno() {}

	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	public LocalTime getHora() {
		return hora;
	}
	public void setHora(LocalTime hora) {
		this.hora = hora;
	}
	public int getKm_actuales() {
		return km_actuales;
	}
	public void setKm_actuales(int km_actuales) {
		this.km_actuales = km_actuales;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getMedio_pago() {
		return medio_pago;
	}
	public void setMedio_pago(String medio_pago) {
		this.medio_pago = medio_pago;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public LinkedList<Trabajo> getTrabajos() {
		return trabajos;
	}
	public void setTrabajos(Trabajo trabajo) {
		this.trabajos.add(trabajo);
	}
	public void resetTrabajos() {
		this.trabajos = new LinkedList<Trabajo>();
	}
	public Vehiculo getVehiculo() {
		return vehiculo;
	}
	public void setVehiculo(Vehiculo vehiculo) {
		this.vehiculo = vehiculo;
	}

	public String toString() {
		return "Turno [fecha=" + fecha + ", hora=" + hora + ", km_actuales=" + km_actuales
				+ ", estado=" + estado + ", medio_pago=" + medio_pago + ", total=" + total + ", trabajos=" + trabajos
				+ ", vehiculo=" + vehiculo + "]";
	}
	
}
