# Coffee Chat End-to-End Test Plan

## Objective
Thoroughly test the entire workflow from **'Schedule a Coffee Chat'** button click to form submission to email receipt, verifying both qualifying and non-qualifying user paths, and all automation and manual review logic via Notion and Zapier.

---

## Test Scenarios

### 1. Qualified Applicant Path (Auto-Approved)
- **Persona:** Student or early-career professional
- **Steps:**
  1. Click **'Schedule a Coffee Chat'** CTA (on homepage, CTA section, or navigation)
  2. Complete and submit the Tally.so form with qualifying answers
  3. Verify new page is created in Notion database with Status = "new"
  4. Zapier auto-approves: Status changes to "auto-approved"
  5. Applicant receives Calendly email
  6. Book a session via Calendly
  7. See the thank-you page with correct messaging
- **Expected Results:**
  - Notion page created with all required fields populated
  - Status changes to "auto-approved" automatically
  - Email with Calendly link is received
  - Calendly booking is successful
  - Thank-you page displays correct message and next steps

### 2. Non-Qualified Applicant Path (Needs Review)
- **Persona:** Experienced professional, startup founder, or ambiguous case
- **Steps:**
  1. Click **'Schedule a Coffee Chat'** CTA
  2. Complete and submit the Tally.so form with non-qualifying or ambiguous answers
  3. Verify new page is created in Notion database with Status = "new"
  4. Zapier sets Status to "needs review"
  5. Joseph receives notification email (optional)
  6. See the thank-you page with correct messaging
- **Expected Results:**
  - Notion page created with all required fields populated
  - Status changes to "needs review" automatically
  - Joseph receives notification email (if enabled)
  - No Calendly link is sent to applicant
  - Thank-you page displays correct message and next steps

### 3. Manual Review Path
- **Persona:** Any applicant flagged for manual review
- **Steps:**
  1. Joseph reviews Notion page with Status = "needs review"
  2. Joseph updates Status to "approved" or "declined"
  3. If approved: Applicant receives Calendly email, Status updates to "approved"
  4. If declined: Applicant receives polite decline email, Status updates to "declined"
- **Expected Results:**
  - Correct email sent based on status change
  - Notion page reflects updated status
  - Email content matches templates

### 4. Error Handling & Alerts
- **Steps:**
  1. Simulate Zapier or Notion integration failure (e.g., disconnect, field mismatch)
  2. Simulate email delivery failure
- **Expected Results:**
  - Joseph receives alert email with error details
  - No submissions are lost; errors are logged for review

### 5. Duplicate, Spam, and Edge Cases
- **Steps:**
  1. Submit multiple forms with same email (duplicate)
  2. Submit obvious spam/test entries
  3. Submit with missing or ambiguous key fields
- **Expected Results:**
  - Duplicates are flagged or handled gracefully
  - Spam/test entries are optionally flagged or filtered
  - Ambiguous/missing fields route to manual review

### 6. Notion Database & Dashboard Verification
- **Steps:**
  1. Confirm all required fields are present and populated for each submission
  2. Verify all Notion views (All Submissions, Needs Review, Auto-Approved, Approved, Declined) display correct items
  3. Check reporting dashboard for accurate counts and recent submissions
- **Expected Results:**
  - All fields and views are correct and up to date
  - Dashboard metrics match actual submissions and statuses

---

## Technical Checks
- Zapier automation triggers correctly for all cases
- Notion integration works for new, updated, and reviewed submissions
- Emails are formatted properly and sent to correct recipients (applicant and Joseph)
- Calendly integration works as expected
- All user-facing copy is clear and matches the intended tone
- Analytics and monitoring capture all relevant events
- All "Schedule a Coffee Chat" CTAs are present and functional on all pages
- After form submission, the thank-you page displays the correct message and guidance
- User journey is consistent and clear from homepage to thank-you page
- Error handling and alerting work as intended
- Duplicate and spam/test entries are handled appropriately
- Notion reporting dashboard is accurate

---

## Test Matrix
| Scenario                        | Persona                | Expected Outcome                | Pass/Fail | Notes |
|----------------------------------|------------------------|---------------------------------|-----------|-------|
| Qualified applicant (auto)       | Student                | Notion: auto-approved, Calendly email, booking, thank-you |           |       |
| Qualified applicant (auto)       | Early-career           | Notion: auto-approved, Calendly email, booking, thank-you |           |       |
| Non-qualified applicant          | Experienced/Founder    | Notion: needs review, Joseph notified, thank-you |           |       |
| Ambiguous/missing fields         | Any                    | Notion: needs review, Joseph notified |           |       |
| Manual review - approved         | Any                    | Notion: approved, Calendly email sent |           |       |
| Manual review - declined         | Any                    | Notion: declined, decline email sent |           |       |
| Incomplete form                  | Any                    | Error message, no submission    |           |       |
| Invalid data                     | Any                    | Error message, no submission    |           |       |
| Duplicate submission             | Any                    | Duplicate flagged/handled       |           |       |
| Spam/test entry                  | Any                    | Optionally flagged/filtered     |           |       |
| Notion field/view check          | Any                    | All fields/views correct        |           |       |
| Dashboard/reporting check        | Any                    | Metrics accurate                |           |       |
| Zapier/Notion error              | Any                    | Joseph alerted, error logged    |           |       |
| Email delivery issues            | Any                    | No lost/incorrect emails        |           |       |
| Attempted logic bypass           | Any                    | No unauthorized access          |           |       |

---

## Test Execution Steps
1. Use a structured test matrix to ensure all scenarios are covered
2. Employ real devices and browsers for testing
3. Involve multiple testers for diverse perspectives
4. Use different email addresses to verify email delivery
5. Document test results with screenshots and detailed notes
6. Verify timing of the entire process to ensure reasonable response times
7. Specifically test with users matching the target demographic (students/early-career) to ensure messaging clarity
8. Confirm all "Schedule a Coffee Chat" CTAs are present and functional on all pages
9. After form submission, verify the thank-you page displays the correct message and guidance
10. For each submission, verify Notion database fields, status changes, and dashboard/reporting accuracy
11. Simulate errors and verify alerting/handling

---

## Documentation & Reporting
- Record all test results in the matrix above
- Attach screenshots and error logs for any failures
- Summarize findings and recommendations for improvements
- Share the completed test plan and results with Joseph via Notion 