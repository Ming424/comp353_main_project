<!DOCTYPE html>
<html>
<head>
	<title>
		dental clinics
	</title>
</head>
<body>

	<h1>Welcome to online dental clinics a</h1>

	<!-- following field set have tuples display all the time 
		  	-dentist 
		 	-patient
			-clinic
			-bill
	as lists or tables?
 	the rest of the field will have tuples display upon on user input submission -->

 	<!-- There should be messages upon each submission to indicate weather the input is valid -->


		<fieldset name = "Dentist">
			<legend>Dentist</legend>
		</fieldset>

		<fieldset name = "patient">
			<legend>Patient</legend>
		</fieldset>

		<fieldset name = "clinc">
			<legend>Clincs</legend>
		</fieldset>

		<fieldset name = "bill">
			<legend>Unpaid bills</legend>
		</fieldset>

	<form name = "treatment_a" action = "server.php" method="get">
		<fieldset name = "treatment_table">
			<legend>Treatment</legend>

			<label>Appointment ID</label>
  			<input type="text" name="TAid"><br><br>

  			<input type="submit" value="search">

		</fieldset>
	</form>

		<p>You can find appointments in 3 different ways please fill out one of them and click "submit" in corresponding field</p>

	<form name = "appointment_d_w" action = "home.php" method="get">
		<fieldset name = "appointment_d_w_table">
			<legend>Appointment_1 </legend>

			<label>Dentist ID</label>
  			<input type="text" name="dId"><br><br>

  			<label>Begin Date</label>
  			<input type="date" name="begin"><br><br>

  			<label>End Date</label>
  			<input type="date" name="end"><br><br>

  			<input type="submit" value="search">
		</fieldset>
	</form>

	<form name = "appointment_c_d" action = "home.php" method="get">
		<fieldset name = "appointment_c_d_table">
			<legend>Appointment_2</legend>

			<label>Clinic Name</label>
  			<input type="text" name="Cname"><br><br>

  			<label>Date</label>
  			<input type="date" name="date"><br><br>

  			<input type="submit" value="search">
		</fieldset>
	</form>

	

	<form name = "appointment_p" action = "home.php" method="get">
		<fieldset name = "appointment_p_table">
			<legend>Appointment_3</legend>

			<label>Patient ID</label>
  			<input type="text" name="PId"><br><br>

  			<input type="submit" value="search">
		</fieldset>
	</form>

	<p>The following sections allow you to modify the database</p>



	<form name = "add_patient" action = "home.php" method="get">
		<fieldset name = "add_patient">
			<legend>Add patient</legend>

			<label>Patient ID </label>
  			<input type="text" name="addPId"><br><br>

  			<label>Patient Name </label>
  			<input type="text" name="addPName"><br><br>

  			<input type="submit" value="add">
		</fieldset>
	</form>

	<form name = "add_appointment" action = "home.php" method="get">
		<fieldset name = "add_appointment">
			<legend>Add appointment</legend>

			<label>Appointment ID </label>
  			<input type="text" name="addAId"><br><br>

  			<label>Patient ID </label>
  			<input type="text" name="addAPId"><br><br>

  			<label>Receptionist ID</label>
  			<input type="text" name="addARId"><br><br>

  			<label>Dentist ID </label>
  			<input type="text" name="addADId"><br><br>

			<label>Date</label>
  			<input type="date" name="addADate"><br><br>
			
			<input type="submit" value="add">
		</fieldset>
	</form>

	<form name = "modify_appointment" action = "home.php" method="get">
		<fieldset name = "modify_appointment">
			<legend>Modify appointment</legend>

			<label>Appointment ID </label>
  			<input type="text" name="modifyAId"><br><br>

  			<label>Patient ID </label>
  			<input type="text" name="modifyAPId"><br><br>

  			<label>Receptionist ID</label>
  			<input type="text" name="modifyARId"><br><br>

  			<label>Dentist ID </label>
  			<input type="text" name="modifyADId"><br><br>

			<label>Date</label>
  			<input type="date" name="modifyADate"><br><br>
			
			<input type="submit" value="modify">
		</fieldset>
	</form>

	<form name = "delete_appointment" action = "home.php" method="get">
		<fieldset name = "delete_appointment">
			<legend>Delete appointment</legend>

			<label>Appointment ID </label>
  			<input type="text" name="deleteAId"><br><br>

  			<input type="submit" value="modify">
		</fieldset>
	</form>
		




</body>
</html>