::设置模块名字
SET ToolName=upm-priorityqueue
::设置模块版本
SET ToolVersion=priorityqueue-0.1.3
::设置模块源路径
SET ToolAssetPath=Assets/Package

::此命令会创建一个ToolName的分支，并同步ToolAssetPath下的内容
git subtree split -P %ToolAssetPath% --branch %ToolName%
:: 在ToolName分支设置标签ToolVersion节点
git tag %ToolVersion% %ToolName%

:: 推送到远端
git push origin %ToolName% %ToolVersion%
git push origin %ToolName%

git subtree push --tags --prefix=%ToolAssetPath% origin %ToolName% %ToolVersion%
pause