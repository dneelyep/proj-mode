(defcustom proj-mode-project-directory ""
  "Holds the default directory where proj-mode projects should be stored."
  :group 'Applications)

;; TODO I should just store the file contents here, in case the file gets deleted/moved/etc.
(defcustom proj-mode-template-file ""
  "The path to the file that should be placed by default in each new project directory."
  :group 'Applications)

(defun proj-mode-setup ()
  "Retrieve initial parameters required for setting up proj-mode."
  (interactive)
  (proj-prompt-for-proj-directory)
  (proj-prompt-for-proj-template-file))

(defun proj-prompt-for-proj-directory ()
  "Prompt the user to enter the directory which will initially be used when creating a new project."
  (customize-set-variable 'proj-mode-project-directory
			  (read-file-name "Set default project directory:")))

(defun proj-prompt-for-proj-template-file ()
  "Prompt the user to enter the template file which will be automatically placed in new projects."
  (customize-set-variable 'proj-mode-template-file
			  (read-file-name "Set project template file:")))

(defun proj-create-project ()
  "Create a new project with a specified name in the default project directory."
  (interactive)
  (setq project-name (read-string "Project name:"))
  (setq proj-mode-project-directory (concat proj-mode-project-directory project-name))
  (make-directory proj-mode-project-directory)
  (copy-file proj-mode-template-file (concat proj-mode-project-directory
				   "/"
                                   (file-name-nondirectory proj-mode-template-file)))
  
  ;; Open the default notes file for the new project.
  (find-file (concat proj-mode-project-directory
		     "/"
		     (file-name-nondirectory proj-mode-template-file))))
