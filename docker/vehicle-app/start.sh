docker run --name vehicle-server -p 8072:8070 \
			--env-file /Users/elmonazareno/RAMESES/docker/env.conf \
			-v /Users/elmonazareno/RAMESES:/Users/elmonazareno/RAMESES \
			-v /Users/elmonazareno/RAMESES/docker/datasources:/apps/app-server/workspace/services/datasources \
 			-v /Users/elmonazareno/RAMESES/docker/connections:/apps/app-server/workspace/services/apps/etracs25/connections \
			-v /Users/elmonazareno/RAMESES/docker/apps/vehicle/adapters:/apps/app-server/workspace/services/apps/etracs25/adapters \
			-v /Users/elmonazareno/RAMESES/docker/apps/vehicle/modules.conf:/apps/app-server/workspace/services/apps/etracs25/modules.conf \
			-d app-server:latest
