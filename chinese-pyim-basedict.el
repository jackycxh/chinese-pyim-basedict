;;; chinese-pyim-basedict.el --- The default pinyin dict of chinese-pyim

;; * Header
;; Copyright (C) 2015 Feng Shu <tumashu@163.com>

;; Author: Feng Shu <tumashu@163.com>
;; URL: https://github.com/tumashu/chinese-pyim-basedict
;; Version: 0.0.1
;; Keywords: convenience, Chinese, pinyin, input-method, complete

;;; License:

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;; * chinese-pyim-basedict README                         :README:doc:

;; ** 简介
;; Chinese-pyim-basedict 是 chinese-pyim 的默认词库，词库的内容的来源:

;; 1. libpinyin 项目内置的词库
;; 2. chinese-pyim 用户贡献的个人词库

;; ** 安装和使用
;; 1. 配置melpa源，参考：http://melpa.org/#/getting-started
;; 2. M-x package-install RET chinese-pyim-basedict RET
;; 3. 在emacs配置文件中（比如: ~/.emacs）添加如下代码：
;;    #+BEGIN_EXAMPLE
;;    (require 'chinese-pyim-basedict)
;;    (chinese-pyim-basedict-enable)
;;    #+END_EXAMPLE

;;; Code:
;; * 代码                                                               :code:
;; #+BEGIN_SRC emacs-lisp

;;;###autoload
(defun chinese-pyim-basedict-enable ()
  "Add basedict to chinese-pyim."
  (interactive)
  (let* ((file (concat (file-name-directory
                        (locate-library "chinese-pyim-basedict.el"))
                       "pyim-basedict.pyim.gz")))
    (when (file-exists-p file)
      (if (featurep 'chinese-pyim)
          (pyim-extra-dicts-add-dict
           `(:name "Basedict-elpa"
                   :file ,file
                   :coding utf-8-unix
                   :dict-type pinyin-dict
                   :elpa t))
        (message "Chinese-pyim 没有安装，chinese-pyim-basedict 启用失败。")))))

;; Enable pyim-basedict
(chinese-pyim-basedict-enable)

;; #+END_SRC

;; * Footer

;; #+BEGIN_SRC emacs-lisp
(provide 'chinese-pyim-basedict)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; chinese-pyim-basedict.el ends here
;; #+END_SRC
