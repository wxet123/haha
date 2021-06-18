<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Trainings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="casas.css">
</head>

<body>


<button type="button" class="btn btn-primary" id="addTraining" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Add Training</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Training</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        
        
 
        <form method="post" action="<%=request.getContextPath()%>/addtraining" id="myform" >
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Course ID :</label>
            <input type="text" class="form-control" id="recipient-name" autocomplete="off" name="course_id" required>
          </div>
          
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Course Name :</label>
            <input type="text" class="form-control" id="recipient-name1" autocomplete="off" name="course_name" required>
          </div>
          
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Description :</label>
            <textarea class="form-control" id="message-text" autocomplete="off" name="description" required></textarea>
          </div>


        </form>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="ssubmit" onclick="closed()">Close</button>
        <button type="button" class="btn btn-primary" id="submit" onclick="submit()">Add</button>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">

    function closed(){
      document.getElementById("recipient-name").value = null;
      document.getElementById("recipient-name1").value = null;
      document.getElementById("message-text").value = null;
    }
    
    function submit() {
    	document.getElementById("myform").submit();
    
    }

</script>



    
</body>
</html>