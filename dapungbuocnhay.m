% Khai báo hệ thống truyền
k = 1; % Đặt giá trị cho k
a0 = 1; 
a1 = 2; 
a2 = 3; 
a3 = 4; 

num = [k]; % Tử của hàm truyền
den = [a0 a1 a2 a3]; % Mẫu của hàm truyền
w = tf(num, den); % Tạo đối tượng hàm truyền

% Chuyển đổi hàm truyền thành mô hình trạng thái
ws = ss(w); % Chuyển đổi hàm truyền sang dạng mô hình trạng thái
A = ws.A; % Ma trận A
B = ws.B; % Ma trận B
C = ws.C; % Ma trận C
D = ws.D; % Ma trận D

% In ra mô hình trạng thái
disp('Mô hình trạng thái:');
disp(A);
disp(B);
disp(C);
disp(D);
% Kiểm tra tính điều khiển được
co = ctrb(A, B); % Tính ma trận điều khiển
rank_co = rank(co); % Tính hạng của ma trận điều khiển
disp(['Hạng ma trận điều khiển: ', num2str(rank_co)]);

% Kiểm tra tính quan sát được
ob = obsv(A, C); % Tính ma trận quan sát
rank_ob = rank(ob); % Tính hạng của ma trận quan sát
disp(['Hạng ma trận quan sát: ', num2str(rank_ob)]);
% Nhận xét tính ổn định
eigenvalues = eig(A); % Tính các giá trị riêng của A
disp('Giá trị riêng của A:');
disp(eigenvalues);

% Kiểm tra tính ổn định
if all(real(eigenvalues) < 0)
    disp('Hệ thống ổn định.');
else
    disp('Hệ thống không ổn định.');
end
% Thiết kế bộ điều khiển phản hồi trạng thái
p = [-2; -5; -k]; % Điểm cực cần gán
K = place(A, B, p); % Tính toán ma trận điều khiển K
disp('Ma trận điều khiển K:');
disp(K);
% Cập nhật ma trận trạng thái với bộ điều khiển
A_new = A - B * K; % Tính ma trận trạng thái mới

% Tìm hàm truyền của hệ thống kín
[num_closed, den_closed] = ss2tf(A_new, B, C, D); % Chuyển đổi về hàm truyền
w_new = tf(num_closed, den_closed); % Tạo đối tượng hàm truyền mới

disp('Hàm truyền của hệ thống kín:');
disp(w_new);

%Tìm đáp ứng bước nhảy
step(w_new)
