-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 08, 2025 lúc 12:21 PM
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
-- Cơ sở dữ liệu: `watchshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`) VALUES
(1, 'Casio', 'casio', '2025-08-10 09:45:25'),
(2, 'Seiko', 'seiko', '2025-08-10 09:45:25'),
(3, 'Citizen', 'citizen', '2025-08-10 09:45:25'),
(4, 'Orient', 'orient', '2025-08-10 09:45:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_name` varchar(80) DEFAULT NULL,
  `guest_email` varchar(120) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `user_id`, `guest_name`, `guest_email`, `rating`, `content`, `status`, `created_at`) VALUES
(7, 35, NULL, NULL, NULL, 5, '??ng h? ??p quá nha', 'approved', '2025-08-19 15:26:36'),
(8, 35, NULL, NULL, NULL, 4, 'x?n quá shop ?i', 'approved', '2025-08-19 15:26:48'),
(10, 33, NULL, NULL, NULL, 5, 'asdsasd', 'approved', '2025-08-21 03:00:26'),
(11, 19, 18, NULL, NULL, 5, 'cccccccc', 'approved', '2025-10-11 06:15:22'),
(12, 1, NULL, 'sdf', 'Das@gmail.com', 4, 'xgxdgdxg', 'approved', '2025-10-11 06:15:53'),
(13, 11, 19, NULL, NULL, 3, 'c?ng ???c', 'approved', '2025-10-11 07:22:05'),
(14, 11, 19, NULL, NULL, 5, 'tuy?t v?i', 'approved', '2025-10-22 07:04:32'),
(15, 31, 19, NULL, NULL, 3, 't?m ???c', 'approved', '2025-10-22 07:10:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(180) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `image_url` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `sku` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `description`, `brand`, `price`, `image_url`, `stock`, `created_at`, `sku`) VALUES
(1, 1, 'Đồng hồ CASIO A168WG-9WDF', 'casio-a168wg-9', 'Gần 80 năm đứng vững trên thị trường ngành công nghiệp đồng hồ, Casio đã khẳng định được vị thế thương hiệu khi liên tục cho ra đời những chiếc đồng hồ đeo tay đa dạng về mẫu mã và đạt chuẩn về chất lượng. Từ những sản phẩm nằm trong phân khúc giá bình dân đến những chiếc đồng hồ cao cấp, tất cả đều được lắp ráp tỉ mỉ, đảm bảo đạt chuẩn chất lượng trong mọi khâu.\r\n\r\nThương hiệu đồng hồ Casio Nhật Bản đã thành công chế tác ra chiếc đồng hồ A168WG-9 – chiếc đồng hồ điện tử nổi tiếng với thiết kế vintage cổ điển, phong cách thời trang với nhiều tính năng tiện ích. Phiên bản với thiết kế mang kiểu dáng chứa đựng vẻ đẹp unisex cùng chất lượng cao cấp đạt chuẩn Nhật Bản đã nhanh chóng lọt vào mắt xanh của các tín đồ mê đồng hồ.', 'Casio', 129.00, 'public/images/MTP-1374L-1AV.png', 20, '2025-08-10 09:45:25', NULL),
(2, 1, 'Đồng hồ Casio F91W-1', 'casio-f91w-1', 'Là 1 sản phẩm Đồng hồ Casio Nam Nhật Bản, thương hiệu đã được khẳng định về chất lượng với giá thành vô cùng hợp lý. Bello là đối tác chính thức của Casio tại Việt Nam từ 2009. Mua Casio đến Bello!', 'Casio', 19.90, 'public/images/CASIO-F-91W-1.jpg', 100, '2025-08-10 09:45:25', NULL),
(3, 2, 'Đồng hồ Seiko 5 Sports SSK003K1', 'seiko-5-sports', 'Seiko 5 Sports GMT SSK003K1 kiểu dáng thể thao sang trọng, tích hợp chức năng GMT phục vụ cho người dùng thường xuyên du lịch, công tác tại nước ngoài.', 'Seiko', 249.00, 'https://donghoduyanh.com/images/products/2023/05/07/large/ssk003k1_1683475339.jpg', 15, '2025-08-10 09:45:25', NULL),
(11, 1, 'Đồng Hồ Nam CASIO MTP-M110L-1AV', 'mtp-m110l-1av', 'Được thiết kế với diện mạo cổ điển của kim giờ, phút và giây, những chiếc đồng hồ kim phong cách này còn trang bị chỉ báo tuần trăng để đưa bạn đến nơi bạn muốn, dù là trong hay ngoài giờ làm việc. Khả năng chống nước tối đa ở độ sâu 50 mét giúp bạn không phải lo lắng khi đi dưới trời mưa hoặc tiếp xúc với nước.', NULL, 250.00, 'https://cdn.casio-vietnam.vn/wp-content/uploads/2025/08/MTP-M110L-1AV.jpg', 5, '2025-08-19 02:40:02', NULL),
(12, 3, 'Đồng Hồ CITIZEN Quartz EQ0595-55A', 'bf2011-01e', 'Đồng hồ CITIZEN Quartz BF2011-01E mẫu nam xuất xứ từ Nhật Bản, sử dụng bộ máy pin hoạt động chính xác và bền bỉ. Mặt kính khoáng cứng chịu lực tốt. Vỏ được làm từ chất liệu thép không gỉ 316L kèm với dây da cao cấp. Khả năng chống nước là 50M có thể đi mưa và rửa tay.', NULL, 450.00, 'public/images/EQ0595-55A.jpg', 45, '2025-08-19 03:21:04', NULL),
(13, 1, 'Đồng hồ Casio G-SHOCK GMA-P2100PC-4A', 'gma-p2100pc-4ab', 'Làm bừng sáng phong cách năng động của bạn với đồng hồ GMA-P2100 có mặt số màu phân cực.\r\n\r\nChiếc đồng hồ nhỏ gọn sang trọng này tỏa sáng rực rỡ từ mọi góc độ, và các vạch chỉ giờ bóng loáng lấp lánh ấn tượng hơn nữa. Viền và dây đeo có kết cấu mờ tạo nên sự cân bằng ấn tượng, tinh tế, làm nổi bật vẻ đẹp rực rỡ độc đáo của thiết kế.', NULL, 756.00, 'public/images/GMA-P2100PC-4A.jpg', 7, '2025-08-19 05:54:00', NULL),
(15, 3, 'Đồng Hồ CITIZEN L Eco-Drive EM0006-53W', 'emyeu0006-53w', 'Đồng hồ Citizen Eco-Drive siêu mỏng màu bạc EM0006-53W là sự kết hợp hoàn hảo giữa hình thức và chức năng. Vòng đeo tay bằng thép không gỉ bóng bẩy của nó tự hào có lớp hoàn thiện được đánh bóng, mang đến một phụ kiện đa năng cho cả những dịp bình thường và trang trọng. Mặt số màu đỏ, được bao bọc trong cấu trúc thép không gỉ chắc chắn, được bổ sung bởi tinh thể sapphire mang lại độ bền và khả năng xem giờ rõ ràng. Đồng hồ có công nghệ Eco-Drive, khai thác ánh sáng để cung cấp năng lượng cho chuyển động thạch anh, loại bỏ nhu cầu thay pin. Nó được thiết kế để chống nước ở độ sâu lên đến 50 mét, phù hợp để đeo hàng ngày và các hoạt động dưới nước nhẹ. Khóa cài gập bằng nút bấm đảm bảo vừa vặn an toàn với kích thước cổ tay lên đến 19 cm.', NULL, 589.00, 'public/images/EM0006-53W.jpg', 5, '2025-08-19 05:57:10', NULL),
(17, 3, 'Đồng Hồ CITIZEN L Eco-Drive EW5602-81D', 'ewws5602-81dad', 'Đồng Hồ Nữ Chính Hãng CITIZEN L Eco-Drive EW5602-81D – Thanh Lịch & Sang Trọng\r\nThiết Kế Nhỏ Gọn, Tinh Tế\r\nCitizen L Eco-Drive EW5602-81D mang phong cách thanh lịch và sang trọng với mặt số xà cừ tự nhiên lấp lánh, tạo hiệu ứng ánh sáng đẹp mắt. mẫu này có kích thước nhỏ gọn hơn với đường kính 21.5mm, cực kỳ phù hợp với những cô nàng yêu thích phong cách tinh tế và thanh mảnh.\r\n\r\nĐiểm nhấn nổi bật của EW5602-81D chính là phần vỏ, dây và viền mạ vàng sang trọng, tạo nên sự quý phái nhưng vẫn giữ được sự nhẹ nhàng, nữ tính.\r\n\r\nCông Nghệ Eco-Drive – Hiện Đại & Bền Bỉ\r\nĐồng hồ được trang bị công nghệ Eco-Drive độc quyền của Citizen, giúp chuyển hóa năng lượng ánh sáng thành điện năng để hoạt động mà không cần thay pin. Đây là một giải pháp thân thiện với môi trường và cực kỳ tiện lợi cho người dùng.\r\n\r\nChất Liệu Cao Cấp & Độ Bền Tuyệt Vời\r\nMặt kính Sapphire: Khả năng chống trầy xước vượt trội, giữ đồng hồ luôn sáng đẹp.\r\nChống nước 5ATM (50m): Phù hợp cho các hoạt động hàng ngày như rửa tay, đi mưa nhẹ.\r\nDây và vỏ thép không gỉ mạ vàng PVD: Tạo sự sang trọng, độ bền cao, giữ màu lâu dài.\r\nLý Do Nên Chọn Citizen L Eco-Drive EW5602-81D\r\nThiết kế nhỏ gọn, sang trọng, phù hợp với cổ tay thanh mảnh.\r\nMặt số xà cừ tinh tế, phản chiếu ánh sáng đẹp mắt.\r\nCông nghệ Eco-Drive tiên tiến, không cần thay pin.\r\nMặt kính sapphire chống trầy, bảo vệ đồng hồ lâu dài.\r\nDây và vỏ mạ vàng cao cấp, tôn lên vẻ đẹp quý phái.\r\n\r\nCitizen L Eco-Drive EW5602-81D là mẫu đồng hồ lý tưởng cho những ai yêu thích phong cách nữ tính, sang trọng nhưng vẫn giữ được nét thanh thoát. Với công nghệ Eco-Drive hiện đại, chất liệu cao cấp và thiết kế tinh tế, đây chắc chắn là một phụ kiện hoàn hảo dành cho phái đẹp.', NULL, 821.00, 'public/images/EW5602-81D.jpg', 3, '2025-08-19 06:00:53', NULL),
(19, 3, 'Đồng Hồ CITIZEN L EM1114-80Y', 'emyeu1114-801a-2b-345bc', 'CITIZEN L EM1114-80Y – mẫu nữ xuất xứ từ Nhật Bản, sử dụng bộ máy Eco-Drive độc quyền của hãng Citizen, chuyển hóa mọi nguồn sáng thành năng lượng, không cần thay pin thường xuyên. Vỏ mạ vàng hồng PVD và dây được làm bằng thép không gỉ 316L cao cấp chắc chắn, bền bỉ. Mặt kính Sapphire chịu lực tốt; khả năng chống nước 50m đủ để chịu nước khi đi mưa và rửa tay.', NULL, 998.00, 'public/images/EM1114-80Y.jpg', 2, '2025-08-19 06:03:52', NULL),
(21, 4, 'Đồng hồ Orient Star Classic Moonphase RE-AY0121A00B', 're-ay0121a00-b23-hsdhj', 'Lấy cảm hứng từ mùa thu, Orient Star tạo nên RE-AY0121A00B với thiết kế quý phái và cuốn hút. Cùng Đồng hồ Galle khám phá ngay mẫu đồng hồ nữ này nhé!\r\n\r\nOrient Star - Trải nghiệm đồng hồ cao cấp, tinh hoa Nhật Bản\r\nĐược thành lập từ năm 1951, Orient Star được định vị ở phân khúc cao cấp hơn so với dòng Orient thông thường. Nếu như với Orient, người dùng sẽ có cơ hội tiếp cận những mẫu đồng hồ với tính năng cơ bản và mức giá hấp dẫn thì qua Orient Star, thương hiệu Nhật Bản mong muốn đem tới những trải nghiệm cao cấp và vượt trội hơn.\r\n\r\nHơn 70 năm kể từ ngày thành lập, Orient Star tự hào khi mọi mẫu đồng hồ của thương hiệu đều được sản xuất theo tiêu chuẩn Manufacture, với mọi chi tiết, mọi công đoạn đều được thực hiện bởi những nghệ nhân của thương hiệu.\r\n\r\nVới việc tận dụng những công nghệ mới của tập đoàn Epson, những năm trở lại đây, Orient Star đang gia tăng lợi ích cho người dùng thông qua những cỗ máy cơ khí được cải tiến, chính xác hơn và có những tính năng cao cấp vượt trội.', NULL, 2120.00, 'public/images/casioMoonPhase.jpg', 1, '2025-08-19 06:10:04', NULL),
(25, 4, 'Đồng Hồ Orient 3Star FAB00004C9', 'fab00004c90-012', 'Đồng hồ đeo tay Nhật Bản Orient đứng trong top những dòng sản phẩm đeo tay Nhật Bản. Vang danh và có đủ sức cạnh tranh với các dòng đồng hồ của thương hiệu Thụy Sĩ bởi nguyên liệu sản xuất ra chiếc đồng hồ Orient không kém cạnh chút nào. Đồng hồ chính hãng Orient FAB00004C9 được sản xuất và lắp ráp tại Nhật Bản cho chất lượng vượt trội, kết hợp cùng bộ võ thép không gỉ cực kỳ bền bỉ, trường tồn mãi với thời gian.', NULL, 121.00, 'https://cdn.casio-vietnam.vn/wp-content/uploads/2025/04/MTP-VD03G-3A.jpg', 9, '2025-08-19 06:28:06', NULL),
(27, 4, 'Đồng hồ  Orient 1010 SE RA-AG0726S00B', 'se-ra-ag0726s00b-ab', 'Nằm trong bộ ba phiên bản đặc biệt Orient 1010 – Văn hiến nghìn năm, tinh hoa hội tụ được nhà sản xuất Nhật Bản ra mắt năm 2019, RA-AG0726S00B là mẫu đồng hồ dành cho phái đẹp với thiết kế trang nhã, thanh lịch và sang trọng.\r\n\r\nBIỂU TƯỢNG KHUÊ VĂN CÁC\r\n\r\n\r\nẤn tượng lớn nhất mà mẫu đồng hồ Orient RA-AG0726S00B mang lại cho người nhìn chắc chắn tới từ hình ảnh Khuê Văn Các, dòng chữ “1010 years Thang Long – Ha Noi” và ô cửa sổ lộ cơ nơi mặt số. Các chi tiết này được đặt lần lượt ở góc 3h và 9h của dial, kết hợp cùng bộ kim và cọc số được chế tác thanh mảnh, mang tới vẻ hài hòa, dễ nhìn cho mặt số. Orient trang bị cho RA-AG0726S00B mặt kính cứng cong, vừa đem lại vẻ retro, vừa tạo nên hiệu ứng đẹp mắt khi người nhìn nghiêng mặt số\r\n\r\nBẢN ĐỒ VIỆT NAM & HOÀNG SA – TRƯỜNG SA\r\n\r\n\r\nỞ phía mặt sau của RA-AG0726S00B, Orient đưa lên hình ảnh của bản đồ Việt Nam với hai quần đảo Hoàng Sa và Trường Sa, giống như một lời khẳng định về chủ quyền lãnh thổ và lãnh hải của chúng ta. Những hình ảnh này được in trên tấm kính trong suốt, giúp cho người nhìn vừa chiêm ngưỡng được những đường nét của bản đồ, vừa có thể quan sát chuyển động nhịp nhàng của cỗ máy F6T22 in-house nhà Orient.\r\n\r\nCỗ máy này có tần số dao động 21600 vph, 22 chân kính, mức trữ cót 40 giờ cùng hai chức năng rất được người dùng Việt ưa chuộng là dừng kim giây và lên cót tay.\r\n\r\nTHIẾT KẾ TINH TẾ\r\n\r\n\r\nSở hữu bộ vỏ có đường kính 35,9mm được chế tác từ thép 316L cao cấp, mạ vàng theo công nghệ PVD và dây đeo bằng da mềm mại, RA-AG0726S00B sẽ mang tới vẻ ngoài sang trọng cũng như trải nghiệm đeo tuyệt vời nơi cổ tay của phái đẹp.\r\n\r\nHỘP GỖ THIẾT KẾ CAO CẤP\r\n\r\n\r\nĐặc biệt, với hộp đựng cao cấp được sản xuất bằng chất liệu gỗ sang trọng, RA-AG0726S00B có thể kết hợp với RA-AG0430S00B trở thành món quà tặng hoàn hảo cho các cặp đôi.', NULL, 369.00, 'https://doseco.vn/_next/image?url=https%3A%2F%2Fdoseco.vn%2Fmedia%2F2023-06%2FRA-AG0024S10B%2520(6).jpg&w=1920&q=75', 8, '2025-08-19 06:31:48', NULL),
(29, 4, 'Đồng hồ Orient RA-AA0823L39B', 'ra-aa0823l39b-012b', 'Orient RA-AA0823L39B là một trong những mẫu đồng hồ nam bán chạy nhất của Orient. Với ngoại hình đầy nam tính và nổi bật, cỗ máy của Orient có khả năng quyến rũ trái tim của mọi chàng trai. Orient RA-AA0823L39B sản phẩm được rất nhiều bạn nam săn đón bởi sự tinh tế cùng với những tính năng nổi bật được tính hợp trên chính phiên bản này.', NULL, 445.00, 'https://cdn.casio-vietnam.vn/wp-content/uploads/2024/11/MTD-135D-2AV.jpg?_gl=1*1p0x25n*_gcl_au*NzI5OTg3Njg0LjE3NTU2NTI3NzU.*_ga*MTQ1NzMxMDU1NC4xNzU1NjUyNzc1*_ga_4N56JFEG6V*czE3NTU2NTI3NzQkbzEkZzAkdDE3NTU2NTI4NDYkajYwJGwwJGgw', 15, '2025-08-19 06:38:18', NULL),
(31, 2, 'Đồng hồ SEIKO SSB129P1', 'ssb129p1-01f', 'Đồng hồ Seiko SSB129P1 nam, thiết kế đồng hồ với tính năng Chronograph, mặt đồng hồ màu đen nam tính, chữ số vạch màu trắng, mặt kính cứng hardlex cao cấp, kiểu dáng thể thao 6 kim, cùng 1 lịch ngày.', NULL, 181.00, 'https://donghoseiko.com/wp-content/uploads/2021/06/seiko_ssb129p1.jpg', 33, '2025-08-19 06:42:41', NULL),
(33, 2, 'Đồng hồ Seiko Presage Cocktail Limited Edition SRPE47J1', 'srpe47j1-012', 'Lấy cảm hứng chủ đạo từ ly cocktail Tequila Sunset, Seiko Presage SRPE47J1 có màu mặt số tựa như màu của buổi mình minh đầy thơ mộng nhưng không kém phần nổi bật. Đây là phiên bản đặc biệt, giới hạn 5000 chiếc trên toàn cầu. Ngoài dây đeo dạng lưới cố định, đồng hồ còn đi kèm với một dây da bê màu nâu.', NULL, 629.00, 'https://donghoseiko.com/wp-content/uploads/2021/06/srpe47j1_1601277745.jpg', 2, '2025-08-19 06:45:21', NULL),
(35, 2, 'Đồng hồ cao cấp Seiko Presage SSA412J1', 'ssa412j1-012', 'Đồng hồ Seiko Presage SARY174J1 thuộc dòng sản phẩm cao cấp Presage của Seiko. Dòng sản phẩm Presage được xem như món quà mà Seiko dành tặng cho các fan hâm mộ của mình. Những chiếc đồng hồ Presage được thiết kế tinh tế, chế tạo từ các vật liệu cao cấp như thép không gỉ 316L, kính Domed, bộ máy đời cao đầy đủ tính năng.\r\n\r\nĐồng hồ Seiko Presage SARY174J1  có lớp vỏ làm từ thép không gỉ 316L trang bị chức năng kháng từ giúp đảm bảo độ bền và độ chính xác cho chiếc đồng hồ này . Sự chi tiết đến từng đường nét của Seiko được thể hiện qua cách họ hoàn thiện mặt số và bộ kim cho chiếc đồng hồ này. Bộ kim vuốt nhọn như lưỡi kiếm và kim giờ dạng thanh như mảnh ghép hoàn thiện cho thiết kế sang trọng hoàn hảo của chiếc đồng hồ này.', NULL, 588.00, 'https://donghoseiko.com/wp-content/uploads/2021/06/dong-ho-seiko-ssa412j1_1608279337.jpg', 4, '2025-08-19 06:47:07', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(120) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `profile_image`, `phone`, `fullname`, `password_hash`, `role`, `created_at`) VALUES
(18, 'admin123', 'admin1@gmail.com', 'public/uploads/avatars/68f8b339bdecb_logo0111.png', '0123456789', 'Admin', '$2y$10$JAYVw0KBfFoGjyQA.4RHkOwzDWNFcfheSt0NREagRJ9f4ktg4n1jW', 'admin', '2025-10-07 05:14:39'),
(19, 'tam', 'cn25236@gmail.com', 'public/uploads/avatars/68f89eb69f08c_logo0222.png', '0987654321', 'tam', '$2y$10$MI3AWD1oWRzKysQHNYwL6Ogdvq6Auv2AE6Oo7qEawwxJqeR/7Gp96', 'user', '2025-10-07 08:36:16'),
(20, 'teo', 'hocvien1@gmail.com', NULL, NULL, NULL, '$2y$10$SccvAQMtXYLTf3kAdmdKPeUJ7MGfj5yrmV4ZL7CtQmQDJHDXyEh4e', 'user', '2025-10-11 07:21:29'),
(21, 'pt0700015@gmail.com', 'pt0700015@gmail.com', NULL, NULL, NULL, '$2y$10$fJgHYdTiMbWlsrXn2gy5iO3rgh4c8qti4l/gu.R0oUYZEcyhlJIAu', 'user', '2025-10-22 06:21:41');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_product` (`product_id`),
  ADD KEY `fk_comments_user` (`user_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_products_category` (`category_id`),
  ADD KEY `idx_products_sku` (`sku`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
