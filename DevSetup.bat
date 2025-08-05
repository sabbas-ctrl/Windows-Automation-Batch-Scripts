@echo off
color a
title Development Setup
powershell.exe -NoProfile -WindowStyle Hidden -Command "& {Start-Process -FilePath 'C:\Users\DELL\AppData\Local\Programs\Microsoft VS Code\Code.exe' -ArgumentList 'C:\Users\DELL\Desktop\freeCodeCamp\Quality-Assurance\boilerplate-mochachai-main\'}"
start chrome.exe --profile-directory="Profile 5" "https://mail.google.com" "https://github.com/sabbas-ctrl" "https://www.freecodecamp.org/learn/back-end-development-and-apis/" "https://gemini.google.com/app/97d9d2071477a758" "https://chatgpt.com/" "http://localhost:3000/"
start chrome.exe --profile-directory="Profile 1" "https://mail.google.com"
start chrome.exe --profile-directory="Profile 9" "https://mail.google.com"