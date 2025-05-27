<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Conditionals, Loops, Error Handling</title>
</head>
<body>
  <h2>Upcoming Events</h2>
  <ul id="eventList"></ul>

  <script>
    const events = [
      { name: "Music Night", date: "2025-08-01", seats: 20 },
      { name: "Past Art Show", date: "2024-05-01", seats: 0 },
      { name: "Food Festival", date: "2025-09-15", seats: 100 }
    ];

    const now = new Date("2025-05-01"); // Current simulation date
    const list = document.getElementById("eventList");

    events.forEach(event => {
      const eventDate = new Date(event.date);
      if (eventDate > now && event.seats > 0) {
        const li = document.createElement("li");
        li.textContent = `${event.name} - ${event.date} (${event.seats} seats)`;
        list.appendChild(li);
      }
    });

    try {
      let seatCount = events[0].seats;
      if (seatCount <= 0) throw new Error("No seats available");
      console.log("Registration possible");
    } catch (err) {
      console.error("Registration failed:", err.message);
    }
  </script>
</body>
</html>
