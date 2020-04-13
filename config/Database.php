<?php 
  class Database {
    // DB Params
    // private $host = 'xvc353.encs.concordia.ca';
    // private $db_name = 'xvc353_4';
    // private $username = 'xvc353_4';
    // private $password = 'Comp3534';
    // private $conn;

    private $host = 'localhost';
    private $db_name = 'comp353';
    private $username = 'root';
    private $password = '';
    private $conn;

    // DB Connect
    public function connect() {
      $this->conn = null;

      try { 
        $this->conn = new PDO('mysql:host=' . $this->host . ';dbname=' . $this->db_name, $this->username, $this->password);
        $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      } catch(PDOException $e) {
        echo 'Connection Error: ' . $e->getMessage();
      }

      return $this->conn;
    }
  }