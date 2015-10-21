DEPRECATED Oct 21, 2015 - Mark Murray  
The contents of the lab have been combined with SlapChat Add. The "space" between the labs was deemed too incremental to publish both. This repository is no longer active.

Slap Chat
==========

# Instructions

  
  1. In your .xcdatamodeld make a new entity called Message. It should have two attributes: content (string) and createdAt (date)
  2. Generate the NSManagedObject subclass. Editor > Create NSManagedObject Subclass, Select "slapchat", select "message".
  3. Set the reuse id and make it a basic cell.
  4. Add a property to your UITableViewController of type `NSArray` that will be an NSArray of `Message` objects.
  5. Put in a few test messages into the context.
  6. Display the contents of each message in the `textLabel.text` of each cell.

# Extra Credit

  1. Add a button that resorts the messages in the array so descending by the createdAt property.
