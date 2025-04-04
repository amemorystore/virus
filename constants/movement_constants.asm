;......_ ......*
BASE_PADDLE_DOWN_SPEED   EQU $0250
BASE_PADDLE_UP_SPEED     EQU $10000 - BASE_PADDLE_DOWN_SPEED
;.
BASE_BALL_Y_POSITION     EQU $40
BASE_BALL_X_POSITION     EQU $50
BASE_BALL_Y_SPEED        EQU $00a0
BASE_BALL_Y_SPEED_NEGATIVE  EQU $10000 - BASE_BALL_Y_SPEED
BASE_BALL_X_SPEED        EQU $0140
BASE_BALL_X_SPEED_NEGATIVE        EQU $10000 - BASE_BALL_X_SPEED
;.
BALL_Y_SPEED_DELTA  EQU $40
MIN_Y_SPEED         EQU $FD  ; high byte of speed
MAX_Y_SPEED         EQU $100 - MIN_Y_SPEED  ; high byte of speed
;.
BALL_X_SPEED_DELTA  EQU $50
MIN_X_SPEED         EQU $FD  ; high byte of speed
MAX_X_SPEED         EQU $100 - MIN_X_SPEED  ; high byte of speed
;.
MAX_DROPS  EQU $6
BASE_LASER_SPEED_RIGHT   EQU $0100
BASE_LASER_SPEED_LEFT    EQU ($10000 - BASE_LASER_SPEED_RIGHT)
;.
LASER_COOLDOWN  EQU 7  ; Number of frames to wait between firing lasers
;.
MIN_PADDLE_HEIGHT  EQU $8
;.
START_PLAY_TIME   EQU 120  ; Number of frames to wait to start a new ball
;.
POINTS_TO_WIN  EQU 99 ; Number of points needed to win the game (13)
;. end