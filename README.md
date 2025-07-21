# I Capital Investor Intake App

## Features

- **Models:**
  - `Partner`
  - `Investor` (belongs to Partner)
  - `Address` (belongs to Investor)
- **Pages:**
  - Partner index (list of partners)
  - Partner investors index (list of investors for a partner)
  - Partner investor show
  - New investor form (with address and file upload)
- **Validation:**
  - All fields required
  - Phone number: must be 10 digits
  - Zip code: must be 5 digits
  - Address fields required
- **File Upload:**
  - Attach a document to each investor (ActiveStorage)

## Setup

1. Install Ruby 3.3.7 (recommended: [asdf](https://asdf-vm.com/))
2. Install dependencies:

   ```sh
   bundle install
   ```
3. Set up the database:

   ```sh
   rails db:create
   rails db:migrate
   rails db:seed
   ```
4. Start the app:

   ```sh
   bin/dev
   ```

5. Visit [http://localhost:3000](http://localhost:3000)
6. Click on the "Acme" partner (created by the seed file) and add investors.

## Testing

Integration test covers adding an investor to a partner and verifying the investor appears in the list.

To run the integration test:

```sh
rails test
```

## Notes

- Moderate error validation is included for required fields, phone, and zip code.
- Further validation (e.g., zip/state correlation, phone area code checks) can be added as needed.
- The app uses Fabrication and Faker for test data.

## If time 
 - I would add better styling ( It's pretty bare bones I must say )
 - I would do the 3, 4 and 5 parts

