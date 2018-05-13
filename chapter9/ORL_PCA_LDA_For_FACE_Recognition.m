
clear;
load ORL_person_trim.mat

Ntrn=size(train_trim,1);    % �н��������� �� 160 2000
Ntst=size(test_trim,1);     % �׽�Ʈ �������� �� 240 2000
lsize=size(train_trim,2);   % �Էº����� ���� �� 2000
Mcls=50;                    % Ŭ������ �� 50


%=====================================
% PCA Feature Extraction
X=train_trim;       % �н������� ���
meanfig=mean(X);    % �н������� ����� ���

%��� ���͸� ������ ����ŭ �ݺ��� ���
M=repmat(meanfig, size(X,1),1); 

% ����ġ �м��� ���� ����� ���, ���л�
S=(X-M)*(X-M)' / Ntrn;

% V : ��������, D : ����ġ
[V,D,U] =svd(S); % ����ġ �м�
W=(X-M)'*V;         % �������� ã�� W = ��ȯ���

%=====================================
% LDA Feature Extraction
eval=diag(D); % PCA�� ����� ���� ����

for i=1:150
    if ((sum(eval(1:i)) / sum(eval)) > 0.95)
        break 
    end
end

Ydim=i;
Wo=orth(W(:,1:Ydim));      % ��ȯ����� ����ȭ
Y=(Wo'*(X)')';          % PCA�� ���� ���� ���(�н� ������)
Yt=(Wo'*(test_trim)')'; % PCA�� ���� ���� ���(�׽�Ʈ ������)
Sw=zeros(Ydim);     % Within-Scatter Matrix ���

for i=1:Mcls
    C=Y((i-1)*3+1: i*3,:);
    Sw=Sw+3*cov(C);
    m(i,:)=mean(C);
end

Sb=Mcls*cov(m);     % between-Scatter Matrix�� ���
[Vf, Df, Uf] = svd(inv(Sw)*Sb); % LDA ��ȯ��� ã��
Z=(Vf'*Y')';     % LDA�� ���� Ư¡ ����(�н� ������)
Zt=(Vf'*Yt')';  % LDA�� ���� Ư¡ ����(�׽�Ʈ ������)


% ���� ������ ����
save feature_person W Vf Y Yt Z Zt;



