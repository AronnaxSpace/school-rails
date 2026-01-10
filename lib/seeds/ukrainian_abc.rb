# Ukrainian ABC (Буквар) Seed Data
# Creates a complete Ukrainian alphabet course with letters, words, and examples

# Ukrainian letters in alphabetical order (33 letters)
UKRAINIAN_LETTERS = %w[А Б В Г Ґ Д Е Є Ж З И І Ї Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ь Ю Я]

# Sample words for each letter with translations
SAMPLE_WORDS = {
  "А" => [
    [ "автобус", "bus" ],
    [ "абетка", "alphabet" ],
    [ "арбуз", "watermelon" ]
  ],
  "Б" => [
    [ "бабуся", "grandmother" ],
    [ "батько", "father" ],
    [ "білка", "squirrel" ]
  ],
  "В" => [
    [ "вода", "water" ],
    [ "вулиця", "street" ],
    [ "вікно", "window" ]
  ],
  "Г" => [
    [ "гора", "mountain" ],
    [ "город", "garden" ],
    [ "голова", "head" ]
  ],
  "Ґ" => [
    [ "ґанок", "porch" ],
    [ "ґудзик", "button" ],
    [ "ґава", "crow" ]
  ],
  "Д" => [
    [ "дім", "house" ],
    [ "дорога", "road" ],
    [ "дерево", "tree" ]
  ],
  "Е" => [
    [ "екран", "screen" ],
    [ "етаж", "floor" ],
    [ "ехо", "echo" ]
  ],
  "Є" => [
    [ "єдиний", "only one" ],
    [ "Європа", "Europe" ],
    [ "єнот", "raccoon" ]
  ],
  "Ж" => [
    [ "жаба", "frog" ],
    [ "життя", "life" ],
    [ "жінка", "woman" ]
  ],
  "З" => [
    [ "зима", "winter" ],
    [ "зоря", "star" ],
    [ "земля", "earth" ]
  ],
  "И" => [
    [ "игра", "game" ],
    [ "історія", "history" ],
    [ "іграшка", "toy" ]
  ],
  "І" => [
    [ "ім'я", "name" ],
    [ "іній", "frost" ],
    [ "індик", "turkey" ]
  ],
  "Ї" => [
    [ "їжа", "food" ],
    [ "їжак", "hedgehog" ],
    [ "Їжачок", "little hedgehog" ]
  ],
  "Й" => [
    [ "йод", "iodine" ],
    [ "йогурт", "yogurt" ],
    [ "йти", "to go" ]
  ],
  "К" => [
    [ "кіт", "cat" ],
    [ "книга", "book" ],
    [ "корова", "cow" ]
  ],
  "Л" => [
    [ "лис", "fox" ],
    [ "ліс", "forest" ],
    [ "лелека", "stork" ]
  ],
  "М" => [
    [ "мама", "mother" ],
    [ "місяць", "month/moon" ],
    [ "малюнок", "drawing" ]
  ],
  "Н" => [
    [ "ніс", "nose" ],
    [ "ніч", "night" ],
    [ "небо", "sky" ]
  ],
  "О" => [
    [ "око", "eye" ],
    [ "озеро", "lake" ],
    [ "осінь", "autumn" ]
  ],
  "П" => [
    [ "птах", "bird" ],
    [ "поле", "field" ],
    [ "привіт", "hello" ]
  ],
  "Р" => [
    [ "рука", "hand" ],
    [ "річка", "river" ],
    [ "ранок", "morning" ]
  ],
  "С" => [
    [ "сонце", "sun" ],
    [ "сім'я", "family" ],
    [ "стіл", "table" ]
  ],
  "Т" => [
    [ "тато", "dad" ],
    [ "трава", "grass" ],
    [ "тигр", "tiger" ]
  ],
  "У" => [
    [ "урок", "lesson" ],
    [ "учитель", "teacher" ],
    [ "улюблений", "favorite" ]
  ],
  "Ф" => [
    [ "футбол", "football" ],
    [ "фарба", "paint" ],
    [ "фонтан", "fountain" ]
  ],
  "Х" => [
    [ "хата", "house" ],
    [ "хліб", "bread" ],
    [ "хмара", "cloud" ]
  ],
  "Ц" => [
    [ "цукор", "sugar" ],
    [ "цвях", "nail" ],
    [ "цирк", "circus" ]
  ],
  "Ч" => [
    [ "час", "time" ],
    [ "червень", "June" ],
    [ "чоловік", "man" ]
  ],
  "Ш" => [
    [ "школа", "school" ],
    [ "шапка", "hat" ],
    [ "шум", "noise" ]
  ],
  "Щ" => [
    [ "щастя", "happiness" ],
    [ "щока", "cheek" ],
    [ "щур", "rat" ]
  ],
  "Ь" => [
    [ "день", "day" ],
    [ "сіль", "salt" ],
    [ "кінь", "horse" ]
  ],
  "Ю" => [
    [ "юнак", "young man" ],
    [ "юрба", "crowd" ],
    [ "юнга", "cabin boy" ]
  ],
  "Я" => [
    [ "яблуко", "apple" ],
    [ "ялинка", "fir tree" ],
    [ "ягода", "berry" ]
  ]
}

puts "\n" + "="*60
puts "  Seeding Ukrainian ABC (Буквар)"
puts "="*60

# Create or find the subject
subject = Subject.find_or_create_by!(name: "Буквар (Ukrainian ABC)")
puts "✓ Subject created: #{subject.name}"

# Create or find the chapter
chapter = subject.chapters.find_or_create_by!(name: "Букви (Letters)", position: 0)
puts "✓ Chapter created: #{chapter.name}"

# Create lessons for each letter
puts "\nCreating lessons for #{UKRAINIAN_LETTERS.length} Ukrainian letters..."
puts "-"*60

UKRAINIAN_LETTERS.each_with_index do |letter, index|
  lesson = chapter.lessons.find_or_initialize_by(name: "Буква #{letter}")

  if lesson.new_record?
    lesson.position = index

    # Create rich text content with placeholder for images
    content_html = <<~HTML
      <div class="letter-lesson">
        <h2>Буква #{letter}</h2>

        <div class="letter-display">
          <p><strong>Велика буква (Capital):</strong> <span class="big-letter">#{letter}</span></p>
          <p><strong>Мала буква (Lowercase):</strong> <span class="big-letter">#{letter.downcase}</span></p>
        </div>

        <div class="image-placeholder">
          <p><em>***picture here***</em></p>
          <p>Illustration: Letter #{letter} with colorful examples</p>
          <p class="note">Suggested image: Large letter #{letter} with related objects/animals around it</p>
        </div>

        <h3>Слова на букву #{letter} (Words starting with #{letter}):</h3>
        <ul class="word-list">
          #{SAMPLE_WORDS[letter].map { |word, translation| "<li><strong>#{word}</strong> - #{translation}</li>" }.join("\n          ")}
        </ul>

        <div class="practice-section">
          <h3>Практика (Practice):</h3>
          <p>Спробуй вимовити букву #{letter} кілька разів!</p>
          <p class="note">Try pronouncing the letter #{letter} several times!</p>
        </div>

        <div class="audio-placeholder">
          <p><em>🔊 Audio pronunciation placeholder</em></p>
          <p class="note">Audio file location: /audio/lessons/letter_#{letter.downcase}.mp3</p>
          <p class="note">To attach audio: <code>lesson.audio.attach(io: File.open("path/to/#{letter.downcase}.mp3"), filename: "#{letter.downcase}.mp3")</code></p>
        </div>
      </div>
    HTML

    lesson.content = content_html
    lesson.save!

    puts "  ✓ Created lesson #{index + 1}/#{UKRAINIAN_LETTERS.length}: #{lesson.name}"

    # Create sample words for this lesson
    SAMPLE_WORDS[letter].each_with_index do |(word_text, translation), word_index|
      word = lesson.words.create!(
        text: word_text,
        translation: translation,
        position: word_index
      )
    end

    puts "    → Added #{SAMPLE_WORDS[letter].length} words: #{SAMPLE_WORDS[letter].map(&:first).join(', ')}"
  else
    puts "  - Lesson already exists: #{lesson.name}"
  end
end

puts "\n" + "="*60
puts "  Ukrainian ABC seeding completed!"
puts "="*60
puts "\nStatistics:"
puts "  • Subjects: #{Subject.count}"
puts "  • Chapters: #{Chapter.count}"
puts "  • Lessons: #{Lesson.count}"
puts "  • Words: #{Word.count}"
puts "\nNext steps:"
puts "  1. Add images to lesson content (replace ***picture here*** placeholders)"
puts "  2. Attach audio files for letter pronunciation"
puts "  3. Attach audio files for word pronunciation"
puts "\nTo attach audio files via Rails console:"
puts "  lesson = Lesson.find_by(name: 'Буква А')"
puts "  lesson.audio.attach(io: File.open('path/to/а.mp3'), filename: 'а.mp3')"
puts "\n  word = Word.find_by(text: 'мама')"
puts "  word.audio.attach(io: File.open('path/to/мама.mp3'), filename: 'мама.mp3')"
puts "="*60 + "\n"
