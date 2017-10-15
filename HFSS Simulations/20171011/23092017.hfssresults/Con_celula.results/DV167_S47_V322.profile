$begin 'Profile'
	$begin 'ProfileGroup'
		StartInfo='Time:  10/03/2017 06:30:17, Host ALEJANDRAPC, HFSS Version 13.0.0'
		TotalInfo='Time:  10/03/2017 06:53:06, Status: Normal Completion'
		ProfileTask('', 0, 0, 0, 0, 0, 'Desired RAM limit not set.', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, 'Solution Basis Order: 1', false, true)
		ProfileTask('  Mesh Pre', 3, 0, 3, 0, 57568, '1884 triangles', true, true)
		ProfileTask('  Mesh TAU (Strict)', 83, 0, 83, 0, 292000, '380875 tetrahedra', true, true)
		ProfileTask('  Mesh TAU (Coarsening)', 34, 0, 33, 0, 292000, '83951 tetrahedra', true, true)
		ProfileTask('  Mesh Post', 6, 0, 6, 0, 299400, '83951 tetrahedra', true, true)
		ProfileTask('Mesh Refinement', 0, 0, 0, 0, 0, 'Lambda Based', false, true)
		ProfileTask('  Mesh (lambda based)', 8, 0, 8, 0, 109308, '81685 tetrahedra', true, true)
		ProfileTask('Mesh Refinement', 0, 0, 0, 0, 0, 'Port Adapt', false, true)
		ProfileTask('Simulation Setup', 5, 0, 4, 0, 118404, 'Disk = 0 KBytes', true, true)
		ProfileTask('Port Adaptation', 3, 0, 2, 0, 128904, 'Disk = 36 KBytes, 81415 tetrahedra ', true, true)
		ProfileTask('  Mesh (port based)', 12, 0, 12, 0, 100092, '81708 tetrahedra', true, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Adaptive Pass 1', 0, 0, 0, 0, 0, ' Frequency: 0.001  GHz', false, true)
		ProfileTask('Simulation Setup', 3, 0, 3, 0, 118472, 'Disk = 0 KBytes', true, true)
		ProfileTask('Matrix Assembly', 10, 0, 9, 0, 402240, 'Disk = 0 KBytes, 81438 tetrahedra , 1: 27 triangles ', true, true)
		ProfileTask('Solver MCS1', 234, 0, 230, 0, 3534336, 'Disk = 0 KBytes, matrix size 517663 , matrix bandwidth  26.2 ', true, true)
		ProfileTask('Field Recovery', 3, 0, 3, 0, 3534336, 'Disk = 10231 KBytes, 1 excitations ', true, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Adaptive Pass 2', 0, 0, 0, 0, 0, ' Frequency: 0.001  GHz', false, true)
		ProfileTask('  Mesh (volume, adaptive)', 12, 0, 12, 0, 128560, '106142 tetrahedra', true, true)
		ProfileTask('Simulation Setup', 3, 0, 3, 0, 149052, 'Disk = 0 KBytes', true, true)
		ProfileTask('Matrix Assembly', 12, 0, 11, 0, 516088, 'Disk = 1 KBytes, 105412 tetrahedra , 1: 63 triangles ', true, true)
		ProfileTask('Solver MCS1', 879, 0, 561, 0, 4426472, 'Disk = 0 KBytes, matrix size 669769 , matrix bandwidth  26.2 ', true, true)
		ProfileTask('Field Recovery', 35, 0, 3, 0, 4426472, 'Disk = 4537 KBytes, 1 excitations ', true, true)
		ProfileTask('', 0, 0, 0, 0, 0, 'Adaptive Passes converged', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Adaptive Process', 0, 0, 0, 0, 0, 'Elapsed time : 00:22:49 , Hfss ComEngine Memory : 78.2 M', false, true)
	$end 'ProfileGroup'
	$begin 'ProfileGroup'
		StartInfo='Time:  10/03/2017 06:53:06, Host ALEJANDRAPC, HFSS Version 13.0.0'
		TotalInfo='Time:  10/03/2017 07:10:29, Status: Normal Completion'
		ProfileTask('', 0, 0, 0, 0, 0, 'Desired RAM limit not set.', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, 'Solution Basis Order: 1', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Solution Sweep', 0, 0, 0, 0, 0, 'Fast Sweep', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, 'From 1E-005 GHz to 0.1 GHz, 99 Steps', false, true)
		ProfileTask('Simulation Setup', 4, 0, 4, 0, 149072, 'Disk = 0 KBytes', true, true)
		ProfileTask('Matrix Assembly', 17, 0, 17, 0, 1303776, 'Disk = 0 KBytes, 105412 tetrahedra , 1: 63 triangles ', true, true)
		ProfileTask('Solver MCS1', 1003, 0, 722, 0, 4376584, 'Disk = 209450 KBytes, matrix size 669769 , matrix bandwidth  26.2 , reduced matrix size 20 ', true, true)
		ProfileTask('Field Recovery', 2, 0, 1, 0, 4376584, 'Disk = 25924 KBytes, 1 excitations ', true, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Solution Process', 0, 0, 0, 0, 0, 'Elapsed time : 00:17:21 , Hfss ComEngine Memory : 78.2 M', false, true)
	$end 'ProfileGroup'
$end 'Profile'
