# Ruby Event OOP

A Ruby application for managing events using object-oriented programming principles.

## Overview

This project demonstrates OOP concepts in Ruby by building an event management system. It allows creating events, managing users, and displaying calendars.

## Installation

1. Ensure you have Ruby installed.
2. Run `bundle install` to install dependencies.

## Usage

Run the application with:
```bash
ruby app.rb
```

This will start a Pry session where you can interact with the classes.

## Project Structure

### /lib Directory

The `/lib` folder contains the core classes of the application:

- **`event.rb`**: Defines the `Event` class, which represents an event with attributes like start date, duration, title, and attendees. It includes methods to check if the event is past, future, or soon, and to postpone it by 24 hours.

- **`user.rb`**: Defines the `User` class for managing users. Each user has an email and age. It maintains a class-level list of all users and provides methods to retrieve all users or find a user by email.

- **`calendar.rb`**: Defines the `Calendar` class, which holds a collection of events. It provides methods to add events, display all events, sort them by date, and display only future events.

- **`calendar_displayer.rb`**: Defines the `CalendarDisplayer` class for rendering a monthly calendar view. It can display a calendar for a given month and year, marking days with events and showing event details.

- **`date_parser.rb`**: Defines the `DateParser` class, which parses French date strings (e.g., "demain à 9h" or "le 19 novembre à 16 h 30") into Ruby `Time` objects.

- **`event_creator.rb`**: Defines the `EventCreator` class for interactively creating events through user input prompts. It asks for title, date, duration, and attendees, then creates and displays the event.

### Main Application

- **`app.rb`**: The main entry point that loads all library files and starts a Pry console for testing and interaction.

## Dependencies

- Ruby
- Bundler (for gem management)
- Pry (for interactive console, specified in Gemfile)

## Contributing

Feel free to extend the classes or add new features!