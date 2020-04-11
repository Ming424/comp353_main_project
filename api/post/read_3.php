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

  $post->clinic = isset($_GET['clinic']) ? $_GET['clinic'] : die();  
  $post->date = isset($_GET['date']) ? $_GET['date'] : die();   
  // debug_to_console($post->clinic);
  // debug_to_console($post->date); 
  

  $result = $post->read_3($post->clinic,$post->date); 
  // debug_to_console($result);

  $num = $result->rowCount();
 
  if($num > 0) { 
    $posts_arr = array(); 

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $post_item = array(
        'Aid' => $Aid,
        'Sin' => $Sin,
        'Did' => $Did,
        'Rid' => $Rid,
        'Bid' => $Bid,
        'miss' => $miss,
        'date' => $date,
        'BelongId' => $BelongId,
        'Cname' => $Cname,
        'Did' => $Did
      );
 
      array_push($posts_arr, $post_item); 
    }
 
    echo json_encode($posts_arr);

  } else { 
    echo json_encode(
      array('error' => 'No Posts Found read_3.php')
    );
  }

