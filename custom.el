(put 'customize-themes 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(corfu-auto t)
 '(custom-safe-themes
   '("7f6bcac0505fb3468fcf436e1274dc538b789f642478320a5f95bfc07d8f10a1"
     "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006"
     "e8ceeba381ba723b59a9abc4961f41583112fc7dc0e886d9fc36fa1dc37b4079"
     "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882"
     "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2"
     "9013233028d9798f901e5e8efb31841c24c12444d3b6e92580080505d56fd392"
     "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
     "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478"
     "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33"
     "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e"
     "6e33d3dd48bc8ed38fd501e84067d3c74dfabbfc6d345a92e24f39473096da3f"
     "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d"
     "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
     "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554"
     "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100"
     "1f292969fc19ba45fbc6542ed54e58ab5ad3dbe41b70d8cb2d1f85c22d07e518"
     "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0"
     "81f53ee9ddd3f8559f94c127c9327d578e264c574cda7c6d9daddaec226f87bb"
     "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d"
     "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69"
     "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9"
     "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" default))
 '(display-time-mode t)
 '(display-time-use-mail-icon nil)
 '(elfeed-feeds '("https://emacs.liujiacai.net/podcast/index.xml"))
 '(flycheck-buffer-switch-check-intermediate-buffers t)
 '(flycheck-clang-args '("-std=c++17"))
 '(flycheck-display-errors-delay 0.25)
 '(flycheck-display-errors-function 'flycheck-popup-tip-show-popup)
 '(flycheck-emacs-lisp-load-path 'inherit)
 '(flycheck-idle-change-delay 1.0)
 '(flycheck-indication-mode 'right-fringe)
 '(flycheck-popup-tip-error-prefix "[!] ")
 '(global-flycheck-mode t)
 '(lsp-clients-clangd-args '("-j=4" "-j=4" "-j=4" "--header-insertion-decorators=0"))
 '(lsp-completion-provider :none)
 '(lsp-ui-doc-show-with-mouse t)
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-files '("~/.org/someday.org" "/home/yoshiki01/.org/agenda.org"))
 '(org-agenda-inhibit-startup t)
 '(org-agenda-loop-over-headlines-in-active-region nil)
 '(org-agenda-skip-unavailable-files t)
 '(org-agenda-span 10)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-window-setup 'current-window)
 '(org-babel-C++-compiler "g++")
 '(org-babel-load-languages '((emacs-lisp . t) (C . t)))
 '(org-babel-python-command "python3" t)
 '(org-capture-templates
   '(("t" "todo" entry (file+headline "~/.org/agenda.org" "Inbox") "* TODO %?" nil
      nil)
     ("n" "Personal notes" entry (file+headline +org-capture-notes-file "Inbox")
      "* %u %?\12%i\12%a" :prepend t)
     ("j" "Journal" entry (file+olp+datetree +org-capture-journal-file)
      "* %U %?\12%i\12%a" :prepend t)
     ("p" "Templates for projects")
     ("pt" "Project-local todo" entry
      (file+headline +org-capture-project-todo-file "Inbox")
      "* TODO %?\12%i\12%a" :prepend t)
     ("pn" "Project-local notes" entry
      (file+headline +org-capture-project-notes-file "Inbox")
      "* %U %?\12%i\12%a" :prepend t)
     ("pc" "Project-local changelog" entry
      (file+headline +org-capture-project-changelog-file "Unreleased")
      "* %U %?\12%i\12%a" :prepend t)
     ("o" "Centralized templates for projects")
     ("ot" "Project todo" entry #'+org-capture-central-project-todo-file
      "* TODO %?\12 %i\12 %a" :heading "Tasks" :prepend nil)
     ("on" "Project notes" entry #'+org-capture-central-project-notes-file
      "* %U %?\12 %i\12 %a" :prepend t :heading "Notes")
     ("oc" "Project changelog" entry
      #'+org-capture-central-project-changelog-file "* %U %?\12 %i\12 %a"
      :prepend t :heading "Changelog")))
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file "/home/yoshiki01/.org/notes.org")
 '(org-download-abbreviate-filename-function
   #[(path)
     ((if (file-in-directory-p path org-download-image-dir)
          (file-relative-name path org-download-image-dir)
        path))
     (t)])
 '(org-download-display-inline-images t)
 '(org-download-heading-lvl nil)
 '(org-download-image-dir nil)
 '(org-download-method 'attach)
 '(org-download-screenshot-method nil)
 '(org-download-timestamp "_%Y%m%d_%H%M%S")
 '(org-export-headline-levels 16)
 '(org-freemind-section-format 'note)
 '(org-goto-auto-isearch nil)
 '(org-hide-emphasis-markers nil)
 '(org-hide-leading-stars t)
 '(org-log-done nil)
 '(org-num-face '(:inherit org-special-keyword :underline nil :weight bold))
 '(org-pomodoro-audio-player "/usr/bin/paplay")
 '(org-pomodoro-finished-sound
   "/home/yoshiki01/.emacs.d/.local/straight/build-29.4/org-pomodoro/resources/startPomo.wav")
 '(org-pomodoro-keep-killed-pomodoro-time t)
 '(org-pomodoro-killed-sound nil)
 '(org-pomodoro-killed-sound-p nil)
 '(org-pomodoro-length 45)
 '(org-pomodoro-long-break-sound
   "/home/yoshiki01/.emacs.d/.local/straight/build-29.4/org-pomodoro/resources/startPomo.wav")
 '(org-pomodoro-overtime-sound
   "/home/yoshiki01/.emacs.d/.local/straight/build-29.4/org-pomodoro/resources/startPomo.wav")
 '(org-pomodoro-short-break-sound
   "/home/yoshiki01/.emacs.d/.local/straight/build-29.4/org-pomodoro/resources/startPomo.wav")
 '(org-pomodoro-start-sound
   "/home/yoshiki01/.emacs.d/.local/straight/build-29.4/org-pomodoro/resources/startPomo.wav")
 '(org-pomodoro-start-sound-p t)
 '(org-pomodoro-ticking-sound
   "/home/yoshiki01/.emacs.d/.local/straight/build-29.4/org-pomodoro/resources/tick.wav")
 '(org-pomodoro-ticking-sound-p nil)
 '(org-refile-targets
   '(("~/.org/done.org" :level . 3) (nil :maxlevel . 3)
     (org-agenda-files :level . 1)))
 '(org-refile-use-outline-path 'file)
 '(org-todo-keywords
   '((sequence "TODO(t)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(w)" "HOLD(h)"
      "IDEA(i)" "|" "DONE(d)" "KILL(k)")
     (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
     (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))
 '(org-use-tag-inheritance nil)
 '(package-selected-packages '(winum))
 '(tab-width 2)
 '(which-key-use-C-h-commands t)
 '(word-wrap nil))
;; NOTE yoshikiDark的自定义face
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(+org-todo-project ((t (:foreground "deep pink" :weight bold))))
 '(lsp-ui-doc ((t (:height 1.0 :family "Courier New"))))
 '(org-agenda-dimmed-todo-face ((t nil)))
 '(org-hide ((t nil)))
 '(org-scheduled ((t (:foreground "lawn green"))))
 '(org-scheduled-previously ((t (:foreground "sea green"))))
 '(org-scheduled-today ((t (:foreground "lawn green"))))
 '(org-upcoming-deadline ((t (:foreground "orange"))))
 '(org-warning ((t (:foreground "orange red")))))
