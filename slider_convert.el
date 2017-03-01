;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  prefix
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq setting_prefix "CID_GA_Set_")
(setq multi_media_prefix  "CID_GA_CDMM_")
(setq radio_prefix  "CID_GA_Radio_")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; tag = prefix + CID
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq setting_cid	(list))
(setq multi_media_cid	(list))
(setq radio_cid		(list))




(setq lst_CID_STAMM ( list
		  "Main_Sound_RSEMid_Treble_L"
		  "Main_Sound_RSEMid_Bass_L"
		  "Main_Sound_RSEMid_Treble_R"
		  "Main_Sound_RSEMid_Bass_R"
		  "Main_Sound_RSEHigh_Treble"
		  "Main_Sound_RSEHigh_Bass"
		  "Main_Sound_Treble"
		  "Main_Sound_Bass"    ;; to do
		  "Main_Sound_Balance" ;; to do
		  "Main_Sound_Fader"   ;; to do
		  "Sound_Equalizer_Band1"
		  "Sound_Equalizer_Band2"
		  "Sound_Equalizer_Band3"
		  "Sound_Equalizer_Band4"
		  "Sound_Equalizer_Band5"
		  "Sound_Equalizer_Band6"
		  "Sound_Equalizer_Band7"
		  "Sound_VolumeSettings_GAL"
		  "Sound_VolumeSettings_Navigation"
		  "Sound_VolumeSettings_PDC"
		  "Sound_VolumeSettings_Gong"
		  "Sound_VolumeSettings_Uplink"
		  "Sound_VolumeSettings_Downlink"
		  ))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; generating tags
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(loop for  x in (reverse lst_CID_STAMM)  do (push (concat setting_prefix	x)	setting_cid))
(loop for  x in (reverse lst_CID_STAMM)  do (push (concat multi_media_prefix	x)	multi_media_cid))
(loop for  x in (reverse lst_CID_STAMM)  do (push (concat radio_prefix		x)	radio_cid))

(defun grab-text-around (centr_str begin_str end_str)
  "return the text around CID symbols and save it into LIST"
  (progn
    (if (not (search-forward centr_str)) (message "cant find %s" centr_str))
    (if (not (search-forward begin_str)) (message "cant find %s" begin_str))
    (beginning-of-line)
    (setq splitPos (1- (point)))
    (if (not (search-forward end_str))   (message "cant find %s"  end_str))
    (beginning-of-line)
    (buffer-substring-no-properties (point) splitPos)
    ))




(defun replace-text-around (centr_str begin_str end_str new_str)
  "replace the text around CID symbols and fill it with new_str"
  (progn
    (if (not (search-forward centr_str)) (message "cant find %s" centr_str))
    (if (not (search-forward begin_str)) (message "cant find %s" begin_str))
    (beginning-of-line)
    (setq splitPos (1- (point)))
    (if (not (search-forward end_str))   (message "cant find %s"  end_str))
    (beginning-of-line)
    (delete-region  (point) splitPos) ) ; delete the region
    (insert new_str) ; insert new string
    )



(defun grab-xml-around (CID)
  "return the text around CID symbols and save it into LIST"
  (progn
    (goto-char 1)
    (grab-text-around CID "<view" "</uiobject>")
    ))


(defun replace-xml-around (cid new_str)
  "return the text around CID symbols and save it into LIST"
  (progn
    (goto-char 1)
    (replace-text-around cid "<view" "</uiobject>" new_str)

    ))



(setq setting_code_list (list))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  open and parser setting file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(find-file "c:/cygwin/home/qxb3589/xml/new/HmiSettings.xml")
(loop for x in (reverse setting_cid)   do (push (grab-xml x) setting_code_list))
(kill-buffer)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  generate multimedia file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(copy-file "c:/cygwin/home/qxb3589/xml/new/HmiMultimedia.xml"  "c:/cygwin/home/qxb3589/xml/new/HmiMultimedia-new.xml" "force over write") 
(find-file "c:/cygwin/home/qxb3589/xml/new/HmiMultimedia-new.xml") 
(loop for a_cid			in multi_media_cid
      for a_new_text		in setting_code_list
      do (replace-xml-around a_cid  a_new_text))

(save-buffer)
(kill-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  generate radio file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(copy-file "c:/cygwin/home/qxb3589/xml/new/HmiRadio.xml"  "c:/cygwin/home/qxb3589/xml/new/HmiRadio-new.xml" "force over write") 
(find-file "c:/cygwin/home/qxb3589/xml/new/HmiRadio-new.xml") 
(loop for a_cid			in radio_cid
      for a_new_text		in setting_code_list
      do (replace-xml-around a_cid  a_new_text))

(save-buffer)
(kill-buffer)



