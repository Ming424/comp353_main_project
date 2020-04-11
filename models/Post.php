<?php
    class Post {
        // DB stuff
        private $conn;  

        public $Did;
        public $Dname;
        public $Cname; 

        public $Aid;
        public $Sin;
        public $Rid;
        public $Bid;
        public $miss;
        public $data; 

        public $count;

        public $Tname;
        public $fee; 

        // Constructor with DB
        public function __construct($db){
            $this->conn = $db;
        }

        public function read_1(){
            $query = 'SELECT * FROM dentist, belongs WHERE belongs.Did = dentist.Did';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        function debug_to_console($data)
        {
            $output = $data;
            if (is_array($output))
                $output = implode(',', $output);

            /** ENABLE THE FOLLOWING ECHO FOR DEBUGGING */
            echo "\n================PHP===============\n";
            echo "PHP => " . $output  . "\n";
            echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";
        }

        // public function read_2_temp($Did,$d1,$d2){
        //     $query = 'SELECT * 
        //         from appointment 
        //         where Did = ' . $Did . '
        //         AND data < 2020-01-03
        //         AND data > 2020-01-01';
        //     $stmt = $this->conn->prepare($query); 
        //     $stmt->bindParam(1, $this->Did);

        //     $stmt->execute(); 
        //     return $stmt;
        // }

            /** DEBUG TEMPLATE */
            // $output = $Did;
            // if (is_array($output)) $output = implode(',', $output);
            // echo "\n================PHP===============\n";
            // echo "PHP => " . $output  . "\n";
            // echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";

        public function read_2($Did,$d1,$d2){
            $query = 'SELECT * 
                from appointment 
                where Did = ' . $Did . '
                AND data < ' . $d1 . '
                AND data > ' . $d2;
            $stmt = $this->conn->prepare($query); 
            $stmt->bindParam(1, $this->Did);

            // $output = $query;
            // if (is_array($output))
            //     $output = implode(',', $output);
            // echo "\n================PHP===============\n";
            // echo "PHP => " . $output  . "\n";
            // echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";

            $stmt->execute(); 
            return $stmt;
        }

        public function read_3(){
            $query = 'select *
            from appointment, belongs
            where appointment.Did = belongs.Did AND 
                    appointment.data = "given date" AND 
                    belongs.Cname = "given clinic name"';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        public function read_4(){
            $query = 'select *
            from appointment
            where Sin = "given sin"';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        public function read_5(){
            $query = 'select Sin, count(*) as count
            from appointment
            where miss = "yes"
            group by Sin
            having count(*) > 0';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        public function read_6(){
            $query = 'select appointment.Bid, treatment.Tname, treatment.fee 
            from appointment, include, treatment
            where Aid = "given appointment id" AND 
                    appointment.Bid = include.Bid AND 
                    include.Tname = treatment.Tname';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        public function read_7(){
            $query = 'select Bid
            from bill
            where paid = "no"';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }
 

       
    }