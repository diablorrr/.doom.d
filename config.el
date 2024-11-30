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
(map! "C-c f o"
      #'(lambda ()
          (interactive)
          (find-file (read-file-name "Open file or directory: " "/home/yoshiki01/.org/"))))


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

;;avy-goto-char快捷键
(map! "C-c g c" #'avy-goto-char)
;;avy-goto-line快捷键
(map! "C-c g l" #'avy-goto-line)

(map! "C-M-y" #'org-download-crlipboard)

;;emacs开启时，自动最大化
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;;org-roam的数据库，文件改变以保证缓存一致性
(org-roam-db-autosync-mode)

;;设置缩进辅助线
;;(setq highlight-indent-guides-method 'fill)

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

;;光标设置
;; (use-package! holo-layer
;;   :config
;;   (setq holo-layer-enable-cursor-animation t
;;         holo-layer-enable-place-info t
;;         holo-layer-cursor-alpha 100
;;         holo-layer-cursor-animation-interval 10
;;         holo-layer-cursor-animation-duration 200
;;         holo-layer-cursor-animation-type "jelly easing"
;;         holo-layer-python-command "/usr/bin/python")
;;   (holo-layer-enable))

;;rss配置
(setq! rmh-elfeed-org-files '("~/.doom.d/elfeed.org"))
(setq! elfeed-db-directory "/home/yoshiki01/.elfeed/db/")
(after! elfeed
  (setq! elfeed-search-filter "@4-year-ago"))
