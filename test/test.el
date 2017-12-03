(require 'ert)
(require 'evil)
(require 'evil-test-helpers)
(require 'evil-snakecamelfy)

(ert-deftest evil-snakecamelfy-test ()
  (ert-info ("basic evil move test")
    (evil-test-buffer
      "[A]B"
      ("l")
      "A[B]"))
  (ert-info ("2 letters")
    (evil-test-buffer
      "AB"
      ("g~iw")
      "a_b"))
  (ert-info ("huge letter, all caps")
    (evil-test-buffer
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      ("g~iw")
      "a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z"))
  (ert-info ("single word, 2 letter, camelcase")
    (evil-test-buffer
      "Ab"
      ("g~iw")
      "ab"))
  (ert-info ("Camel word")
    (evil-test-buffer
      "Camel"
      ("g~iw")
      "camel"))
  (ert-info ("CamelCase word")
    (evil-test-buffer
      "CamelCase"
      ("g~iw")
      "camel_case"))
  (ert-info ("random pattern")
    (evil-test-buffer
      "ABcdeF"
      ("g~iw")
      "a_bcde_f"))
  (ert-info ("2 letters")
    (evil-test-buffer
      "a_b"
      ("g~iW")
      "AB"))
  (ert-info ("huge letter, all caps")
    (evil-test-buffer
      "a_b_c_d_e_f_g_h_i_j_k_l_m_n_o_p_q_r_s_t_u_v_w_x_y_z"
      ("g~iW")
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
  (ert-info ("single word, 2 letter, camelcase")
    (evil-test-buffer
      "ab"
      ("g~iW")
      "ab"))
  (ert-info ("Camel word")
    (evil-test-buffer
      "camel"
      ("g~iW")
      "camel"))
  (ert-info ("CamelCase word")
    (evil-test-buffer
      "camel_case"
      ("g~iW")
      "CamelCase"))
  (ert-info ("random pattern")
    (evil-test-buffer
      "a_bcde_f"
      ("g~iW")
      "ABcdeF")))
