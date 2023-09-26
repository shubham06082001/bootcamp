const questions = [
  {
    question: "What is the capital of France?",
    answers: [
      { text: "Paris", correct: true },
      { text: "Madrid", correct: false },
      { text: "Rome", correct: false },
      { text: "Berlin", correct: false },
    ],
  },
  {
    question: 'Which planet is known as the "Red Planet"?',
    answers: [
      { text: "Earth", correct: false },
      { text: "Mars", correct: true },
      { text: "Jupiter", correct: false },
      { text: "Venus", correct: false },
    ],
  },
  {
    question: "What is the largest mammal?",
    answers: [
      { text: "Elephant", correct: false },
      { text: "Blue Whale", correct: true },
      { text: "Giraffe", correct: false },
      { text: "Hippopotamus", correct: false },
    ],
  },
  {
    question: "Which famous scientist developed the theory of relativity?",
    answers: [
      { text: "Isaac Newton", correct: false },
      { text: "Galileo Galilei", correct: false },
      { text: "Albert Einstein", correct: true },
      { text: "Marie Curie", correct: false },
    ],
  },
  {
    question: "What is the largest organ in the human body?",
    answers: [
      { text: "Heart", correct: false },
      { text: "Skin", correct: true },
      { text: "Liver", correct: false },
      { text: "Brain", correct: false },
    ],
  },
]

const questionElement = document.getElementById("question")
const answerButtons = document.getElementById("answer-buttons")
const scoreElement = document.getElementById("score")
const timerElement = document.getElementById("time")
const nextButton = document.getElementById("next-button")
const resetButton = document.getElementById("reset")

let currentQuestionIndex = 0
let score = 0
let timeLeft = 15
let timerInterval

function startTimer() {
  timerInterval = setInterval(() => {
    if (timeLeft > 0) {
      timeLeft--
      updateTimerDisplay()
    } else {
      clearInterval(timerInterval)
      lockAnswerButtons()
      nextButton.classList.remove("hide")
    }
  }, 1000)
}

function updateTimerDisplay() {
  timerElement.textContent = formatTime(timeLeft)
}

function formatTime(seconds) {
  const minutes = Math.floor(seconds / 60)
  const remainingSeconds = seconds % 60
  return `${minutes}:${remainingSeconds < 10 ? "0" : ""}${remainingSeconds}`
}

function resetTimer() {
  clearInterval(timerInterval)
  timeLeft = 15
  updateTimerDisplay()
}

function lockAnswerButtons() {
  for (const button of answerButtons.children) {
    button.disabled = true
    if (button.classList.contains("correct")) {
      button.classList.add("correct-highlight")
    }
  }
}

function showQuestion(question) {
  resetTimer()
  startTimer()
  questionElement.textContent = question.question
  answerButtons.innerHTML = ""

  question.answers.forEach((answer, index) => {
    const button = document.createElement("button")
    button.textContent = answer.text
    button.classList.add("button")
    button.addEventListener("click", () => selectAnswer(answer.correct, button))
    answerButtons.appendChild(button)
  })
}

function selectAnswer(isCorrect, button) {
  clearInterval(timerInterval)
  lockAnswerButtons()

  if (isCorrect) {
    score += 10
    scoreElement.textContent = score
    button.classList.add("correct")
    button.classList.add("correct-highlight")
  } else {
    button.classList.add("selected")
    button.classList.add("wrong-highlight")
  }

  nextButton.classList.remove("hide")
}

function nextQuestion() {
  currentQuestionIndex++
  if (currentQuestionIndex < questions.length) {
    showQuestion(questions[currentQuestionIndex])
    nextButton.classList.add("hide")
  } else {
    endQuiz()
  }
}

function endQuiz() {
  questionElement.textContent = "Quiz completed!"
  answerButtons.innerHTML = ""
  timerElement.textContent = ""
  nextButton.classList.add("hide")
  resetButton.classList.remove("hide")

  if (score === questions.length * 10) {
    showModal()
  }
}

function showModal() {
  // Your showModal function implementation here
}

nextButton.addEventListener("click", nextQuestion)

// Initialize the resetButton click event listener
resetButton.addEventListener("click", () => {
  resetButton.classList.add("hide")
  startQuiz()
})

function startQuiz() {
  currentQuestionIndex = 0
  score = 0
  scoreElement.textContent = score
  nextButton.classList.add("hide")
  resetButton.classList.add("hide")
  showQuestion(questions[currentQuestionIndex])
}

// Initialize the quiz by calling startQuiz()
startQuiz()
