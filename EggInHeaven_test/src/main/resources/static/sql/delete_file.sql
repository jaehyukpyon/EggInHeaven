create table delete_file(
  commu_img varchar2(50),
  commu_date date default sysdate
  );
  
  drop trigger save_delete_file;
  
  create or replace trigger save_delete_file
  after update or delete
  on community
   for each row
   begin
    if(:old.commu_img is not null) then
      if(:old.commu_img != :new.commu_img or :new.commu_img is null) then
        insert into delete_file
          (commu_img)
         values(:old.commu_img);
       end if;
      end if;
     end;
     /