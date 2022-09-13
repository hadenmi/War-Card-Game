struct Card {
  var name:String;
  var value:String;
}

var suits:[String] = ["Hearts", "Diamonds", "Clubs", "Spades"];
var values:[String] = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace", "Joker"];

func GetValueName(value: Int) -> String {
  return values[value - 1];
}

func GetValueFromName(name: String) -> Int {
  for index in 0...values.count - 1 {
    if (values[index] == name) {
      return index;
    }
  }
  return -1;
}

func GetRandomCard() -> Card {
  let suitIndex = Int.random(in: 0...suits.count - 1);
  let valueIndex = Int.random(in: 0...values.count - 1);

  return Card(name: suits[suitIndex], value: values[valueIndex]);
}

print("Dealing cards...");

var scorePlayer1 = 0;
var scorePlayer2 = 0;

for _ in 1...26 {
  let cardPlayer1 = GetRandomCard();
  let cardPlayer2 = GetRandomCard();
  let cardValue1 = GetValueFromName(name: cardPlayer1.value);
  let cardValue2 = GetValueFromName(name: cardPlayer2.value);
  print("-- Player 1: --");
  print(cardPlayer1.name, cardPlayer1.value);
  print("-- Player 2: --");
  print(cardPlayer2.name, cardPlayer2.value);
  if (cardValue1 > cardValue2) {
    print("Player 1 won the round!");
    scorePlayer1 += 1;
  } else if (cardValue1 < cardValue2) {
    print("Player 2 won the round!");
    scorePlayer2 += 1;
  } else {
    print("Both players tied!");
  }
}

print("Evaluating scores...");

if (scorePlayer1 == scorePlayer2) {
  print("Both players tied with a score of \(scorePlayer1)!");
} else if (scorePlayer1 > scorePlayer2) {
  print("Player 1 won with a score of \(scorePlayer1)!");
  print("Player 2 lost with a score of \(scorePlayer2).");
} else {
  print("Player 2 won with a score of \(scorePlayer2)!");
  print("Player 1 lost with a score of \(scorePlayer1).");
}