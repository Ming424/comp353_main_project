<?php
 
    //Header
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: applicaion/json'); 
    include_once '../../config/TestDatabase.php';
    include_once '../../models/TestPost.php';  


    // Instantiate DB & connect
    $database = new TestDatabase();
    $db = $database->connect();

    // Instantiate blog post object
    $post = new TestPost($db); 


    // Get POST param if existed
    $post->id = isset($_GET['id']) ? $_GET['id'] : die(); 
    // $post->author = isset($_GET['author']) ? $_GET['author'] : die();

    // Call method
    $post->read_single();

    $post_arr = array( 
        // the ID
        'id' => $post->id,
        'title' => $post->title . rand(0,9),
        'body' => $post->body,
        'author' => $post->author,
        'category_id' => $post->category_id,
        'category_name' => $post->category_name
    );

    print_r(json_encode($post_arr));

    // if($num > 0) {
    //     // Post array
    //     $posts_arr = array();
    //     // $posts_arr['data'] = array();
    
    //     while($row = $result->fetch(PDO::FETCH_ASSOC)) {
    //       extract($row);
    
    //       $post_item = array( 
    //         // the ID
    //         'id' => $post->id,
    //         'title' => $post->title,
    //         'body' => $post->body,
    //         'author' => $post->author,
    //         'category_id' => $post->category_id,
    //         'category_name' => $post->category_name
    //     );
    
    //       // Push to "data"
    //       array_push($posts_arr, $post_item);
    //       // array_push($posts_arr['data'], $post_item);
    //     }
    
    //     // Turn to JSON & output
    //     echo json_encode($posts_arr);
    
    //   } else {
    //     // No Posts
    //     echo json_encode(
    //       array('message' => 'No Posts Found')
    //     );
    //   }