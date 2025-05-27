<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Functions, Closures, HOF</title>
</head>
<body>
  <h2>Event Functions</h2>
  <p id="results"></p>

  <script>
    const events = [
      { name: "Yoga Class", category: "Health" },
      { name: "Painting", category: "Art" },
      { name: "Jazz Night", category: "Music" }
    ];

    function addEvent(eventList, name, category) {
      eventList.push({ name, category });
    }

    function registerUser(eventName) {
      return `User registered for ${eventName}`;
    }

    function filterEventsByCategory(events, category) {
      return events.filter(event => event.category === category);
    }

    function registrationCounter() {
      let count = 0;
      return function () {
        count++;
        return count;
      };
    }

    const musicCounter = registrationCounter();
    const filtered = filterEventsByCategory(events, "Music");
    const msg = registerUser(filtered[0].name);
    const total = musicCounter();

    document.getElementById("results").textContent = `${msg}. Total registrations in Music: ${total}`;
  </script>
</body>
</html>
