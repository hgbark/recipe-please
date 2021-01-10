CREATE OR REPLACE PROCEDURE TEAM_NULLPOINT.proc_mem_update
(
   user_id IN varchar2,
   user_pw IN varchar2,
   change_pw IN varchar2,
   change_zip IN varchar2,
   change_hp IN varchar2,
   change_nick IN varchar2,
   change_mail IN varchar2,
    msg OUT varchar2
)
IS
    cnt number;    
    nickCheck number;
    e_wrong_info EXCEPTION;
BEGIN       

     SELECT count(*) into cnt from MEMBER where m_id=user_id and m_pw=user_pw;     --회원 정보수정을 위한 사전 아이디 비밀번호 체크
     

     
        IF (cnt>0) THEN  
        
             SELECT count(*) into nickCheck FROM member WHERE m_nick =  change_nick;    --닉네임 중복확인을 위한 것
             
             IF(nickCheck>0) THEN
                msg := '닉네임이 이미 존재합니다';
             ELSE
                 UPDATE member
                 SET
                   m_pw = change_pw,
                   m_zip = change_zip,
                   m_hp=change_hp,
                   m_nick=change_nick,
                   m_mail=change_mail
                 WHERE m_id = user_id;
                 commit;
                 msg:='정상적으로 회원수정 되었습니다';
             END IF;
            
        ELSE
            raise e_wrong_info;        
        END IF;   
        
    EXCEPTION
    WHEN e_wrong_info THEN
       msg:='패스워드가 틀렸습니다';
END;
/