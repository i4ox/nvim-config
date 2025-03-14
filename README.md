# Современная конфигурация NeoVim с полной поддержкой разработки на Golang

## Возможности

- Управление плагинами через [Lazy.nvim](https://github.com/folke/lazy.nvim)
- Красивая стартовая страница через [snacks.nvim](https://github.com/folke/snacks.nvim)
- Автодополнение кода, сниппетов и слов через [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Поддержка протокола языкового сервера (LSP) через [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- Интеграция с отладчиком через [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- Интеграция с Git через [vim-fugitive](https://github.com/tpope/vim-fugitive)
- Проводник файлов через [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- Подсказки пользовательских сочетаний клавиш через [which-key.nvim](https://github.com/folke/which-key.nvim)
- Сверхбыстрый нечеткий поиск по проекту через [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Навигация по символам через [namu.nvim](https://github.com/bassamsdata/namu.nvim)
- Быстрый переход по буферам через [flash.nvim](https://github.com/folke/flash.nvim)
- Отображение индекса и количества результатов поиска через [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
- Сворачивание кода с помощью [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) и [statuscol.nvim](https://github.com/kdheepak/statuscol.nvim)
- Подсветка цветов через [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
- Интеграция тестов через [neotest](https://github.com/nvim-neotest/neotest)
- Подсветка синтаксиса через [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Красивая цветовая схема через [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- ИИ-помощник через [supermaven-nvim](https://github.com/supermamon/supermaven-nvim)
- Быстрая вставка и переход по парным символам через [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Поддержка вкладок через [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

## Внешние инструменты

С tmux вы можете использовать:

- [lazygit](https://github.com/jesseduffield/lazygit) для работы с git репозиториями
- [lazydocker](https://github.com/jesseduffield/lazydocker) для работы с docker контейнерами
- [k9s](https://github.com/derailed/k9s) для работы с kubernetes кластерами

## Отладка

Используется отладчик [delve](https://github.com/go-delve/delve) для Go.

## Линтинг и форматирование

Поддерживаются линтеры для:

- Go
- Bazel
- Dockefile
- Markdown
- JS/TS, Vue, Svelte
- GraphQL
- HTML, CSS, SCSS
- JSON
- YAML

Поддерживаются форматтеры для:

- Go
- Bazel
- JS/TS, Vue, Svelte
- GraphQL
- HTML, CSS, SCSS
- JSON
- YAML
