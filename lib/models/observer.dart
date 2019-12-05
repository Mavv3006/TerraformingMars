abstract class Observable {
  notify();

  // This class is intended to be used as a mixin, and should not be
  // extended directly.
  factory Observable._() => null;
}

class Observer {
  static Map<String, List<Observable>> observers = {"next_round_notification": []};

  static const String nextRound = "next_round_notification";

  static subscribeObserver(Observable object, String notification) {
    observers[notification].add(object);
  }

  static bool unsubscribeObserver(
      Observable object, String notification) {
    var observerList = observers[notification];

    if (observerList == null) {
      return false;
    } else {
      return observerList.remove(object);
    }
  }

  static bool notifyObservers(String notification) {
    var observerList = observers[notification];

    if (observerList == null) {
      return false;
    }

    for (Observable observable in observerList) {
      observable.notify();
    }
    return true;
  }
}
