package mx.edu.utez.tricks.model;
import java.util.Date;
public class Asistencia {
    private int idAsistencia;
    private Date fechaAsistencia;
    private String presente;
    public Asistencia() {
    }
    public Asistencia(int idAsistencia, Date fechaAsistencia, String presente) {
        this.idAsistencia = idAsistencia;
        this.fechaAsistencia = fechaAsistencia;
        this.presente = presente;
    }
    public int getIdAsistencia() {
        return idAsistencia;
    }
    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
    }
    public Date getFechaAsistencia() {
        return fechaAsistencia;
    }
    public void setFechaAsistencia(Date fechaAsistencia) {
        this.fechaAsistencia = fechaAsistencia;
    }
    public String getPresente() {
        return presente;
    }
    public void setPresente(String presente) {
        this.presente = presente;
    }
}
