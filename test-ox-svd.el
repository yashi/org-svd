;;; ox-svd.el --- Test code for ox-svd.el

;; Copyright (C) 2023 Yasushi SHOJI

;; Author: Yasushi SHOJI <yasushi.shoji@gmail.com>
;; Keywords: org, svd

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is test code for ox-svd.el.
;;
;; You can load this file with `load-file' and run the test with
;; `ert', Emacs Lisp Regression Testing.
;;
;; The test code depends on org-mode/testing/org-test.el.  So, make
;; sure you have org-test.el loaded or have it in your load path.
;; (add-to-list 'load-path "org-mode/testing")
;;
;; Obviously, you should have had ox-svd.el in your load path,
;; too.

;;; Code:
(require 'org-test)
(require 'ox-svd)

(defun org-svd-test-transcode-with-template (str1 str2)
  (should (equal (org-test-with-temp-text str1 (org-export-as 'svd))
		 str2)))

(ert-deftest test-org-svd/title ()
  (org-svd-test-transcode-with-template
   "#+title: Test SVD document in ORG"

   "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<device schemaVersion=\"1.1\" xmlns:xs=\"https://raw.githubusercontent.com/ARM-software/CMSIS/master/CMSIS/Utilities/CMSIS-SVD.xsd\">
<vendor>Space Cubics</vendor>
<vendorID>SC</vendorID>
<name>SC_OBC_FPGA</name>
<series>ARMCM3</series>
<version>1.2</version>
<description>Test SVD document in ORG</description>
<cpu>
<name>CM3</name>
<revision>r1p0</revision>
<endian>little</endian>
<mpuPresent>true</mpuPresent>
<fpuPresent>false</fpuPresent>
<nvicPrioBits>8</nvicPrioBits>
<vendorSystickConfig>false</vendorSystickConfig>
</cpu>
<addressUnitBits>8</addressUnitBits>
<width>32</width>
<size>32</size>
<access>read-write</access>
<resetValue>0x00000000</resetValue>
<resetMask>0xFFFFFFFF</resetMask>
<peripherals>
</peripherals>
</device>"))
