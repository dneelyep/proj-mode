(defun proj-mode-setup ()
  "Retrieve initial parameters required for setting up proj-mode."
  (interactive)
  (proj-prompt-for-proj-directory)
  (proj-prompt-for-proj-template-file))

(defun proj-prompt-for-proj-directory ()
  "Prompt the user to enter the directory which will initially be used when creating a new project."
  (setq directory (read-file-name "Set default project directory:")))

(defun proj-prompt-for-proj-template-file ()
  "Prompt the user to enter the template file which will be automatically placed in new projects."
  (setq template-file (read-file-name "Set project template file:")))

(defun proj-create-project ()
  "Create a new project with a specified name in the default project directory."
  (interactive)
  (setq project-name (read-string "Project name:"))
  (setq project-directory (concat directory  project-name))
  (make-directory project-directory)
  (copy-file template-file (concat project-directory "/notes.org"))
  
  ;; Open the default notes file for the new project.
  (find-file (concat project-directory "/notes.org")))

;; TODO I shouldn't be hard-coding the name of the template file to notes.org...
