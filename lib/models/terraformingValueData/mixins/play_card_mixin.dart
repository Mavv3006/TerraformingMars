mixin PlayCardMixin {
  void playCard(int amount);

  bool canPlayCard(int amount);

  int get lastCardValue;

  void playAmount(int amount);

  void logPlayingCard();
}
