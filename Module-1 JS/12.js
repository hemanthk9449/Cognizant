<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>AJAX & Fetch</title>
</head>
<body>
  <h2>Send Registration</h2>
  <form id="ajaxForm">
    <input type="text" name="name" placeholder="Name" required><br><br>
    <input type="email" name="email" placeholder="Email" required><br><br>
    <button type="submit">Send</button>
  </form>
  <p id="responseMsg"></p>

  <script>
    document.getElementById("ajaxForm").addEventListener("submit", function(e) {
      e.preventDefault();
      document.getElementById("responseMsg").textContent = "Sending...";

      setTimeout(() => {
        fetch("https://jsonplaceholder.typicode.com/posts", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            name: e.target.name.value,
            email: e.target.email.value
          })
        })
        .then(response => response.json())
        .then(data => {
          document.getElementById("responseMsg").textContent = "Registration successful!";
        })
        .catch(() => {
          document.getElementById("responseMsg").textContent = "Submission failed.";
        });
      }, 1000);
    });
  </script>
</body>
</html>
