# SmartBank - Modular Banking Backend System


## System Overview  

SmartBank is a web-based banking application built with Flask and MySQL. It allows customers to register, log in, view their details, transfer money, manage savings, and view transaction history. Admins can access a dashboard to view all customers. The application emphasizes security with session management and basic validation.

## Features

- **User Registration**: New customers can register with personal details, creating an account with an initial balance of 0.
- **Login/Logout**: Secure login for customers and a hardcoded admin login.
- **Customer Dashboard**: Access to view profile, transfer money, add savings, and view transactions.
- **Money Transfer**: Transfer funds between accounts with balance checks and transaction logging.
- **Savings**: Add money to your account balance.
- **Transaction History**: View all transactions (sent and received) in chronological order.
- **Profile Management**: Update personal details like username, DOB, phone, and email.
- **Account Deletion**: Permanently delete your account after password verification.
- **Forgot Password**: Reset password via email (basic implementation without actual email sending).
- **Admin Dashboard**: View all registered customers.
- **Session Management**: Ensures only logged-in users access restricted pages.

## Prerequisites

- Python 3.x
- MySQL (via XAMPP or standalone)
- Flask and related libraries (see Installation)

## Installation

1. **Clone the Repository**:
   ```
   git clone <repository-url>
   cd smartbank
   ```

2. **Install Python Dependencies**:
   ```
   pip install flask flask-mysqldb mysql-connector-python
   ```

3. **Set Up MySQL Database**:
   - Install and start XAMPP (or your preferred MySQL server).
   - Open phpMyAdmin (usually at http://localhost/phpmyadmin).
   - Create a database named `smartbank`.
   - Create the following tables:

     **customers**:
     ```sql
     CREATE TABLE customers (
         account_number VARCHAR(20) PRIMARY KEY,
         username VARCHAR(50) NOT NULL,
         dob DATE NOT NULL,
         gender VARCHAR(10) NOT NULL,
         aadhar_number VARCHAR(12) NOT NULL,
         pan_number VARCHAR(10) NOT NULL,
         phone_number VARCHAR(15) NOT NULL,
         email VARCHAR(100) UNIQUE NOT NULL,
         password VARCHAR(255) NOT NULL,
         address TEXT NOT NULL
     );
     ```

     **accounts**:
     ```sql
     CREATE TABLE accounts (
         account_number VARCHAR(20) PRIMARY KEY,
         balance DECIMAL(10,2) DEFAULT 0.00,
         FOREIGN KEY (account_number) REFERENCES customers(account_number)
     );
     ```

     **transactions**:
     ```sql
     CREATE TABLE transactions (
         id INT AUTO_INCREMENT PRIMARY KEY,
         from_account VARCHAR(20) NOT NULL,
         to_account VARCHAR(20) NOT NULL,
         amount DECIMAL(10,2) NOT NULL,
         timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
         FOREIGN KEY (from_account) REFERENCES accounts(account_number),
         FOREIGN KEY (to_account) REFERENCES accounts(account_number)
     );
     ```

4. **Configure the Application**:
   - Update `app.config` in the code if your MySQL settings differ (e.g., password, host).
   - Ensure templates (e.g., `index.html`, `login.html`) are in a `templates/` folder.
   - Ensure static files (CSS/JS) are in a `static/` folder if used.

## Running the Application

1. Start your MySQL server (via XAMPP).
2. Run the Flask app:
   ```
   python app.py
   ```
   - The app will run on `http://127.0.0.1:5000/` with debug mode enabled.
   - For production, set `debug=False` and use a WSGI server like Gunicorn.

## Usage

- **Home Page**: Visit `/` to access the main page.
- **Register**: Go to `/register` to create a new account.
- **Login**: Use `/login` to log in as a customer or admin (admin: email=`admin@gmail.com`, password=`admin123`).
- **Customer Features** (after login):
  - Dashboard: `/customer`
  - View Details: `/view_customer`
  - Transfer Money: `/trans_amount`
  - Add Savings: `/savings`
  - View Transactions: `/transactions`
  - Update Profile: `/update_profile`
  - Delete Account: `/delete_account`
- **Admin Features**: `/admin` to view all customers.
- **Forgot Password**: `/forgot_password` to reset password.
- **Logout**: `/logout` to end session.

### Example Workflow
1. Register a new customer.
2. Log in and add savings.
3. Transfer money to another account (ensure the recipient exists).
4. View transaction history.

## Security Notes

- Passwords are stored in plain text (not recommended for production; use hashing like bcrypt).
- Admin credentials are hardcoded.
- Use HTTPS in production.
- Validate all inputs to prevent SQL injection (Flask-MySQLdb helps, but parameterized queries are used).