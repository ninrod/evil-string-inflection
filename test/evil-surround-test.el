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
  (ert-info ("basic text")
    (evil-test-buffer
      "AB"
      ("g~iw")
      "A_B"))
  (ert-info ("basic text")
    (evil-test-buffer
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      ("g~iw")
      "A_B_C_D_E_F_G_H_I_J_K_L_M_N_O_P_Q_R_S_T_U_V_W_X_Y_Z")))
