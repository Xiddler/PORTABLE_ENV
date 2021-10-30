# Date 2021-10-30
# Running this file will open my journal in vim to today's date
# To use janet ~/.scripts/my_journal.janet
# Aliased to jmj to distinguish it from the normal alias I use mj


(defn to-double-digit-string [digit]
  " add 1 as the months and days are 0-indexed in the output to (os/date time) in the function get-date-time-string"
  (string/slice (string "0" (+ digit 1)) -3)) 

(defn get-date-time-string [time] # time is in the Unix epoch e.g. 1635595362
  "gets the date in number format e.g. 08-11 and adds the .md suffix for the journal filename"
  (let [date (os/date time) # repl:21:> (os/date 1635595362) --> {:dst false :hours 12 :minutes 2 :month 9 :month-day 29 :seconds 42 :week-day 6 :year 2021 :year-day 302}
        month (to-double-digit-string (get date :month))
        day (to-double-digit-string (get date :month-day))]
    (string  day  "-" month".md")))

(defn get-current-date-time-string []
  (get-date-time-string (os/time)))

(def my-date (get-current-date-time-string))

(def base-path "/run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/")

(defn get-year [time]
  (let [date (os/date time)
        year (get date :year)]
    (string year)))

(defn get-my-year []
  (get-year (os/time)))

(var my-year (get-my-year))

(defn get-month [time]
 (let [date  (os/date time)
       month (to-double-digit-string (get date :month))]
   (string month)))

(defn get-my-month []
  (get-month (os/time)))

(var my-month (get-my-month))

(var jour-path (string base-path my-year "/" my-month "/" my-date))


(os/execute 
    @("/usr/sbin/vim" jour-path)
    :p)

