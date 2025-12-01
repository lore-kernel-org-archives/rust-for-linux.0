Received: from outbound.mr.icloud.com (p-west2-cluster1-host1-snip4-10.eps.apple.com [57.103.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CA0154BE2
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764567960; cv=none; b=KqsOENL0NcKkyQU4VHhFbo4deO3AVTiQcV2QQXFj6Gk3oAJGtHY6TpVmfmM7DI6Sznyv+zXxzm7kd2lkph5EXpi+k24xy2lEMnZbyt8B/pFpQYKFCgjk0YwFJWHcLwGqoHtRJi2YyD9SgGlSYYK1OyT/TlVQCLK3SsuyoFcNXSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764567960; c=relaxed/simple;
	bh=Pl3/28oceqEJ8BvZ7eYpwyYqlTnxTyUf9BBJYtboFgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0oS+OSY8SevF3pjwLUkpE8H+5fXTw7Gwj4xn63u8XKl1sZ+Eeil86IQGL/p1uFIvAuf3JAIfYhQKBkRiIgZJ/bonQlWraZRj1bzSwy0/3to3rtmXYRNO5M7/Lsi/SdxNuyFF9sWMGyxUfliWttf4j5Jff27hH6LGdRCagugZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=an3U6PjT; arc=none smtp.client-ip=57.103.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="an3U6PjT"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-3 (Postfix) with ESMTPS id 951611800245;
	Mon,  1 Dec 2025 05:45:57 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=fqOQl7IRlH2m9/CecGGERA72bhgqt7htYyRBwZJ5PiY=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=an3U6PjTYd6ycxh1m7cnb5LNKl5FHP25MkUzjz0VZWHQKBtKd+B6aWkdT3KE0u7fRKquhhxUhzi9q6WfEawLLICfDsDzSUcE9a8+WwVXNrKTE2aEm/876yER3bP1Xa3cIFCBo4MCAZvYaXlWYggKvGWJfkdH6dRqpo8IMlzoozNBd754SkzeGmMsouuhO3lIcfghzYadPdqKrpUT6qiDAf8XPFtVTB6WSz46WA5z8JIFp4EF4r7G9MhAOC28eOC1rk1rSx01n9+gCa3iA1ii5cjt0LolHXw1a3+fJPA9laRl26OzeL9OXSttZVRk2nd2wRQ4TRf6xvyc8oJ1bUqTFw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-3 (Postfix) with ESMTPSA id E6F1B1800258;
	Mon,  1 Dec 2025 05:45:55 +0000 (UTC)
Date: Mon, 1 Dec 2025 15:45:52 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com, dakr@kernel.org,
	acourbot@nvidia.com, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH v5] rust: Return Option from page_align and ensure no usize
 overflow
Message-ID: <aS0rkCpdbRu9n4p8@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: ZaTA5MvbtYeWjvMfbyvFKTRtXDcylTnZ
X-Proofpoint-ORIG-GUID: ZaTA5MvbtYeWjvMfbyvFKTRtXDcylTnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA0NSBTYWx0ZWRfX5Fw/tG/xLUoa
 qpEA4HUI+JSWlGb+A8uoyzK52rBtVESkfHW2/+Crr6W1QAHNx1bukoibf4ccVoDKis+hMAW2isT
 9dKnxcnqjOtaIL13YB+e7RqDSw/eOVDRAYUOxV/zL+cpaSg6NqBBIIPh/44vO4MPDglGqsWF8k+
 uob/dKbnUgUITRefDQIqM4VD2Xhxo/30ODboDoqsibGPyCmkkPYwjd7Fsf3gJtC6g3LGpbmYtST
 DA2fm2yU+CIACZ1EFuGhvr6TXoxqBFUnuD79p578WA6sN8jD/JNiYWX5FQsJ5fjmT8YwiXB4XP3
 WOO+Y5efN2APWyyaOEd
X-Authority-Info: v=2.4 cv=XdKEDY55 c=1 sm=1 tr=0 ts=692d2b95 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8 a=0o5Cv9durJIS_GGn4MoA:9 a=CjuIK1q_8ugA:10
 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=346
 bulkscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010045
X-JNJ: AAAAAAABSiv34//MZ+Nc+EYQsX+HOFFI8dORwJx9j6ONT2SHRlukSq0CM26QUYBAAOgxC+I/sxCjXk0GtI0kI7kBG+sreZLPjowgn3lWncYi8hXUuLLU8HL5cPM07unTHLQU7IpHzefsqs9H9r3MjJlZO2MOz11er+l2WTWQdCxZkneBgZNNOu1iXzmWP9Yp83lxhfWm0P5R/aKPmtoAzs6Aqb5L2tEeh3yQDFNt2409ahJkHmeLESt2x8OdmHhDi6j2iqvoXShu4kC97EJzX7U9LkzvpYoLy2Ccxbz0lwO30Rwd0/m0JDPJDnAlBqPGyPOLKgdg3zFG8XblO3594R0/qwCRitYhSD6GL1V40Aqd5SP8qeE08VIIFopyhatexDoPJvdeMtRWEOQS4zD3pOhy6kXo8X+3P/jCiG/OQcb3Mv7TxEiWjZjdniO3oYfOIjdmVIaBEk80oEti9O1Y4iWWBX97jErSBfgq/Ldjyg/o3+d9U/AdI4K/3qq0G+kudPKZaN8Y1LMdiq9/a2IVqbX9c00BC0b7epo7gz+TPbVc1V2mIkIZyonwRPeSpQNMhclaE+O5+AISf31Sztj1953JMuTHL8LncDb4vicPzXSrfUOH9AAf3w5huS4vbPd9alyeWOF4d8Z2563KuutFFQ==

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
- Backtick the backtickable works in example comment
- Add new example for `usize::MAX` input value
- Newline before # Examples
- Link to v4: https://lore.kernel.org/rust-for-linux/aSzDj1htLp11eCWF@fedora/T/#t

rust/kernel/page.rs | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..4a0cfa32a5d6 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -27,12 +27,36 @@

 /// Round up the given number to the next multiple of [`PAGE_SIZE`].
 ///
-/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
-/// [`usize`].
-pub const fn page_align(addr: usize) -> usize {
-    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
-    // cases.
-    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
+/// Returns a page aligned [`usize`] in cases where the value can be aligned. Otherwise, returns [`None`]
+/// if the aligned size will overflow a [`usize`].
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
