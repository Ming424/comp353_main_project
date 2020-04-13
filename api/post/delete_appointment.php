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

  $post->Aid = isset($_GET['Aid']) ? $_GET['Aid'] : die();

  if($post->delete_appointment( $post->Aid)) {
    echo json_encode(
      array('message' => 'Category Updated')
    );
  } else {
    echo json_encode(
      array('message' => 'Category not updated')
    );
  }

//   $result = $post->modify_appointment(
//       $post->Aid,
//       $post->Sin,
//       $post->Did,
//       $post->Rid,
//       $post->Bid,
//       $post->miss,
//       $post->date
//     ); 

//   $num = $result->rowCount();
 
//   if($num > 0) { 
//     $posts_arr = array(); 

//     while($row = $result->fetch(PDO::FETCH_ASSOC)) {
//       extract($row);

//       $post_item = array(
//         'Aid' => $Aid,
//         'Sin' => $Sin,
//         'Did' => $Did,
//         'Rid' => $Rid,
//         'Bid' => $Bid,
//         'miss' => $miss,
//         'date' => $date
//       );
 
//       array_push($posts_arr, $post_item); 
//     }
 
//     echo json_encode($posts_arr);

//   } else { 
//     echo json_encode(
//       array('error' => 'No Posts Found read_2.php')
//     );
//   }

