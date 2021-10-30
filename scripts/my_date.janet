(defn to-double-digit-string [digit]
  (string/slice (string "0" digit) -3))

(defn get-date-time-string [time]
  (let [date (os/date time)
        year (get date :year)
        month (to-double-digit-string (get date :month))
        day (to-double-digit-string (get date :month-day))
        hours (to-double-digit-string (get date :hours))
        minutes (to-double-digit-string (get date :minutes))
        seconds (to-double-digit-string (get date :seconds))]
    (string year "-" month "-" day "__" hours ":" minutes ":" seconds)))

(defn get-current-date-time-string []
  (get-date-time-string (os/time)))


### USAGE

(print (get-current-date-time-string))
# => "2020-09-23__17:20:00"
