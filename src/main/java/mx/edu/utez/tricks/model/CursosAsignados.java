package mx.edu.utez.tricks.model;

public class CursosAsignados {

    private String grupos, carrera;


    private String estado;
    private int id_estado ,asistencia_id,calificacion_id;

    public CursosAsignados() {
    }

    public CursosAsignados(String grupos, String carrera, String estado, int id_estado, int asistencia_id, int calificacion_id) {
        this.grupos = grupos;
        this.carrera = carrera;
        this.estado = estado;
        this.id_estado = id_estado;
        this.asistencia_id = asistencia_id;
        this.calificacion_id = calificacion_id;
    }

    public String getGrupos() {
        return grupos;
    }

    public void setGrupos(String grupos) {
        this.grupos = grupos;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public int getAsistencia_id() {
        return asistencia_id;
    }

    public void setAsistencia_id(int asistencia_id) {
        this.asistencia_id = asistencia_id;
    }

    public int getCalificacion_id() {
        return calificacion_id;
    }

    public void setCalificacion_id(int calificacion_id) {
        this.calificacion_id = calificacion_id;
    }


}
