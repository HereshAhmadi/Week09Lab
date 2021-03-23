package dataaccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import models.Notes;
import models.Users;

public class NoteDB {

    public List<Notes> getAll(String owner) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try{
           // List<Notes> noteList = em.createNamedQuery("Notes.findAll",Notes.class);
           Users user = em.find(Users.class, owner);
           return user.getNotesList();
        }finally{
            em.close();
        }
    }

    public Notes get(int noteId) throws Exception {
       EntityManager em = DBUtil.getEmFactory().createEntityManager();
       
       try{
           Notes note = em.find(Notes.class, noteId);
          // String firstname = note.getOwner().getFirstname();
        //  List<Notes> noteList = note.getOwner().getNotesList();
           return note;
       }finally{
           em.close();
       }
  
    }

    public void insert(Notes note) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            Users user = note.getOwner();
            user.getNotesList().add(note);
            trans.begin();
            em.persist(note);//equivalent to an insert statement
            em.merge(user);//equivalent to an update statement 
            trans.commit();//commit the changes 
        } catch(Exception e){
            trans.rollback();
        }finally {
            em.close();
        }
    }

    public void update(Notes note) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(note);//equivalent to an update statement 
            trans.commit();//commit the changes 
        } catch(Exception e){
            trans.rollback();
        }finally {
            em.close();
        }
        
    }

    public void delete(Notes note) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            Users user = note.getOwner();
            user.getNotesList().remove(note);
            trans.begin();
            em.remove(em.merge(note));//equivalent to a delete statement 
            em.merge(user);//equivalent to an update statement 
            trans.commit();//commit the changes 
        } catch(Exception e){
            trans.rollback();
        }finally {
            em.close();
        }
    }

}
