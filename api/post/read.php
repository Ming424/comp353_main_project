<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/TestDatabase.php';
  include_once '../../models/TestPost.php';
 
  $database = new TestDatabase();
  $db = $database->connect();
 
  $post = new TestPost($db);
 
  $result = $post->read(); 
  $num = $result->rowCount();
 
  if($num > 0) { 
    $posts_arr = array(); 
    $posts_num = array();


    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $post_item = array(
        'id' => $id,
        'title' => $title,
        'body' => html_entity_decode($body),
        'author' => $author,
        'category_id' => $category_id,
        'category_name' => $category_name
      );
 
      array_push($posts_arr, $post_item); 
    }

    array_push($posts_arr, $num);
    
    echo json_encode($posts_arr);

  } else {
    // No Posts
    // echo json_encode(
    //   array('wdf' => 'No Posts Found')
    // );
  } 