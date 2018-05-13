
clear;
load ORL_person_trim.mat

Ntrn=size(train_trim,1);    % 학습데이터의 수 160 2000
Ntst=size(test_trim,1);     % 테스트 데이터의 수 240 2000
lsize=size(train_trim,2);   % 입력벡터의 차원 수 2000
Mcls=50;                    % 클래스의 수 50


%=====================================
% PCA Feature Extraction
X=train_trim;       % 학습데이터 행렬
meanfig=mean(X);    % 학습데이터 행렬의 평균

%평균 벡터를 데이터 수만큼 반복한 행렬
M=repmat(meanfig, size(X,1),1); 

% 고유치 분석을 위한 행렬을 계산, 공분산
S=(X-M)*(X-M)' / Ntrn;

% V : 고유벡터, D : 고유치
[V,D,U] =svd(S); % 고유치 분석
W=(X-M)'*V;         % 고유벡터 찾기 W = 변환행렬

%=====================================
% LDA Feature Extraction
eval=diag(D); % PCA로 축소할 차원 결정

for i=1:150
    if ((sum(eval(1:i)) / sum(eval)) > 0.95)
        break 
    end
end

Ydim=i;
Wo=orth(W(:,1:Ydim));      % 변환행렬의 직교화
Y=(Wo'*(X)')';          % PCA에 의한 차원 축소(학습 데이터)
Yt=(Wo'*(test_trim)')'; % PCA에 의한 차원 축소(테스트 데이터)
Sw=zeros(Ydim);     % Within-Scatter Matrix 계산

for i=1:Mcls
    C=Y((i-1)*3+1: i*3,:);
    Sw=Sw+3*cov(C);
    m(i,:)=mean(C);
end

Sb=Mcls*cov(m);     % between-Scatter Matrix의 계산
[Vf, Df, Uf] = svd(inv(Sw)*Sb); % LDA 변환행렬 찾기
Z=(Vf'*Y')';     % LDA에 의한 특징 추출(학습 데이터)
Zt=(Vf'*Yt')';  % LDA에 의한 특징 추출(테스트 데이터)


% 추출 데이터 저장
save feature_person W Vf Y Yt Z Zt;



