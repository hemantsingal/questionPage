Build a Flutter module that loads, displays, and evaluates multiple-choice questions (MCQs) from local JSON data, gives instant feedback, and awards XP to the user for correct answers.

Framework: Flutter

State Management: Riverpod

Data Source: Local JSON file (assets/questions.json)

Persistence: Hive (to store progress and last index)

UI: Material 3

Store questions

"""
[
  {
    "id": 1,
    "chapter": "Quadratic Equations",
    "topic": "Nature of Roots",
    "question": "For what value of k does x² + kx + 9 = 0 have equal roots?",
    "options": ["3", "−3", "6", "−6"],
    "correctIndex": 2,
    "difficulty": 2,
    "explanation": "For equal roots, b² − 4ac = 0 ⇒ k² − 36 = 0 ⇒ k = ±6."
  },
  {
    "id": 2,
    "chapter": "Quadratic Equations",
    "topic": "Solving Quadratics",
    "question": "Find the roots of x² − 7x + 12 = 0.",
    "options": ["x = 3, 4", "x = 2, 6", "x = 1, 12", "x = −3, −4"],
    "correctIndex": 0,
    "difficulty": 1,
    "explanation": "Factorization: x² − 7x + 12 = (x − 3)(x − 4) = 0 ⇒ x = 3, 4."
  },
  {
    "id": 3,
    "chapter": "Some Applications of Trigonometry",
    "topic": "Heights and Distances",
    "question": "A tower casts a shadow of 30 m when the Sun’s elevation is 30°. Find the height of the tower.",
    "options": ["10√3 m", "15√3 m", "30√3 m", "10 m"],
    "correctIndex": 0,
    "difficulty": 3,
    "explanation": "tan(30°) = height / 30 ⇒ 1/√3 = h / 30 ⇒ h = 10√3 m."
  },
  {
    "id": 4,
    "chapter": "Introduction to Trigonometry",
    "topic": "Trigonometric Ratios",
    "question": "If sin θ = 3/5, find cos θ.",
    "options": ["4/5", "5/4", "√(3)/2", "2/3"],
    "correctIndex": 0,
    "difficulty": 1,
    "explanation": "sin²θ + cos²θ = 1 ⇒ (3/5)² + cos²θ = 1 ⇒ cos θ = 4/5."
  },
  {
    "id": 5,
    "chapter": "Coordinate Geometry",
    "topic": "Section Formula",
    "question": "Find the coordinates of the point dividing the line joining (2, −3) and (4, 1) internally in the ratio 3:1.",
    "options": ["(3.5, 0)", "(3, 0)", "(3, −1)", "(3, −2)"],
    "correctIndex": 2,
    "difficulty": 2,
    "explanation": "Using section formula: (mx₂ + nx₁)/(m+n), (my₂ + ny₁)/(m+n) ⇒ (3×4 + 1×2)/4 = 3, (3×1 + 1×(−3))/4 = −1."
  },
  {
    "id": 6,
    "chapter": "Triangles",
    "topic": "Pythagoras Theorem",
    "question": "In a right triangle, if one side is 5 cm and hypotenuse is 13 cm, find the other side.",
    "options": ["12 cm", "8 cm", "10 cm", "9 cm"],
    "correctIndex": 0,
    "difficulty": 1,
    "explanation": "h² = p² + b² ⇒ 13² = 5² + b² ⇒ b = 12 cm."
  },
  {
    "id": 7,
    "chapter": "Statistics",
    "topic": "Mean of Data",
    "question": "Find the mean of 5, 7, 3, 8, 7, 10.",
    "options": ["7", "6.6", "8", "6"],
    "correctIndex": 1,
    "difficulty": 1,
    "explanation": "Mean = sum/n = (5 + 7 + 3 + 8 + 7 + 10)/6 = 40/6 = 6.6."
  },
  {
    "id": 8,
    "chapter": "Real Numbers",
    "topic": "Euclid’s Division Lemma",
    "question": "If the HCF of 65 and 117 is expressible as 65m + 117n, find one possible pair (m, n).",
    "options": ["(2, −1)", "(−2, 1)", "(4, −3)", "(−4, 3)"],
    "correctIndex": 1,
    "difficulty": 3,
    "explanation": "Using Euclid’s lemma: 117 = 65×1 + 52, 65 = 52×1 + 13, 52 = 13×4 + 0. Back-substituting ⇒ 13 = 65(−2) + 117(1)."
  },
  {
    "id": 9,
    "chapter": "Polynomials",
    "topic": "Relationship between Coefficients and Roots",
    "question": "If α and β are zeros of x² − 5x + 6, find α + β and αβ.",
    "options": ["α + β = 5, αβ = 6", "α + β = 6, αβ = 5", "α + β = 3, αβ = 2", "α + β = 5, αβ = −6"],
    "correctIndex": 0,
    "difficulty": 1,
    "explanation": "For ax² + bx + c = 0 ⇒ α + β = −b/a = 5, αβ = c/a = 6."
  },
  {
    "id": 10,
    "chapter": "Surface Areas and Volumes",
    "topic": "Volume of Cone",
    "question": "A cone has radius 7 cm and height 24 cm. Find its volume.",
    "options": ["1232 cm³", "1233 cm³", "1231 cm³", "1250 cm³"],
    "correctIndex": 0,
    "difficulty": 2,
    "explanation": "Volume = (1/3)πr²h = (1/3) × 3.14 × 7² × 24 = 1232 cm³."
  }
]
"""

1. Question Loading

Load question


2. Display Logic

Show:

Question text

4 options as selectable radio buttons

“Submit Answer” button

“Next Question” button

Disable “Submit” after user answers.

3. Feedback

On submit:

Highlight correct option in green and incorrect in red.

Show a small explanation panel (from JSON).

If correct → add XP (using the Project #1 model).

If wrong → no XP, optional tip from mentor.

4. Progress Tracking

Save the current question index and XP in Hive.

On app restart, load from Hive and continue from last question.

“Reset Progress” button clears state.

5. Navigation

Button “Next Question” loads next question in array.

When last question reached → show “Quiz Complete” screen with summary:

Total correct / total questions

Total XP earned

“Retry” button

6. Animations

Smooth fade between questions.

Progress bar showing quiz completion (e.g. “5 / 10 Questions”).






Acceptance Criteria

Loads questions from JSON asset successfully.

User can select and submit exactly one answer.

Immediate correct/wrong feedback with explanation.

XP awarded correctly and reflected in Hive state.

Progress persists after app restart.

Completion screen appears after final question.


Randomize question order each session.

Add a timer per question (10 seconds → bonus XP if answered fast).

Add difficulty multipliers to XP (e.g. level × difficulty).

Add mentor-style toast: “Nice work! You’re on a streak.”

Include “Review Mode” to revisit explanations.



A functional quiz engine prototype that:

Loads and displays MCQs from structured data,

Gives instant feedback,

Awards XP and persists progress,
