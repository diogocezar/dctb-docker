<?php
	$host = 'dctb-mysql';
	$user = 'root';
	$pass = 'root';
	$base = 'base';
	$port = '3306';
	$conn = new mysqli($host, $user, $pass, $base, $port);

	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}

	$sql    = "SELECT * FROM user";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
	    while($row = $result->fetch_assoc()) {
	        echo "id: " . $row["id"]. " - name: " . $row["name"]. " - email: " . $row["email"]. "<br>";
	    }
	} else {
	    echo "0 results";
	}
	$conn->close();
?>