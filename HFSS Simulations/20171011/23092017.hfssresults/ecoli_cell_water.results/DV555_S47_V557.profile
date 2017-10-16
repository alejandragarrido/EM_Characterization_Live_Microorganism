$begin 'Profile'
	$begin 'ProfileGroup'
		StartInfo='Time:  10/16/2017 09:58:40, Host EEFANT36, HFSS Version 13.0.0'
		TotalInfo='Time:  10/16/2017 10:09:34, Status: Normal Completion'
		ProfileTask('', 0, 0, 0, 0, 0, 'Desired RAM limit not set.', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, 'Solution Basis Order: 1', false, true)
		ProfileTask('  Mesh Pre', 2, 0, 2, 0, 56800, '1884 triangles', true, true)
		ProfileTask('  Mesh TAU (Strict)', 56, 0, 56, 0, 292000, '380900 tetrahedra', true, true)
		ProfileTask('  Mesh TAU (Coarsening)', 21, 0, 21, 0, 292000, '82499 tetrahedra', true, true)
		ProfileTask('  Mesh Post', 4, 0, 4, 0, 299248, '82499 tetrahedra', true, true)
		ProfileTask('Mesh Refinement', 0, 0, 0, 0, 0, 'Lambda Based', false, true)
		ProfileTask('  Mesh (lambda based)', 6, 0, 6, 0, 107248, '80504 tetrahedra', true, true)
		ProfileTask('Mesh Refinement', 0, 0, 0, 0, 0, 'Port Adapt', false, true)
		ProfileTask('Simulation Setup', 2, 0, 2, 0, 116472, 'Disk = 0 KBytes', true, true)
		ProfileTask('Port Adaptation', 1, 0, 1, 0, 126712, 'Disk = 36 KBytes, 80257 tetrahedra ', true, true)
		ProfileTask('  Mesh (port based)', 7, 0, 7, 0, 99064, '80513 tetrahedra', true, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Adaptive Pass 1', 0, 0, 0, 0, 0, ' Frequency: 0.001  GHz', false, true)
		ProfileTask('Simulation Setup', 2, 0, 2, 0, 116496, 'Disk = 0 KBytes', true, true)
		ProfileTask('Matrix Assembly', 6, 0, 6, 0, 397336, 'Disk = 0 KBytes, 80266 tetrahedra , 1: 30 triangles ', true, true)
		ProfileTask('Solver MCS1', 138, 0, 138, 0, 3334716, 'Disk = 0 KBytes, matrix size 510201 , matrix bandwidth  26.2 ', true, true)
		ProfileTask('Field Recovery', 1, 0, 1, 0, 3334716, 'Disk = 10083 KBytes, 1 excitations ', true, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Adaptive Pass 2', 0, 0, 0, 0, 0, ' Frequency: 0.001  GHz', false, true)
		ProfileTask('  Mesh (volume, adaptive)', 7, 0, 7, 0, 125760, '104596 tetrahedra', true, true)
		ProfileTask('Simulation Setup', 2, 0, 2, 0, 146112, 'Disk = 0 KBytes', true, true)
		ProfileTask('Matrix Assembly', 7, 0, 7, 0, 506272, 'Disk = 1 KBytes, 103928 tetrahedra , 1: 59 triangles ', true, true)
		ProfileTask('Solver MCS1', 379, 0, 378, 0, 5843088, 'Disk = 0 KBytes, matrix size 660211 , matrix bandwidth  26.2 ', true, true)
		ProfileTask('Field Recovery', 2, 0, 2, 0, 5843088, 'Disk = 4471 KBytes, 1 excitations ', true, true)
		ProfileTask('', 0, 0, 0, 0, 0, 'Adaptive Passes converged', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Adaptive Process', 0, 0, 0, 0, 0, 'Elapsed time : 00:10:53 , Hfss ComEngine Memory : 78.9 M', false, true)
	$end 'ProfileGroup'
	$begin 'ProfileGroup'
		StartInfo='Time:  10/16/2017 10:09:34, Host EEFANT36, HFSS Version 13.0.0'
		TotalInfo='Time:  10/16/2017 10:20:54, Status: Normal Completion'
		ProfileTask('', 0, 0, 0, 0, 0, 'Desired RAM limit not set.', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, 'Solution Basis Order: 1', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Solution Sweep', 0, 0, 0, 0, 0, 'Fast Sweep', false, true)
		ProfileTask('', 0, 0, 0, 0, 0, 'From 0.0001 GHz to 1 GHz, 99 Steps', false, true)
		ProfileTask('Simulation Setup', 2, 0, 2, 0, 145984, 'Disk = 0 KBytes', true, true)
		ProfileTask('Matrix Assembly', 11, 0, 11, 0, 1283904, 'Disk = 0 KBytes, 103928 tetrahedra , 1: 59 triangles ', true, true)
		ProfileTask('Solver MCS1', 664, 0, 663, 0, 6648232, 'Disk = 620261 KBytes, matrix size 660211 , matrix bandwidth  26.2 , reduced matrix size 60 ', true, true)
		ProfileTask('Field Recovery', 0, 0, 0, 0, 6648232, 'Disk = 25531 KBytes, 1 excitations ', true, true)
		ProfileTask('', 0, 0, 0, 0, 0, '', false, true)
		ProfileTask('Solution Process', 0, 0, 0, 0, 0, 'Elapsed time : 00:11:20 , Hfss ComEngine Memory : 78.9 M', false, true)
	$end 'ProfileGroup'
$end 'Profile'
