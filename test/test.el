(require 'ert)
(require 'evil)
(require 'evil-test-helpers)
(require 'evil-string-inflection)

(ert-deftest evil-string-inflection-test ()
  (ert-info ("full cycle")
    (evil-test-buffer
      "AnAwesomeC[a]melCaseWord"
      ("g~iW")
      "[a]nAwesomeCamelCaseWord"
      (".")
      "an-awesome-camel-case-word"
      (".")
      "An_Awesome_Camel_Case_Word"
      (".")
      "an_awesome_camel_case_word"
      (".")
      "AN_AWESOME_CAMEL_CASE_WORD"
      (".")
      "AnAwesomeCamelCaseWord")))
