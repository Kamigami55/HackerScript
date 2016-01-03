# HackerScript
Get shit done!

AppleScripts that make my life better.

## Index of scripts
- [LifeLog](#LifeLog)
- [OneClick](#OneClick)

<h2 id="LifeLog">LifeLog</h2>

An AppleScript that save what you do today to Evernote

This script is assumed to be run every day at 0:05 (or anytime after 0:00).

This script does the following things:
- Replace the Evernote tag "#Today" with "#<yesterday's date>". ex: #Today -> #20151216
- Add a new Evernote note in "@Life Online" notebook with title of today's date and with tag of "#Today" and "@Diary" and some default content.
- (WIP)Add your iCalender events yesterday to your yesterday's lifelog note. 
- (WIP)Add your Todoist to-dos that you done yesterday to your yesterday's lifelog note. 
- (WIP)Add your new notes' links yesterday to your yesterday's lifelog note. 

<h2 id="OneClick">OneClick</h2>

An AppleScript that automatically launch some apps

This script will launch the following apps:
- Safari
- LINE
- Mail
- Evernote
