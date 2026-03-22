-- -------------------- USERS --------------------
CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_type TEXT,
  name TEXT NOT NULL,
  student_number TEXT,
  employee_number TEXT,
  email TEXT NOT NULL
);

-- -------------------- BOOKS --------------------
CREATE TABLE IF NOT EXISTS books (
  book_code TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  author TEXT NOT NULL,
  year INTEGER,
  category TEXT,
  dewey_decimal TEXT,
  available INTEGER DEFAULT 1
);

-- -------------------- BORROW RECORDS --------------------
CREATE TABLE IF NOT EXISTS borrow_records (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  book_code TEXT,
  user_id INTEGER,
  borrow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  due_date DATE,
  return_date DATETIME,
  FOREIGN KEY (book_code) REFERENCES books(book_code),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- -------------------- BOOKS --------------------
INSERT OR IGNORE INTO books (book_code, title, author, year, category, dewey_decimal, available) VALUES
-- SB = Storybooks
('SB-001', 'Noli Me Tángere', 'José Rizal', 1887, 'Storybooks', '899.211', 1),
('SB-002', 'Ilustrado', 'Miguel Syjuco', 2008, 'Storybooks', '823.92', 1),
('SB-003', 'Alamat ng Ampalaya', 'Augie Rivera', 1997, 'Storybooks', '899.211', 1),

-- RM = Reference Materials
('RM-001', 'Merriam-Webster''s Dictionary', 'Merriam-Webster', 1843, 'Reference Materials', '423', 1),
('RM-002', 'Encyclopædia Britannica', 'Encyclopaedia Britannica', 1910, 'Reference Materials', '030', 1),
('RM-003', 'The World Almanac', 'Sarah Janssen', 2024, 'Reference Materials', '030', 1),

-- BE = Basic Education
('BE-001', 'Closing the Vocabulary Gap', 'Alex Quigley', 2018, 'Basic Education', '372.44', 1),
('BE-002', 'Liberating Learning', 'Santiago Rincón-Gallardo', 2019, 'Basic Education', '371.2', 1),
('BE-003', 'Teaching Computing', 'William Lau', 2017, 'Basic Education', '371.33', 1),

-- BT = Basic Technology
('BT-001', 'Learn to Code with Scratch', 'Raspberry Pi Foundation', 2016, 'Basic Technology', '005.13', 1),
('BT-002', 'Discrete Mathematics', 'Oscar Levin', 2018, 'Basic Technology', '511', 1),
('BT-003', 'Data Science at the Command Line', 'Jeroen Janssens', 2021, 'Basic Technology', '005.7', 1),

-- CM = Cultural Materials
('CM-001', 'The Mythology Class', 'Arnold Arre', 1999, 'Cultural Materials', '741.5959', 1),
('CM-002', 'Filipino Children''s Favorite Stories', 'Liana Romulo', 2020, 'Cultural Materials', '398.2', 1),
('CM-003', 'Philippine Folk Literature', 'Damiana L. Eugenio', 2002, 'Cultural Materials', '398.2', 1);

-- -------------------- USERS --------------------
INSERT OR IGNORE INTO users (user_type, name, student_number, employee_number, email) VALUES
-- Students
('student', 'Juan Dela Cruz', 'S10101', NULL, 'juan.dela.cruz@school.edu.ph'),
('student', 'Maria Santos', 'S10102', NULL, 'maria.santos@school.edu.ph'),
('student', 'Jose Reyes', 'S10103', NULL, 'jose.reyes@school.edu.ph'),
('student', 'Ana Garcia', 'S10104', NULL, 'ana.garcia@school.edu.ph'),
('student', 'Carlo Mendoza', 'S10105', NULL, 'carlo.mendoza@school.edu.ph'),

-- Teachers
('teacher', 'Ricardo Villanueva', NULL, 'T10101', 'ricardo.villanueva@school.edu.ph'),
('teacher', 'Linda Aquino', NULL, 'T10102', 'linda.aquino@school.edu.ph'),
('teacher', 'Ernesto Bautista', NULL, 'T10103', 'ernesto.bautista@school.edu.ph'),
('teacher', 'Susana Castillo', NULL, 'T10104', 'susana.castillo@school.edu.ph'),
('teacher', 'Danilo Flores', NULL, 'T10105', 'danilo.flores@school.edu.ph'),

-- Admins
('admin', 'Rosario Lim', NULL, 'E10201', 'rosario.lim@school.edu.ph'),
('admin', 'Fernando Cruz', NULL, 'E10202', 'fernando.cruz@school.edu.ph'),
('admin', 'Gloria Ramos', NULL, 'E10203', 'gloria.ramos@school.edu.ph'),
('admin', 'Benito Torres', NULL, 'E10204', 'benito.torres@school.edu.ph'),
('admin', 'Carmen Navarro', NULL, 'E10205', 'carmen.navarro@school.edu.ph');