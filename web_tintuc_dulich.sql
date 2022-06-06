

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_tintuc_dulich`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mat_khau` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `ho_ten`, `email`, `mat_khau`) VALUES
(1, 'Y Long Niê KDăm', 'admin@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `binh_luan`
--

CREATE TABLE `binh_luan` (
  `id` int(11) NOT NULL,
  `nguoi_dung_id` int(11) DEFAULT NULL,
  `tin_tuc_id` int(11) DEFAULT NULL,
  `noi_dung` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `binh_luan`
--

INSERT INTO `binh_luan` (`id`, `nguoi_dung_id`, `tin_tuc_id`, `noi_dung`, `created_at`) VALUES
(3, 1, 6, 'bai viết hay quá', '2018-10-24 22:30:47'),
(4, 1, 5, 'đẹp quá\r\n', '2018-10-24 22:31:03'),
(5, 1, 6, 'qua dep ', '2018-10-25 07:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` int(11) NOT NULL,
  `ten_danh_muc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `danh_muc`
--


INSERT INTO `danh_muc` (`id`, `ten_danh_muc`, `created_at`, `updated_at`) VALUES
(1, 'DU LỊCH VÀ ẨM THỰC', '2018-10-24 18:41:05', '0000-00-00 00:00:00'),
(3, 'TOUR TÂY NGUYÊN', '2018-10-25 07:13:57', '0000-00-00 00:00:00');

-- --------------------------------------------------------
--
-- Table structure for table `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id_nguoi_dung` int(11) NOT NULL,
  `ho_ten` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mat_khau` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Dumping data for table `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id_nguoi_dung`, `ho_ten`, `mat_khau`, `email`) VALUES
(1, 'Dani Kuan', 'e10adc3949ba59abbe56e057f20f883e', 'Danikuan@gmail.com'),
(2, 'Y Sel Ayun', 'e10adc3949ba59abbe56e057f20f883e', 'Selayun@gamail.com');



-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `links` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `ten`, `links`) VALUES
(2, 'slide1', 'ho_Ta_Dung_1.jpg'),
(3, 'slide2', 'photo-of-waterfall-2904640.jpg'),
(4, 'slide3', 'w-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tin_tuc`
--

CREATE TABLE `tin_tuc` (
  `id_tin` int(20) NOT NULL,
  `tieu_de` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `danh_muc_id` int(15) DEFAULT NULL,
  `hinh_anh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noi_dung` text COLLATE utf8_unicode_ci,
  `luot_xem` int(11) DEFAULT '0',
  `id_nguoi_dang` int(11) NOT NULL,
  `hien_thi` tinyint(20) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `tin_tuc`
--

INSERT INTO `tin_tuc` (`id_tin`, `tieu_de`, `danh_muc_id`, `hinh_anh`, `noi_dung`, `luot_xem`, `id_nguoi_dang`, `hien_thi`) VALUES
(2,'Du lịch Đà Lạt',3,'Ho-tuyen-lam-dulichdalat-1.jpg','<p><strong>Hồ Tuyền Lâm Đà Lạt có gì</strong><br>Vẻ đẹp thiên nhiên <br>Có rất nhiều du khách thắc mắc với Hoa Dalat Travel là Hồ Tuyền Lâm có gì đặc biệt mà thu hút du khách đông đến thế câu trả lời chính là nơi đây có một vẻ đẹp hoang dã với hồ nước trong xanh, bao quanh xung quanh là rừng thông. Mách bạn một điều vô cùng thú vị đó chính là ngắm hoàng hôn và bình minh ở Hồ Tuyền Lâm sẽ rất tuyệt vời đó.</p><p><strong>Chơi gì?</strong><br>Đến hồ bạn có thể lựa chọn các trò chơi như đạp vịt, uống cà phê ngắm cảnh hồ bạn cũng có thể tham khảo tour chèo thuyền ngắm lá phong của Hoa Dalat Travel để cảm nhận được vẻ đẹp của tự nhiên nơi đây. <br>Nếu muốn khám phá toàn bộ hồ bạn có thể đến bến du thuyền hồ tuyền lâm đi một vòng quanh hồ với giá từ 300.000đ tới 500,000đ cho một thuyền đoàn từ 6 tới 15 người.</p><p><strong>Ăn gì?</strong>Quanh hồ có rất nhiều nhà hàng ngon về thịt rừng cho bạn lựa chọn, ngoài ra bạn cũng có thể ăn các món bình dân khác ở các quán gần khu du lịch.</p><p><strong>Ở khách sạn, Resort</strong>Có rất nhiều khách sạn và Resort đẹp long lanh tiêu chuẩn 4,5 sao có view nhìn ra hồ cho bạn lựa chọn nghỉ dưỡng, có thể kể tới như:<br>Dalat Edensee <br>Terracotta hotel & resort <br>Sam Tuyền Lâm <br>Bình An Village <br></p>',5,0,1),
(3,'Du lịch Đak Lăk',3,'dak-lak-1.jpg','<p><strong>Khám phá những điểm đến hấp dẫn nhất ở Đăk Lăk</strong><br>Thác Dray Nur <br>Đây là nơi thích hợp cho du lịch phượt ở Đăk Lăk mà chúng to muốn chia sẻ cho các bạn. Du khách đến với thác Dray Nur để chiêm ngưỡng sự kỳ vĩ và bí ẩn mà thiên nhiên mang lại cho Đăk Lăk. Mỗi buổi chiều tà, khi dòng nước đổ ào ạt xuống chân thác thì cũng là lúc mà khách du lịch được nhìn thấy cảnh tượng hàng ngàn con dơi bay trên bầu trời để về nơi trú ẩn. Ngoài ra khi tới đây các bạn sẽ được tham gia vào bữa cơm truyền thống của người dân địa phương và cùng hòa mình vào màn ca vũ bên ánh lửa phập phồng với bộ lạc nơi đây.</p><p><strong>Hồ Lăk</strong><br>Được mệnh danh là hồ nước ngọt lớn nhất nhì cả nước, hồ Lăk mang trong mình một nguồn nước dồi dào để phục vụ việc tưới tiêu đồng ruộng của người dân Đăk Lăk. Câu cá ở hồ Lăk là một <strong>hoạt động vui chơi du lịch nổi tiếng ở Đăk Lăk</strong> mà bạn chắc chắn nên thử một lần. Nếu bạn thích thú với nơi đây, hãy tới với thị trấn Liên Sơn, huyện Lăk, tỉnh Đăk Lăk để thử vận may và cùng bạn bè của mình đốt lửa nướng cá sau khi thu hoạch được chiến lợi phẩm tươi ngon từ thiên nhiên này nhé.</p><p><strong>Bản Đôn</strong><br>Từ bé chắc ai cũng được nghe bài Chú voi con ở bản Đôn đúng không nào? Vậy thì đây chính là nơi bắt nguồn của bài hát thiếu nhi dễ thương mà ai cũng thuộc này đấy. Đến với bản Đôn, du khách ngoài việc được thăm thú những đàn voi khổng lồ hiền lành mà còn được khám phá núi rừng, sông suối bao la tráng lệ và cùng làm những món ăn dân tộc của cư dân Bản Đôn. Nếu bạn dẫn theo bé yêu nhà mình đi du lịch Đăk Lăk thì đừng quên cho bé tới bản Đôn để thăm thú nhé, chắc chắn bé nhà bạn sẽ vô cùng thích cho mà xem.</p><p><strong>Làng cà phê Trung Nguyên</strong></br> Cà phê Trung Nguyên là một thương hiệu cà phê nổi tiếng ở trong nước lẫn nước ngoài mà người dân Việt Nam chắc chắn ai cũng biết. Cà phê là loại thức uống thơm ngon mà rất nhiều người yêu thích, khách du lịch khi tới với làng cà phê Trung Nguyên sẽ được thưởng thức những ly cà phê đậm chất Tây Nguyên mà chỉ nơi đây mới có được. Các bạn đừng quên mang về cho mình loại <strong>đặc sản của Đăk Lăk</strong> này trước khi về để cho người thân của mình thưởng thức nha. Hãy tới vào dịp hoa cà phê nở rộ (tháng 3) để cảm nhận hết cái đẹp của núi rừng Đăk Lăk mà ai từng đặt chân tới cũng không thể nào quên nhé.</p>',9,0,3),
(4,'Du lịch Gia Lai',3,'Gia-Lai.jpg','<p><strong>Biển Hồ</strong> <br> Hồ T’nưng (cách viết khác là Hồ Tơ Nuêng, hồ Tơ Nưng) hay Biển Hồ hoặc hồ Ea Nueng là một hồ nước ngọt nằm ở phía tây bắc thành phố. Theo các nhà khoa học thì hồ T’Nưng chính là miệng núi lửa đã ngừng hoạt động từ hàng trăm triệu năm qua. Hồ có hình bầu dục, độ sâu trung bình từ khoảng 12 đến 19 m. Hồ T’Nưng là một trong những hồ đẹp nhất ở Tây Nguyên. khi gió to thường có sóng lớn nên mới gọi là biển hồ. Còn người địa phương gọi là T’Nưng, có nghĩa là “biển trên núi”.</p><p><strong>Công Viên Đông Xanh</strong><br>Đây là một không gian văn hóa mang đậm bản sắc dân tộc của vùng Bắc Tây Nguyên với nhiều công trình văn hóa, tâm linh hoành tráng giữa không gian thiên nhiên bao la như: cây hóa thạch hàng ngàn năm tuổi, đền Thờ Vua Hùng, Vua Lửa, Vua Nước, chùa Một Cột, công viên Bách thảo… Bên cạnh đó, du khách còn được tìm hiểu và khám phá những nét độc đáo pha chút huyền bí của văn hóa Tây Nguyên qua mô hình kiến trúc nhà mồ, nhà rông, nhà dài; qua truyền thuyết kết hợp với những hoa văn, họa tiết được tổng hợp và cách điệu trên biểu tượng Đài cảnh Tây Nguyên.</p><p><strong>Nhà Thờ Pleichuet</strong><br><strong>Nhà thờ Pleichuet</strong>nằm trên đường Trương Định, phường Thắng Lợi, trung tâm thành phố Pleiku. Mang dáng dấp nhà rông của đồng bào dân tộc Tây Nguyên, nhà thờ không chỉ là nơi sinh hoạt của người dân địa phương mà còn là điểm tham quan du khách nên ghé thăm khi có dịp đến đại ngàn Gia Lai.</p><p><strong>Bảo Tàng Tỉnh Gia Lai</strong><br>Bảo tàng lưu giữ gần 7.000 đầu hiện vật, trong đó có nhiều hiện vật có giá trị cao về văn hoá truyền thống như: bộ sưu tập cồng chiêng, trống lớn của đồng bào dân tộc Jrai, Bahnar, ché cổ quý hiếm, và nhiều hiện vật có giá trị thể hiện một cách chân thực nhất các đặc trưng văn hoá của cộng đồng hai dân tộc Bahnar và Jarai.</p>',8,1,1),
(5,'Du lịch Kon Tum',3,'Kon-Tum.jpg','<p><strong>Măng Đen</strong><br>Được mệnh danh là Đà Lạt thứ hai của Kon Tum, Măng Đen là một thị trấn thuộc huyện Kon Plong, tỉnh Kon Tum, có rừng nguyên sinh và nhiều hồ, thác nước. Khí hậu nơi đây mát mẻ trong lành, thích hợp cho du khách tránh nóng mùa hè. Nằm ở độ cao 1.100 – 1.400m so với mặt biển, giữa ngút ngàn thông và hoa rừng nên thời tiết ở Măng Đen lúc nào cũng se se lạnh. Đến với Măng Đen bạn sẽ được đi trên con đường quanh co với hai bên là những rặng thông xanh ngắt, thoang thoảng mùi nhựa thông. Văng vẳng là tiếng chim hót líu lo, khí hậu mát lành mang nét hoang sơ, hùng vĩ của núi rừng.</p><p><strong>Ngã Ba Đông Dương</strong><br>Ngã ba Đông Dương huyền thoại là điểm tiếp giáp giữa 3 nước Việt Nam, Lào và Campuchia. Đây là nơi mà dân phượt vẫn truyền tai nhau về câu chuyện một con gà gáy, cả 3 nước cùng nghe. Để có thể tới được ngã ba Đông Dương, du khách sẽ phải vượt qua một hành trình khá khó khăn với những con đường ngoằn ngoèo, quanh co. <br>Khi đặt chân lên vùng biên qua những bậc thang là chạm tay vào cột mốc làm bằng đá hoa cương, cao 2 m, nặng gần 900kg, được đặt trên độ cao 1.086 m là một trong hai cột mốc biên giới ghi danh ba quốc gia Lào – Việt Nam – Campuchia. Cột mốc hình tam giác, mỗi mặt quay về phần lãnh thổ của quốc gia đó với hình quốc huy trang trọng.</p><p><strong>Nhà Thờ Kon Tum</strong><br>Nhà thờ chính tòa Kon Tum hay còn được gọi là nhà thờ Gỗ, được xây dựng vào năm 1913 do các linh mục người Pháp khởi xướng, hiện nay dùng làm nhà thờ chính tòa, nơi đặt ngai tòa của vị giám mục giáo phận Kon Tum. Nhà thờ này theo kiến trúc Roman kết hợp với kiến trúc nhà sàn của người Ba Na – sự kết hợp giữa phong cách châu Âu và nét văn hóa của Tây Nguyên Việt Nam. Điều đặc biệt của công trình này là được làm hoàn toàn bằng gỗ cà chít, không dùng bê tông cốt thép và vôi vữa để sơn trét. Hệ thống cột, rui mè ở đây được chạm khắc tỉ mỉ, công phu làm toát lên khí chất tự nhiên nhưng hào hùng của người dân bản địa.</p><p><strong>Cầu Treo Klor</strong><br>Nhắc đến các điểm tham quan nổi tiếng của du lịch Kon Tum không thể bỏ quá cầu treo Kon Klor – cây cầu nối liền hai bờ sông Đắk Bla huyền thoại. Từ trên cây cầu này, phóng tầm mắt ngắm nhìn không gian làng mạc, đồng lúa, ruộng ngô, bãi mía xung quanh cùng với dòng sông mải miết chảy ngay dưới chân cầu, du khách sẽ cảm thấy tâm hồn mình như thoáng đạt hơn. <br>Đến đây, bạn có thể ghé thăm làng dân tộc Ba Na – Kon Klor, cùng uống với họ can rượu cần rồi lên đường vượt dòng sông qua cầu treo để đến một vùng đất phù sa trù phú. Đó là những vườn chuối, vườn cà phê và các loại cây ăn quả. Vượt con đường quanh co khoảng 6km sẽ đến làng Kon K’tu, một làng dân tộc Ba Na còn giữ nguyên được những nét sinh hoạt và cảnh vật thiên nhiên hoang sơ</p><p><strong>Vườn Quốc Gia Chư Mom Rây</strong><br>Vườn quốc gia Chư Mom Ray nằm ở phía bắc Tây Nguyên và phía tây của tỉnh Kon Tum, trên địa phận của 2 huyện Sa Thầy và Ngọc Hồi. Nơi đây có tính đa dạng sinh học cao nhất trong các vườn quốc gia hiện nay với gần 1.500 loài thực vật, trong đó có 131 loài được xác định là quý hiếm, có nguy cơ tuyệt chủng như phong lan, ngành hạt trần…</p><p><strong>Sông Đắk Bla</strong><br>Sông Đắk Bla trong lòng người dân Kon Tum là dòng sông mang tính biểu tượng bởi vì không có sông Đắk Bla thì không có Kon Tum, xét về mặt lịch sử cũng như địa lý. Đến phố núi Kon Tum, bạn sẽ ngỡ ngàng với hình ảnh dòng sông Đắk Bla như một dải lụa mềm uốn lượn điệu đà ôm gọn thành phố Kon Tum bé nhỏ, và sẽ thật ấn tượng khi nhìn thấy giữa vùng sông nước Đắk Bla bao la rộng lớn, những chiếc thuyền độc mộc như những chiếc lá rừng lững lờ trôi trên sông.</p><p><strong>Nhà Rông Kon KLor</strong><br>Nhà rông Kon K’lor là biểu tượng của tình đoàn kết và sức mạnh cộng đồng của người dân. Nhà cao 22m, rộng trên 6m và dài hơn 17 m. Với thiết kế truyền thống cùng chất liệu bằng gỗ, tranh, tre, nứa, lá và những họa tiết, hoa văn công phu, tỉ mỉ, nơi đây chính là điểm đến thú vị cho du khách. <br><Strong>Núi Ngọc Linh</Strong>là một phần của dãy Trường Sơn Nam. Với độ cao 2.600m, đây là địa điểm phù hợp cho người yêu thích bộ môn leo núi và những chuyến phiêu lưu mạo hiểm. Đặc biệt, trong dãy Ngọc Linh có loài nhân sâm nổi tiếng Việt Nam mang tên sâm Ngọc Linh mọc tập trung ở các huyện miền núi Ngọc Linh thuộc Kon Tum và Quảng Nam ở độ cao 1.500m đến 2.100m.</p>',10,0,1),
(6,'Du lịch Đăk Nông',3,'Dak-Nong.jpg','<p><strong>Hồ Ea Sno</strong><br>Hồ có diện tích 80ha xung quanh được bao bọc bởi những núi rừng trùng điệp cùng với những rừng cây xanh mướt. Hồ Ea Snô còn giữ được nguyên vẻ hoang sơ, hữu tình hiếm có của nó. Du lịch phượt tới Đắk Nông bạn sẽ cảm thấy được vẻ đẹp thiên nhiên tuyệt vời ở nơi đây. Tất cả mọi mệt mỏi trong cuộc sống khi đứng trước hồ sẽ biến tan cùng với những làn gió trong mát.</p><p><strong>Thác Đray Sáp</strong><br>Đây là ngọn thác đẹp nhất và hùng vĩ nhất khu vực Tây Nguyên với chiều cao là 50m, chiều dài 100m. Nếu một lần được ngắm vẻ hùng vĩ của thác thì bạn sẽ không cảm thấy hối hận khi bỏ thời gian để dành một chuyến du lịch phượt Đắk Nông. Không chỉ cuốn hút khách du lịch bởi sự hùng vĩ của thác mà gắn với nó còn là một câu chuyện tình đầy lãng mạn về nàng H ‘mi. Người con gái xinh đẹp này bị quái vật nuốt chửng khi đang ngồi nói chuyện cùng người yêu. Sau đó nàng hóa thành những cột khói khổng lồ đó là những cột thác còn người yêu của nàng hóa thành gốc cây lớn cắm vào lòng cắm sâu vào đất vươn lên đến tận trời như muốn ở mãi bên người con gái mình yêu.</p><p><strong>Thác Trinh Nữ</strong><br>Với những bạn nữ thích sự dịu dàng, nữ tính thì thác Trinh Nữ là địa điểm tuyệt vời cho bạn. Khác với sự hùng vĩ của thác Đray Sáp và thác Gia Long thác Trinh Nữ có vẻ đẹp thơ mộng. Dòng thác giống như một nàng thiếu nữ e ấp nép mình dưới những con đường đã ghồ ghề tạo cho dòng thác một vẻ đẹp quyến rũ. Đến đây du khách được tận hưởng sự mát lạnh của dòng thác và được tham gia các hoạt động vui chơi giải trí như câu cá, cưỡi voi, ngủ trên những chiếc chòi chênh vênh bên bờ đá. Đây sẽ là một trải nghiệm tuyệt vời cho chuyến hành trình của bạn.</p><p><strong>Thác Gia Long</strong><br>Thác Gia Long đặc biệt ở ngay tên gọi, bị cuốn hút bởi vẻ đẹp của nơi đây nên vua Gia Long đã tự xé núi đi vào đây để thưởng ngoạn khung cảnh nơi đây. Chính vì vậy mà thác ày có tên là Gia Long. Thác Gia Long cao khoảng 40m, dòng thác đổ dài 40m. Theo kinh nghiệm du lịch Đắk Nông thì đây là thác đẹp nhất của Đắk Nông. Điều đặc biệt của thác này là sự hài hòa với cảnh quan. Nằm cạnh thác Gia Long là một hồ tắm tiên và một hang động rất đẹp. Đến đây bạn không chỉ được ngắm nhìn cảnh sông núi mà còn được đắm mình trong những dòng nước mát lạnh, trong lành của núi đồi. Khi đi bạn nhớ mang theo quần áo tắm hoặc mang dự trữ một vài bộ để mình có thể thỏa thích nghịch cùng những dòng thác ở nơi đây.</p><p><strong>Những món ăn đặc sản ngon, nổi tiếng Đăk Nông</strong><br><strong>Rựu Cần</strong><br>Nhắc đến những dân tộc ở Tây Nguyên thì chắc chắn chúng ta không thể không nhắc đến rượu cần – loại đồ uống đặc trưng cả người Tây Nguyên và của người Đắk Nông. Rượu chính là món quà mà ông trời ban cho con người chính vì vậy đây không chỉ là là loại đồ uống mà người dân nơi đây yêu thích mà nó còn là món ăn tinh thần của người Đắk Nông dùng để cúng tế trời đất. <br> <strong>Cà Đắng</strong> <br>Cà đắng món ăn đặc trưng của người Đắk Nông. Đây chỉ là loại cà mọc dại nhưng người dân ở đây thấy đây là loại quả ăn được nên họ đem về trồng từ đó cà đắng là món ăn được thưởng thức hàng ngày của người Đắk Nông. Cà có vị đắng nhưng rất hấp dẫn thường được dùng để nấu canh, kho cá, tép rất ngon và hấp dẫn. Nếu đã tới đây thì bạn thử món ăn cà đắng bình dị này để thấy được hết về mảnh đất và con người Đắk Nông. <br> <strong>Cơm Nang</strong><br>khá giống với những món cơm lam của các vùng dân tộc phía Bắc, cơm nấu từ gạo nếp dẻo được nướng trong ống nứa nên có hương rất thơm, vị dẻo ngọt. Cơm ngon nhất là khi được ăn cùng với gà nướng, bò nướng chế biến độc đáo, hương vị đặc trưng của vùng đất Đắk Nông...</p>',6,1,1),
(12,'Du lịch Buôn Ma Thuột',3,'Buon-Me-Thuot.jpg','<p><strong>Đá Voi Mẹ</strong><br>Nằm trên địa bàn xã Yang Tao (huyện Lắk), cách trung tâm TP. Buôn Ma Thuột khoảng 40 km theo Quốc lộ 27, đá Voi Yang Tao gồm một cặp đá Voi Cha và đá Voi Mẹ hiện lên sừng sững giữa núi rừng, mang trong mình những truyền thuyết ly kỳ, bí ẩn. Theo ước lượng thì đá Voi Mẹ có chiều dài khoảng 200m, chu vi dưới chân đá khoảng 500m, cao khoảng hơn 30m và nặng hàng vạn tấn. Đây chính là tảng đá nguyên khối lớn nhất Việt Nam. <br>Từ mặt đất, chỉ mất khoảng 15 phút để lên đến đỉnh cao nhất của tảng đá bằng cách leo qua những sườn dốc thoai thoải. Từ trên đỉnh đá Voi Mẹ, có thể quan sát nhiều thắng cảnh trong vùng như: hồ Yang Reh và dãy Chư Yang Sin – mái nhà của Tây Nguyên. Tuy lên đỉnh đá Voi Mẹ không khó nhưng bạn phải thật cẩn thận vì trên tảng đá có rất ít chỗ bám. Vào những ngày gió mạnh, việc leo lên đỉnh đá Voi Mẹ là điều khá mạo hiểm bởi người leo có thể bị gió cuốn lăn khỏi vách đá.</p><p><strong>Khu Du Lịch Ko Tam</strong><br>Khu du lịch Ko Tam cách trung tâm Thành phố Buôn Ma Thuột 8 km, tọa lạc ngay trên quốc lộ 26, 789 Phạm Văn Đồng, P. Tân Hoà, TP Buôn Ma Thuột. Đến đây, du khách có thể tìm hiểu về nền văn hóa Tây Nguyên đa dạng, nhiều bản sắc. Đặc biệt, toàn bộ các công trình kiến trúc trong khu du lịch đều được dựng bằng tre, nứa, gỗ trông thật ấn tượng và lạ mắt. <br>Tại đây, còn có một nhà sàn là nơi trưng bày các tranh ảnh, nhạc cụ dân tộc của người Ê đê hay khu vực bến nước được tái hiện theo cách tự nhiên nhất thể hiện tín ngưỡng văn hóa của người đồng bào, thêm vào đó là hồ câu nhân tạo với những chiếc thuyền thúng tạo cơ hội cho du khách có được trải nghiệm bơi thuyền mới lạ.</p><p><strong>Tượng Đài chiến thắng Buôn Ma Thuột</strong><br>Tượng đài nằm ở chính giữa vòng xoay Ngã Sáu, với mô hình xe tăng cắm cờ để kỷ niệm chiến thắng Buôn Ma Thuột, cũng là biểu tượng thiêng liêng của người dân thành phố. Dù ai đi đâu ở đâu thì chỉ cần nhìn thấy biểu tượng Ngã Sáu là như nhìn thấy nhà mình. </p><p><strong>Những món ăn ngon không thể bỏ qua</strong><br> Bún đỏ là một đặc sản của thành phố cao nguyên này. Tên gọi của món ăn bắt nguồn từ một tô bún với màu đỏ đặc trưng của nước dùng. Món ăn được kết hợp nhiều nguyên liệu như: gạch cua, trứng cút, các loại rau… Bạn có thể thưởng thức món ăn bình dân này ở ngã tư Trần Phú & Y Zut, góc đường Phan Đình Giót – Lê Hồng Phong hoặc ở góc Lê Duẩn – Phan Đình Giót. <br>Bún giò chìa: (hay bún chìa) có nước dùng khá giống với bún bò Huế. Khác biệt lớn nhất là ở phần nguyên liệu. Thay vì sử dụng thịt bò, người dân vùng cao nguyên này sử dụng phần tảng thịt phía chân sau của con lợn. Thịt được chọn đem về rửa sạch, sau đó ninh cho chín nhừ trong nồi nước dùng, tiếp đó vớt ra để nguội. Mỗi khi có khách gọi món, chủ quán lại lấy từng khúc giò chìa đem thả vào nồi nước dùng cho nóng, sau đó cho vào tô bún đã có sẵn chút mắm ruốc, sau cùng là cho hành lá, hành tây và chan nước dùng nóng hổi vào bát. Bạn có thể thưởng thức món này ở 222 đường Nguyễn Tất Thành, 18 Tản Đà, quán bún bò trên đường YBih Aleo, góc Bà triệu – Hùng Vương… <br>ánh ướt thịt nướng pha trộn nhiều nguyên liệu: một đĩa bánh ướt, một đĩa thịt nướng, bên cạnh là dưa leo, xoài xanh, dưa cải chua, rau thơm… Tất cả được cuốn lại và ăn kèm với chén nước chấm cay xé lưỡi. Du khách có thể ghé địa chỉ E45 Trần Nhật Duật (bán từ 3h chiều). <br>Bò nhúng me với vị chua ngọt, ăn kèm bánh mì, cải xoong và salad cũng là món ăn ngon nổi tiếng. Địa chỉ: 62A Lê Thánh Tông. <br>Canh lá của người Êđê hay còn gọi là lẩu lá. Món ăn được chế biến từ 10 loại là rừng khác nhau. Khi ăn có vị nhân nhẩn đắng và cay nồng rất lạ miệng. Bạn có thể tìm thấy món ăn này trong các nhà hàng đặc sản ở Buôn Ma Thuột. <br>Canh chua cá lăng hay lẩu cá lăng – du khách khó có thể bỏ qua món cá đặc sản của dòng sông Serepork hùng vĩ. Đây là món ăn ngon miệng và có tác dụng giải nhiệt rất tốt trong những ngày nắng. Ngoài ra, cá lăng còn được dùng để kho tộ, canh riêu cá lăng. Bạn có thể thưởng thức món này ở quán Phương Dung & Mỹ Lan – Hoà Phú.</p>',6,1,1);
INSERT INTO `tin_tuc` (`id_tin`, `tieu_de`, `danh_muc_id`, `hinh_anh`, `noi_dung`, `luot_xem`, `id_nguoi_dang`, `hien_thi`) VALUES
(8, 'Tây Nguyên có đặc sản mọc dại bên đường', 1, 'Canh_qu_va_hoa_ca_ng.jpg', '<p><strong>Cà đắng xưa nay là món ăn dân dã của đồng bào dân tộc thiểu số Tây Nguyên nhưng ngày nay trở thành đặc sản. Kết tinh từ khí hậu, thổ nhưỡng tạo nên vị đắng rất riêng, đặc trưng của loại cà mọc dại này.</strong></p>\r\n\r\n<p>Ai có lần đến với vùng đất bạt ngàn nắng gió này sẽ nhớ mãi những vườn cà phê trải dài, những con người say trong tiếng nhạc cồng chiêng mời gọi, những món ăn ngon đã thưởng thức một lần thì khó quên. Không như cà đắng cây thấp tẹt dưới đất trái có vị đăng đắng đặc trưng, nhẩn nhẩn hơn khổ qua một tí, cây trổ bông kết trái quanh năm quả to hơn cà pháo, màu xanh có vân trắng. Trước cây mọc dại rồi được người đồng bào mang về trồng xen trong những rẫy cà phê. Giờ thì có một số gia đình trồng nhiều để bán. Mà cà đắng này là loại mọc dại dọc các tuyến đường hoặc trên các triền đồi Tây Nguyên, cây cà đắng cao quá đầu người, cành lá sum suê. Quả cà to bằng đầu ngón tay, có màu xanh, ruột nhiều hạt, phần cuống có nhiều gai nhọn, cây  ra hoa kết trái từ tháng 3- 10 âm lịch trái rộ nhất là từ tháng 5 trở đi. Đúng như tên gọi, loại cà này có vị đăng đắng rất đặc trưng, được người dân chế biến theo nhiều cách khác nhau. Các cư dân bản địa Ê Đê, M’ Nông, Gia Rai … xem cà đắng như món ăn không thể thiếu trong đời sống sinh hoạt hàng ngày của người đồng bào. Sau một ngày lao động vất vả trên nương lại quây quân bên nhau cùng thưởng thức bữa cơm gia đình với món cà đắng, món đặc sản của vùng núi rừng nơi đây. Hương vị đắng của cà, quyện trong vị ngọt mát của cá, vị cay của ớt cùng mùi thơm của gia vị tạo nên nét đặc trưng riêng cho ẩm thực vùng đất này, làm đắm say bao vị khách khi đến thăm mảnh đất và con người nơi đây. Cách nấu khá đơn giản, ngoài món cà luộc ra, còn lại xào hay nấu canh người dân đều dã nhuyễn với các gia vị đi kèm như ớt, tỏi, lá é, cá khô rồi phi hành thơm lên nấu cho thật nhừ. Món ăn sau khi nấu có đủ vị đắng, cay, bùi, béo, ngọt quyện lại với nhau tạo nên hương vị đặc trưng.</p>\r\n\r\n<p><img alt=\"Cà đắng ngoài vườn. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/Ca_xao_ca_kho.jpg" style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nCà đắng xào cá khô. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n<p>Nay không còn là món ăn dân dã của đồng bào Tây Nguyên, cà đắng trở thành đặc sản được nhiều nhà hàng sang trọng, khu du lịch đưa vào thực đơn để phục vụ khách hàng. Anh Y Danh Niê (người Ê đê, ở buôn Yang Làng, xã Krông Na, huyện Buôn Đôn, Đắk Lắk) chuyên phục vụ cơm nước cho khách du lịch tại Trung tâm Giáo dục dịch vụ và môi trường thuộc Vườn Quốc gia Yok Đôn cho biết: Trong số các món ăn quen thuộc của người bản địa thì cà đắng là món được khách du lịch yêu thích và nhắc tới nhiều nhất bởi vị “đắng” rất đặc trưng chỉ có ở loại cà này. Chẳng phải ai cũng "ưng cái bụng" vị đắng của trái cà đắng. Nhưng nếu ăn được, bạn sẽ nghiền cái vị đắng của cà, vị mặn của cá, vị cay của ớt, vị thơm của lá é hoặc ngò gai.... Người lần đầu ăn không quen với vị đắng nhân nhẫn, nhưng sau đó sẽ bị hấp dẫn đến khó quên với vị đắng này. Du khách hay ví von ăn cà đắng giống như thưởng thức cà phê, lần đầu thấy đắng nhưng dần dần thành quen, dễ gây “nghiện”. Để phù hợp với khẩu vị của thực khách, trong quá trình chế biến, người nấu ngâm cà trong nước muối rồi chần qua nước sôi để giảm bớt vị đắng. Ngoài nấu cà đắng với cá khô theo kiểu của người đồng bào thì có thể nấu với cá tươi hoặc um với ếch, lươn, thịt dê, gà, bò… cho đa dạng món ăn. Tuy nhiên, cách nấu và các gia vị đi kèm như ớt xanh, tỏi, lá é hay ngò gai… vẫn phải giữ nguyên để không làm mất đi hương vị đặc trưng của món ăn.</p>\r\n\r\n<p><img alt=\"Cà đắng ngoài vườn. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/Canh_qu_va_hoa_ca_ng.jpg" style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nCành quả và hoa cà đắng. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n<p>Nay không còn là món ăn dân dã của đồng bào Tây Nguyên, cà đắng trở thành đặc sản được nhiều nhà hàng sang trọng, khu du lịch đưa vào thực đơn để phục vụ khách hàng. Anh Y Danh Niê (người Ê đê, ở buôn Yang Làng, xã Krông Na, huyện Buôn Đôn, Đắk Lắk) chuyên phục vụ cơm nước cho khách du lịch tại Trung tâm Giáo dục dịch vụ và môi trường thuộc Vườn Quốc gia Yok Đôn cho biết: Trong số các món ăn quen thuộc của người bản địa thì cà đắng là món được khách du lịch yêu thích và nhắc tới nhiều nhất bởi vị “đắng” rất đặc trưng chỉ có ở loại cà này. Chẳng phải ai cũng "ưng cái bụng" vị đắng của trái cà đắng. Nhưng nếu ăn được, bạn sẽ nghiền cái vị đắng của cà, vị mặn của cá, vị cay của ớt, vị thơm của lá é hoặc ngò gai.... Người lần đầu ăn không quen với vị đắng nhân nhẫn, nhưng sau đó sẽ bị hấp dẫn đến khó quên với vị đắng này. Du khách hay ví von ăn cà đắng giống như thưởng thức cà phê, lần đầu thấy đắng nhưng dần dần thành quen, dễ gây “nghiện”. Để phù hợp với khẩu vị của thực khách, trong quá trình chế biến, người nấu ngâm cà trong nước muối rồi chần qua nước sôi để giảm bớt vị đắng. Ngoài nấu cà đắng với cá khô theo kiểu của người đồng bào thì có thể nấu với cá tươi hoặc um với ếch, lươn, thịt dê, gà, bò… cho đa dạng món ăn. Tuy nhiên, cách nấu và các gia vị đi kèm như ớt xanh, tỏi, lá é hay ngò gai… vẫn phải giữ nguyên để không làm mất đi hương vị đặc trưng của món ăn.</p>\r\n\r\n<p></p>\r\n\r\n<p><img alt=\"Cà đắng ngoài vườn. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/Ch_inh_Th_Ngan.jpg" style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nCô gái hái cà. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n', 7, 0, 2),
(9, 'Thơm ngon đậm vị món gà nướng Bản Đôn', 1, 'ga-nuong-1.jpg', '<p><strong>Vị thơm, ngọt đậm đà của thịt gà hòa quyện với vị cay nồng của muối é tạo nên đặc sắc riêng của món gà nướng Bản Đôn.</strong></p>\r\n\r\n<p>Gà nướng Bản Đôn là một món ăn dân giã của đồng bào dân tộc thiểu số, tuy nhiên, hiện nay món ăn này đã trở thành một đặc sản không thể bỏ qua đối với du khách khi đến thăm mảnh đất Tây Nguyên.</p>\r\n\r\n<p>\r\n\r\n<p>Để làm món ăn này, nguyên liệu quan trọng nhất là thịt gà. Để có những con gà nướng thơm ngon, người dân Bản Đôn phải rất công phu nuôi, chọn gà. Đó phải là gà thả vườn chính hiệu, chủ yếu ăn thức ăn rơi vãi, côn trùng…Gà được chọn nướng là loại mới lớn, độ chừng hơn 1kg mỗi con. Nếu gà lớn thì thịt sẽ dai, gà nhỏ quá lại có mùi hôi…</p>\r\n\r\n<p><img alt=\"Gà nướng muối tiêu. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/ga-nuong-1.jpg" style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nGà nướng là món ăn đặc trưng của ẩm thực Tây Nguyên. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n<p>Gà sau khi được làm sạch, để nguyên con, mổ dọc theo ức rồi bẻ dẹt ra, ướp muối ớt, nước sả và thêm ít mật ong rừng. Điệu đặc biệt là sả chỉ được giã nhỏ rồi lọc lấy nước chứ không ướp cả xác, nước sả càng nhiều, thịt nướng càng thơm ngon.</p>\r\n\r\n</p>\r\n\r\n<p>Gà ướp khoảng 30 phút đến một tiếng thì được kẹp vào thanh tre rồi quay đều trên lửa than. Cứ vài phút xoay trở một lần cho đến khi gà chín chuyển sang màu vàng, tươm mỡ béo ngậy. Chỉ nhìn thôi cũng đủ ứa nước miếng.</p>\r\n\r\n<p><img alt=\"Cà đắng ngoài vườn. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/ga-nuong-2.jpg" style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nGà không đặt trực tiếp trên than, không dùng vỉ thép, chủ yếu làm chín bằng hơi nóng.  Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n<p>Để ăn gà nướng Bản Đôn chuẩn vị thì phải chấm với muối ớt hoặc muối sả. Dù là loại muối nào cũng phải được giã với ớt rừng xanh. Loại ớt này ăn giòn thơm, rất hấp dẫn. Nếu ăn gà nướng kèm với những thanh cơm lam chín dẻo mềm thì lại càng ngon hơn.</p>\r\n\r\n<p></p>\r\n\r\n<p><img alt=\"Cà đắng ngoài vườn. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/ga-nuong-3.jpg" style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nGà nướng là món ăn đặc trưng của ẩm thực Tây Nguyên. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n<p>Trong những buổi chiều se lạnh ở núi rừng, được quây quần bên bếp lửa giữa nhà sàn, vừa nhẩn nha thưởng thức món gà nướng thơm ngon đậm đà, vừa nghe tiếng thác reo… Đó thực sự là bữa ăn đậm chất núi rừng, mang lại cảm giác vô cùng sảng khoái.</p>\r\n\r\n', 7, 0, 2),
(10, 'Hương thơm măng rừng', 1, 'mang-le.jpg', '<p><strong>Mùa mưa đi dọc các đường quốc lộ Tây Nguyên ta thường bắt gặp không biết bao nhiêu chợ măng. Ngoài măng ra không có hàng hoá gì
 khác. Người Ba Na, Gia Rai, Xê Đăng mình trần da đen cháy ngồi như bất động trên những gùi măng le đợi người đến mua.<br>Cây le thuộc họ tre nứa khá điển hình trên vùng đất ba gian. 
Cây le có sức phát tán mạnh mẽ, sức sống dẻo dai đến kỳ lạ. Hễ nơi nào có đất trồng trọt là có cây le xuất hiện. Cây le dù bị đốt cháy, tàn lửa tại đâm chồi khác mọc khoẻ hơn, quả là một 
loài cây “bất tử”.</strong></p>\r\n\r\n<p>Khai hoang đất rừng le chỉ còn cách phải đào cho bằng hết gốc rễ. Đồng bào Tây Nguyên tìm đất làm nương thấy rừng già không ngán nhưng gặp rừng le 
là phải hoảng sợ. Ở đâu có le mọc thì chỉ có cỏ đuôi chồn và bụi trinh nữ là còn len lỏi được, mọi loài cây khác đều phải thường bước lùi mọc nơi khác. Ở Tây Nguyên, rừng le gần như không
 có giá trị ngoại trừ măng. Măng le rất nhiều ăn tươi đã ngon, ăn khô càng bỏ xa măng áo tơi, măng lưỡi lợn gốc nứa, vẩu, mai. Vào các buôn được mời bữa cơm gạo nương ăn với măng le nấu 
với thịt nai khô có kèm muối đâm lá bép ớt hiếm mới là khách quí. Dù có ngon đến đâu thì măng le vẫn chỉ là măng le nhưng dân vùng biển miền Trung Trung Bộ lại rất ưa thích nên thường được nghe nhấn gọi:
\r\n\r\n<p>“Ai về nhắn với cội nguồn.</p>\r\n\r\n<p>Măng le gửi xuống cá chuồn gửi lên”</p>
</p>\r\n\r\n<p><img alt=\"Măng le có vị ngọt, bùi, không hề đắng chát. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/mang-le.jpg" style=\"margin-left:150px;height:480px; width:800px\" />
<br />\r\nHương vị đặc trưng. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n<p>Mùa khô trên Tây Nguyên không còn chợ măng. Chợ măng Gia Lu chỉ còn từng 
đống từng đống bẹ măng khô, “di Sản” của những phiên chợ măng năm trước. Đến mùa mưa chợ măng bất ngờ mọc lên khắp nơi. Ai cũng nói “càng ngày càng có nhiều chợ măng và 
chợ măng nào cũng ngày càng lớn thêm”. Tại sao lại lắm chợ măng như vậy, măng le ở đâu mà lắm thế? Người địa phương ăn sao cho hết được? Trăm người bán nhưng lại chẳng có vạn 
người mua. Măng thì ế mà rừng thì dần dần cạn kiệt. Câu trả lời dành cho số đồng bảo dân tộc ít người sống du canh du cư phá rẫy làm nương, vài ba vụ đất bạc màu lại bỏ đi phá rừng
 nơi khác. Nhưng sức tàn phá đó cũng chẳng thấm vào đâu so với diện tích rừng bị phá do bọn cai thầu tứ xứ đổ về đây khai thác gỗ với danh nghĩa liên doanh liên kết với các lâm trường, 
các cơ quan xí nghiệp từ tỉnh tới huyện xã được cấp giấy phép “làm gỗ cơ chế”, “gỗ tạo vốn” thi nhau phá được nhiều rừng lấy được nhiều gỗ. Rừng Tây Nguyên chỉ tạm yên ắng trong mấy 
tháng mùa mưa. Trong rừng chỉ còn lại bà con người dân tộc thiểu số lầm lũi kiếm măng le. Đến mùa khô mọi cánh rừng lại sôi động, cây lại ngả đổ ngổn ngang để trơ lại những khoảnh rừng 
trơ trụi nhường cho những đám le không trồng mà mọc chiếm chỗ. Thế là diện tích rừng le mỗi năm một tăng, rừng gỗ ngày càng thu hẹp lại, chợ măng càng nhiều, quy mô càng lớn. Nguồn thục 
phẩm măng tươi măng khô dồi dào phong phú, con người có thêm nhiều cái ăn không biết. Đó là điều đáng mừng hay đáng lo, Vui hay là buồn xung quanh câu chuyện lặng lẽ? Ước gì mùa mưa kéo 
dài suốt năm để kiếm nhiều miếng le và đừng có mùa khô nữa để người ta quen gọi là “mùa khai thác gỗ”, chẳng thiết gì cái mùa mưa quái ác chỉ lợi thế cho măng le dễ mọc còn bọn cai thầu
thì hết cách làm ăn phá phách.</p>\r\n\r\n</p>\r\n\r\n<p></p>\r\n\r\n<p><img alt=\"Cà đắng ngoài vườn. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/mang-le-1.jpg" 
style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nMua măng về làm quà rất tiện vì gọn nhẹ giá lại phải chăng. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n', 7, 0, 2),
(1, 'Bơ sáp Dăk Lăk', 1, 'bo-sap-daklak-1.jpg', '<p><strong>Bơ là trái cây nhiệt đới có nguồn gốc từ Mexico. Nhờ ăn ngon và bổ nên nó đã được trồng và canh tác ở nhiều nơi trên trái đất, 
đặc biệt là Indonesia, Philippne, và Brazil.</strong></p>\r\n\r\n<p>Ở Việt Nam ta ,bơ được trồng ở nhiều nơi trong cả nước nhưng nổi tiếng nhất vẩn là bơ sáp Tây Nguyên.Có thể Bơ ở 
đây phù hợp với khí hậu thổ nhưỡng đất đỏ bazan nên Bơ Tây Nguyên sớm trở thành món đặc sản vùng miền của vùng đất Cao Nguyên này .\r\n\r\n<p>“Ai về nhắn với cội nguồn</p>.
\r\n\r\n<p>Ngon nhất là giống bơ sáp được trồng ở Đak Lak , quả bơ to bên trong là lớp cùi bơ dầy dặn, vàng ươm, dẻo quánh.Nếu là lần đầu tiên thưởng thức, mới nếm thử bạn sẽ cảm 
thấy hình như bơ hơi nhạt. Nhưng rồi ngay sau đó, vị ngầy ngậy, thơm mát từ miếng bơ mềm lừ khiến bạn thấy thật ngon miệng. Chính cái vị thanh nhẹ, mát lành đó đã hấp dẫn người ăn, 
khiến người ta đâm “nghiện” thứ trái cây mộc mạc này</p></p>\r\n\r\n<p><img alt=\"Bơ ngon bởi được trồng hợp với vùng đất đỏ bazan, có lớp cùi dầy, vàng và nhiều tỷ lệ bơ sáp. 
Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/bo-sap-daklak-2.jpg" style=\"margin-left:150px;height:480px; width:800px\" />
<br />\r\nBơ sáp Đak Lak nổi tiếng với cơm dày ,ruột vàng ,ngon ,béo nhẹ và rất tốt cho sức khỏe. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n<p>Ngày xưa do điều 
kiện về văn hóa giao thương giữa các vùng miền còn gặp nhiều khó khăn ,Bơ sáp Tây Nguyên phần lớn được người địa phương thưởng thức ,nhưng sau này với sự phát triển mạnh mẻ của vùng đất
 Cao Nguyên ,Bơ Đak Lak đả nổi tiếng toàn quốc ,được các quán ẩm thực và nhà hàng đưa vào thực đơn như là món mang lại giá trị dinh dưỡng cao,tốt cho sức khỏe.</p>\r\n\r\n<p>Bơ sáp Tây Nguyên ngày nay được chế biến t
hành rất nhiều món ăn phong phú, đa dạng và vô cùng hấp dẫn, nhìn là muốn được thưởng thức , bởi sức cuốn hút của bơ sáp vàng.</p>.
\r\n\r\n</p>\r\n\r\n<p></p>\r\n\r\n<p><img alt=\"Sinh tố bơ một món rất thông dụng ngày nay  Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/sinh-to-bo.jpg" 
style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nCô gái hái cà. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n', 7, 0, 2),
(7, 'Thịt nai – Đặc sản của Tây Nguyên', 1, 'kho-nai-1.jpg', '<p><strong>Khám phá ẩm thực và thử qua những món ăn tại Đắk Lắk, chắc chắn thực khách khó lòng cưỡng lại những
 món ăn ngon làm từ thịt nai. Thực tế dù vị giác của mỗi người là khác nhau, cảm nhận món ăn của mỗi người cũng khác nhau, và đương nhiên độ ngon của từng món ăn cũng tùy thuộc 
vào mỗi ý kiến của mỗi người khác nhau. Tuy nhiên, những món ăn chế biến từ thịt nai đều cho mọi người đều cảm nhận chung là ngon. Đặc biệt, muốn thưởng thức thịt nai thơm ngon, 
đa dạng trong cách chế biến thì Đắk Lắk nên là điểm dừng chân mà thực khách cần nán lại.  </strong></p>\r\n\r\n<p>Tour du lịch Đắk Lắk không chỉ là những hành trình khám phá cảnh
 quan núi rừng hùng vỹ đầy ấn tượng, còn là những chuyến đi nhiều trải nghiệm khó quên về hương vị ẩm thực địa phương, trong đó có những món ăn ngon từ thịt nai. Đắk Lắk nổi tiếng 
với món thịt nai không phải vì thịt nai nơi đây là ngon nhất, mà bởi vì 2 lý do chính: một là do thịt nai rất khó tìm ở vùng đất này, nên thịt nai trở thành đặc sản và được chế biến 
hết sức tỷ mỷ, công phu; hai là do hương vị trong cách chế biến thịt nai của người Đắk Lắk rất khác biệt, giản dị nhưng tinh tế bởi thế mà thịt nai Đắk Lắk luôn làm ấm lòng người thực
 khách bốn phương.<p>\r\n\r\n<p>Món ăn tại Đắk Lắk chế biến từ thịt nai rất phong phú. Thực khách có thể thưởng thức thịt nai với 7 cách chế biến khác nhau, món nào cũng có hương vị đặc
 trưng và giá trị khác nhau, bao gồm 7 món: thịt nai nướng, thịt nai xào, thịt nai nhúng mẻ, sườn nai rán, giấm nai lúc lắc, cháo bao tử nai và khô nai. Đối với các món như: sườn nai rán,
 giấm nai lúc lắc, cháo bao tử nai thì đòi hỏi thời gian và công đoạn thực hiện nhiều hơn, tuy nhiên đa phần người dân ở đây cũng như thực khách phương xa luôn ưa chuộng hơn một tí đối với
 các món chế biến từ nai có phần nguyên thủy, đơn giản trong cách thực hiện nhưng giữ được trọn vẹn nhất và tôn lên được vị ngon nhất của thịt nai, đó chính là các cách chế biến: nướng và làm khô.</p>.
\r\n\r\n<p>Đầu tiên, chúng ta thử thưởng thức qua món thịt nai nướng trứ danh của Đắk Lắk nhé. Với món nướng như thế này, người ta sẽ chọn các mảng thịt nai tươi ngon nhất, mang đi thái
 mỏng rồi ướp gia vị, gồm: gừng nướng, mỡ nước, tiêu, xì dầu, bột ngọt, muối, đường. Khi gia vị đã thấm vào thớ thịt, ta mang đi nướng trên lửa củi hoặc lửa than, trở đều tay khi nướng cho
 thịt chín đều ở 2 mặt. Đặc biệt, một miếng thịt nai nướng ngon là một miếng thịt không dai vì chín quá mà cũng không bở vì quá tái. Khi ăn, chúng ta sẽ dùng thịt nai nướng lấy từ bếp 
nướng xuống, không cần chấm thêm với nước chấm, cũng không cần kết hợp thêm với nguyên liệu nào khác.</p></p>\r\n\r\n<p><img alt=\"Thịt nai có thể chế biến được rất nhiều món hấp dẫn.Ảnh: Kiểu Sơn.\" 
src=\"/tintucdulich/public/uploads/tintuc/thitnai.jpg" style=\"margin-left:150px;height:480px; width:800px\" />
<br />\r\nNai khô ăn ngọt lịm chứ không béo ngậy như nai nướng.Ảnh: Kiểu Sơn.<br />&nbsp;</p>\\r\n\r\n<p>Tiếp theo là món khô nai. Món ăn này hầu 
như chinh phục được tất cả các thực khách từ già đến trẻ, bởi sự vui miệng của nó khi ăn cũng như hương vị dễ chịu đọng lại trong cổ họng. Để làm được khô nai, người ta tiến hành dùng thịt
 nai tươi để thái lát mỏng, rồi mang tẩm ướp với nhiều gia vị truyền thống, trong đó không thể thiếu ớt mè trắng, ngũ vị hương, sả, đường, muối, xì dầu. Công đoạn ướp phải tuân thủ trong 
thời gian từ 1 tiếng rưỡi đến 2 tiếng đồng hồ, như thế thì thịt mới thấm và săn chắc. Tiếp đó lấy từng miếng thịt nai đem nướng trên than hoa, sau cùng dùng vật cứng dần miếng thịt cho đến
 khi miếng thịt mềm và bung lên từng thớ thịt nhỏ.</p>\r\n\r\n<p>Có thể thấy, chỉ với nguyên liệu là thịt nai nhưng bằng nhiều cách chế biến khác nhau, vùng đất của ẩm thực rừng núi này
 đã mang lại cho thực khách những trải nghiệm thú vị. Và quả thực, những món ăn từ thịt nai như thế xứng đáng được gọi là đặc sản vùng miền.</p>.
\r\n\r\n</p>\r\n\r\n<p></p>\r\n\r\n<p><img alt=\"Hương thơm thịt Nai. Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/kho-nai.jpg" 
style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nKhô nai là món ngon đặc sản được rất nhiều người yêu thích. Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n', 7, 0, 2),
(11, 'Huyền thoại cà phê chồn', 1, 'ca-phe-chon.jpg', '<p><strong>Cà phê chồn được sản xuất như thế nào, chồn được nuôi để cho ra hạt cà phê trứ danh ra sao... là những câu hỏi được giải
 đáp tại Đắk Lắk - thủ phủ cà phê Việt Nam.  </strong></p>\r\n\r\n<p>Nói về sự ra đời của cà phê chồn, ông Nguyễn Vịnh cho biết cà phê chồn tại Việt Nam xuất hiện một cách tự nhiên vào
 nửa đầu thế kỷ 20, khi cây cà phê được người Pháp du nhập sang và trồng đại trà thành những đồn điền rộng lớn nằm sát những cánh rừng đại ngàn tại vùng đất Tây Nguyên. Mỗi năm chỉ có 
một mùa cà phê duy nhất từ tháng 8 đến tháng 12. Trong khoảng thời gian này, vào ban đêm, những con chồn hương, tên khoa học là cầy vòi đốm đi kiếm ăn. Chúng lẻn vào lô cà phê để thưởng
 thức những trái cà phê chín mọng trên cành mà chúng lựa chọn rất kỹ bằng bản năng siêu phàm của mình. Cũng trong đêm đó, con chồn chỉ nhằn phần ngoài hạt cà phê, nhả vỏ mềm bên ngoài và
 nuốt nguyên trái gồm phần thịt và hạt. Sau quá trình tiêu hóa, phần hạt cà phê được thải ra. Nhân cà phê vẫn được bao bọc nguyên vẹn trong vỏ trấu. <p>\r\n\r\n<p>Hồi đó, những người nông 
dân đi thu hái cà phê cho chủ đồn điền đã thấy những đống phân chồn trộn lẫn hạt cà phê này. Họ xin các ông cai mang về phơi khô, chà vỏ và rang chế biến chúng thành thức uống. Sau đó ông
 cai biết, rồi chủ người Pháp cũng biết đến và đều cho rằng nó có hương vị thơm ngon hơn cà phê bình thường. Từ đó cà phê chồn trở nên nổi tiếng.</p>.
\r\n\r\n<p>Cà phê ở đây Làng cà phê Trung Nguyên cũng rất đa dạng cho bạn lựa chọn. Bạn có thể thưởng thức những tách cà phê tươi được rang xay tại chỗ đậm phong cách Việt hay thử qua 
các phong cách cà phê thế giới: Thổ Nhĩ Kỳ, Ý hay cà phê Syphon đến từ Nhật Bản…</p></p>\r\n\r\n<p><img alt=\"Cà phê chồn có hương vị rất khác biệt với cà phê khác. Ảnh: 
Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/caphechon.jpg" style=\"margin-left:150px;height:480px; width:800px\" />
<br />\r\nNai khô ăn ngọt lịm chứ không béo ngậy như nai nướng.Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n<p>TCà phê chồn hay còn được gọi là Kopi Luwak – loại cà phê đặc biệt cực phẩm, 
là một thức uống hiếm có và đắt đỏ nhất thế giới. Về sự tích hình thành cà phê chồn cũng khá đặc biệt và thú vị. Hàng trăm năm trước, từ những năm đầu thế kỉ 18, người Hà Lan đã đem cây 
cà phê đầu tiên du nhập vào đảo Java và Sumatra – Indonesia – một trong những vùng thuộc địa của Hà Lan. Sau đó, cây cà phê được trồng nhiều hơn và trở thành thức uống của giới thượng 
lưu nơi đây. Ở những vườn cà phê này, một loại động vật có vú cầy vòi đốm hay còn gọi là chồn rất yêu thích loại quả này, chúng thường trèo lên cây cà phê và ăn những trái chín mọng thơm 
ngon nhất. Tuy nhiên, dạ dày của loài chồn lại chỉ tiêu hóa được phần vỏ thịt bên ngoài quả cà phê, do đó phần ruột trong hay các hạt cà phê sẽ được thải ra ngoài cùng với phân của chúng.
Cà phê chồn chính là được chế biến từ những hạt cà phê lẫn trong phân này, và tất nhiên đã được làm sạch và trải qua nhiều giai đoạn khác để tạo nên chất lượng hạt cà phê tuyệt hảo.
Do hạt cà phê đã được tiêu hóa ở dạ dày loài chồn, dưới tác động của các emzyme tiêu hóa nên cấu trúc protein trong hạt cà phê cũng bị biến đổi, một số acid bị loại bỏ khiến cho hương vị
 của cà phê chồn rất đặc biệt.</p>\r\n\r\n<p>Do lượng chồn hoang trên thế giới không còn nhiều, cùng với quy trình sản xuất qua nhiều giai đoạn phức tạp nên giá của cà phê chồn rất cao. 
Có thể nói, cà phê chồn nguyên chất là thức uống cao cấp thương hạng dành cho giới thượng lưu và những người sành uống cà phê.</p>.
\r\n\r\n</p>\r\n\r\n<p></p>\r\n\r\n<p><img alt=\"  Ảnh: Kiểu Sơn.\" src=\"/tintucdulich/public/uploads/tintuc/12chot_guct.jpg" 
style=\"margin-left:150px;height:480px; width:800px\" /><br />\r\nHương vị cà phê chồn là gì  Ảnh: Kiểu Sơn.<br />\r\n&nbsp;</p>\r\n\r\n</p>\r\n\r\n</p>\r\n\r\n', 7, 0, 3);--
-- Table structure for table `tour_tn`
--
CREATE TABLE `tour_tn` (
  `id` int(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ten_tour` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Dumping data for table `tour_tn`
--
INSERT INTO `tour_tn` (`id`, `ten_tour`, `created_at`, `updated_at`) VALUES
(1, 'TOUR ĐĂK LĂK', '2020-10-24 18:41:05', '0000-00-00 00:00:00'),
(2, 'TOUR ĐĂK NÔNG', '2020-10-25 07:13:57', '0000-00-00 00:00:00'),
(3, 'TOUR GIA LAI', '2020-10-26 07:13:57', '0000-00-00 00:00:00'),
(4, 'TOUR LÂM ĐỒNG', '2020-10-28 07:13:57', '0000-00-00 00:00:00'),
(5, 'TOUR KON TUM', '2020-10-29 07:13:57', '0000-00-00 00:00:00');
--
-- Table structure for table `book_tour`
--

CREATE TABLE `book_tour` (
  `id_nguoi_book` int(20) DEFAULT NULL,
  `ten_danh_muc` nvarchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ho_ten` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gioi_tinh` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdt` int(10) NOT NULL,
  `ngay_book` date ,
  `dia_chi` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Adult` int(20) NOT NULL,
  `ghi_chu` text COLLATE utf8_unicode_ci,
  PRIMARY KEY(`id_nguoi_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Dumping data for table `book_tour`
--

INSERT INTO `book_tour` (`id_nguoi_book`, `ten_danh_muc`,`ho_ten`, `gioi_tinh`, `sdt` ,`ngay_book`,`dia_chi`,`email`, `Adult`,`ghi_chu`) VALUES
(1,'TOUR ĐĂK LĂK', 'Dani Kuan', 'nam',0989877644,20/10/2020,'huyenLak-tinh Dak Lak','Danikuan@gmail.com',5,'hello');
--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `tour_tn`
--
ALTER TABLE `tour_tn`
  ADD KEY (`id`);
--
-- Indexes for table `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nguoi_dung_id` (`nguoi_dung_id`),
  ADD KEY `tin_tuc_id` (`tin_tuc_id`);

--
-- Indexes for table `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id_nguoi_dung`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);
--

--
-- Indexes for table `tin_tuc`
--
ALTER TABLE `tin_tuc`
  ADD PRIMARY KEY (`id_tin`),
  ADD KEY `danh_muc_id` (`danh_muc_id`);

--
-- Indexes for table `book_tour`
--
ALTER TABLE `book_tour`
  ADD KEY (`id_nguoi_book`);
--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `binh_luan`
--
ALTER TABLE `binh_luan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id_nguoi_dung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tin_tuc`
--
ALTER TABLE `tin_tuc`
  MODIFY `id_tin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tour_tn`
--
ALTER TABLE `tour_tn`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
  
--
-- AUTO_INCREMENT for table `book_tour`
--
ALTER TABLE `book_tour`
  MODIFY `id_nguoi_book` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id_nguoi_dung`) ON DELETE CASCADE,
  ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`tin_tuc_id`) REFERENCES `tin_tuc` (`id_tin`) ON DELETE CASCADE;
 
--
-- Constraints for table `book_tour`
--

  
--
-- Constraints for table `tin_tuc`
--
ALTER TABLE `tin_tuc`
  ADD CONSTRAINT `tin_tuc_ibfk_1` FOREIGN KEY (`danh_muc_id`) REFERENCES `danh_muc` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
