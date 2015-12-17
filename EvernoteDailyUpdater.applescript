-- get the date string
set theDate to (current date)
set newTag to "#Today"
set {year:y, month:m, day:d} to ((current date) - 1 * days)
set oldTag to "#" & (y * 10000 + m * 100 + d) as string
set theTitle to date string of theDate

tell application "Evernote"
	
	set theNotes to find notes "tag:" & newTag
	if (not (tag named oldTag exists)) then
		make tag with properties {name:oldTag}
	end if
	repeat with eachNote in theNotes
		assign tag oldTag to eachNote
		unassign tag newTag from eachNote
	end repeat
	
	create note notebook "@Life Online" tags {newTag, "@Diary"} title theTitle with html "
<b>��O�G</b><div><br/></div><hr />
<b>�ǲ߬����G</b><div><br/></div><hr />
<b>���Ȭ����G</b><div><br/></div><hr />
<b>�Ϭ١G</b><div><br/></div><hr />
<b>ı�o�ܭ��n�������G</b><div><br/></div><hr />
<b>���O�G<div><br/></div></b>
"
end tell