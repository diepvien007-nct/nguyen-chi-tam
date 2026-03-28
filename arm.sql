-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 27, 2025 lúc 01:45 PM
-- Phiên bản máy phục vụ: 10.6.19-MariaDB
-- Phiên bản PHP: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webchamcong`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_month` int(11) NOT NULL,
  `pay_year` int(11) NOT NULL,
  `base_salary` decimal(12,2) DEFAULT NULL,
  `overtime_pay` decimal(12,2) DEFAULT NULL,
  `deductions` decimal(12,2) DEFAULT NULL,
  `net_salary` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_type` enum('nghi_phep','lam_them','tam_ung','quen_cham_cong') NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` text NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `approved_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `requests`
--

INSERT INTO `requests` (`id`, `user_id`, `request_type`, `start_date`, `end_date`, `reason`, `amount`, `status`, `approved_by`, `created_at`) VALUES
(1, 1, 'nghi_phep', '2025-11-04', '2025-11-08', 'gì đó', NULL, 'approved', 2, '2025-11-06 19:58:17'),
(2, 1, 'nghi_phep', '2025-11-14', '2025-11-22', '222', NULL, 'rejected', 2, '2025-11-06 21:21:44'),
(3, 3, 'nghi_phep', '2025-11-29', '2025-11-30', 'nghỉ bệnh', NULL, 'rejected', 3, '2025-11-27 05:38:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `time_attendances`
--

CREATE TABLE `time_attendances` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin_time` datetime DEFAULT NULL,
  `checkout_time` datetime DEFAULT NULL,
  `work_date` date NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `time_attendances`
--

INSERT INTO `time_attendances` (`id`, `user_id`, `checkin_time`, `checkout_time`, `work_date`, `notes`) VALUES
(1, 1, '2025-11-07 02:54:51', '2025-11-07 02:54:53', '2025-11-07', NULL),
(2, 3, '2025-11-27 12:41:18', '2025-11-27 12:41:28', '2025-11-27', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_code` varchar(50) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `role` enum('user','hr','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `employee_code`, `full_name`, `email`, `password`, `position`, `role`, `created_at`) VALUES
(1, 'NV0002009', 'Lê Tuấn Vũ', 'vu.lt@example.com', '123', 'Pha Chế', 'user', '2025-11-06 19:36:55'),
(2, 'NV0000001', 'Nguyễn Văn An', 'an.nv@example.com', '123456', 'Quản lý Nhân sự', 'hr', '2025-11-06 19:36:55'),
(3, 'NV0000002', 'Trần Thị Bình', 'binh.tt@example.com', '123456', 'Admin Hệ thống', 'admin', '2025-11-06 19:36:55'),
(4, 'NV0002010', 'Phạm Thị Chi', 'chi.pt@example.com', '123456', 'Thu Ngân', 'user', '2025-11-06 19:36:55'),
(5, '021d', 'huy khanh', 'huykhank0609@gmail.com', 'bobacf13', 'Nhân viên2', 'user', '2025-11-06 20:14:47'),
(7, '021dd22', 'huy khanh2', 'huykhank12@gmail.com', 'bobacf13', 'Nhân viên2', 'user', '2025-11-06 20:56:54'),
(9, '0', 'd', 'huykhank123@gmail.com', 'bobacf13', 'Nhân viên222', 'user', '2025-11-06 21:22:30'),
(10, 'PC001', 'Nguyễn Văn Tèo', 'vanteo@gmail.com', 'vanteo123', 'Pha chế', 'user', '2025-11-25 06:30:09');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `time_attendances`
--
ALTER TABLE `time_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_code` (`employee_code`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `time_attendances`
--
ALTER TABLE `time_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `time_attendances`
--
ALTER TABLE `time_attendances`
  ADD CONSTRAINT `time_attendances_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
