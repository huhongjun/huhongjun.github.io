@echo on

@rem 删除SVN版本控制目录 => 搜索当前目录子目录下的.svn目录,全部删除

@rem for /r . %%a in (.) do @if exist "%%a\.svn" @echo "%%a\.svn"
@for /r . %%a in (.) do @if exist "%%a\.svn" rd /s /q "%%a\.svn"

@echo completed
@pause