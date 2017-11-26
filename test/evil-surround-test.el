(require 'ert)
(require 'evil)
(require 'evil-test-helpers)
(require 'snakecamelfy)

(ert-deftest snakecamelfy-evil-operator-test ()
  (ert-info ("basic evil move test")
    (evil-test-buffer
      "A"
      ("g~iw")
      "A"))
  (ert-info ("basic text")
    (evil-test-buffer
      "AB"
      ("g~iw")
      "A_B")))
