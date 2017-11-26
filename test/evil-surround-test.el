(require 'ert)
(require 'evil)
(require 'evil-test-helpers)
(require 'snakecamelfy)

(ert-deftest snakecamelfy-evil-operator-test ()
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
  (ert-info ("single word, camelcase")
    (evil-test-buffer
      "Camel"
      ("g~iw")
      "camel")))
