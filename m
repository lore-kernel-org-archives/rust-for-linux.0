Received: from outbound.ci.icloud.com (ci-2002d-snip4-2.eps.apple.com [57.103.88.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841AF2AF1D
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 05:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766469451; cv=none; b=U8rtrsqpDQHp5KJJt0diQwPBa02Hsy67/D58oB/a8DvGqErEexxCofBRkYmiacsrfwBs0FnilUl2F7+B34t9JsNcwTZWd9+f87DNjux9S/rhQGNeij6Hd4i/bOV/jEvNBqsJBa1QA4RRof6tssVJPBdjn7qvaCgqJtg3KeLFEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766469451; c=relaxed/simple;
	bh=bFKvP3XkEYUPGxxTWGqDoPHRaHaWzts1/PWrApvJaI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQeXfCIA0jT/lit1hQqlQCTK7bpT5mv8h/GYb3jX3JQ8P+wX8/mGXF5ptlIJduytvdEqJpDbgUo0U4TIi/2hwQ2KO1XoN3Li2sahvWgOAg2KKni0bX/M7wnTB6iSrKbfs6JszpluFhQk5Ho+WU14Qzf/qOODqQJU4T8cxoWOfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=kTDs8OFF; arc=none smtp.client-ip=57.103.88.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="kTDs8OFF"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-1 (Postfix) with ESMTPS id 6905018000BF;
	Tue, 23 Dec 2025 05:57:26 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=M0YBrhdVCASY/GZtDDZllFQ4qQ6gcrspv1rMytWBg8w=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=kTDs8OFF6e8hBRJ3S5hAH4IH8meESLCxPlMrL4rnf5nHvpH4BrVJMGhXsnAUE+kxMDX2DMjRswovlm6Yid2AobT6iTJTinoCc+g8/g01bqtmYWYYOWjc1hUx474KcvLQbPXPMntBKC+Q+l3Mhql9LG9Q9m+2fPW4dScUhZDWEbSh4Lq/pa+Fo65AAduapQTZdbdLXsl8Tjei91q0LPwaxbkZKmu0DTuitli+uHRt/6t70r855qh4cH67poEyB4Bt2fhw/j4hkzdai/yWkhYUCY8f8vdVXJDXnQ9tGARkJG3HJJeQ8RMdiUaTtXoUm3tL8FgXaIulyq2x3d4WoAVIRA==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-1 (Postfix) with ESMTPSA id 355F91800159;
	Tue, 23 Dec 2025 05:57:12 +0000 (UTC)
From: Brendan Shephard <bshephar@bne-home.net>
To: acourbot@nvidia.com,
	aliceryhl@google.com,
	miguel.ojeda.sandonis@gmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	Brendan Shephard <bshephar@bne-home.net>
Subject: [PATCH v8] rust: Return Option from page_align and ensure no usize overflow
Date: Tue, 23 Dec 2025 15:56:47 +1000
Message-ID: <20251223055647.9761-1-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kJB3ZCM7xJ_t_5vm4fYUfYjuH6oZwXIS
X-Authority-Info: v=2.4 cv=AKGOOlP9 c=1 sm=1 tr=0 ts=694a2f47 cx=c_apl:c_pps
 a=2G65uMN5HjSv0sBfM2Yj2w==:117 a=2G65uMN5HjSv0sBfM2Yj2w==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=Ikd4Dj_1AAAA:8 a=JppZAXPjAAAA:8 a=QX4gbG5DAAAA:8 a=0o5Cv9durJIS_GGn4MoA:9
 a=mTXuAFqUwmiQvsSFmwXH:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA0OCBTYWx0ZWRfX+VwR8or/HOnN
 qv0Ca18xnWsxSs6/UDFSBmqpa3puuS9fyN3HnpH975ztMP6wr85N7Vw4A8o17aejXN27Qqd6HU9
 Ea/hu+WKups1r4ktALIRaNCXAuhD2KUl5rR5htY0WQL+CN77ylnqntpvjTDAGBPQhDmw6qdjamn
 9xM/+1yxRW4aYtrcF/j36H7XnPWaf4IaiD6RkZhXCFLNS4HyEb7TXBWWosClsFpfnc26TC0utWu
 eth1xj1X8z36H1QVeDyIpwasaLdcFvse3soK9sf2I6iVyjxJ96UkBB0VVU4udnT7kW6W6Z9sI4L
 TqzLLQ3JqU432slTvjF
X-Proofpoint-GUID: kJB3ZCM7xJ_t_5vm4fYUfYjuH6oZwXIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=641
 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 adultscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512230048
X-JNJ: AAAAAAABq6OMtlApmHt8ClgLHBWmoSITj6zhwaP1ch1E8MMZYb6bW3v0Pmn8mDeFqzmv3RlSR63Sh51E1XdRV6EJGIxM5u/ZjM8WQEUxTQhTjlfQLHqdgJ5Dh6zJioa2MxwpWzk0KdCwCoOigdYQXq/N7PTAhn3fPu3RjXIoImpnxeUybpiTb8xPuxCLI5/MalUGtgFaebqf1SE6rc41Io/nEwsv6CqkqXBmUqRLndzczjgznb7BMwJekVxB+6l7RhFx7AyKDAcrn5EbbhDOmWU73Ga3nVaf6rer5oiz01/WJEFDS/ptIP2b/i8wgl/Nn4ouYRFPtNHs1epFoW0TYhQR+NzOt+tNdMwT8L8jhnUyrdxsw6mtIjFe5RE2kmehcqAYhSQ6jBQYQcRhtBMAvN+IZAXGl2iCO9QCNhPbD/iU/fXaX/zR3RQEpmsei1iVROHPanYMr3wn4CwOqmphh+aEPkerDDs6BKDoG0Pwb0WK1GZ1gLWdm9zHkuYL4ga28zKhiGDn17lsz/yifbpJlmorlaR03DYZ/yWqeVU2fNpz9Uz0wOiLCvOGAwttbU7Py5Te/IDQQB5jFdCb/n7LF9ILiAR3GXt9HhxcaZ0B/xAmMGDDm6nFg4E+MCYeDI380635NeRtxqFNqb4xzAxhu/wUYy36ivt2T5cffF3DZQ==

Change `page_align()` to return `Option<usize>` to allow validation
of the provided `addr` value. This ensures that any value that is
within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
returns `None` to indicate overflow.

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
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

Changes in v7:
- Addressed nits by Reviewer Alexandre Courbot
- Link to v6: https://lore.kernel.org/rust-for-linux/DEOIMG7Z0J8B.3OOY2A989T3G6@nvidia.com/#R

Changes in v8:
- Consistent periods at end of sentences
- Removed unnecessary tests and comments
- Link to v7: https://lore.kernel.org/rust-for-linux/20251204224006.353646-2-bshephar@bne-home.net/

 rust/kernel/page.rs | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..2ab58dcf34c7 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -25,14 +25,33 @@
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
+/// ```
+/// use kernel::page::{page_align, PAGE_SIZE};
+///
+/// // Requested address is already aligned.
+/// assert_eq!(page_align(0x0), Some(0x0));
+/// assert_eq!(page_align(PAGE_SIZE), Some(PAGE_SIZE));
+///
+/// // Requested address needs alignment up.
+/// assert_eq!(page_align(0x1), Some(PAGE_SIZE));
+/// assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
+///
+/// // Requested address causes overflow (returns None).
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

