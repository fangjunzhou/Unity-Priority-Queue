:: 设置项目名称
SET ProjectName=Priority_Queue
::设置模块名字
SET ToolName=upm-priorityqueue
::设置模块版本
SET ToolVersion=priorityqueue-0.1.5
::设置模块源路径（相对项目）
SET ToolAssetPath=Assets/Package

:: 进入项目文件夹
cd %ProjectName%

::此命令会创建一个ToolName的分支，并同步ToolAssetPath下的内容
git subtree split -P %ToolAssetPath% --branch %ToolName%

:: 推送到远端
git push origin %ToolName%

git checkout main

:: 确认分支
echo "请确认当前位置为main分支，否则不要继续运行"
git branch
pause

:: 备份main分支
git add -A
git commit -m "Backup main before %ToolVersion%"

:: 将所有更新提交到ToolName分支
git subtree push --prefix=%ToolAssetPath% origin %ToolName%

:: 进入ToolName并提交tag到最近的commit中
git checkout %ToolName%
for /F %%i in ('git rev-parse --short HEAD') do ( set commitid=%%i)
git tag -a %ToolVersion% %commitid% -m "%ToolVersion%"

::提交
git push --set-upstream origin upm-priorityqueue
git push --tags

:: 回到main分支并进行最后的提交
git checkout main
git push
pause