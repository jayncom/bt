CREATE DATABASE student_db;

USE student_db;

CREATE TABLE mon_hoc (
    ma_mon_hoc VARCHAR(10) PRIMARY KEY,
    ten_mon_hoc VARCHAR(255)
);
CREATE TABLE sinh_vien (
    ma_sinh_vien VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(255)
);
CREATE TABLE bang_diem (
    ma_mon_hoc VARCHAR(10),
    ma_sinh_vien VARCHAR(10),
    diem_so FLOAT,
    PRIMARY KEY (ma_mon_hoc, ma_sinh_vien),
    FOREIGN KEY (ma_mon_hoc) REFERENCES mon_hoc(ma_mon_hoc),
    FOREIGN KEY (ma_sinh_vien) REFERENCES sinh_vien(ma_sinh_vien)
);
INSERT INTO mon_hoc (ma_mon_hoc, ten_mon_hoc)
VALUES 
    ('MH001', 'Toán'),
    ('MH002', 'Lý'),
    ('MH003', 'Hóa');
INSERT INTO sinh_vien (ma_sinh_vien, ho_ten)
VALUES 
    ('MSSV123', 'Nguyễn Văn A'),
    ('MSSV456', 'Trần Thị B'),
    ('MSSV789', 'Lê Hoàng C');

-- Thêm điểm cho sinh viên MSSV123
INSERT INTO bang_diem (ma_mon_hoc, ma_sinh_vien, diem_so)
VALUES 
   ('MH001', 'MSSV123', 8.5),
   ('MH002', 'MSSV123', 9.0),
   ('MH003', 'MSSV123', 7.8);

-- Thêm điểm cho sinh viên MSSV456
INSERT INTO bang_diem (ma_mon_hoc, ma_sinh_vien, diem_so)
VALUES 
   ('MH001', 'MSSV456', 7.0),
   ('MH002', 'MSSV456', 8.5),
   ('MH003', 'MSSV456', 9.2);

-- Thêm điểm cho sinh viên MSSV789
INSERT INTO bang_diem (ma_mon_hoc, ma_sinh_vien, diem_so)
VALUES 
   ('MH001', 'MSSV789', 9.0),
   ('MH002', 'MSSV789', 8.0),
   ('MH003', 'MSSV789', 8.8);

SELECT sv.ho_ten AS ho_ten_sinh_vien, bd.diem_so
FROM sinh_vien sv
JOIN bang_diem bd ON sv.ma_sinh_vien = bd.ma_sinh_vien
JOIN mon_hoc mh ON bd.ma_mon_hoc = mh.ma_mon_hoc
WHERE mh.ten_mon_hoc = 'Lý';


SELECT 
    sv.ho_ten AS ten_sinh_vien, 
    mh.ten_mon_hoc, 
    bd.ma_mon_hoc, 
    bd.ma_sinh_vien, 
    bd.diem_so
FROM 
    bang_diem bd
JOIN 
    sinh_vien sv ON bd.ma_sinh_vien = sv.ma_sinh_vien
JOIN 
    mon_hoc mh ON bd.ma_mon_hoc = mh.ma_mon_hoc
WHERE 
    mh.ten_mon_hoc = 'Lý';


