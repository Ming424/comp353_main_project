<?php  
 
 header('Access-Control-Allow-Origin: *');
 header('Content-Type: application/json'); 
 include_once '../../config/Database.php';
 include_once '../../models/Post.php';
 
  $database = new Database();
  $db = $database->connect();  
  $post = new Post($db); 

  $result = $post->read_include();   
  $num = $result->rowCount();
 
  if($num > 0) { 
    $posts_arr = array(); 

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $post_item = array(
        'IncludeId' => $IncludeId,
        'Tname' => $Tname,
        'Bid' => $Bid
      );
 
      array_push($posts_arr, $post_item); 
    }
 
    echo json_encode($posts_arr);

  } else { 
    echo json_encode(
      array('error' => 'No Posts Found read_belongs.php')
    );
  }

