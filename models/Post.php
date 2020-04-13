<?php
    class Post {
        // DB stuff
        private $conn;  

        public $Did;
        public $Dname;
        public $Cname; 
        public $Pname; 

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

        public $DAid;

        public $user_query;

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
            $query = 'SELECT appointment.Bid, treatment.Tname, treatment.fee, treatment.excutor 
            from appointment, include, treatment
            where Aid = \'' . $Aid . '\' AND 
                    appointment.Bid = include.Bid AND 
                    include.Tname = treatment.Tname';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        public function read_7(){
            $query = 'select bill.Bid, Sum(treatment.fee) as sum, Pname
            from bill, include, treatment, appointment, patient
            where paid = 0 AND bill.Bid = include.Bid AND treatment.Tname = include.Tname AND bill.Bid = appointment.Bid AND appointment.SIN = patient.SIN
            group by Bid';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            return $stmt;
        }

        public function my_query($q){
            $query = $q;
            $stmt = $this->conn->prepare($query); 
            $stmt->execute(); 
            // return $stmt;
        }







        public function read_appointment(){
            $query =  'SELECT * from appointment';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_belongs(){
            $query =  'SELECT * from belongs';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_bill(){
            $query =  'SELECT * from bill';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_clinic(){
            $query =  'SELECT * from clinic';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_dental_assistant(){
            $query =  'SELECT * from dental_assistant';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_dentist(){
            $query =  'SELECT * from dentist';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_include(){
            $query =  'SELECT * from include';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_patient(){
            $query =  'SELECT * from patient';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_receptionist(){
            $query =  'SELECT * from receptionist';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_treatment(){
            $query =  'SELECT * from treatment';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function read_single_appointment($Aid){
            $query =  'SELECT * from appointment WHERE Aid = \'' . $Aid . '\'';
            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            return $stmt;
        }

        public function modify_appointment($Aid,$Sin,$Did,$Rid,$Bid,$miss,$date){
            $query =  'UPDATE appointment
                SET Sin = \''. $Sin . '\',
                    Did = \''. $Did . '\',
                    Rid = \''. $Rid . '\',
                    Bid = \''. $Bid . '\',
                    miss = \''. $miss . '\',
                    date = \''. $date . '\'
            WHERE Aid = \''. $Aid . '\''; 
            
            $stmt = $this->conn->prepare($query); 
            if($stmt->execute())   return true; 
            printf("Error: $s.\n", $stmt->error);
            return false;
        }

        public function delete_appointment($Aid){
            $query =  'DELETE 
                FROM appointment
                WHERE Aid = \''. $Aid . '\''; 
            $stmt = $this->conn->prepare($query); 
            if($stmt->execute()) {
                return true;
            }
            printf("Error: $s.\n", $stmt->error);
            return false;
        }

        public function add_patient($Pname,$Sin){
            $query =  'INSERT INTO patient 
                VALUE (\'' .$Pname . '\',\'' . $Sin . '\')'; 
            $stmt = $this->conn->prepare($query); 
            
            
            if($stmt->execute()) {
                return true;
            }
            //printf("Error: $s.\n", $stmt->error);
            return false;
        }


        public function check_patient_exist($key){
            $query =  'SELECT *   
                       FROM  patient
                       where Sin = \'' .$key . '\''; 

            $stmt = $this->conn->prepare($query); 
            $stmt->execute();   
            
            $num_of_row = $stmt->rowCount();

            //printf($num_of_row);

            if($num_of_row == 0)
                return false;
            else
                return true;
    
        }

        public function add_appointment($Did, $Sin, $date){

            $patient_exist = $this->check_patient_exist($Sin);

            

            if($patient_exist == false)
                return false;
            else{

                $query = 'INSERT INTO appointment(Did, Sin, date, miss, Rid, Bid) 
                VALUE (\'' .$Did . '\',\'' . $Sin . '\',\'' . $date . '\', 1,1,1 )'; 
               ;
               

                $stmt = $this->conn->prepare($query); 

                if($stmt->execute()) {
                    return true;
                } 
                //printf("Error: $s.\n", $stmt->error);
                return false;
            }
        }


        public function user_query($query){
            
            $stmt = $this->conn->prepare($query); 
            
            if($stmt->execute()) {
                return true;
            } 
            //printf("Error: $s.\n", $stmt->error);
            return false;
            
        }


        


 

       
    }