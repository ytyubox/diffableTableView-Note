#  DiffableTableView

## How I think of it

```
         ┌─────────┐      ┌───────────┐    ┌──────────────┐
         │TableView│      │DataSource │    │  Data giver  │
         └─────────┘      └───────────┘    └──────────────┘
              │                 │                  │       
              │                 │                  │       
              │dataSource assign│                  │       
              │    ───────────▶ │                  │       
              │                 │                  │       
              │                 │                  │       
              │      setup      │                  │       
              │◀───Sections ────│                  │       
              │      Cells      │                  │       
              │                 │     request      │       
              │                 │───────data─────▶ │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
              │                 │    give back     │       
              │                 │◀────SnapShot──── │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
              │      Update     │                  │       
              │◀───with diff────┤                  │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
   trying to  │                 │                  │       
── get Item ─▶│                 │                  │       
              │                 │                  │       
              │   item for      │                  │       
              │──indexPath─────▶│                  │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
              │ item? for       │                  │       
              │◀───the ─────────│                  │       
              │ indexPath       │                  │       
              │                 │                  │       
              │                 │                  │       
◀- the item? ─│                 │                  │       
              │                 │                  │       
              │                 │                  │       
              │                 │                  │       
```

## Quick note

1. No UITableViewDataSource, using DataSouce: UITableViewDiffableDataSource (SubClass is ok)
2. No `reloadData()`, using dataSource apply snapShot.
3. SnapShot is only reloadRow for hashabled item, if it has something changed other than hashable, will be ignored by diff.
4. animation diff using `dataSource.defaultRowAnimation` for both insert/delete.
5. DataSoure can get item for IndexPath by `dataSource.itemIdentifier(for:)`
