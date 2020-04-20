(defun get-buffer-contents (buf1)
  (interactive)
  (let ((buf (get-buffer buf1)))
    (move-beginning-of-line 1)
    (insert (buffer-whole-string buf))))

(defun buffer-whole-string (buffer)
  "get all the text content from the specified buffer as a string"
  (with-current-buffer buffer
    (save-restriction
      (widen)
      (buffer-substring-no-properties (point-min) (point-max)))))

(defun toggle-py-break ()  
  "remove py debug code, if found, else insert it"  
  (interactive)  
  (let ((x (line-number-at-pos))  
	(cur (point)))  
    (let ((found-point (search-forward-regexp "^[ ]*import pdb; pdb.set_trace();" nil t)))  
      (if (and (not (null found-point))
	       (= x (line-number-at-pos)))  
	  (let ()  
	    (move-beginning-of-line 1)  
	    (kill-line 1)  
	    (move-beginning-of-line 1))  
	(let ()
	  (move-beginning-of-line 1)  
	  (insert "import pdb; pdb.set_trace();\n") 
	  (goto-char cur))))))

(defun interrupt-process (process)
  "Send a SIGINT to BUFFERs process."
  (interactive (list 
                (completing-read 
                 "Process: "
                 (mapcar 'process-name (process-list)))))
  (kill-process process))

(defun interrupt-buffer-process (buffer)
  "Send a SIGINT to BUFFERs process."
  (interactive (list 
                (completing-read 
                 "Buffer: "
                 (mapcar 'buffer-name (remove-if-not 'get-buffer-process (buffer-list))))))
  (signal-process (get-buffer-process buffer) 'sigint))

;; (defun my-eldoc-display-message (format-string &rest args)
;;   "Display eldoc message near point."
;;   (when format-string
;;     (pos-tip-show (apply 'format format-string args))))

;; (add-hook 'eldoc-mode-hook #'set-eldoc-popup)

;; (defun set-eldoc-popup ()
;;     (setq eldoc-message-function #'my-eldoc-display-message))

;; (defun popup-documentation-at-point ()
;;   (interactive)
;;   (let* ((position (point))
;;          (string-under-cursor (buffer-substring-no-properties
;;                          (progn (skip-syntax-backward "w_") (point))
;;                          (progn (skip-syntax-forward "w_") (point)))))
;;     (goto-char position)
;;     (popup-tip (ac-symbol-documentation (intern string-under-cursor)))))

(defun company-show-doc-buffer-symbol ()
  (interactive)
  "Temporarily show the documentation buffer for the symbol."
  (company-assert-enabled)
    (let* ((symb (symbol-at-point)))
    (if (symbolp symb)
	    (let*
		;; todo - work out how to make all backends available
		((company-backend #'company-elisp)
		 (doc-buffer (or (my/company-call-backend 'company-elisp 'doc-buffer (symbol-name symb))
				    (user-error "No documentation available"))))
		;; company-quickhelp--doc relies on company having set up an appropriate backend...
		;;((doc-string (company-quickhelp--doc (symbol-name symb))))
	      ;; if we got a doc buffer then need to read out contents and show in popup
		 (insert doc-buffer)))))

(defun my/company-show-doc ()
  "Show docs"
  (interactive)
  (let* ((symb (symbol-at-point)))
    (when (symbolp symb)
      (let* ((bb company-backends)
	     (mode (symbol-name major-mode))
	     (symb-name (symbol-name symb))
	     (company-prefix symb-name)
	     backend
	     (doc-buffer (cl-loop for b in bb
				  thereis (let ((company-backend b))
					    (setq backend b)
					    (when (company-call-backend 'prefix)
					      (company-call-backend 'doc-buffer symb-name))))))
	(when (or (stringp doc-buffer) (consp doc-buffer))
	  (pop-to-buffer (get-buffer-create "*ShowDoc*"))
	  (setq buffer-read-only nil)
	  (erase-buffer)
	  (insert (get-buffer-contents doc-buffer))
	  (special-mode))))))

;(defun my/set-company-backend (fun args))
;    (cl-dolist (backend (if company-backend
;                            ;; prefer manual override
;                            (list company-backend)
;                          company-backends))
;      (setq prefix
;            (if (or (symbolp backend)
;                    (functionp backend))
;                (when (company--maybe-init-backend backend)
;                  (let ((company-backend backend))

(defun my/company-call-backend (backend &rest args)
  (company--force-sync #'company-call-backend-raw args backend))
;;   (interactive)
;;   (let (other-window-scroll-buffer)
;;     (company--electric-do
;;       (let* ((symb (symbol-at-point))
;; 	     (doc-buffer (or (company-call-backend 'doc-buffer symb)
;; 				       (user-error "No documentation available")))
;;              start)
;;         (when (consp doc-buffer)
;;           (setq start (cdr doc-buffer)
;;                 doc-buffer (car doc-buffer)))
;;         (setq other-window-scroll-buffer (get-buffer doc-buffer))
;;         (let ((win (display-buffer doc-buffer t)))
;;           (set-window-start win (if start start (point-min))))))))
;; (put 'company-show-doc-buffer 'company-keep t)
