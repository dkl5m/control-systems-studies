clc;clear;

%A matrix; B matrix; C matrix; D matrix
%sys=ss(A,B,C,D);
%sysd=c2d(sys,1);

num = [200];                % tf numerator
den = [1 6 4];              % tf denominator
[A,B,C,D]=tf2ss(num,den);
Cm=ctrb(A,B);               % controllability matrix
Om=obsv(A,C);               % observability matrix

if (rank(Cm)==rank(A))
    'Controllable'
else
    'Not controllable'
end

if (rank(Om)==rank(A))
    'Observable'
else
    'Not Observable'
end

% Observer gain for observer poles=-1
L=acker(A',C',[-1;-1])'
% Observer matrices
Aobs=[A-L*C]
Bobs=[B L]
Cobs=eye(2) % wanting all states
Dobs=zeros(2,2)
