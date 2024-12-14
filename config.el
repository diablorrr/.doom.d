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
(setq doom-font (font-spec :family "Sarasa Term SC Nerd" :size 24 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Sarasa Term SC Nerd" :size 26))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
;;启动主题设置
(setq doom-theme 'adwaita)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; 设置org文件的默认目录
(setq org-directory "~/.org/")
;;打开org的目录
(defun open-org-dir ()
        (interactive)
        (find-file (read-file-name "Open file or directory: " "/home/yoshiki01/.org/")))
(map! "C-c f o" #'open-org-dir)
;;org-roam的数据库，文件改变以保证缓存一致性
;;(org-roam-db-autosync-mode)
;;+org/refile-to-file
(map! :after org
      "C-c C-w" #'+org/refile-to-file)

;;debug时用的
;; (add-variable-watcher 'org-agenda-files
;;                       (lambda (_sym newval operation where)
;;                         (message "org-agenda-files changed: %s (Operation: %s)" newval operation)
;;                         (debug))) ; 捕获调用堆栈

;;org-agenda捕获TODO文件
;; (after! org
;;   (setq! org-agenda-files (directory-files-recursively "/home/yoshiki01/.org" "\\.org$")))

(after! org
  (setq! org-agenda-files
         (cl-remove-if
          (lambda (file) (string-match-p "/\\.org/roam/" file))  ; 排除包含 /.org/.roam/ 的文件
          (directory-files-recursively "/home/yoshiki01/.org" "\\.org$"))))



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
;;   - Setting doom variables (which start with 'doom-' or '+').
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
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.




;;emacs开启时，自动最大化
(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;;永久显示workspace
(after! persp-mode
  (defun display-workspaces-in-minibuffer ()
    (with-current-buffer " *Minibuf-0*"
      (erase-buffer)
      (insert (+workspace--tabline))))
  (run-with-idle-timer 1 t #'display-workspaces-in-minibuffer)
  (+workspace/display))

;;更改dashboard
(defun my-weebery-is-always-greater ()
  (let* ((banner '("Hello World"                                   ))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))
(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

;;修改doom-dashboard的footer
(defun doom-dashboard-widget-footer ()
  (insert
   "\n"
   (+doom-dashboard--center
    (- +doom-dashboard--width 2)
    (with-temp-buffer
      (insert-text-button
       (propertize "yoshiki" 'face 'doom-dashboard-footer)
       'action (lambda (_) (browse-url "https://example.com"))
       'follow-link t
       'help-echo "Open custom page")
      (buffer-string)))
   "\n"))


;;搜索增强
(map! "C-s" #'consult-line)
;;快速运行代码
(map! "<f5>" #'quickrun)
;;切换treemacs窗口
(map! :prefix "C-c"
      "w e" #'treemacs-select-window)
;;增强切换buffer,会显示最近的文件
(map! :prefix "C-x"
      "b" #'switch-to-buffer)
;;projectile相关设置
(after! projectile
  (map! :map projectile-mode-map "C-c p a" #'projectile-add-known-project)
  (map! :map projectile-mode-map "C-c p r" #'projectile-remove-known-project))

;;粘贴图片
(map! "C-M-y" #'org-download-crlipboard)



;;打开项目
(defun open-proj ()
  (interactive)
  (find-file (read-file-name "open proj: " "/home/yoshiki01/.proj/")))
(map! "C-c f j" #'open-proj)

;;解绑快捷键
;;(map! :map general-override-mode-map "C-c f p" nil)

;;字体放大缩小
(map! :map global-map
      "C-=" #'doom/increase-font-size
      "C--" #'doom/decrease-font-size)
;;窗口调整
(map! "M-]" #'doom/window-enlargen
      "M-[" #'balance-windows)


;;avy-goto-word-0快捷键
(map! :map global-map
      "C-r" #'avy-goto-word-0)
;;avy-goto-line快捷键
(map! "C-x j" #'avy-goto-line)

;;dired改键
(map! :after dired
      :map dired-mode-map
      "b" #'dired-up-directory)

;;imenu-list配置
(map! "C-c o i" #'imenu-list)
(setq! imenu-list-auto-resize t)

;;imenu-list快捷键设置
(defvar my-toggle-state t)
(defun my-toggle-show-hide ()
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
(map! :after imenu-list
      :map imenu-list-major-mode-map
      "u" #'my-toggle-show-hide)

(map! :map c-mode-base-map "C-o" #'lsp-ui-doc-toggle)
(after! lsp-ui
  (setq lsp-ui-doc-max-width 200
        lsp-ui-doc-max-height 100
        lsp-ui-doc-position 'top))
(custom-set-faces
 '(lsp-ui-doc ((t (:height 1.0 :family "Courier New"))))) ;; 设置字体和大小


;;TODO：删除未使用的图片
