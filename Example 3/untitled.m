x = sdpvar(2,1);
Constraints = [x <= 3 , x(1) >= 2 , x(2) >= 1];
Objective = [1 3]*x;
ops = sdpsettings;
sol = optimize(Constraints , Objective , ops);
if sol.problem == 0
 disp('求解成功')
else disp('求解失败，失败原因为：')
 disp(sol.info)
end