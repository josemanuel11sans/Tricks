package mx.edu.utez.tricks.model;

public class TipoUsuario {
    private int idRol;
    private String tpoUsuarioRol;
    public TipoUsuario() {
    }
    public TipoUsuario(int idRol, String tpoUsuarioRol) {
        this.idRol = idRol;
        this.tpoUsuarioRol = tpoUsuarioRol;
    }
    public int getIdRol() {
        return idRol;
    }
    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }
    public String getTpoUsuarioRol() {
        return tpoUsuarioRol;
    }
    public void setTpoUsuarioRol(String tpoUsuarioRol) {
        this.tpoUsuarioRol = tpoUsuarioRol;
    }
}
