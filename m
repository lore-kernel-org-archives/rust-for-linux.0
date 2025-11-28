Received: from outbound.ms.icloud.com (p-west3-cluster3-host10-snip4-10.eps.apple.com [57.103.72.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FA9274650
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764366569; cv=none; b=WuQ3ZmLkmmVhwn3ZigrC+yP5Os2DlZ/j8yPNtmoT3i87fIjA4xMFgcxfvRLyHvhEsMOpwiwp1QcEdiyaKciYsuwik842W8kohyDLTiOoAPBZJeOWLCA1NAFux8jkXXvI0i3ksEXKiABCgY1g52lUXm9NaDEePj0dUnxskViBm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764366569; c=relaxed/simple;
	bh=yN9SO5e2RhqdG7IFmOf5gtP9JXcl8mpJ1t4WYnr8uug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bP/aw1kIWDevb8ulMV+DgyJKyf90/V4/43YMLDubCpp8q87vF080NJZlyonUzj9cz7gyKkamJKrAQSiGeqOtM++Uaxo+y48Azv4IcDatDk/9rsknGcyrMqc3jWYDJPoT1NbChZG8n6ZfPfZbDkNom4oxBa7XuzUxP/3E6gUr78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=gU0SvB/M; arc=none smtp.client-ip=57.103.72.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="gU0SvB/M"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-2 (Postfix) with ESMTPS id CDC6D180010E;
	Fri, 28 Nov 2025 21:49:24 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=qnDQTjc0AolUELrbTPtaaT0aZGWFmRZvAaXRAyDXFtI=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=gU0SvB/Mt8iZ33uCdsM4OdqZ7kTc0is6H4x68qSTO+FUGjld/kyP8yFBqEx+fyKBbHQua3s54XW/jdS8e0nuR8jLN6vVe1rWGZe8dlwEUJCRszqKWsAQLJ6ytjFYWhtdfPCr+ooA/kPfaDQ8JBnSqFHyfhJKxFNv62/gHA3HKA8j2pUvQQcVgf3hiTJo/G4sDXRSw/MG7vmtgPpccr/VKjEZShcscVQzvej/Z/o5cr8EBiA7ebReGwF1ZSsN4vW6tBHd8MUAs92kWn7P7T/qi2HIHC63V9mbWOWRuMx4FG086pxFAJ8/yEK1Nhi67diyXSgyAghjUc4EZ4q5APeTVw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-2 (Postfix) with ESMTPSA id C3959180039D;
	Fri, 28 Nov 2025 21:49:22 +0000 (UTC)
Date: Sat, 29 Nov 2025 07:49:19 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com, dakr@kernel.org,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH v3] rust: Return Option from page_align and ensure no usize
 overflow
Message-ID: <aSoY31U3uDI2y7V1@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Authority-Info: v=2.4 cv=GZcaXAXL c=1 sm=1 tr=0 ts=692a18e5 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=NOBzSAs92IVqpsMOjEYA:9 a=CjuIK1q_8ugA:10 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-GUID: eps24FaQP60NvChDfBJq6RmhON4DBXoI
X-Proofpoint-ORIG-GUID: eps24FaQP60NvChDfBJq6RmhON4DBXoI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDE2MiBTYWx0ZWRfX7zvocRf8gi7y
 UhVN7QNcmNbx1r1hOaOxE0BAKCDI9mu4QluUwQ+6b8mcUeWRcMNWJDk7r32JEGSAOhiD8jMMV0f
 Li+znkGvgQksNI8QdNi+jCSfYxZFriBWvWFy9Z56KEd/4fPxlcgH9cDgDvgcgymGPrAoiJsEOm1
 JrjTWFRqOPNS8/WBWohPebvH8T6ME8LN7u6eE1hUiocRqFsf38Ie88ULNZTnq6O42nVUmclhVKf
 PgRMIlC0lVJsOHiyjmqUx1j/yRmYVnqr9XE9BbZaoUG/a1tOZf6hRfJz/nBltzBqfBu5PK6lWn+
 TQ2iMFxTLuFXab6uhhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=455 mlxscore=0
 phishscore=0 clxscore=1030 spamscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280162
X-JNJ: AAAAAAABlprquTxX7hrEAvBIAIGDgdfO2lFmKDx5JtNQOoxd5XhPH+MetnDtkriXOPvArn3Ptj4SYbYW/O8WBzSoI2BYKVfonof08fMR5Ku1/U4NyeBj832kgzN9LwLjAJBp7dv65P4ex31Kb//z7sRQAZpvhD74l9uB1UMbanMgZNc3WmN2xdFcoJPQ+gnq8TJzegyp00/1gr6uYRtjYAOC8emeh3Skw19jF6olpQo48RlAVphMuEQ0luKSV4eUaPhBvwRa5pHdGMggZVZEO3J62hASqZ4oOkFxzUNE6vM5SNAfe/uZR1f3onYCun/lobIrBkZwrvHS/J/BiiJSlcjhySk9H/MOaoY/sdSUyiir0ELrP9ZTzbrqEJDXGRmGJJUVOPvOZBqT4MXYn/ibL/MdT60Ih8tFHG6RJ1vWRnSJnB/cO2PQRGweaCgwoAEP2UODdrtCaXIwXY5GF+qvtzlr+tpUqHmb6K+b/iWK/p9vYwwSUhpAj8SRe9/2neeuLMgjq46UcksAKoV1fBx2XXJ3poBOmG5wAFZmJnbLgeGyAYiDiLnqSkgbZQxth2iWGp8Tz75QQLLBhJojx/qx8p2tLLK9fIDMxECVuv49K+4+4onFBCukofR8tirLmZY3nWRMCA5c2Pq39jYoc/9ibjP8cmKMfAlhgbE=

Change `page_align()` to return `Option<usize>` to allow validation
of the provided `addr` value. This ensures that any value that is
within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
returns `None` to indicate overflow.

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
Changes in v2:
- Reworded commit message to follow the imperative form.
- Expanded the documentation to explain the `Some` and `None` return cases.
- Added a period at the end of the documentation comment.
- Link to v1 (and v2): https://lore.kernel.org/rust-for-linux/aSheTh-T1oroAUHR@fedora/T/#t

Changs in v3:
- Fix documentation layout for better rustdoc rendering
- Add doc examples and doctest
- Ensure function is always inlined for performance optimisation
- Restructure function so that early return is the None case and the
  default is the happy path.

 rust/kernel/page.rs | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..0409749e4ab8 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -27,12 +27,34 @@

 /// Round up the given number to the next multiple of [`PAGE_SIZE`].
 ///
-/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
-/// [`usize`].
-pub const fn page_align(addr: usize) -> usize {
-    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
-    // cases.
-    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
+/// Returns a page aligned [`usize`] in cases where the value can be aligned. Otherwise, returns `None`
+/// if the aligned size will overflow a [`usize`].
+/// # Examples
+///
+/// Assuming a `PAGE_SIZE` of 4096 (0x1000):
+///
+/// ```rust
+/// use kernel::page::{page_align, PAGE_SIZE};
+/// // Case 1: Already aligned
+/// assert_eq!(page_align(0x0), Some(0x0));
+/// assert_eq!(page_align(0x1000), Some(0x1000));
+///
+/// // Case 2: Needs alignment up
+/// assert_eq!(page_align(0x1), Some(0x1000));
+/// assert_eq!(page_align(0x1001), Some(0x2000));
+///
+/// // Case 3: Requested address causes overflow (returns None)
+/// // The check asserts that None is returned when a value is requested within one PAGE_SIZE of
+/// usize::MAX.
+/// let overflow_addr = usize::MAX - (PAGE_SIZE / 2);
+/// assert_eq!(page_align(overflow_addr), None);
+/// ```
+#[inline(always)]
+pub const fn page_align(addr: usize) -> Option<usize> {
+    let Some(sum) = addr.checked_add(PAGE_SIZE - 1) else {
+        return None;
+    };
+    Some(sum & PAGE_MASK)
 }

 /// Representation of a non-owning reference to a [`Page`].

base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
--
2.51.1
