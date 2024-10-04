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
