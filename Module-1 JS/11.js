<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Form Handling</title>
</head>
<body>
  <h2>Register for an Event</h2>
  <form id="registerForm">
    <input type="text" name="name" placeholder="Name" required><br><br>
    <input type="email" name="email" placeholder="Email" required><br><br>
    <select name="event">
      <option value="">Select Event</option>
      <option value="music">Music</option>
      <option value="art">Art</option>
    </select><br><br>
    <button type="submit">Submit</button>
  </form>
  <p id="formMsg"></p>

  <script>
    document.getElementById("registerForm").addEventListener("submit", function(event) {
      event.preventDefault();

      const form = event.target;
      const name = form.elements.name.value;
      const email = form.elements.email.value;
      const eventType = form.elements.event.value;

      if (!name || !email || !eventType) {
        document.getElementById("formMsg").textContent = "All fields are required.";
      } else {
        document.getElementById("formMsg").textContent = `Thank you, ${name}, for registering.`;
      }
    });
  </script>
</body>
</html>
