(require 'ert)
(require 'evil)
(require 'evil-test-helpers)
(require 'snakecamelfy)

(ert-deftest evil-textobj-xml-attr-test ()
  (ert-info ("basic evil move test")
    (evil-test-buffer
      "CamelCase"
      ("g~iw")
      "camel_case"))
  (ert-info ("basic text")
    (evil-test-buffer
      "camel_case"
      ("g~iw")
      "CamelCase")))
