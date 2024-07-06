package mx.edu.utez.tricks.model;

public class Usuario {
     private int id_usuario;
    private String nombre;
    private  String apellido;
    private String mail;
    private String contra;
    private String estado;

    public Usuario() {
    }
    public Usuario(String nombre, String contra) {
        this.nombre = nombre;
        this.contra = contra;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getContra() {
        return contra;
    }
    public void setContra(String contra) {
        this.contra = contra;
    }
    public Usuario(int id_usuario, String nombre, String apellido, String mail, String telefono, String fechaNacimiento, String contra) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
//        this.telefono = telefono;
//        this.fechaNacimiento = fechaNacimiento;
        this.contra = contra;
    }
    public String getApellido() {
        return apellido;
    }
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public String getMail() {
        return mail;
    }
    public void setMail(String mail) {
        this.mail = mail;
    }
    public int getId_usuario() {
        return id_usuario;
    }
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String Estado() {
        return estado;
    }


    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}

