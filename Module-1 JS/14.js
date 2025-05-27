<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>jQuery and Frameworks</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    .card {
      display: none;
      border: 1px solid #ccc;
      padding: 10px;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <button id="registerBtn">Show Event Card</button>
  <div class="card">Event: Music Festival</div>

  <script>
    $(document).ready(function() {
      $('#registerBtn').click(function() {
        $('.card').fadeIn();
        setTimeout(() => $('.card').fadeOut(), 3000);
      });
    });
  </script>

  <p><strong>Note:</strong> Frameworks like React or Vue allow reusable components, virtual DOM, and state management.</p>
</body>
</html>
