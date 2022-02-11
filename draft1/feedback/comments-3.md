
# HLVA Review Feedback

*Submitted by DOJ rep, July 2008*

We should change the language of section 1.3 that describes the NIEM PMO governing NIEM and delegating responsibility to the NBAC and NTAC.  The PMO is the executive body, not the governing body.  The NTAC and NBAC govern NIEM – you could say they are delegated this responsibility from the ESC, but that’s pretty theoretical as I’m not sure the ESC has ever formally met.

In section 4.1, shouldn’t conformance and quality checks occur prior to update publication?  Does this imply that we’re allowing domains to publish non-conformant and low-quality updates?  There should be at least some minimum bar set here for domain updates prior to a reconciliation review.

In section 4.1.1, let’s call the NBAC the “designated body for harmonization” as opposed to delegated (related to above comment.)

Related to section 4.1.2, there needs to be some versioning number rules that deal with this situation better.  Not an issue for the HLVA, but for a more detailed spec.  In particular, a new Screening domain that is only modified as a result of reconciliation to point to the newest Justice:Arrest object should not show the same order of version number incrementation that the Justice domain does for modifying an existing object..  Ideally, a scheme would be able to distinguish between major releases, minor releases, significant domain updates, and reconciliation-only updates, at least..  Not to mention indicating backwards-compatibility..

The issue of numbering schemes comes up again in sections 5.3, 6.3, and 7.3.  I recommend nailing down a scheme with more transparency and clarity.  Domains should be able to specify their major/minor version numbers, but not the format of their namespace URIs – too much confusion.  There should be a defined scheme for releases, published updates, etc.  I suggest putting the version of the Core schema into the namespace URIs for domains somehow (e.g.,http://niem.gov/release/2.0/domains/jxdm/4.2).  That would better allow independent management of version numbers between the overall release and the domains.  I would also have a standard scheme for “bumping” domain namespaces (perhaps this is what is meant by the “Namespace URI Directive” without actually specifying the scheme).

Also on numbering schemes – what’s the position on backwards compatibility?  If the major.minor.micro scheme for overall releases is used, you are not being transparent with respect to backwards compatibility (a micro release means that only one domain has changed – no reconciliation – but not that its changes are necessarily backwards compatible).  Perhaps a 4-tier numbering scheme, where the last number is reserved for backwards-compatible changes only?  Are micro version numbers even included in the namespace URIs?  The same argument applies to domain numbering schemes – is there (will there be) a mandatory scheme for making backwards-compatibility transparent?
