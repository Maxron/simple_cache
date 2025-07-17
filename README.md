# simple_cache

A lightweight caching abstraction for Flutter apps.  
Supports both in-memory and persistent caching using shared preferences, with flexible TTL and value provider support.

## Features

- Easy-to-use cache interface with TTL support
- In-memory cache (`InMemoryCacheObject`)
- Persistent cache using SharedPreferences (`SharedPreferencesCacheObject`)
- Customizable serialization logic
- Value auto-refresh via `valueProvider`

## Getting started

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  simple_cache: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Usage

### In-memory cache

```dart
final cache = InMemoryCacheObject<int>(
  value: 42,
  ttl: Duration(minutes: 5),
  valueProvider: () async => fetchValueFromServer(),
);

final value = await cache.getValue();
```

### Persistent cache (SharedPreferences)

```dart
final cache = SharedPreferencesCacheObject<int>(
  cacheKeyPrefix: 'my_key',
  ttl: Duration(minutes: 10),
  fromString: (s) => int.tryParse(s),
  toString: (v) => v.toString(),
  valueProvider: () async => fetchValueFromServer(),
);

final value = await cache.getValue();
```

## Custom serialization

You can also use predefined delegates like `IntSerializationDelegate`, `StringSerializationDelegate`, etc.

```dart
final delegate = IntSerializationDelegate();
delegate.fromString("123"); // => 123
delegate.formatString(456); // => "456"
```

## Additional information

This library is useful when building apps that need caching behavior without depending on external databases.  
Great for optimizing network requests and storing frequently accessed values with expiration.

Contributions and issues welcome!
