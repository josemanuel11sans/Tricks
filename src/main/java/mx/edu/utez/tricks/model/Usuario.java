package mx.edu.utez.tricks.model;

public class Usuario {
     private int id_usuario;
    private String nombre;
    private  String apellido;
    private String mail;
    private String contra;
    private String estado;
    private int id_rol, id_estado, grupos_id_grupo;

    public Usuario(int id_usuario, String nombre, String apellido, String mail, String contra) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contra = contra;
    }

    public Usuario() {
    }
    public Usuario(String nombre, String contra) {
        this.nombre = nombre;
        this.contra = contra;
    }

    public Usuario(String idUsuario, String nombre, String apellido, String mail, String contra, String number) {
    }

    public Usuario(int idUsuario, String estado) {
        this.id_usuario = idUsuario;
        this.estado = estado;
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

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public int getGrupos_id_grupo() {
        return grupos_id_grupo;
    }

    public void setGrupos_id_grupo(int grupos_id_grupo) {
        this.grupos_id_grupo = grupos_id_grupo;
    }
}

