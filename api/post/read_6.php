<?php  
 
function debug_to_console($data){
    $output = $data;
    if (is_array($output))  $output = implode(',', $output);
    echo "\n================PHP===============\n";
    echo "PHP => " . $output  . "\n";
    echo "^^^^^^^^^^^^^^^^PHP^^^^^^^^^^^^^^^\n\n";
}


  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json; charset=UTF-8');
  include_once '../../config/Database.php';
  include_once '../../models/Post.php';
 
  $database = new Database();
  $db = $database->connect(); 

  $post = new Post($db); 

  $post->Aid = isset($_GET['Aid']) ? $_GET['Aid'] : die();   
  

  $result = $post->read_6($post->Aid);  

  $num = $result->rowCount();
 
  if($num > 0) { 
    $posts_arr = array(); 

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $post_item = array(
        'Bid' => $Bid,
        'Tname' => $Tname,
        'fee' => $fee
      );
 
      array_push($posts_arr, $post_item); 
    }
 
    echo json_encode($posts_arr);

  } else { 
    echo json_encode(
      array('error' => 'No Posts Found read_6.php')
    );
  }

