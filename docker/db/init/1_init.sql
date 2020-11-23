-- create user
create user jedi password 'jedi12345';
grant all on database jedi_db to jedi;
grant pg_read_server_files to jedi ;
grant pg_write_server_files to jedi ;
