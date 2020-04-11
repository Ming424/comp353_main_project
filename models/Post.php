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
        public $date; 

        public $count;

        public $Tname;
        public $fee; 

        public $BelongId;

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

        public function read_2_temp(){
            $query = 'select * from appointment where Did = 1 AND date >= \'2020-01-01\' AND date <= \'2020-01-05\'';
            $stmt = $this->conn->prepare($query); 
            $stmt->bindParam(1, $this->Did);


            // $output = $query;
            // if (is_array($output)) $output = implode(',', $output);
            // echo "\n================PHP===============\n";
            // echo "PHP => " . $output  . "\n";
            // echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";

            $stmt->execute(); 
            return $stmt;
        }

            /** DEBUG TEMPLATE */
            // $output = $Did;
            // if (is_array($output)) $output = implode(',', $output);
            // echo "\n================PHP===============\n";
            // echo "PHP => " . $output  . "\n";
            // echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";

        public function read_2($Did,$d1,$d2){
            $query = 
                'SELECT * 
                FROM appointment 
                WHERE Did = ' . $Did . '
                AND date >= \'' . $d1 . '\'' . '
                AND date <= \'' . $d2 .'\'';
            $stmt = $this->conn->prepare($query); 
            $stmt->bindParam(1, $this->Did);

            

            $stmt->execute(); 

            // $result = $stmt->fetch(PDO::FETCH_ASSOC);
            
            // $output = $query;
            // if (is_array($output))
            //     $output = implode(',', $output);
            // echo "\n================PHP===============\n";
            // echo "PHP => " . $output  . "\n";
            // echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";

            return $stmt;
        }

        public function read_3($clinic,$date){
            $query = 
            'SELECT * from appointment, belongs
            where appointment.Did = belongs.Did 
            AND  appointment.date = \'' . $date . '\'
            AND belongs.Cname = \'' . $clinic .'\'';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 


            // $output = $query;
            // if (is_array($output))
            //     $output = implode(',', $output);
            // echo "\n================PHP===============\n";
            // echo "PHP => " . $output  . "\n";
            // echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";

            return $stmt;
        }

        public function read_4($sin){
            $query = 'SELECT *
            from appointment
            where Sin = \'' . $sin . '\'';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        public function read_5(){
            $query = 'SELECT Sin, count(*) as count
            FROM appointment
            where miss = 1
            group by Sin
            having count(*) > 0';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        public function read_6($Aid){
            $query = 'SELECT appointment.Bid, treatment.Tname, treatment.fee 
            from appointment, include, treatment
            where Aid = \'' . $Aid . '\' AND 
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







        public function read_appointment(){
            $query =  'SELECT * from appointment';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();  

            // $output = $query;
            // if (is_array($output))
            //     $output = implode(',', $output);
            // echo "\n================PHP===============\n";
            // echo "PHP => " . $output  . "\n";
            // echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";

            return $stmt;
        }
 

       
    }