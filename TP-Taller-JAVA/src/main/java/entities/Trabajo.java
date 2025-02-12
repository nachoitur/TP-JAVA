package entities;

import java.util.LinkedList;

public class Trabajo {
	private int id_trabajo;
	private String tipo_trabajo;
	private String descripcion;
	private float costo_mdo;
	private LinkedList<Repuesto> repuestos = new LinkedList<Repuesto>();
	
	public Trabajo(int id_trabajo, String tipo_trabajo, String estado, String descripcion, String km_actual,
			float costo_mdo, String medio_pago, float total) {
		super();
		this.id_trabajo = id_trabajo;
		this.tipo_trabajo = tipo_trabajo;
		this.descripcion = descripcion;
		this.costo_mdo = costo_mdo;
	}
	
	public Trabajo() {}

	public int getId_trabajo() {
		return id_trabajo;
	}
	public void setId_trabajo(int id_trabajo) {
		this.id_trabajo = id_trabajo;
	}
	public String getTipo_trabajo() {
		return tipo_trabajo;
	}
	public void setTipo_trabajo(String tipo_trabajo) {
		this.tipo_trabajo = tipo_trabajo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public float getCosto_mdo() {
		return costo_mdo;
	}
	public void setCosto_mdo(float costo_mdo) {
		this.costo_mdo = costo_mdo;
	}
	public LinkedList<Repuesto> getRepuestos() {
		return repuestos;
	}
	public void setRepuestos(Repuesto repuesto) {
		this.repuestos.add(repuesto);
	}
	
	public float getTotalRepuestos() {
		float total = 0;
		for(Repuesto r: getRepuestos()) {
			total += r.getPrecio();
		}
		return total;
	}

	public String toString() {
		return "Trabajo [id_trabajo=" + id_trabajo + ", tipo_trabajo=" + tipo_trabajo + ", descripcion=" + descripcion
				+ ", costo_mdo=" + costo_mdo +", repuestos=" + repuestos +"]";
	}
	
}
