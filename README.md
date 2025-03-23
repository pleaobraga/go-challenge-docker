# Go Challenge Docker

This project is a simple Go application designed to demonstrate Docker containerization and deployment best practices. The application prints "Full Cycle Rocks!!" when executed.

## 🚀 Getting Started

### Prerequisites
Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Go (Optional for local development)](https://golang.org/doc/install)

## 🛠️ Running the Application

### Option 1: Run Locally (without Docker)
If you want to run the application locally (with Go installed):

```bash
git clone https://github.com/pleaobraga/go-challenge-docker.git
cd go-challenge-docker
go run main.go
```

**Expected Output:**
```
Full Cycle Rocks!!
```

---

### Option 2: Run with Docker
This application has been containerized for simplicity. To run the application using Docker:

1. Clone the repository:
   ```bash
   git clone https://github.com/pleaobraga/go-challenge-docker.git
   cd go-challenge-docker
   ```

2. Build the Docker image:
   ```bash
   docker build -t pleaobraga/fullcycle .
   ```

3. Run the Docker container:
   ```bash
   docker run --rm pleaobraga/fullcycle
   ```

**Expected Output:**
```
Full Cycle Rocks!!
```

---

### Option 3: Pull Pre-Built Image from Docker Hub
This image has been published to Docker Hub for convenience. You can pull and run it directly without building locally:

```bash
docker run --rm pleaobraga/fullcycle
```

**Docker Hub Link:** [pleaobraga/fullcycle](https://hub.docker.com/r/pleaobraga/fullcycle)

---

## 🧱 Project Structure
```
/go-challenge-docker
 ├── main.go       # Main Go application file
 ├── Dockerfile     # Dockerfile to build the image
 └── README.md      # Project documentation
```

---

## 🐳 Dockerfile Explanation
This project follows best practices using a **multi-stage build** to minimize image size:

```dockerfile
FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM scratch
COPY --from=builder /app/main .
CMD ["/main"]
```

✅ **Multi-stage Build:** Ensures the final image is minimal by using `scratch` as the final stage.  
✅ **CGO_ENABLED=0:** Disables CGO for a statically linked binary.  
✅ **Final Image Size:** Minimal and lightweight for efficient deployment.  

---

## 📄 License
This project is licensed under the MIT License.

---

## 🤝 Contributing
Contributions are welcome! Feel free to fork the repository, create a branch, and submit a pull request.

---

## 📧 Contact
For questions or suggestions, feel free to reach out via [GitHub](https://github.com/pleaobraga).

---

**Happy Coding! 🚀**

