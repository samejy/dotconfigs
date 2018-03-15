

(defun get-buffer-contents ()
  (interactive)
  (let ((buf (get-buffer "*Messages*")))
    (move-beginning-of-line 1)
    (insert (buffer-whole-string buf))))

(defun buffer-whole-string (buffer)
  "get all the text content from the specified buffer as a string"
  (with-current-buffer buffer
    (save-restriction
      (widen)
      (buffer-substring-no-properties (point-min) (point-max)))))
