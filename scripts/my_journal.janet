# Date 2021-10-30
# Running this file will open my journal in vim to today's date
# To use janet ~/.scripts/my_journal.janet
# Aliased to jmj to distinguish it from the normal alias I use mj


(defn to-double-digit-string [digit]
  " add 1 as the months and days are 0-indexed in the output to (os/date time) in the function get-date-time-string. The -3 means slice the last 2 items e.g. 011 --> 11."
  (string/slice (string "0" (+ digit 1)) -3)) 

(defn get-date-time-string [time] 
  `` 
   gets the date in number format e.g. 08-11 and adds the .md suffix for the journal filename 
   time is an argument for this function
   repl:21:> (os/date 1635595362) --> {:dst false :hours 12 :minutes 2 :month 9 :month-day 29 :seconds 42 :week-day 6 :year 2021 :year-day 302}`` 
  (let [date (os/date time) # here time is an argument for the os/date module and is in the Unix epoch; let is used when there are multiple variable assignments
        month (to-double-digit-string (get date :month))
        day (to-double-digit-string (get date :month-day))]
    (string  day  "-" month".md")))

(defn get-my-date []
  (get-date-time-string (os/time)))

(var my-date (get-my-date))

(def base-path "/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/")

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


# Now, with all the preliminaries, I can call the os/execute module to open my journal in vim
(os/execute 
    @("/usr/sbin/vim" jour-path)
    :p)

