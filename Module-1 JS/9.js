<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Async JS and Fetch</title>
</head>
<body>
  <h2>Fetch Events</h2>
  <button onclick="loadEvents()">Load Events</button>
  <p id="status"></p>
  <ul id="eventList"></ul>

  <script>
    function loadEvents() {
      const status = document.getElementById("status");
      status.textContent = "Loading...";

      // Simulate API fetch
      setTimeout(async () => {
        try {
          const events = await fetchMockEvents();
          status.textContent = "Loaded successfully!";
          const list = document.getElementById("eventList");
          events.forEach(event => {
            const li = document.createElement("li");
            li.textContent = event.name;
            list.appendChild(li);
          });
        } catch (error) {
          status.textContent = "Failed to load events.";
        }
      }, 1000);
    }

    function fetchMockEvents() {
      return new Promise((resolve, reject) => {
        const mockData = [
          { name: "Music Fest" },
          { name: "Coding Bootcamp" }
        ];
        resolve(mockData);
      });
    }
  </script>
</body>
</html>
