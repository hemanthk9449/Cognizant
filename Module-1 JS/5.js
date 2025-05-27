<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Objects and Prototypes</title>
</head>
<body>
  <h2>Event Object Example</h2>
  <p id="objectOutput"></p>

  <script>
    function Event(name, date, seats) {
      this.name = name;
      this.date = date;
      this.seats = seats;
    }

    Event.prototype.checkAvailability = function () {
      return this.seats > 0 ? "Seats Available" : "Sold Out";
    };

    const myEvent = new Event("Tech Talk", "2025-10-10", 25);
    const entries = Object.entries(myEvent);

    document.getElementById("objectOutput").innerHTML = `
      <strong>${myEvent.name}</strong> on ${myEvent.date} - ${myEvent.checkAvailability()}<br>
      <strong>Details:</strong> ${entries.map(([k, v]) => `${k}: ${v}`).join(", ")}`;
  </script>
</body>
</html>
