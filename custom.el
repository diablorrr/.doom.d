(put 'customize-themes 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7f6bcac0505fb3468fcf436e1274dc538b789f642478320a5f95bfc07d8f10a1" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "e8ceeba381ba723b59a9abc4961f41583112fc7dc0e886d9fc36fa1dc37b4079" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "9013233028d9798f901e5e8efb31841c24c12444d3b6e92580080505d56fd392" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e" "6e33d3dd48bc8ed38fd501e84067d3c74dfabbfc6d345a92e24f39473096da3f" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "1f292969fc19ba45fbc6542ed54e58ab5ad3dbe41b70d8cb2d1f85c22d07e518" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "81f53ee9ddd3f8559f94c127c9327d578e264c574cda7c6d9daddaec226f87bb" "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" default))
 '(elfeed-feeds '("https://emacs.liujiacai.net/podcast/index.xml"))
 '(lsp-ui-doc-show-with-mouse t)
 '(org-agenda-files
   '("~/.org/roam/20241220112523-设计模式.org" "/home/yoshiki01/.org/DoomEmacs使用手册.org" "/home/yoshiki01/.org/todo.org" "/home/yoshiki01/.org/设计模式使用手册.org" "/home/yoshiki01/.org/English使用手册.org"))
 '(org-download-abbreviate-filename-function
   '(closure
        (t)
        (path)
      (if
          (file-in-directory-p path org-download-image-dir)
          (file-relative-name path org-download-image-dir)
        path)))
 '(org-download-heading-lvl nil)
 '(org-download-method 'directory)
 '(org-download-screenshot-method nil)
 '(org-download-timestamp "_%Y%m%d_%H%M%S")
 '(org-export-headline-levels 6)
 '(org-freemind-section-format 'note)
 '(org-goto-auto-isearch nil)
 '(org-hide-emphasis-markers t)
 '(package-selected-packages '(winum))
 '(which-key-use-C-h-commands t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#EDEDED" :foreground "#2E3436" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 126 :width normal :foundry "ADBO" :family "Source Code Pro"))))
 '(bold ((t (:foreground "black" :weight bold))))
 '(cursor ((t (:background "black"))))
 '(doom-modeline-buffer-file ((t (:foreground "gold" :weight bold))))
 '(doom-modeline-buffer-path ((t (:foreground "gold"))))
 '(highlight ((t (:background "gold" :foreground "black"))))
 '(italic ((t (:slant italic))))
 '(line-number ((t (:background "gold" :foreground "black" :weight bold))))
 '(lsp-ui-doc ((t (:height 1.0 :family "Courier New"))))
 '(lsp-ui-doc-background ((t (:background "white"))))
 '(magit-section-highlight ((t (:extend t :background "dark orange"))))
 '(mode-line ((t (:background "black" :foreground "white" :box (:line-width (1 . -1) :style released-button)))))
 '(org-inline-src-block ((t (:inherit org-block))))
 '(org-list-dt ((t (:foreground "orange red" :weight bold))))
 '(org-table ((t (:foreground "Blue1"))))
 '(shadow ((t (:foreground "gray30")))))
