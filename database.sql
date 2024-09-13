-- Create the database
CREATE DATABASE pintar_analitika;
USE pintar_analitika;

-- Create the 'users' table for user management
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    role ENUM('admin', 'manager', 'staff') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the 'business_data' table for storing business data
CREATE TABLE business_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_type VARCHAR(255) NOT NULL,
    value FLOAT NOT NULL,
    date DATE NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create the 'reports' table for storing generated reports
CREATE TABLE reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    report_type VARCHAR(255) NOT NULL,
    generated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert some default users (optional)
INSERT INTO users (username, password, email, role) VALUES
('admin', MD5('admin123'), 'admin@example.com', 'admin'),
('manager', MD5('manager123'), 'manager@example.com', 'manager'),
('staff', MD5('staff123'), 'staff@example.com', 'staff');

-- Insert example data for business_data table (optional)
INSERT INTO business_data (data_type, value, date, user_id) VALUES
('Penjualan', 1000000, '2024-01-01', 2),
('Inventaris', 200000, '2024-01-02', 2),
('Pengeluaran', 500000, '2024-01-03', 2);

-- Insert example data for reports table (optional)
INSERT INTO reports (report_type, user_id) VALUES
('Laporan Penjualan', 2),
('Laporan Inventaris', 2),
('Laporan Pengeluaran', 2);

-- View all users (for testing purposes)
SELECT * FROM users;

-- View all business data (for testing purposes)
SELECT * FROM business_data;

-- View all reports (for testing purposes)
SELECT * FROM reports;
