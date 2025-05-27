<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>DOM Manipulation</title>
  <style>
    .card {
      border: 1px solid #ccc;
      padding: 10px;
      margin: 5px;
      width: 200px;
    }
  </style>
</head>
<body>
  <h2>Available Events</h2>
  <div id="eventsContainer"></div>

  <script>
    const events = [
      { name: "Coding Bootcamp", seats: 10 },
      { name: "Health Seminar", seats: 5 }
    ];

    const container = document.getElementById("eventsContainer");

    events.forEach(event => {
      const card = document.createElement("div");
      card.className = "card";
      card.innerHTML = `<h3>${event.name}</h3><p>Seats: ${event.seats}</p>`;
      container.appendChild(card);
    });
  </script>
</body>
</html>
