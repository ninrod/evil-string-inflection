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


(evil-define-operator evil-operator-snakecamelfy (beg end type)
  :move-point nil
  (interactive "<R>")
  (message (concat "beg: " (number-to-string beg) ", end: " (number-to-string end))))

(define-key evil-normal-state-map snakecamelfy-key 'evil-operator-snakecamelfy)

;; A_B_cd

(provide 'snakecamelfy)

;;; snakecamelfy.el ends here
