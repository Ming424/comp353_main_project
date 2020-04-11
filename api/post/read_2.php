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

  $post->Did = isset($_GET['Did']) ? $_GET['Did'] : die();  
  $post->d1 = isset($_GET['d1']) ? $_GET['d1'] : die();  
  $post->d2 = isset($_GET['d2']) ? $_GET['d2'] : die();  
  // debug_to_console($post->Did);
  // debug_to_console($post->d1);
  // debug_to_console($post->d2);
  

  $result = $post->read_2($post->Did,$post->d1,$post->d2); 
  // $result = $post->read_2_temp(); 
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
        'date' => $date
      );
 
      array_push($posts_arr, $post_item); 
    }
 
    echo json_encode($posts_arr);

  } else { 
    echo json_encode(
      array('error' => 'No Posts Found read_2.php')
    );
  }

