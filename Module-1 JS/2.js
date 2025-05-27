<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>JS Syntax, Data Types, Operators</title>
</head>
<body>
  <h2>Event Information</h2>
  <div id="eventDetails"></div>

  <script>
    const eventName = "Art Workshop";
    const eventDate = "2025-07-15";
    let availableSeats = 50;

    let eventInfo = `Event: ${eventName} | Date: ${eventDate} | Seats: ${availableSeats}`;
    document.getElementById("eventDetails").textContent = eventInfo;

     availableSeats--;
    console.log(`Seats after registration: ${availableSeats}`);
  </script>
</body>
</html>
