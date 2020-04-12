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
  header('Access-Control-Allow-Methods: PUT');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization,X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';
 
  $database = new Database();
  $db = $database->connect(); 

  $post = new Post($db); 

  $post->user_query = isset($_GET['query']) ? $_GET['query'] : die();


  if($post->user_query($post->user_query)) {
    echo json_encode(
      array('message' => 'Category Updated')
    );
  } else {
    echo json_encode(
      array('message' => 'patient does not exist or Aid has exist')
    );
  }

