// 1. BlocBuilder:
// UI Only: It doesn't handle side effects like showing a dialog, snack bar, or navigation. It’s solely concerned with updating the UI based on the state.
// Usage: Best used when you want to rebuild widgets based on state.


// 2. BlocListener:
// Used to listen for state changes to perform actions like navigation, showing dialogs, snack bars, or other side effects.
// Doesn't Rebuild UI: It doesn’t rebuild the UI. Instead, it just responds to state changes by executing side effects.
// Usage: Best for handling non-UI related actions that need to happen in response to state changes. 


// 3. BlocConsumer:
// Combines the functionality of both BlocBuilder and BlocListener.
// Builds UI + Handles Side Effects: You can handle state changes that trigger UI rebuilds as well as side effects in one widget.
// Usage: Best used when you need both UI updates and side effects in the same widget.