;;; snakecamelfy.el --- Evil operator to transform CamelCase words into snake_case and vice-versa -*- lexical-binding: t -*-

;; Copyright (C) 2015 by Filipe Silva (ninrod)

;; Author: Filipe Silva <filipe.silva@gmail.com>
;; URL: https://github.com/ninrod/snakecamelfy
;; Version: 0.0.1
;; Package-Requires: ((evil "1.2.13"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides an evil operator to tranform CamelCase words into snake_case.

;;; Code:

;;; Settings:

(require 'evil)

(defgroup snakecamelfy nil
  "Provides a toggle operator to transform CamelCase words to snake_case and vice-versa."
  :group 'snakecamelfy
  :prefix 'snakecamelfy-)

(defcustom snakecamelfy-key (kbd "g~")
  "Key for the snakecamelfy operator."
  :type 'string
  :group 'snakecamelfy)

;;; Core functions

(defun snakecamelfy--upper-letter-to-snake (&optional underscore)
  (let ((case-fold-search nil))
    (cond ((looking-at "[[:upper:]]")
           (evil-invert-case (point) (1+ (point)))
           (when underscore
             (save-excursion
               (forward-char)
               (insert "_")
               1)))
          (t
           nil))))

;; a_b_c_d_e_f_g

;;; Connect to Evil machinery

(evil-define-operator evil-operator-snakecamelfy (beg end type)
  :move-point nil
  (interactive "<R>")
  (let ((finish end))
    (save-excursion
      (goto-char beg)
      (while (< (point) finish)
        (let ((underscore (not (= (point) (1- finish)))))
          (cond ((snakecamelfy--upper-letter-to-snake underscore)
                 (setq finish (1+ finish)))))
        (forward-char)))))

(define-key evil-normal-state-map snakecamelfy-key 'evil-operator-snakecamelfy)

(provide 'snakecamelfy)

;;; snakecamelfy.el ends here
