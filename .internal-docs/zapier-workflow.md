# Zapier Automation Workflow for Coffee Chat Applications

## Overview
This workflow automates the process of handling coffee chat applications submitted via the Tally.so form. Tally now directly integrates with Notion, so each form submission is automatically added as a new page in the Notion database. Zapier monitors the Notion database to handle filtering, emailing, and status changes. Qualified applicants receive a Calendly booking link automatically, while others are flagged for manual review. The workflow provides robust error handling for easy monitoring and future updates.

---

## Trigger
- **App:** Notion
- **Event:** New Database Item (created by Tally's direct integration)

---

## Filtering Logic
After a new submission is added to Notion (via Tally), Zapier evaluates the applicant based on their responses:

- **Qualified:**
  - Student (undergraduate, graduate, MBA, etc.)
  - Early-career professional (recent grad, analyst, associate, <5 years experience)
- **Non-Qualified:**
  - Experienced professionals (mid/senior roles, >5 years experience)
  - Startup founders seeking investment
  - Incomplete or ambiguous responses

**Fields used for filtering:**
- **current professional status** (single-select; primary filter)
- **Educational Background & Institution** (used for context or to clarify ambiguous cases)
- **Discussion Topic** and **Guidance** (used for context or to clarify ambiguous cases)

**Note:** Only one role can be selected per submission. Filtering is primarily based on the 'current professional status' field. Other fields are used to provide additional context, especially for manual review or if the role is ambiguous.

**Example:**
- If someone selects 'Student' as their current professional status, but their background says "10 years in finance" and their discussion topic is "pitching my startup for investment," this would be flagged for manual review despite the role selection.
- If someone selects 'Early-career professional' and their background and topic align (e.g., "recent grad, looking for VC career advice"), they are qualified.
- If someone selects 'Startup Founder' as their current professional status, regardless of background/topic, they are not qualified for auto-booking.

---

## Notion Review Database

All new submissions are added as pages in a Notion database via Tally's direct integration. The database should include the following properties:

- Name (Title property)
- Status (Select: "new", "auto-approved", "needs review", "approved", "declined")
- Email (Email property)
- current professional status (Select or text)
- Educational Background & Institution (Text)
- City (Text)
- Discussion Topic (Text)
- Guidance (Text)
- How did you hear about me (Text)
- Submission Date and Time (Date/Time property)
- Notes (Text, for reviewer comments)

### How it works:
- Tally form submissions are automatically added to Notion.
- Zapier monitors the Notion database for new entries.
- If the applicant is qualified, Zapier sends the Calendly email and sets Status to "auto-approved".
- If not qualified or ambiguous, Status is set to "needs review".
- Joseph reviews "needs review" pages and updates Status to "approved" or "declined" as appropriate.
- Zapier watches for Status changes:
  - If changed to "approved", Zapier sends the Calendly link to the applicant.
  - If changed to "declined", Zapier sends a polite decline email (optional).

---

## Actions
### 1. Qualified Applicants
- **Action:** Send an automated email with the Calendly booking link
- **Email Template:**
  - Subject: "Book Your Coffee Chat with Joseph Bahous"
  - Body: Thank you, brief next steps, Calendly link, encouragement to connect on LinkedIn
- **Status in Notion:** auto-approved

### 2. Non-Qualified Applicants
- **Action:** Remain in Notion for manual review, send a notification email to Joseph (optional)
- **Status in Notion:** needs review
- **Manual Review:** Joseph updates Status to "approved" or "declined" as appropriate
- **Zapier Action:**
  - If Status changes to "approved", send Calendly link
  - If Status changes to "declined", send polite decline email (optional)

### 3. Error Handling
- **Action:** If any step fails, send an alert to Joseph's email with error details

---

## Step-by-Step Workflow
1. **Trigger:** New Tally.so submission is automatically added to Notion
2. **Zapier monitors Notion:** Detects new database item
3. **Filter:** Check if applicant is qualified
   - If qualified → Send Calendly email, set Status to "auto-approved"
   - If not qualified → Set Status to "needs review"
4. **Manual Review:** Joseph reviews "needs review" pages and updates Status
   - If Status changes to "approved" → Send Calendly email
   - If Status changes to "declined" → Send decline email (optional)
5. **Error Handling:** On any failure, send alert to Joseph

---

## Edge Cases & Special Scenarios
- **Ambiguous current professional status/background/topic:** Route for manual review
- **Missing key fields:** Route for manual review
- **Spam/obvious test entries:** Optionally filter or flag
- **Repeat submissions:** Optionally deduplicate or flag

---

## Testing & Monitoring
- Submit test entries for each scenario (qualified, non-qualified, ambiguous)
- Verify correct emails are sent
- Check Zapier task history for errors
- Monitor email deliverability
- Periodically review workflow logic as needs evolve
- Review the Notion database regularly for stuck or unreviewed submissions

---

## Future Improvements
- Add CRM integration for tracking applicants
- Add Slack notifications for new submissions
- Refine filtering logic as more data is collected
- Personalize emails based on applicant background
- Add analytics for conversion tracking

---

## Flowchart

1. New Tally.so Submission
   ↓
2. Tally adds to Notion Database (including Submission Date and Time)
   ↓
3. Zapier monitors Notion: Qualified?
   → Yes → Send Calendly Email, set Status to auto-approved
   → No  → Set Status to needs review
   ↓
4. Manual Review (if needed): Joseph updates Status
   → approved → Send Calendly Email
   → declined → Send Decline Email (optional)
   (Any error → Send Alert to Joseph)

---

## Notion AI Prompt: Create Application Review Database & Reporting Dashboard

Use the following prompt with Notion AI to generate the database and dashboard needed for this workflow:

> **Prompt:**  
> Create a Notion database for managing coffee chat applications submitted via Tally.so.  
> The database should have the following properties:
> - **Name** (Title)
> - **Status** (Select: "new", "auto-approved", "needs review", "approved", "declined")
> - **Email** (Email)
> - **Current Professional Status** (Select: "Student", "Early-career professional", "Experienced professional", "Startup founder", "Other")
> - **Educational Background & Institution** (Text)
> - **City** (Text)
> - **Discussion Topic** (Text)
> - **Guidance** (Text)
> - **How did you hear about me** (Text)
> - **Submission Date and Time** (Date/Time)
> - **Notes** (Text, for reviewer comments)
>
> **Views to create:**
> - **All Submissions** (Table view, sorted by Submission Date and Time descending)
> - **Needs Review** (Filtered table view: Status = "needs review")
> - **Auto-Approved** (Filtered table view: Status = "auto-approved")
> - **Approved** (Filtered table view: Status = "approved")
> - **Declined** (Filtered table view: Status = "declined")
>
> **Reporting Dashboard:**
> - Create a new Notion page called "Coffee Chat Reporting Dashboard."
> - On this page, add linked database views from the main application database to show:
>   - Total submissions (use a rollup or count)
>   - Number of "needs review" submissions
>   - Number of "auto-approved" and "approved" submissions
>   - Number of "declined" submissions
>   - Recent submissions (last 7 days)
> - Optionally, add charts or summary blocks if available, and any other key metrics for quick reference.
>
> The database and dashboard should be ready for integration with Zapier for automation and manual review.

---

**Keep this page and prompt updated as your workflow evolves.**

---

## Step-by-Step Zapier Setup Guide

Follow these steps to automate the workflow using Notion and Zapier:

### 1. Trigger: New Database Item in Notion
- **App:** Notion
- **Event:** New Database Item
- **Connect your Notion account** and select the Coffee Chat Application database (created by Tally).
- **Test trigger** to pull in a recent submission.

### 2. Action: Filter by Qualification
- **App:** Filter by Zapier
- **Set up filter:**
  - Only continue if "Current Professional Status" is "Student" or "Early-career professional" (or your chosen qualified values).

### 3. Action: Send Email to Qualified Applicants
- **App:** Gmail (or your preferred email service)
- **Event:** Send Email
- **To:** Use the applicant's email from the Notion database
- **Subject:** Book Your Coffee Chat with Joseph Bahous
- **Body:**
  - Thank you message
  - Calendly link
  - Next steps
  - LinkedIn CTA

### 4. Action: Update Status in Notion
- **App:** Notion
- **Event:** Update Database Item
- **Set Status:** Change to "auto-approved" for qualified applicants

### 5. Path for Non-Qualified/Manual Review
- **If the filter fails (not qualified):**
  - Status in Notion remains "needs review"
  - (Optional) Send notification to Joseph for manual review

### 6. Trigger: Status Change in Notion (Manual Review)
- **App:** Notion
- **Event:** Updated Database Item
- **Set up a new Zap:**
  - Trigger when Status changes to "approved" or "declined"

### 7. Action: Send Email After Manual Review
- **If Status = "approved":**
  - Send Calendly link email as above
- **If Status = "declined":**
  - Send polite decline email (optional)

### 8. Error Handling (Optional)
- **App:** Gmail/Slack/Email by Zapier
- **Event:** Send notification to Joseph if any step fails

---

### Tips
- Test each step with sample data from Notion.
- Use Zapier's built-in test tools to ensure mapping and logic are correct.
- Monitor the Zapier task history for errors or missed steps.
- Adjust filters and email templates as needed.

---

**Keep this section updated as your workflow or tools evolve.**

---

## Agent Prompts Documentation

### Initial Prompt for Agent 1 (Applicant Status Auto-Processor)

When a new item is created in the specified Notion database (likely from a Tally.so submission):

1. Retrieve the value from the "Current Professional Status" field of the new Notion item.
2. Based on the value of "Current Professional Status", proceed with conditional actions.

IF "Current Professional Status" is "Student" OR "Early-career professional":
- Send an email to the applicant.
- Subject: Next Steps for Your Coffee Chat Request (Suggested)
- Body: Use the provided template, replacing "[Applicant Name]" with the applicant's name from Notion, "[Calendly Link]" with the actual Calendly scheduling link, and "LinkedIn Profile" with the correct LinkedIn URL.
- Update the "Status" field of the Notion item to "auto-approved".

ELSE (if "Current Professional Status" is anything else):
- Update the "Status" field of the Notion item to "needs review".
- Send an email notification to jjhachem@gmail.com.
- Subject: New Applicant Needs Review (Suggested)
- Body: Include relevant details about the new applicant from the Notion item.

Expected Outcome: The new Notion item is automatically processed based on the applicant's professional status, resulting in either an automated email to the applicant and a status update to "auto-approved", or a status update to "needs review" and an email notification for manual review.

---

### Final Working Prompt: Applicant Status Auto-Processor

**Trigger:**
- When a new item is created in the specified Notion database (likely from a Tally.so submission) with a status field "New"

**Logic:**
1. Retrieve the value from the "Current Professional Status" field of the new Notion item.
2. Based on the value of "Current Professional Status", proceed with conditional actions.

**IF** "Current Professional Status" is "Student" OR "Early-career professional":
- Send an email to the applicant.
  - Subject: Next Steps for Your Coffee Chat Request (Suggested)
  - Body: Use the provided template, replacing "[Applicant Name]" with the applicant's name from Notion, "[Calendly Link] [https://calendly.com/j-j-bahous ]" with the actual Calendly scheduling link, and "LinkedIn Profile" with the correct LinkedIn URL: https://www.linkedin.com/in/joseph-bahous-cfa-337196b3
- Update the "Status" field of the Notion item to "auto-approved".

**ELSE** (if "Current Professional Status" is anything else):
- Update the "Status" field of the Notion item to "needs review".
- Send an email notification to jjhachem@gmail.com.
  - Subject: New Applicant Needs Review (Suggested)
  - Body: Include relevant details about the new applicant from the Notion item.

**Expected Outcome:**
- The new Notion item is automatically processed based on the applicant's professional status, resulting in either an automated email to the applicant and a status update to "auto-approved", or a status update to "needs review" and an email notification for manual review.

**Tools Used:**
- :action[Gmail: Send Email]
- :datasource[Coffee Chat Applications] (Notion database)
- :action[Notion: Find Database Item]
- :action[Notion: Update Database Item]

---

### Final Working Prompt: Needs Review Handler and Responder

When an item in the "Coffee Chat Applications" Notion database is updated and the "Status" field changes to "approved" or "declined".

1. Retrieve the updated item from the "Coffee Chat Applications" Notion database to get the "Status" field value, the applicant's name, and the applicant's email address.

If the retrieved "Status" is "approved":
- Send an email using Gmail to the applicant's email address.
- Subject: "Book Your Coffee Chat with Joseph Bahous"
- Body: "Hi [Applicant Name from Notion], Thank you for your interest in scheduling a coffee chat with Joseph! Next steps: Book your chat: Click the link below to choose a time that works for you: https://calendly.com/j-j-bahous Confirmation: After booking, you'll receive a confirmation email with all the meeting details and a calendar invite. Prepare your questions: Feel free to bring any questions or topics you'd like to discuss—whether it's career advice, industry insights, or your personal goals. Connect on LinkedIn: You're welcome to connect with Joseph here: https://www.linkedin.com/in/joseph-bahous-cfa-337196b3 Need to reschedule? Use the link in your confirmation email to change your booking if needed. Looking forward to your chat! Best regards, Joseph Bahous"
- Optionally, update the Notion item to indicate that the approval email was sent (e.g., set a "Last Action" or "Email Sent" property).

If the retrieved "Status" is "declined":
- Send an email using Gmail to the applicant's email address.
- Subject: "Update on Your Coffee Chat Application"
- Body: A polite message thanking the applicant for their interest, stating that the request cannot be accommodated at this time, and optionally including the LinkedIn link (https://www.linkedin.com/in/joseph-bahous-cfa-337196b3) for them to stay connected.
- Optionally, update the Notion item to indicate that the decline email was sent.

**Expected Outcome:**
- Applicants receive an email based on whether their application status is set to "approved" or "declined" in Notion. The "approved" email provides a link to book a coffee chat, while the "declined" email politely informs them of the decision. Optionally, the Notion item is updated to reflect that an email was sent.

**Tools Used:**
- :action[Gmail: Send Email]
- :datasource[Coffee Chat Applications] (Notion database)
- :action[Notion: Find Database Item]
- :action[Notion: Update Database Item]

---

**Keep this section updated as your agent instructions or workflow evolve.** 