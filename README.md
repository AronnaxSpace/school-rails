# Aronnax School

A modern, flexible learning platform built with Ruby on Rails for managing and delivering educational content.

## Overview

Aronnax School is a hierarchical educational content management system that can be used for any subject. The platform features a colorful, child-friendly public interface and a professional admin panel for content management. It comes pre-loaded with Ukrainian ABC (Буквар) content as an example, but can support any educational subject or course.

### Content Structure

```
Subject (e.g., "Буквар - Ukrainian ABC", "Mathematics Grade 3", "World History")
  └── Chapter (e.g., "Букви - Letters", "Multiplication", "Ancient Rome")
      └── Lesson (e.g., "Буква А", "Times Tables", "The Roman Empire")
          └── Word (e.g., "автобус - bus", "Definition", "Vocabulary Term")
```

### Use Cases

This platform can be used for various educational purposes:
- **Language Learning**: Alphabet, vocabulary, grammar lessons
- **Mathematics**: Concepts, formulas, practice problems
- **Sciences**: Biology, chemistry, physics topics
- **History & Social Studies**: Historical periods, events, figures
- **Music & Arts**: Theory, techniques, terminology
- **Professional Training**: Corporate training, certifications, skill development
- **Any Structured Learning**: The flexible hierarchy supports any educational content

## Features

### Public Interface
- Colorful, animated design optimized for learners
- Rich text lesson content with ActionText
- Audio file support for multimedia learning
- Responsive design with Tailwind CSS
- Easy navigation through subjects, chapters, and lessons
- Suitable for any educational subject or course

### Admin Panel
- HTTP Basic Authentication for secure access
- Complete CRUD operations for all content types
- Hierarchical content management with breadcrumb navigation
- Rich text editor (Trix) for lesson content
- Audio file upload support for lessons and words
- Visual indicators for content completeness
- Statistics dashboard
- Inline management from dashboard

## Technical Stack

- **Ruby**: 3.3.6
- **Rails**: 8.1.2
- **Database**: PostgreSQL
- **CSS Framework**: Tailwind CSS 4.1.18
- **Rich Text**: ActionText with Trix editor
- **File Storage**: ActiveStorage

## Installation

### Prerequisites

- Ruby 3.3.6
- PostgreSQL
- Node.js (for asset compilation)

### Setup Steps

1. Clone the repository:
```bash
git clone <repository-url>
cd aronnax-school
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
bin/rails db:create
bin/rails db:migrate
```

4. Load seed data (33 Ukrainian letters with sample words):
```bash
bin/rails db:seed
```

5. Start the server:
```bash
bin/rails server
```

6. Visit the application:
- Public site: http://localhost:3000
- Admin panel: http://localhost:3000/admin

## Admin Access

### Development Credentials

Default admin credentials for development/test environments:
- **Username**: `admin`
- **Password**: `changeme123`

These are configured in [config/initializers/admin_config.rb](config/initializers/admin_config.rb).

## Credits

This application was built with the assistance of [Claude Code](https://github.com/anthropics/claude-code), Anthropic's official CLI for AI-powered development.

---

Built with ❤️ using Ruby on Rails
