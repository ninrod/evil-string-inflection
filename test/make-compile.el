(setq files '("evil-string-inflection.el"))
(setq byte-compile--use-old-handlers nil)
(mapc #'byte-compile-file files)


