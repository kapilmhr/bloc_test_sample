
# Bloc architecture with test

A new Flutter app with bloc architecture and testing.

## Dependencies

```
dependencies:  
dio: ^5.4.2  
equatable: ^2.0.5  
flutter_bloc: ^8.1.5  
```

```
dev_dependencies:  
bloc_test: ^9.1.7  
mocktail: ^1.0.3
```

### Test covered
1. Test if the initial state is correct.
2. Test if the bloc is initialized correctly.
3. Test if the bloc emits the expected state when it throws an error.
4. Test if the bloc emits the expected state when it returns a success.