    -- [ 시스템 계정(System) 접속 ] ----------------------------------------------
   
   -- 2-1. 계정 생성
   -- create user <계정이름> identified by <계정암호> default tablespace users;
   -- tablespace : 테이블, 뷰, 다른 데이터베이스 객체들이 저장되는 장소
   create user PTMS_TEAM_PROJECT identified by tiger default tablespace users;
    
   -- 2-22. 사용자 권한 부여
   -- grant connect, resource, create view to <계정이름>
   grant connect, resource, create view to PTMS_TEAM_PROJECT;
   -- grant create view to hr;
   
   