<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Debugging and Testing</title>
</head>
<body>
  <h2>Debug Registration</h2>
  <form id="debugForm">
    <input type="text" name="name" placeholder="Name" required><br><br>
    <button type="submit">Register</button>
  </form>
  <p id="debugMsg"></p>

  <script>
    document.getElementById("debugForm").addEventListener("submit", function(e) {
      e.preventDefault();
      console.log("Form submitted");
      const name = e.target.name.value;
      console.log("Name entered:", name);

      try {
        if (!name) throw new Error("Name is required");
        document.getElementById("debugMsg").textContent = `Welcome, ${name}`;
      } catch (err) {
        console.error("Submission error:", err);
        document.getElementById("debugMsg").textContent = err.message;
      }
    });
  </script>
</body>
</html>
