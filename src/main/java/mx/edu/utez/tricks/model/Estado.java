package mx.edu.utez.tricks.model;

public class Estado {
    private int idEstado = 0;
    private String estado;

    public Estado() {
    }
    public Estado(int idEstado, String estado) {
        this.idEstado = idEstado;
        this.estado = estado;
    }
    public int getIdEstado() {
        return idEstado;
    }
    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }
    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
}
