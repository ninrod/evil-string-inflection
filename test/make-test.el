(setq load-prefer-newer t)

(let ((current-directory (file-name-directory load-file-name)))
  (setq test-path (expand-file-name "." current-directory))
  (setq root-path (expand-file-name ".." current-directory)))

(add-to-list 'load-path root-path)
(add-to-list 'load-path test-path)

(load (concat (file-name-as-directory test-path) "test.el") nil t)

(ert-run-tests-batch-and-exit)
