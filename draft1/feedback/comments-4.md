
# HLVA draft review feedback

*Submitted by DOJ rep, July 2008*

- Title of document -- this is not really an "architecture".  I recommend "NIEM High Level Version Process" or "NIEM High Level Version Plan"

- Section 1. Introduction -- I recommend including some kind of reference to the schema content of the NIEM Core and various domains.  Something like the following: "For more information on what is included in the NIEM Core, what domains or code table schemas have been defined, and what is included in these domain and code table schemas, see the NIEM website (or federated IEPD repository site?) at <weblink>. "

- Section 3.2 first paragraph -- "…or websites like Bugzilla and SharePoint."  SharePoint is not a website.  What is this statement intended to mean?

- Section 3.3 (or address elsewhere) -- Recommend the following added to page 6: "Updates of specific IEPDs are the responsibility of the IEPD owners and users, and should be coordinated among them.  An example of configuration management for a cross-government IEPD can be found at <website>. " -- cite the web location of the SAR CM plan, or some similar example.

- While maintenance of specific IEPDs is clearly not in scope of this document, it would be helpful to cite where specific IEPD development fits into this overall process, since that's the context many people will be coming from.  How that IEPD work can feed recommendations for NIEM changes should at least be identified in here somewhere (in the graphic on page 7), even if the details of how those changes are addressed is left to the people within each specific NIEM domain.

- Another recommendation to graphic on page 7 -- more clearly identify the NIEM micro release as "domain-specific, versions 1.1.X", the NIEM minor release as "domain reconciliation, versions 1.X", and the major release as "synchronization to NIEM Core, versions X."

- Section 5.3 -- while these numbering schemes for NIEM domain (1.1.X), domain reconciliation (1.X), and core synchronization (X.0), are nice and clearly structured, this doesn't seem to address the reality that domain owners are free to update and modify the schemas for their own domain, without central control.  I'm not saying that there should be central control, but if the domains are versioning their own schemas as needed before feeding those up to higher levels of NIEM governance, then the version numbering of the domains may rapidly outpace, and no longer match up to, the overall versioning of the NIEM Core.  Perhaps this is already understood, but the version numbering as described can be interpreted to mean that overall NIEM versions 1.1.X will match the NIEM Core X.0 version numbering, which apparently will not be the case (?).

- Section 6. Data Stores -- I guess a future doc will address this section in more detail and provide web links to the online resources that support this?  I assume these online collaboration resources are not available yet.
