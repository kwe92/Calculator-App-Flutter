class ButtonValue {
  const ButtonValue();
  static const List<String> _buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  List<String> get buttons => _buttons;
  static final int clear = _buttons.indexOf('C');
  static final int division = _buttons.indexOf('/');
  static final int multiplication = _buttons.indexOf('x');
  static final int subtraction = _buttons.indexOf('-');
  static final int addition = _buttons.indexOf('+');
  static final int percentage = _buttons.indexOf('%');
  static final int plusMinus = _buttons.indexOf('+/-');
  static final int equal = _buttons.indexOf('=');
}
