package vehicle.facts;

import java.util.*;
import java.rmi.server.*;

public class VehicleApplication {
	
	int appyear;
	Date appdate;
	String apptype;
	String vehicletype;
	String objid;
	String controlno;

	def fixDate( def dt ) {
		if( dt instanceof String ) {
			def df = new java.text.SimpleDateFormat( "yyyy-MM-dd");
			dt = df.parse( dt );
		}
		return dt;
	}

	public VehicleApplication( def m ) {
		controlno = m.controlno;
		apptype = m.apptype;
		objid = m.objid;		
		vehicletype  = m.vehicletypeid;
		if( m.appyear ) appyear = m.appyear;
		
		if( m.appdate ) {
			appdate = fixDate( m.appdate );
		}	

	}

}