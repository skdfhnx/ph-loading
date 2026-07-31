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

## FastDL (танцы / wiltOS anim)
Папка `fastdl/` — корень для `sv_downloadurl`. Внутри пути как в GAME:

- `models/m_anm.mdl` (+ `.ani`, `f_anm`, `z_anm`)
- `models/player/wiltos/anim_*.mdl` (base + `anim_extension_mod13.mdl`)
- `sound/wos/tf2/taunts/*`, `materials/wos/tf2/taunts/*`

На сервере:

```
sv_downloadurl "https://skdfhnx.github.io/ph-loading/fastdl"
```

Те же файлы лежат в аддоне `phe_hunter_dances` (AddFile). Без FastDL клиенты часто не получают крупные `.ani` и видят только ходьбу (`fail=no_driver`).

Обновить FastDL с сервера (PowerShell): скопировать `models/`, `sound/`, `materials/` из `garrysmod/addons/phe_hunter_dances/` в `ph-loading/fastdl/`, затем `git push`.

**Не** используй Git LFS — GitHub Pages не отдаёт LFS-файлы.

## Как подключить на PH-сервере
В `garrysmod/cfg/server.cfg`:

```
sv_loadingurl "https://skdfhnx.github.io/ph-loading/loading.html"
sv_downloadurl "https://skdfhnx.github.io/ph-loading/fastdl"
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
