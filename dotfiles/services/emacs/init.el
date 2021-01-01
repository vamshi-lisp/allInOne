
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PERSONAL INFO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "Vamshi krishna")
(setq user-mail-address "benb6768@gmail.com")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; BASIC STUFF ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 3)

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)
;; Highlight corresponding parentheses when cursor is on one
(show-paren-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; WHICH KEY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GENERAL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(use-package general
;  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC");)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; HYDRA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "y" '(save-buffer :which-key "ySave")
  "f" '(counsel-find-file :which-key "find-file")
  "q" '(save-buffers-kill-emacs :which-key "quit")
  "z" '(hydra-text-scale/body :which-key "zoom")
  "w" '(ace-window :which-key "ace window")
  "s" '(swiper :which-key "swiper")
  "i" '(ibuffer :which-key "ibuffer")
  "e" '(eshell-other-window :which-key "eshell")
  "t" '(vterm-toggle :which-key "vterm")
  "k" '(kill-current-buffer :which-key "kill one")
  "c" '(evilnc-comment-or-uncomment-lines :which-key "comment")
  "m"  '(:ignore t :which-key "multi-cursors")
  "mn" '(mc/mark-next-like-this :which-key "next-like-this")
  "ma" '(mc/mark-all-like-this :which-key "all-like-this")
  "mp" '(mc/mark-previous-like-this :which-key "prev-like-this"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EVIL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-mode 1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(evil-collection-init)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LINE NUMBERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(dolist (mode '(org-mode-hook
                term-mode-hook
                vterm-mode-hook
                shell-mode-hook
		dired-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;; FISH ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq shell-file-name "fish")
;;;;;;;;;;;;;;;;;;;;;;;;;;; UI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq x-stretch-cursor nil)
(use-package highlight-numbers
  :hook ((prog-mode conf-mode) . highlight-numbers-mode)
  :config (setq highlight-numbers-generic-regexp "\\_<[[:digit:]]+\\(?:\\.[0-9]*\\)?\\_>"))

;(set-cursor-color "#000000") 
;(setq font-lock-maximum-decoration t)
(setq pos-tip-internal-border-width 6
      pos-tip-border-width 1)
(blink-cursor-mode -1)
(setq blink-matching-paren nil)
(set-frame-parameter (selected-frame) 'alpha '(92 . 90))
(add-to-list 'default-frame-alist '(alpha . (92 . 90)))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(add-hook 'find-file-hook 'all-the-icons-dired-mode)
(set-face-attribute 'default nil :font "SauceCodePro Nerd Font Mono" :height 235)
;;(set-face-attribute 'mode-line nil :height 100)
;;(set-face-attribute 'mode-line-inactive nil :height 100)
(solaire-global-mode +1)
(load-theme 'doom-vibrant t)
(setq doom-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 32)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 22)
      doom-big-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 36))
;(setq doom-theme 'doom-vibrant)
;(use-package ewal
;  :init (setq ewal-use-built-in-always-p nil
;              ewal-use-built-in-on-failure-p t
;              ewal-built-in-palette "sexy-material"))
;(use-package ewal-spacemacs-themes
;  :init (progn
;          (setq spacemacs-theme-underline-parens t
;                my:rice:font (font-spec
;                              :family "Source Code Pro"
;                              :weight 'semi-bold
;                              :size 11.0))
;          (show-paren-mode +1)
;          (global-hl-line-mode)
;          (set-frame-font my:rice:font nil t)
;          (add-to-list  'default-frame-alist
;                        `(font . ,(font-xlfd-name my:rice:font))))
;  :config (progn
;            (load-theme 'ewal-spacemacs-modern t)
;            (enable-theme 'ewal-spacemacs-modern)))
;(use-package ewal-evil-cursors
;  :after (ewal-spacemacs-themes)
;  :config (ewal-evil-cursors-get-colors
;           :apply t :spaceline t))
;(use-package spaceline
;  :after (ewal-evil-cursors winum)
;  :init (setq powerline-default-separator nil)
;  :config (spaceline-spacemacs-theme))

;(load-theme 'ewal-doom-vibrant t)
;(enable-theme 'ewal-doom-vibrant t)
;; Mode line settings
;;(require 'solar)

;(use-package sky-color-clock
;  :straight (sky-color-clock
;             :type git
;             :host github
;             :repo "zk-phi/sky-color-clock")
;  :config
;  (eval-when-compile
;    (when calendar-latitude
;      (sky-color-clock-initialize (round calendar-latitude)))))

(defface evil-normal-state-face
  `((t (:foreground "#F7B2EE"
        :background "#A273FF"
        :weight ultra-bold)))
  "Face for warnings in the modeline. Used by `*flycheck'")

(defface evil-insert-state-face
  `((t (:foreground "#1A7162" :background "#B2EFE5" :weight ultra-bold)))
  "Face for warnings in the modeline. Used by `*flycheck'")

(defface evil-visual-state-face
  `((t (:foreground "#E9391D" :background "#FFA96F" :weight ultra-bold)))
  "Face for warnings in the modeline. Used by `*flycheck'")

(defface evil-leader-state-face
  `((t (:foreground "#FFFFFF" :background "#000000" :weight ultra-bold)))
  "Face for warnings in the modeline. Used by `*flycheck'")

(defun evil-state-char ()
  "Show starting character of evil state and propertize with respective face."
  (let ((state (symbol-value 'evil-state)))
    (cond ((equal 'normal state) (propertize " N "
                                             'face 'evil-normal-state-face))
          ((equal 'insert state) (propertize " I "
                                             'face 'evil-insert-state-face))
          ((equal 'visual state) (propertize " V "
                                             'face 'evil-visual-state-face)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  COMPANY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook 'global-company-mode)
;(use-package minions
;  :ensure t
;  :init(minions-mode)
;  :config
;  (validate-setq
;    minions-mode-line-lighter "#"
;    minions-direct '(flycheck-mode)))
;		     ; cider-mode)))
(use-package moody
  :ensure t
  :config
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))
  ;:hook (doom-modeline-mode . minions-mode)
  ;:custom
  ;(minions-mode-line-lighter ""))
(use-package minions
  :hook (doom-modeline-mode . minions-mode)
  :custom
  (minions-mode-line-lighter ""))
(doom-modeline-mode 1)

;(use-package doom-modeline
;  :init (doom-modeline-mode 1)
;  ;:after eshell     ;; Make sure it gets hooked after eshell
;  :hook (after-init . doom-modeline-init)
;  :ensure t
;  :config
  ;; Custom doom-modeline segments
  ;(defvar skycolor-clock)
  ;(doom-modeline-def-segment skycolor-clock
  ;  (sky-color-clock))
;  (defvar custom-evil-state)
;  (doom-modeline-def-segment custom-evil-state
;    (evil-state-char))
  ;; Configure doom-modeline variables
  (setq find-file-visit-truename t)
  (setq doom-modeline-minor-modes t)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-height 1)
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
  ;(setq doom-modeline-icon nil)
  (setq doom-modeline-lsp t)
  (display-time-mode 1)  
  (display-battery-mode 1)
  ;; Define custom doom-modeline configuration
 ; (doom-modeline-def-modeline 'gs
 ;   '(bar  custom-evil-state  vcs buffer-encoding buffer-info))
  ;  ;'(skycolor-clock))
 ; (defun setup-custom-doom-modeline ()
 ;   (doom-modeline-set-modeline 'gs 'default)) 
 ; (add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)
 ; :hook
 ; (after-init . doom-modeline-mode))
;; use setq-default to set it for /all/ modes
           ;; value of current line number
;;(setq-default mode-line-format
 ;             (list
;               ;; day and time
  ;             '(:eval (propertize (format-time-string " %b %d %H:%M ")
   ;                                'face 'font-lock-builtin-face))


    ;           '(:eval (propertize (substring vc-mode 5)
     ;                              'face 'font-lock-comment-face))

               ;; the buffer name; the file name as a tool tip
;               '(:eval (propertize " %b "
 ;                                  'face
  ;                                 (let ((face (buffer-modified-p)))
   ;                                  (if face 'font-lock-warning-face
    ;                                   'font-lock-type-face))
     ;                              'help-echo (buffer-file-name)))

               ;; line and column
      ;         " (" ;; '%02' to set to 2 chars at least; prevents flickering
       ;        (propertize "%02l" 'face 'font-lock-keyword-face) ","
        ;       (propertize "%02c" 'face 'font-lock-keyword-face)
       ;        ") "

               ;; relative position, size of file
;               " ["
;               (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
 ;              "/"
  ;             (propertize "%I" 'face 'font-lock-constant-face) ;; size
   ;            "] "

               ;; spaces to align right
;               '(:eval (propertize
 ;               " " 'display
  ;              `((space :align-to (- (+ right right-fringe right-margin)
   ;                                   ,(+ (string-width org-mode-line-string) (+ 3 (string-width mode-name)))
    ;                                  )))))

     ;          (propertize org-mode-line-string 'face '(:foreground "#5DD8FF"))

               ;; the current major mode
      ;         (propertize " %m " 'face 'font-lock-string-face)
               ;;minor-mode-alist
       ;        ))
;(set-face-attribute 'mode-line nil
;                    :background "#353644"
;                    :foreground "white"
;                    :box '(:line-width 4 :color "#353644")
;                    :overline nil
;                    :underline nil)
;		    ;:family "Source Code Pro " :height 250)

;(set-face-attribute 'mode-line-inactive nil
;                    :background "#353644";"#565063"
;                    :foreground "white"
;                    :box '(:line-width 4 :color "#353644")
;                    :overline nil
;                    :underline nil)
;(setq )
;(powerline-default-theme)
;(powerline-nano-theme)

		    ;:family "Source Code Pro " :height 250)
;;(spaceline-emacs-theme)
;;(setq powerline-height 34)
;;(eyeliner/segment my/buffer-name-segment (buffer-name))
;;(setq telephone-line-primary-right-separator 'telephone-line-abs-left
;;      telephone-line-secondary-right-separator 'telephone-line-abs-hollow-left)
;;(setq telephone-line-subseparator-faces '())
;;(setq telephone-line-lhs
;;       '((evil   . (telephone-line-airline-position-segment))))
;;(setq telephone-line-height 21
;;      telephone-line-evil-use-short-tag t)
;(telephone-line-mode t)
;;(setq-default mode-line-format nil)
;;(add-hook 'after-init-hook #'fancy-battery-mode)
;;(spaceline-emacs-theme)
;;(load-theme 'spolsky t)
;(use-package doom-modeline
;  :ensure t
;  :init 
;  (doom-modeline-mode 1)
;  (setq doom-modeline-height 1)
; ;; (setq all-the-icons-color-icons nil)
;  :config 
;  (display-time-mode 1)  
;  (display-battery-mode 1))
;(setq sml/no-confirm-load-theme t)
;(setq sml/theme 'atom-one-dark)
;(sml/setup)
;;(setq-default mode-line-format
;;	       `("%e"
;;      ,;;(when dw/exwm-enabled
       ;;   '(:eval (format "[%d] " exwm-workspace-current-index)))
;;      mode-line-front-space
  ;;    evil-mode-line-tag
   ;;   mode-line-mule-info
    ;;  mode-line-client
     ;; mode-line-modified
      ;;mode-line-remote
      ;;mode-line-frame-identification
      ;;mode-line-buffer-identification
      ;;sml/pos-id-separator
      ;;(vc-mode vc-mode)
      ;;" "
      ;mode-line-position
      ;sml/pre-modes-separator
      ;mode-line-modes
     ; " "
      ;mode-line-misc-info))
;(setq rm-excluded-modes
 ;   (mapconcat
  ;    'identity
   ;   ; These names must start with a space!
    ;  '(" GitGutter" " MRev" " company"
     ; " Helm" " Undo-Tree" " Projectile.*" " Z" " Ind"
      ;" Org-Agenda.*" " ElDoc" " SP/s" " cider.*")
      ;"\\|"))
;;(display-time-mode)
;;(require 'smart-mode-line)
;;(setq sml/no-confirm-load-theme t)
;;(setq powerline-arrow-shape 'curve)
;(setq powerline-default-separator-dir '(right . left))
;(setq sml/mode-width 0)
;(setq sml/name-width 20)
;(rich-minority-mode 1)
;(setf rm-blacklist "")
;;(sml/setup)

(set-face-attribute 'mode-line nil :font "Source Code Pro-10" :height 210)
(set-face-attribute 'mode-line-inactive nil :font "Source Code Pro-10" :height 210)
;(hl-line-mode -1)
(global-hl-line-mode +1)
(smart-cursor-color-mode +1)
;(setq nord-uniform-mode-lines t)
;(hl-line-mode 1)
;(require 'hl-line)
;(set-face-background hl-line-face "darkblue" )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MULTIPLE CURSORS  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'multiple-cursors)
;;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; IVY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ivy-mode 1)
(add-hook 'after-init-hook 'all-the-icons-ivy-setup)
(setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir))
;(all-the-icons-ivy-setup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; KEEP THE FOLDERS CLEAN ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)

(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

(setq create-lockfiles nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; TREEMACS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(treemacs-icons-dired-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; HASKELL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'haskell-mode)
(require 'haskell-process)
(require 'nix-haskell-mode)
(require 'haskell-interactive-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode )
(add-hook 'haskell-mode-hook 'nix-haskell-mode)
(setq  haskell-interactive-popup-errors nil)

(rune/leader-keys

  "h"  '(:ignore t :which-key "haskell")
  "r"  '(haskell-process-load-file :which-key "repl")
  "hs" '(haskell-interactive-switch :which-key "switch"))

;;(require 'company-ghci)
;;(push 'company-ghci company-backends)
;;(add-hook 'haskell-mode-hook 'company-mode)
;;; To get completions in the REPL
;;(add-hook 'haskell-interactive-mode-hook 'company-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LSP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ELECTRIC PAIR ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DESKTOP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(desktop-save-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; VTERM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ESHELL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun eshell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   EDWINA   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(use-package edwina
;;  :ensure t
;;  :config
;;  (setq display-buffer-base-action '(display-buffer-below-selected))
;;  (edwina-setup-dwm-keys)
;;  (edwina-mode 1))
;;(setq display-buffer-base-action '(display-buffer-below-selected))
;;(edwina-setup-dwm-keys)
;;(edwina-mode 1)

;;(ivy-rich-mode 1)
;;(use-package doom-modeline
;;  :hook (after-init . doom-modeline-mode)
;;  :init
;;  (setq doom-modeline-bar-width 5 
;;        doom-modeline-buffer-file-name-style 'truncate-except-project
;;        doom-modeline-lsp t
;;        doom-modeline-env-version t
;;        doom-modeline-indent-info nil
 ;;       doom-modeline-buffer-encoding nil
   ;;     doom-modeline-vcs-max-length 20
     ;;   doom-modeline-major-mode-color-icon nil)

  ;;:config
  ;;(set-face-attribute 'region nil
   ;;                   :foreground (face-background 'doom-modeline-bar)
   ;;                   :background (face-background 'default))
 ;; (set-face-attribute 'highlight nil
  ;;                    :foreground (face-background 'doom-modeline-bar)
   ;;                   :background (face-background 'default))

  ;;(eval-when-compile
   ;; 'company
    ;;(doom-modeline-def-segment company-backend
     ;; "Display the current company backend. `company-backend'."
      ;;(when (company--active-p)
       ;; (format "%s"
        ;;        (--map (s-replace "company-" "" (format "%s" it))
         ;;              (if (listp company-backend) company-backend (list company-backend)))))))

 ;; (doom-modeline-def-segment
   ;; buffer-info
    ;;"Overwrite of buffer info to not include the icon"
    ;;(concat
     ;;(doom-modeline--buffer-state-icon)
     ;;(doom-modeline--buffer-name)))

 ;; (doom-modeline-def-segment
  ;;  buffer-type
   ;; "Buffer icon and version if it exists"
    ;;(concat
     ;;(doom-modeline-spc)
     ;;(doom-modeline--buffer-mode-icon)
     ;;(when (and doom-modeline-env-version doom-modeline-env--version)
      ;; (propertize
       ;; (format "%s " doom-modeline-env--version)
        ;;'face '(:height 0.7)))))

;;  (doom-modeline-def-modeline
 ;;   'main
  ;;  '(bar workspace-name window-number modals matches buffer-type buffer-info remote-host)
   ;; '(company-backend misc-info persp-name battery debug lsp input-method buffer-encoding  process vcs checker)))

