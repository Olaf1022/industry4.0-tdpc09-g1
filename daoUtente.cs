﻿using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descrizione di riepilogo per daoUtente
/// </summary>
public class daoUtente {
    public daoUtente() {
        //
        // TODO: aggiungere qui la logica del costruttore
        //
    }
    //getAllItem
    public List<Utente> getAllUtentes()
    {
        List<Utente> listaUtente = new List<Utente>();
        DataTable dt = new DataTable();
        DbEntity db = new DbEntity();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM Utenti;";

        dt = db.eseguiQuery(cmd);

        foreach (DataRow d in dt.Rows)
        {
            Utente oUtente = new Utente();
            oUtente.ID = (int)d["idutente"];
            oUtente.Username = (string)d["usename"];
            oUtente.Password = (string)d["password"];
            oUtente.Ruolo = (int)d["fk_ruolo"];
            listaUtente.Add(oUtente);
        }
        return listaUtente;
    }
    //getById
    public Utente getUtente(int id)
    {
        Utente oUtente = new Utente();
        DataTable dt = new DataTable();
        DbEntity db = new DbEntity();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM Utenti WHERE idutente = '" + id + "';";

        dt = db.eseguiQuery(cmd);

        foreach (DataRow d in dt.Rows)
        {
            oUtente.ID = (int)d["idutente"];
            oUtente.Username = (string)d["usename"];
            oUtente.Password = (string)d["password"];
            oUtente.Ruolo = (int)d["fk_ruolo"];
        }
        return oUtente;
    }
    //getByItem


    public Utente getLogin(Utente oUtente)
    {
        DataTable dt = new DataTable();
        DbEntity db = new DbEntity();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM Utenti WHERE usename = '" + oUtente.Username + "' AND password = '" + oUtente.Password + "';";

        dt = db.eseguiQuery(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow d in dt.Rows)
            {
                oUtente.ID = (int)d["idutente"];
                oUtente.Username = (string)d["usename"];
                oUtente.Password = (string)d["password"];
                oUtente.Ruolo = (int)d["fk_ruolo"];
            }
        }

        return oUtente;
    }
    //updateByItem
    public void updateUtente(Utente oUtente)
    {
        DataTable dt = new DataTable();
        DbEntity db = new DbEntity();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE Utenti SET usename = '" + oUtente.Username +
            "', password = '" + oUtente.Password +
            "', fk_ruolo = '" + oUtente.Ruolo +
            "'WHERE idutente = " + oUtente.ID + ";";

        db.eseguiQueryNOreturn(cmd);
    }
    //deleteById
    public void deleteUtente(Utente oUtente)
    {
        DataTable dt = new DataTable();
        DbEntity db = new DbEntity();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "DELETE Utenti WHERE idutente = " + oUtente.ID + ";";
        db.eseguiQueryNOreturn(cmd);
    }
    //insertByItem
    public void insertUtente(Utente oUtente)
    {
        DataTable dt = new DataTable();
        DbEntity db = new DbEntity();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO Utenti (usename, password, fk_ruolo) VALUES ('" +
            oUtente.Username + "', '" + oUtente.Password + "', '" + "', '" + oUtente.Ruolo + "'); SET @idutente = SCOPE_IDENTITY();";

        SqlParameter p = new SqlParameter();
        p.ParameterName = "@idutente";
        p.Size = 4;
        p.Direction = ParameterDirection.Output;
        cmd.Parameters.Add(p);
        db.eseguiQueryNOreturn(cmd);
    }
}