
# 🌍 Wild Tour

> A web-based Tour Management System for discovering destinations, managing tours, and handling travel bookings efficiently.

![Java](https://img.shields.io/badge/Java-17%2B-orange)
![Jakarta EE](https://img.shields.io/badge/Jakarta%20EE-Servlet-blue)
![JSP](https://img.shields.io/badge/View-JSP-green)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![Maven](https://img.shields.io/badge/Build-Maven-red)
![License](https://img.shields.io/badge/License-Educational-lightgrey)

## 📖 Overview

**Wild Tour** is a web-based Tour Management System designed to simplify the process of exploring, managing, and booking travel experiences.

The application provides a centralized platform where users can browse available tours, view destination details, create bookings, and interact with the system through an intuitive web interface.

Administrators can manage tours, bookings, users, and customer information from the management side of the application.

The project is built using **Java, Jakarta Servlets, JSP, JDBC, MySQL, and Maven**, following a structured backend architecture that separates application logic, data access, and presentation.

---

## ✨ Features

### 👤 User Features

- User registration and authentication
- Secure login and logout
- Browse available tours
- View detailed tour information
- Explore destinations
- Book tours
- Manage booking information
- Contact and inquiry functionality
- User session management

### 🗺️ Tour Management

- View available tour packages
- Add new tours
- Update existing tours
- Delete tours
- Manage destination details
- Manage pricing and tour information

### 📅 Booking Management

- Create tour bookings
- Store customer booking details
- View booking information
- Manage booking status
- Administrative booking management

### 🛠️ Administration

- Manage users
- Manage tours
- Manage bookings
- View customer information
- Handle customer inquiries
- Perform CRUD operations across the system

---

## 🏗️ Architecture

The application follows a layered architecture inspired by the **MVC design pattern**.

```text id="b51fb5"
┌───────────────────────┐
│       Client          │
│   Browser / User      │
└───────────┬───────────┘
            │ HTTP Request
            ▼
┌───────────────────────┐
│   Presentation Layer  │
│       JSP / HTML      │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│   Controller Layer    │
│       Servlets        │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│   Business / Logic    │
│       Services        │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│     Data Access       │
│      DAO / JDBC       │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│       MySQL DB        │
└───────────────────────┘
```

### Request Flow

```text id="jdab4w"
User Request
     │
     ▼
   Servlet
     │
     ▼
Business Logic
     │
     ▼
DAO Layer
     │
     ▼
MySQL Database
     │
     ▼
Response / JSP View
```

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| Language | Java |
| Backend | Jakarta Servlet |
| View Layer | JSP |
| Database | MySQL |
| Database Access | JDBC |
| Build Tool | Maven |
| Web Server | Apache Tomcat |
| Frontend | HTML, CSS, JavaScript |
| Version Control | Git & GitHub |

---

## 📁 Project Structure

```text id="cgt9v9"
Wild_Tour
│
├── src
│   └── main
│       │
│       ├── java
│       │   └── com
│       │       └── wild_tour
│       │           │
│       │           ├── servlet
│       │           ├── dao
│       │           ├── model
│       │           ├── service
│       │           └── util
│       │
│       ├── resources
│       │
│       └── webapp
│           ├── css
│           ├── js
│           ├── images
│           ├── WEB-INF
│           └── *.jsp
│
├── pom.xml
├── README.md
└── .gitignore
```

---

## ⚙️ Getting Started

### Prerequisites

Make sure you have the following installed:

- Java JDK 17 or higher
- Apache Maven
- MySQL
- Apache Tomcat 10+
- Git

Verify your installations:

```bash id="fqlpwm"
java -version
mvn -version
mysql --version
```

---

## 📥 Installation

### 1. Clone the Repository

```bash id="p90e5t"
git clone https://github.com/YOUR_USERNAME/Wild_Tour.git
```

Navigate into the project:

```bash id="pws18e"
cd Wild_Tour
```

---

### 2. Configure the Database

Create a MySQL database:

```sql id="zfw8uz"
CREATE DATABASE wild_tour;
```

Update your database configuration with your local MySQL credentials.

Example configuration:

```java id="hbd7kz"
String url = "jdbc:mysql://localhost:3306/wild_tour";
String username = "YOUR_USERNAME";
String password = "YOUR_PASSWORD";
```

> ⚠️ Never commit real passwords or sensitive credentials to a public repository.

---

### 3. Build the Project

Use Maven to build the project:

```bash id="m7wdn7"
mvn clean install
```

---

### 4. Deploy to Apache Tomcat

Deploy the generated application to your Apache Tomcat server.

Start Tomcat and open:

```text id="9q7kzf"
http://localhost:8080/Wild_Tour/
```

The exact URL may vary depending on your configured context path.

---

## 🗄️ Database Design

The application is based around core entities such as:

### Users

```text id="j0ttaj"
User
├── id
├── name
├── email
├── password
└── role
```

### Tours

```text id="ojg7dp"
Tour
├── id
├── title
├── destination
├── description
├── price
└── duration
```

### Bookings

```text id="b6r2gq"
Booking
├── id
├── user_id
├── tour_id
├── booking_date
└── status
```

### Relationships

```text id="0pyw2a"
┌─────────┐       ┌──────────┐       ┌─────────┐
│  User   │  1 ──<│ Booking  │>── 1  │  Tour   │
└─────────┘       └──────────┘       └─────────┘
```

A user can create multiple bookings, while each booking is associated with a specific tour.

---

## 🔐 Security Practices

The project applies important backend security concepts, including:

- Session-based authentication
- User authorization
- Input validation
- SQL injection prevention
- Prepared statements
- Protected administrative functionality
- Secure database connection handling

Example of a parameterized query:

```java id="zmk51s"
String query = "SELECT * FROM users WHERE email = ?";

PreparedStatement statement =
        connection.prepareStatement(query);

statement.setString(1, email);
```

Using parameterized queries helps reduce the risk of SQL injection.

---

## 🔄 Application Workflow

```text id="nb29ih"
            ┌───────────────┐
            │     User      │
            └───────┬───────┘
                    │
                    ▼
           ┌────────────────┐
           │ Browse Tours   │
           └───────┬────────┘
                   │
                   ▼
           ┌────────────────┐
           │ Select a Tour  │
           └───────┬────────┘
                   │
                   ▼
           ┌────────────────┐
           │ Login/Register │
           └───────┬────────┘
                   │
                   ▼
           ┌────────────────┐
           │   Book Tour    │
           └───────┬────────┘
                   │
                   ▼
           ┌────────────────┐
           │ Store Booking  │
           │   in Database  │
           └───────┬────────┘
                   │
                   ▼
           ┌────────────────┐
           │ Admin Manages  │
           │    Booking     │
           └────────────────┘
```

---

## 📸 Screenshots

Add screenshots of your application here.

### 🏠 Home Page

```md id="91o0zh"
![Home Page](screenshots/home.png)
```

### 🗺️ Tours Page

```md id="e30u10"
![Tours Page](screenshots/tours.png)
```

### 📅 Booking Page

```md id="rs6km9"
![Booking Page](screenshots/booking.png)
```

### 🔐 Login Page

```md id="9y64rr"
![Login Page](screenshots/login.png)
```

### 🛠️ Admin Dashboard

```md id="l0e4dj"
![Admin Dashboard](screenshots/admin-dashboard.png)
```

---

## 🚀 Future Improvements

- [ ] Online payment integration
- [ ] Email booking confirmation
- [ ] Password hashing with BCrypt
- [ ] Forgot password functionality
- [ ] Tour reviews and ratings
- [ ] Advanced search and filtering
- [ ] Image upload for tours
- [ ] REST API support
- [ ] JWT authentication
- [ ] Role-based access control
- [ ] Admin analytics dashboard
- [ ] Cloud deployment
- [ ] Docker support

---

## 🧠 What I Learned

Through this project, I gained practical experience with:

- Java web application development
- Jakarta Servlets
- JSP
- MVC architecture
- JDBC
- MySQL database integration
- CRUD operations
- Session management
- Authentication and authorization
- Maven dependency management
- Git and GitHub
- Deploying Java web applications

---

## 🤝 Contributing

Contributions are welcome.

If you would like to contribute:

1. Fork the repository.
2. Create a new feature branch.

```bash id="cy43w5"
git checkout -b feature/your-feature-name
```

3. Make your changes.
4. Commit your changes.

```bash id="v1smrf"
git commit -m "Add: your feature description"
```

5. Push to your branch.

```bash id="vxakpa"
git push origin feature/your-feature-name
```

6. Open a Pull Request.

---

## 👨‍💻 Author

**Ganesh K S**

Backend Developer focused on building scalable web applications and continuously improving software engineering skills.

- GitHub: https://github.com/ganeshkshassan-droid

---

## 📄 License

This project is currently intended for **educational and portfolio purposes**.

---

<div align="center">

### ⭐ If you found this project useful, consider giving it a star!

**Built with Java • Jakarta Servlets • JSP • JDBC • MySQL • Maven**

</div>
