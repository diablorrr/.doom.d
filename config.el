;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.

(setq user-full-name "yoshiki"
      user-mail-address "1299331829@qq.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-font (font-spec :family "Sarasa Term SC Nerd" :size 24 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "Sarasa Term SC Nerd" :size 26))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;;(setq doom-theme 'doom-one)
;;(setq doom-theme 'doom-dracula)
;;(setq doom-theme 'doom-one-light)
(setq doom-theme 'doom-city-lights)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

(use-package! emacs
  :init
  (defun open-proj ()
    (interactive)
    (find-file (read-file-name "open proj: " "/home/yoshiki01/.proj/")))
  :config
  (add-to-list 'auto-mode-alist '("\\.h\\'" . cpp-mode))        ;; 进入.h的时候进入cpp-mode
  (add-to-list 'initial-frame-alist '(fullscreen . maximized))  ;; emacs开启时，自动最大化，开启自动换行
  (setq display-line-numbers-type t)
  :bind(("C-c f j" . 'open-proj)                                ;; 打开项目
        ("C-M-y" . 'duplicate-line)                             ;; 复制粘贴当前行 x N
        ("C-=" . #'doom/increase-font-size)                     ;; 字体放大缩小
        ("C--" .  #'doom/decrease-font-size)
        ("M-]" . #'doom/window-enlargen)                        ;; 窗口调整
        ("M-[" . #'balance-windows)
        ("<mouse-8>" . #'better-jumper-jump-backward)           ;;设置鼠标返回
        ("M-." . #'+lookup/definition)
        ("M-/" . #'+lookup/references)
        ))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(use-package! org
  :defer t
  :init
  (setq org-directory "/home/yoshiki01/.org/")
  (defun open-org-dir ()
    (interactive)
    (find-file (read-file-name "Open file or directory: " "/home/yoshiki01/.org/")))
  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-todo-log-states)
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (defun yoshiki/org-clock-out-when-todo ()
    (when (string= (org-get-todo-state) "TODO")
      (when (org-clock-is-active)
        (org-clock-out))))
  (defun yoshiki/org-clock-out-when-todo ()
    (when (string= (org-get-todo-state) "TODO")
      (when (org-clock-is-active)
        (org-clock-out))))
  (add-hook 'org-after-todo-statistics-hook #'org-summary-todo)                  ;; 当子任务全部DONE时，父任务自动转变为DONE
  (add-hook 'org-after-todo-state-change-hook #'yoshiki/org-clock-in-when-strt)  ;; 当TODO状态变成STRT时，如果不存在计时器，则开始计时
  (add-hook 'org-after-todo-state-change-hook #'yoshiki/org-clock-out-when-todo) ;; 当其他状态转变为TODO时，检查是否存在计时器，存在就关闭
  :bind(("C-c f o" . 'open-org-dir)
        :map org-mode-map
        ("C-c M-w" . '+org/refile-to-file)
        ("C-c C-w" . 'org-refile)
        ("C-c C-r" . 'org-roam-refile))
  :config
  (setq! tab-width 8)
  (require 'ox-freemind)
  (require 'org-download)
  )



(use-package! org-roam
  :init
  (org-roam-db-autosync-mode))



(use-package! org-noter
  :defer t
  :config
  (defun yoshiki/scroll-other-window () ;; org-noter中在笔记区域滚动pdf区域
    (interactive)
    (let* ((wind (other-window-for-scrolling))
           (mode (with-selected-window wind major-mode)))
      (if (eq mode 'pdf-view-mode)
          (with-selected-window wind
            (pdf-view-next-line-or-next-page 2))
        (scroll-other-window 2))))
  (defun yoshiki/scroll-other-window-down ()
    (interactive)
    (let* ((wind (other-window-for-scrolling))
           (mode (with-selected-window wind major-mode)))
      (if (eq mode 'pdf-view-mode)
          (with-selected-window wind
            (progn
              (pdf-view-previous-line-or-previous-page 2)
              (other-window 1)))
        (scroll-other-window-down 2))))
  :bind (:map org-mode-map
              ("C-M-v" . 'yoshiki/scroll-other-window)
              ("C-M-S-v" . 'yoshiki/scroll-other-window-down))
  )



(use-package! org-download
  :after org
  :bind (:map org-mode-map
              ("C-M-S-y" . #'org-download-clipboard)))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+'). 设置doom变量
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys




;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! consult
  :bind
  ("C-s" . 'consult-line)     ; buffer搜索增强
  ("C-x b" . 'consult-buffer) ; 切换buffer                        ;
  )



(use-package! dired
  :bind
  (:map dired-mode-map
        ("h" . 'dired-up-directory)
        ("l" . 'dired-find-file)
        ("j" . 'dired-next-line)
        ("k" . 'dired-previous-line)
        ))



(use-package! magit
  :init
  (defun open-git-dir ()
        (interactive)
        (find-file (read-file-name "Open file or directory: " "/home/yoshiki01/git/")))
  :bind
  ("C-c f g" . #'open-git-dir))



(use-package! persp-mode
  :config
  (defun display-workspaces-in-minibuffer ()       ;; 永久显示workspace
    (with-current-buffer " *Minibuf-0*"
      (erase-buffer)
      (insert (+workspace--tabline))))
  (run-with-idle-timer 1 t #'display-workspaces-in-minibuffer)
  (+workspace/display))



(use-package! projectile
  :bind (:map projectile-mode-map
         ("C-c p a" . #'projectile-add-known-project)
         ("C-c p r" . #'projectile-remove-known-project)))



(use-package! avy
  :bind
  ("C-r" . #'avy-goto-word-0)
  ("C-x j" . #'avy-goto-line)
  )



;; TODO imenu-list显示在底部
(use-package! imenu-list
  :init
  (defvar my-toggle-state t)
  (defun yoshiki/my-toggle-show-hide ()
    "Toggle between `hs-show-all` and `hs-hide-all` functions."
    (interactive)
    (if (not (fboundp 'hs-show-all))
        (message "The `hs-show-all` function is not defined.")
      (if (not (fboundp 'hs-hide-all))
          (message "The `hs-hide-all` function is not defined.")
        (if my-toggle-state
            (progn
              (setq my-toggle-state nil)
              (message "Hiding...")
              (funcall #'hs-hide-all))
          (progn
            (setq my-toggle-state t)
            (message "Showing...")
            (funcall #'hs-show-all))))))
  :config
  (setq! imenu-list-auto-resize t)
  (setq! imenu-list-position 'right)
  :bind
  (("C-c o i" . #'imenu-list)
   :map imenu-list-major-mode-map
   ("u" . #'yoshiki/my-toggle-show-hide)))



(use-package! lsp-ui
  :defer t
  :bind (:map lsp-ui-mode-map
              ("C-o" . #'lsp-ui-doc-toggle)
              ;;([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ;;("M-/" . #'lsp-ui-peek-find-references)
              ))



(use-package! transpose-frame
  :bind
  ("C-t" . #'transpose-frame))



(use-package! cc-mode
  :defer t
  :config
  (setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "gnu"))))



;;-------------------------------------------------------------------------------------------------------------------
(setq-default tab-width 4) ;; 表示一个 tab 4个字符宽
(setq-default indent-tabs-mode nil) ;; nil 表示将 tab 替换成空格
