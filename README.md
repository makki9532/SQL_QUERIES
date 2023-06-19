# SQL_QUERIES
This is a coursework completed in 2022. The goal was to write basic, medium and advanced queries from the provided schema.

Relational Schema Investment:

Investment (Id, CompanyId, ShareId)
Protection (Id , CompanyId, ProtectionType, PatentLocation, ExpiryDate)
          -- ProtectionType: Patent, Copyright or Trademark
Shares (Id , NumberShares, ShareType , PurchasePrice, CurrentPrice, PercentageOfOwnership)
            -- ShareType: Ordinary, Preference or Non-Voting
Company (Id, Name, FounderId, Area, ExpectedTurnover, Turnover, ExpectedNumberCustomers, NumberCustomers)
Founder (Id, Name, Telephone, email, Nationality )
