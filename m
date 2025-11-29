Received: from outbound.ms.icloud.com (p-west3-cluster6-host1-snip4-10.eps.apple.com [57.103.75.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DAC14F125
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 00:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.75.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764377698; cv=none; b=kWdHPlL3z2lGx21FJKLORjH1/8TTrW4Rwx9NQnfydZjDh8IKj610QfhK5F9LPHcV7Zll13LDGbthid2d8j1jPP4Ie6etTA6uvZEvCXlQ2oAUpaqKBgFyQl5mZ8NzciPTqgETgT4L7YOXoM7Hz2hU73QWPPByHplu0DDo93/B/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764377698; c=relaxed/simple;
	bh=xBUcxip0yLHxGnmERWghLrLOru7Z/tne2PnZJib4THA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDzFkqPJxNsUsQLHUDSD4FOR1hMNEv0KeIn6YNU8o7jaHPScQ7qbokM7OCWOIwBivCFt3qTwHDEN/2I4AcGI9B5/L88UWq6Y7PH6Evlxdff9fcUdlUUdL8tc3vp9nzpnbkArA9On9j6JqQaE0y0oaDT0bGHfADVSUZHGn4V5wrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=B8pjeZxN; arc=none smtp.client-ip=57.103.75.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="B8pjeZxN"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-6 (Postfix) with ESMTPS id CA4411800310;
	Sat, 29 Nov 2025 00:54:54 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=gMGeii2MvfU6xnuOZG/egs/9if4UYYfs89OhVs4vucQ=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=B8pjeZxN6ZXLXReAJw782AsS/mwvp8YEdQV+AP/9MPevFeCLTyWZtcBh5Ao52L5WbBFpsJK699leAHXEF4dvh92rPWrWN3gCqz71WMnaYGVRreBRLDpF8XsXqfZ0Of3jO7EUZmPwCxUycZLzkT+nsHskBBUCNANoJtZLB4/v09gvARCXyzd+3PhAz/njyR7JnVDGuUATK0WLrlx/+Ihly80nGYBmZV1wFPZrwU5O3TTtkhH0QNLcWlKNWeriqTXxrKAeQVBUaxRwDd2kw4NovoLmvMf20rYDnXPjAOR4VqrpNSWAwv/yQTUmbGe6J57sRwQt/7HP7Ph+Sqtbvy/NkA==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-6 (Postfix) with ESMTPSA id E6AD518000BD;
	Sat, 29 Nov 2025 00:54:52 +0000 (UTC)
Date: Sat, 29 Nov 2025 10:54:49 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com, dakr@kernel.org,
	acourbot@nvidia.com, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH v4] rust: Return Option from page_align and ensure no usize
 overflow
Message-ID: <aSpEWf8ytDn_laHh@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: 1sUIxO5unLiCdWZroGYQguS6OSnBqMX2
X-Authority-Info: v=2.4 cv=R+cO2NRX c=1 sm=1 tr=0 ts=692a445f cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=NOBzSAs92IVqpsMOjEYA:9 a=CjuIK1q_8ugA:10 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwNSBTYWx0ZWRfX9aUILmCDU3Xa
 brVRgozJfKI6ya7KCngkmA3BOj5mFjUf3GhL9sBp70PUh8r1/8cnQHLrxOyE29GEhr2xQpKrbpG
 /SzhtvdfBbXZVK6XT738BoQyCfaFYO5ByYrYy7r4CvKZu+/pHAezaFRcfg2G+tKRgSbLWW+8KNn
 2xyjV/8hxQjNvhGONN+9o7kXecrInPAqUoNT+lsEEtbojND+rTI0ZB66xG8D5kFQkjWHZVUPJTv
 XaRTnnN2KVWFk53K5Q871lB1+pVuVohOp6fDFcTe6Km1EKKED5mmXSz+4I1q4fo1df4/0zN5gSP
 LW9TKKTDugx2phtTSVq
X-Proofpoint-GUID: 1sUIxO5unLiCdWZroGYQguS6OSnBqMX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1030 adultscore=0 mlxlogscore=387 malwarescore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290005
X-JNJ: AAAAAAABKvxPE1Xgv1V2zI6Q+xSCF7Jbe6GUJ+sbpxppP92OL7hk2sNDSH/r0JJ0JHowfngc4AHZd+I6G8BXRGjixX6ZdOFcsSKOiZ80XSEN9dASeYE3Dja+VGjQv3otP6P/FpMqh+vi/fJIzO4+x1bYPhk4i6nnR9tdDbYrEUyprlKtHL4piAbPIsNJH3EQXQCS+Im7vgM5AySXJhhlfBZ0yfWy8TM22BCUqAp78SAKdsmobArV7fSR8lkiIHK8ngvVmFa/yfxLQD7exZhJLIMY3In95Cq4mCNx0iwhgxNvUAV7n8QgWGIK6Lip4VYImBce7pk3hdCOBywe7VWUThKhv475baDCiOi5dBPnEDP9vXWC8gX2I4VKY2pd6k4/d82DHHEt2CeqSWezLct+ZuwXkx6GLYAGAEZcXduo1miwvPWdRKCv19EbSabRv8Y1rva3ZnqQBbMJ9PUz0Hy7gL3XdrMWw0aTbjp1DN0R+0k+6UKVg7KH80nrjWd2ZTex0rqy0bGdBXJrw5+xFtfs3A+T35MtfEBf2JpTPx0OsX1j/p8kD95MrBFIRQ8jdii877FAybPs4o0WPbJZGfJjntr+rYIaiZqNZxNdm3F23Or2fI8rKHSBpWttYDLcoC7O/khSfYHPoUBI5OaZAMcsxJZhyIzK

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

Changes in v3:
- Fix documentation layout for better rustdoc rendering
- Add doc examples and doctest
- Ensure function is always inlined for performance optimisation
- Restructure function so that early return is the None case and the
  default is the happy path.

Changes in v4:
- Fix rustdoc missing comment (//) prefix
- Rebase on master
- Link to v3: https://lore.kernel.org/rust-for-linux/aSoY31U3uDI2y7V1@fedora/T/#u

 rust/kernel/page.rs | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..2049ff859ac9 100644
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
+/// // usize::MAX.
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

base-commit: e6640487845061255af9614ec0a192e4fafa486e
--
2.51.1





