require "curses"

#see https://logmi.jp/tech/articles/321327

Curses.init_screen
begin
  s = "*"
  x = 0
  y = 0

  Curses.stdscr.keypad(true)
  Curses.stdscr.timeout = 100
  loop do
    val = Curses.get_char
    Curses.setpos(y, x)
    Curses.addstr(" ")
    Curses.refresh
    case val
    when Curses::KEY_DOWN then
      y += 1
    when Curses::KEY_UP then
      y -= 1
    when Curses::KEY_LEFT then
      x -= 1
    when Curses::KEY_RIGHT then
      x += 1
    end
    Curses.setpos(y, x)
    Curses.addstr(s)
    Curses.refresh
  end
ensure
  Curses.close_screen
end

