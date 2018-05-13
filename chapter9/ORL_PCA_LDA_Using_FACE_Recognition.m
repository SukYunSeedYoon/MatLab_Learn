
clear;
load ORL_person_trim.mat
load feature_person

Ntrn=size(train_trim,1);    % 학습데이터의 수
Ntst=size(test_trim,1);     % 테스트 데이터의 수
lsize=size(train_trim,2);   % 입력벡터의 차원 수
Mcls=50;                    % 클래스의 수


%=====================================
% Classification Using PCA Feature and LDA Features

% 가능한 모든 특징 차원에 대하여 반복 수행
for dim=1: Mcls-1
    Wo=orth(W(:,1:dim));       % 정한 차원만큼 주 성분벡터 행렬 직교화
    Y=(Wo'*(train_trim)')';            % PCA 특징 추출(학습)
    Yt=(Wo'*(test_trim)')';   % PCA 특징 추출(테스트 데이터)
    for i=1:Ntst              % 각 테스트 데이터에 대해 분류 시작
        yt=Yt(i,:);           % 테스트 데이터에 대한 PCA 특징
        zt=Zt(i,1:dim);       % 테스트 데이터에 대한 LDA 특징
        for j=1:Ntrn                    % 학습 데이터들과의 거리 계산
            dy(j)=norm(yt-Y(j,1:dim));
            dz(j)=norm(zt-Z(j,1:dim));
        end
        [minvy, miniy]=min(dy); % 최근접이웃 찾기 (PCA 특징)
        [minvz, miniz]=min(dz); % 최근접이웃 찾기 (LDA 특징)
        min_labely(i)=train_label(miniy);   % 최근접이웃의 클래스로 할당(PCA)
        min_labelz(i)=train_label(miniz);   % 최근접이웃의 클래스로 할당(LDA)
    end
    % 분류율 계산(PCA)
    error_labely=find(min_labely-test_label);
    correcty=Ntst-size(error_labely,2);
    classification_ratey(dim)=correcty/Ntst;
    
    % 분류율 계산 (LDA)
    error_labelz=find(min_labelz-test_label);
    correctz=Ntst-size(error_labelz,2);
    classification_ratez(dim)=correctz/Ntst;
    [classification_ratey(dim), classification_ratez(dim)];
end

% 특징 수에 따른 분류율 변화 그래프 그리기
figure(1);
plot([1:49], classification_ratey, 'b-');
hold on
plot([1:49], classification_ratez, 'r-');



