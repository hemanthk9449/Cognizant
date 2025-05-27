<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Event Handling</title>
</head>
<body>
  <h2>Event Actions</h2>
  <input type="text" id="search" placeholder="Search events...">
  <select id="categoryFilter">
    <option value="">--Category--</option>
    <option value="Music">Music</option>
    <option value="Art">Art</option>
  </select>
  <button id="registerBtn">Register</button>
  <p id="output"></p>

  <script>
    document.getElementById("registerBtn").onclick = function() {
      document.getElementById("output").textContent = "Registered successfully!";
    };

    document.getElementById("categoryFilter").onchange = function(e) {
      document.getElementById("output").textContent = `Filtering category: ${e.target.value}`;
    };

    document.getElementById("search").onkeydown = function(e) {
      document.getElementById("output").textContent = `Typing: ${e.key}`;
    };
  </script>
</body>
</html>
