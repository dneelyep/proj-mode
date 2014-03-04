;; So what we need to do is:
;; * Have a proj-mode-setup function that sets the template file, and takes/stores a default project directory.
;; * Have a proj-mode-create-project function that takes in a directory and makes a new project.
(defun proj-mode-setup ()
  "Retrieve initial parameters required for setting up proj-mode."
  (interactive)
  (prompt-for-proj-directory)
  (prompt-for-proj-template-file))

(defun prompt-for-proj-directory ()
  "Prompt the user to enter the directory which will initially be used when creating a new project."
  (setq directory (read-file-name "Set default project directory:")))

(defun prompt-for-proj-template-file ()
  "Prompt the user to enter the template file which will be automatically placed in new projects."
  (setq template-file (read-file-name "Set project template file:")))

(defun proj-create-project ()
  "Create a new project with a specified name in the default project directory."
  (setq project-name (read-string "Project name:")))
