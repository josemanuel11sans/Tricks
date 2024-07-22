package mx.edu.utez.tricks.model;

import java.util.Date;

public class Historial {
    private int idHistorial, usuarioIdusuario;
    private String  descripcion;
    private Date fecha_creacion;

    public Historial() {
    }

    public Historial(int idHistorial, int usuarioIdusuario, String descripcion, Date fecha_creacion) {
        this.idHistorial = idHistorial;
        this.usuarioIdusuario = usuarioIdusuario;
        this.descripcion = descripcion;
        this.fecha_creacion = fecha_creacion;
    }

    public int getIdHistorial() {
        return idHistorial;
    }

    public void setIdHistorial(int idHistorial) {
        this.idHistorial = idHistorial;
    }

    public int getUsuarioIdusuario() {
        return usuarioIdusuario;
    }

    public void setUsuarioIdusuario(int usuarioIdusuario) {
        this.usuarioIdusuario = usuarioIdusuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(Date fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }
}
