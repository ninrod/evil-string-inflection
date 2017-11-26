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
  "Provide a toggle operator to transform CamelCase words to snake_case and vice-versa."
  :group 'snakecamelfy
  :prefix 'snakecamelfy-)

(defcustom snakecamelfy-key (kbd "g~")
  "Key for the snakecamelfy operator."
  :type 'string
  :group 'snakecamelfy)

;;; common functions

(defun snakecamelfy--has-pattern (beg end pattern)
  "verify if string from BEG to END has an underscore."
  (let ((str (buffer-substring-no-properties beg end)))
    (string-match-p pattern str)))

;;; snakefy core functions

(defun snakecamelfy--upper-letter-to-snake (&optional underscore)
  "Invert case and apply underscore if applicable.
If UNDERSCORE is not nil, applies underscore. If it's nil, then it does not insert underscore."
  (let ((case-fold-search nil))
    (cond ((looking-at "[[:upper:]]")
           (evil-invert-case (point) (1+ (point)))
           (when underscore
             (save-excursion
               (insert "_")
               1)))
          (t
           nil))))

(defun snakecamelfy--snakefy (beg end)
  "Snakefy string from BEG to END."
  (let ((finish end))
    (save-excursion
      (goto-char beg)
      (while (< (point) finish)
        (cond ((snakecamelfy--upper-letter-to-snake (not (= (point) beg)))
               (setq finish (1+ finish))))
        (forward-char)))))

;;; Connect to Evil machinery

(evil-define-operator evil-operator-snakecamelfy (beg end type)
  "Define a new evil operator that toggles snake to camel and vice-versa."
  :move-point nil
  (interactive "<R>")
  ;; https://stackoverflow.com/questions/2129840/check-if-a-string-is-all-caps-in-emacs-lisp
  (cond ((snakecamelfy--has-pattern beg end "\\`[A-Z]*\\'")
         (snakecamelfy--snakefy beg end))
        (t
         nil)))

(define-key evil-normal-state-map snakecamelfy-key 'evil-operator-snakecamelfy)

(provide 'snakecamelfy)

;;; snakecamelfy.el ends here
