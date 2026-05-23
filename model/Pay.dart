abstract class Pay{
  double _amount;
  double get amount=>this._amount;
  void set amount(double amount)=>this._amount=amount;
  Pay({amount}):this._amount=amount;
  void processPayment();
}