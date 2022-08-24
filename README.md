# R-news
Приложение новостей с регистрацией, анимациями и алгоритмами подбора потенциально подходящих пользователю новостей

В этом проекте я использовала:
* MVVM + binding
* SnapKit для верстки 
* Lottie для анимаций 
* Kingfisher для изображений
* UserDefaults для хранения данных

## Launch Screen и Архитектура проекта

<img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/launch.gif" width="160">  <img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/Снимок%20экрана%202022-08-20%20в%2019.22.00.png" width="172">  <img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/Снимок%20экрана%202022-08-20%20в%2019.22.34.png" width="185"> 

## Home Page

На главной странице при первом запуске приложения будет возможность зарегестрироватьсся или войти в уже сущетсвующий аккаунт.

<img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/all.gif" width="160"> 

## SignUp Page

Здесь все поля должны пройти валидацию, расписанную через регулярные выражения. При отоброжении всех надписей в зеленом цвете возможно совершить регистрацию, если хотя бы одно поле не заполнено - появится алерт с предупреждением.

<img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/signup.gif" width="160">  <img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/confetti.gif" width="160"> 

## LogIn Page

После успешной регистрации можно сразу выполнить вход в аккаунт.

<img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/login.gif" width="160"> 

## News 

* Основной экран с новостями, по клику на любую из новостей откроется детальный экран с более подробной информацией об этой новости, по клику на кнопку "Read more" откроется еще один экран WebKit, с сайтом, откуда была взята конкретная новость

<img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/placeholder.gif" width="160">  <img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/newsscreen.gif" width="160">  <img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/detailscreen.gif" width="160">  <img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/webkit.gif" width="160"> 

* Смена страны в пикере позволит смотреть актуальные новости в этой стране, на языке этой страны!

<img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/picker.gif" width="160"> 

* Более узкий поиск по категориям с кастомной анимацией, прописанной через расширение UITableView

<img src="https://github.com/AnnaGola/R-news/blob/main/Screenshots/detail.gif" width="160"> 
