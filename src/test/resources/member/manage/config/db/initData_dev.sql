select *
  from not_exists_in_prd;
-- 운영 환경에서 돌아갈 수 없는 스크립트를 추가해 둠.. 방지책

truncate table users;

Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('brown','java','java',to_date('2020/10/14','YYYY/MM/DD'),'java','대전 중구 대흥동','주소지 수정함!','35364','d:/upload/cony.png','cony.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('cony','코니하이하이','conyPass',to_date('2020/10/14','YYYY/MM/DD'),'토끼하이하이',null,null,null,'D:\profile\cony.png','cony.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('sally','샐리','sallyPass',to_date('2020/10/14','YYYY/MM/DD'),'병아리',null,null,null,'D:\profile\sally.png','sally.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('james','제임스','jamesPass',to_date('2020/10/14','YYYY/MM/DD'),'사람',null,null,null,'D:\profile\james.png','james.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('moon','문','moonPass',to_date('2020/10/14','YYYY/MM/DD'),'달',null,null,null,'D:\profile\moon.png','moon.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('leonard','레너드','leonardPass',to_date('2020/10/15','YYYY/MM/DD'),'개구리',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('edward','에드워드','edwardPass',to_date('2020/10/15','YYYY/MM/DD'),'애벌레',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('jessica','제시카','jessicaPass',to_date('2020/10/15','YYYY/MM/DD'),'고양이',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('boss','보스','bossPass',to_date('2020/10/15','YYYY/MM/DD'),'사람',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('choco','초코','chocoPass',to_date('2020/10/15','YYYY/MM/DD'),'곰2',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('pangyo','팡요','pangyoPass',to_date('2020/10/15','YYYY/MM/DD'),'판다',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('muzi','무지','muziPass',to_date('2020/10/15','YYYY/MM/DD'),'토끼',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('con','콘','conPass',to_date('2020/10/15','YYYY/MM/DD'),'악어',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('apeach','어피치ㅋㅋㅋㅋzzzzzzz','apeachPass',to_date('2020/10/15','YYYY/MM/DD'),'복숭아',null,null,null,'d:\upload\james.png','james.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('ryan','라이언 ','ryanPass',to_date('2020/10/15','YYYY/MM/DD'),'사자',null,null,null,'D:\profile\ryan.png','ryan.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('tofan123','조웅현','pass1234',to_date('2020/10/22','YYYY/MM/DD'),'뽀똥이','대전 서구 관저북로 14','405동 801호','35364','D:\profile\136ffaa8-8f99-49f9-80ee-d6b78bd20022.png','moon.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('riser','riser','riser',to_date('2020/11/18','YYYY/MM/DD'),'riser','서울','중구','35364',null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('dndgus','dndgus','dndgus',to_date('2020/11/18','YYYY/MM/DD'),'dndgus',null,null,null,null,null);
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('tipcoffee','tipcoffee','tipcoffee',to_date('2020/11/18','YYYY/MM/DD'),'tipcoffee',null,null,null,'d:/upload/sally.png','sally.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('example','example','example',to_date('2020/11/18','YYYY/MM/DD'),'example','서울 강남구 개포로 202','101호','06307','d:/upload/brown.png','brown.png');
Insert into WHC_DEV.USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('newexample','newexample','newexample',to_date('2020/11/18','YYYY/MM/DD'),'newexample','제주특별자치도 제주시 가령골길 1','111','63275','d:/upload/cony.png','cony.png');
COMMIT;