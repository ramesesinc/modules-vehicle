package vehicle.facts;

import java.util.*;
import java.rmi.server.*;

public class VehicleUnit {
	
	String plateno;
	String engineno;
	String bodyno;
	String sidecarno;
	String make;
	String model;
	String color;
	String chassisno;
	String sidecarcolor;

	String appid;
	String apptype;

	public VehicleUnit( def m ) {
		if(m.unit) {
			this.plateno = m.unit.plateno;
			this.engineno = m.unit.engineno;
			this.bodyno = m.unit.bodyno;
			this.sidecarno = m.unit.sidecarno;
			this.make = m.unit.make;
			this.model = m.unit.model;
			this.color = m.unit.color;
			this.chassisno = m.unit.chassisno;
			this.sidecarcolor = m.unit.sidecarcolor;			
		}
		this.appid = m.appid;
		this.apptype = m.apptype;
	}

}