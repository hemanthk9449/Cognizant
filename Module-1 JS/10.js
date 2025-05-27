<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Modern JavaScript Features</title>
</head>
<body>
  <h2>Modern JS Features</h2>
  <pre id="output"></pre>

  <script>
    const event = { name: "Workshop", date: "2025-06-10", seats: 30 };
    const { name, date } = event; // Destructuring
    const display = (title = "Event") => `${title}: ${name} on ${date}`; // Default param & arrow function

    const originalEvents = [event];
    const clonedEvents = [...originalEvents]; // Spread operator

    document.getElementById("output").textContent = display() +
      "\nCloned events: " + JSON.stringify(clonedEvents);
  </script>
</body>
</html>
