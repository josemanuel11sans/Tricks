package mx.edu.utez.tricks.model;

public class Cursos {
    private int idCurso;
    private  String nombreCurso;

    public Cursos() {
    }
    public Cursos(int idCurso, String nombreCurso) {
        this.idCurso = idCurso;
        this.nombreCurso = nombreCurso;
    }
    public String getNombreCurso() {
        return nombreCurso;
    }
    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }
    public int getIdCurso() {
        return idCurso;
    }
    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }
}
