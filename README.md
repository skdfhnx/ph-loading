# PropHunt Loading Screen

Готовый экран загрузки для **Russian PropHunt / Шестерочка**.
Зеркало по качеству/UX для `ttt-loading` (не трогает TTT).

## Что умеет
- `GameDetails` — имя сервера, карта, слоты, режим
- `SetFilesTotal` / `SetFilesNeeded` — реальный прогресс
- `DownloadingFile` / `SetStatusChanged` — текущий файл и статус
- Смена советов и шуток, чтобы не скучать
- Discord, команды, причины остаться
- Без автозвука

## Как выложить (GitHub Pages)
1. Репозиторий `ph-loading` (как у TTT: `ttt-loading`)
2. Залей `loading.html` в корень (ветка `main`)
3. Settings → Pages → Source: Deploy from branch → `main` / root
4. Ссылка:
   `https://skdfhnx.github.io/ph-loading/loading.html`

## Как подключить на PH-сервере
В `garrysmod/cfg/server.cfg`:

```
sv_loadingurl "https://skdfhnx.github.io/ph-loading/loading.html"
```

Потом `changelevel` или рестарт PropHunt.

Опционально карта в URL:
```
sv_loadingurl "https://skdfhnx.github.io/ph-loading/loading.html?m=%m"
```

## Превью
Открой `loading.html` двойным кликом (`file://`) или добавь `?preview=1` — демо-прогресс только так.
На HTTPS URL внутри GMod демо **не** запускается (иначе ломает реальный прогресс).

## Брендинг
- Название: **RUSSIAN PROPHUNT**
- Магазин: **Шестерочка**
- Акцент: teal `#4EE2C0` (как в UI магазина)
- Discord: тот же, что у проекта (`discord.gg/pxcxagfXjc`)
