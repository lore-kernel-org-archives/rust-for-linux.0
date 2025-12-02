Received: from outbound.ci.icloud.com (p-east1-cluster6-host7-snip4-10.eps.apple.com [57.103.90.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60634309EF0
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.90.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668144; cv=none; b=mvqjRyNmUJbNkinEP79urVdxI30/JhXknJ3diwQ9dJJEE6+bK/qJDf8zpaqN8rjgKf73lP9IqvHQYdBOmTzL3PGrSnxvua+nS8uFJjM1c3SMurMrPKW1Mz9OM60UzR7Pi9O0EB5iNM5U84YsWPa1P06EqSjYZugHZJ5GPYGROE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668144; c=relaxed/simple;
	bh=yI9dkw4UWgs3ZfKil75NnBEG8O+VZEb1vBApW9zh0w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkZOppa8OcE4lktCSesusJ7G7gbw9BQ8ji4NmiAp5Ngivn4BegydCe+3dti0zYI8JPDIf680LTLbGM559nx3EgIXWc6ouLpTFAOXxY9kqsy1Si7gzFSOTbJFtYfVarFouEmJ3tnPHbMIKvuzOLBysfDJx8OsIe3ZN5coB/751Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=WR1qBdqI; arc=none smtp.client-ip=57.103.90.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="WR1qBdqI"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-7 (Postfix) with ESMTPS id DDEAF18000B5;
	Tue,  2 Dec 2025 09:35:39 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=kEphec4HKR1EvVAkriDkhw//FW+P1V1vOvCZIRWUBL4=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=WR1qBdqI5h+ZNukAvuBV3FGY00BrKi6ebo3JZIzjJIIAc0ncV49nMWlX0vw0xXEena61dTSVQRSGG5DYP3ijMnKpAtuIAEGs0BLmMZgYqgKYq/TDAJELSfM7FgQGQle+YDYqjnCwwvgDi+0A5vIkv8YVcguQyB5D/aWb9JLL5EPpw0bt6Rv323H5PJMh7Xg39QMGkhdIQEdIv/kYUh1fOGa+vIIvXGsB7hkG7Y4T2gy7rL1c8tKzj7H3Fu2S5PXnciqMHBjDzc4BK0R5rBcXl6gs4mDbn3g6U126tq9xTfh2w06zJdHn0I+uuvDEaIMQLYsnSStu+04CrD+lT8kewQ==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-7 (Postfix) with ESMTPSA id 5B4E818000B9;
	Tue,  2 Dec 2025 09:35:37 +0000 (UTC)
Date: Tue, 2 Dec 2025 19:35:33 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com, dakr@kernel.org,
	acourbot@nvidia.com, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH v6] rust: Return Option from page_align and ensure no usize
 overflow
Message-ID: <aS6y5blasMX0KcD7@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: vdG6ORWunTIUxAtiSC8wo8Lhdrqo7wzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA3NiBTYWx0ZWRfX0/ZOOG0wG8gK
 gNjGCJSokqsDMafly5HDkf84sTt1jPwVIq3s7k11mREwx2FcNsgiN2mqHwcpmjTWljVCnE2lfDQ
 BD0wQkkIKP0Zu+H7yEbZSKlD207xnPf+ykT0IbC39UudxhoD5C6bm45cu55NAb8q3E83H6hTGsj
 a7wlIUD69ikwHcGzq81lCLUHHA+8Tgbg46SKo/NbcTcx2P9GfaTnMdqnPEv2yD6/naQhplAOSCD
 r2w0R46oH+IuNyTTo2YhS5G+g9k1uOIWS/I+xYOHz9dAKVmMG9Vsd42tKhGjHhzZ+HaOgFt7ar7
 UIZnGCMF5uttV/KoZb/
X-Authority-Info: v=2.4 cv=bd9mkePB c=1 sm=1 tr=0 ts=692eb2ec cx=c_apl:c_pps
 a=2G65uMN5HjSv0sBfM2Yj2w==:117 a=2G65uMN5HjSv0sBfM2Yj2w==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=JppZAXPjAAAA:8 a=0o5Cv9durJIS_GGn4MoA:9
 a=CjuIK1q_8ugA:10 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-ORIG-GUID: vdG6ORWunTIUxAtiSC8wo8Lhdrqo7wzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=395 malwarescore=0 adultscore=0 clxscore=1030 mlxscore=0
 phishscore=0 bulkscore=0 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020076
X-JNJ: AAAAAAABKlsdxu064K8rQyxWneFlSi95dZ7hhK3QWOM+nnhopM4zud/ebwsbA8Rdbn93YisWm+vRqfFMqSl0/2H6SFd+5Jh4bLR4NNYo9UUVcQKukjkqanGSvd2zbeGZ72faAVgJEYQ0yeLXHjNlNmxKoieyYUBvyqXQBaVSgTsUiVCt/sW4FgFl1q9E9LG6U0qFu3lC+sHnW6T+KxGy17gmT19OiIpPFUP4KRoAB6zM4vJAJjTa1AloQWa+zcngVbg4nOw/AsfY11d0FdgDYm74zr511kA9Ny0KyO/SvezER7jNBNVjfMwfc7AHY8ef8iV0Idrv+6HpO3w09Wuu70D8MQjNcEosMn1TRODtflYloX1p8ekP1NIpkaUK5B1AOujC/Bm9AMsjZDzdpcv0BojYoo8Ug7iGeAA2vsPa5B5M2wF7kF0zGgxPK5uDa3EujjWl0gM74micm8aJAVc+MO0WE4D1+dSKO399tgulCg00fSCGV820sEhnV8zA0g2NAsas42hRk3jwtFeYd8wF98NzZtIylruIkRrqWzaNfRl91/tLSy9we8rjmiqrSoMMV2iu5UEe+35aXqho7MB33jJ5gXb6vqzmpZoy00CUtJpzAiGMLZp2ncysHNV4CejXj8IBIClPouyLWVq4K0v7MiBPMyJcjA==

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

Changes in v5:
- Use kernel `PAGE_SIZE` for all doctest examples
- Backtick the backtickable words in example comment
- Add new example for `usize::MAX` input value
- Newline before # Examples
- Link to v4: https://lore.kernel.org/rust-for-linux/aSzDj1htLp11eCWF@fedora/T/#t

Changes in v6:
- Simplified Doc text
- Link to v5: https://lore.kernel.org/rust-for-linux/aS1qz6WjjP8E49pY@google.com/T/#t

 rust/kernel/page.rs | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..ac554aaee2d4 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -25,14 +25,37 @@
 /// A bitmask that gives the page containing a given address.
 pub const PAGE_MASK: usize = !(PAGE_SIZE - 1);

-/// Round up the given number to the next multiple of [`PAGE_SIZE`].
+/// Rounds up to the next multiple of [`PAGE_SIZE`].
 ///
-/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
-/// [`usize`].
-pub const fn page_align(addr: usize) -> usize {
-    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
-    // cases.
-    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
+/// Returns [`None`] on integer overflow.
+///
+/// # Examples
+///
+/// ```rust
+/// use kernel::page::{page_align, PAGE_SIZE};
+/// // Case 1: Already aligned
+/// assert_eq!(page_align(0x0), Some(0x0));
+/// assert_eq!(page_align(PAGE_SIZE), Some(PAGE_SIZE));
+///
+/// // Case 2: Needs alignment up
+/// assert_eq!(page_align(0x1), Some(PAGE_SIZE));
+/// assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
+///
+/// // Case 3: Requested address causes overflow (returns None)
+/// // The check asserts that `None` is returned when a value is requested within one `PAGE_SIZE` of
+/// // `usize::MAX`.
+/// let overflow_addr = usize::MAX - (PAGE_SIZE / 2);
+/// assert_eq!(page_align(overflow_addr), None);
+///
+/// // Case 4: Requested address size of `usize::MAX` would overflow, and subsequently returns `None`.
+/// assert_eq!(page_align(usize::MAX), None);
+/// ```
+#[inline(always)]
+pub const fn page_align(addr: usize) -> Option<usize> {
+    let Some(sum) = addr.checked_add(PAGE_SIZE - 1) else {
+        return None;
+    };
+    Some(sum & PAGE_MASK)
 }

 /// Representation of a non-owning reference to a [`Page`].
--
2.51.1
