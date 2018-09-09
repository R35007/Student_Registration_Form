package Dbwrk;

import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

public class dconnect {
	
	final String HOST="localhost";
	final int PORT=27017;
	final String DBNAME="local";
	public static dconnect instance;
	public MongoClient mongo;
	public DB db;
	
	private dconnect() throws UnknownHostException
	{
		this.mongo=new MongoClient(this.HOST,this.PORT);
		this.db=this.mongo.getDB(this.DBNAME);
	}
	
	public static dconnect createInstance() throws UnknownHostException
	{
		if (dconnect.instance==null) 
		{
			dconnect.instance=new dconnect();
		}
		return dconnect.instance;
	}
	public DBCollection getCollection(String name)
	{
		return this.db.getCollection(name);
	}

}
