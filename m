Received: from outbound.mr.icloud.com (p-west2-cluster5-host2-snip4-10.eps.apple.com [57.103.71.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05B26E71F
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 22:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.71.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764888077; cv=none; b=FqO+bDaoBpSRfzKMwG8jb/lLoYIwPiQeFu1DS+K2LBrps3V+OL6zuAivjR18jVao7+ZP4cKtrW2B5gDJJU0ryDhYL3+XMN+AX6vVjF8fz/9bsUFmT7qpTxoo8o2wLIkBB8tSqyuCmLtZgnLy0qPOidJp52jkICy7/VzCYJC95K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764888077; c=relaxed/simple;
	bh=0SZLA7RWkh6PPw3PKIvBCTbUP2EQmxRnA9IkWVicoxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HmZbbXdS4+j7hTPGot476cZpDttGbOE1HL2GNMov9VdlWNU7/ij4j71rGU4zmWoAX4mPdB9f5WT6OaK552XVfdRLr882GkLHLWu4xlX1wdcQSMCF1AYgI5LMIikDVq7JW5ZyLA9dM2MPZALZ58rCvHe6ttff9TopvtwZ7qzhVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=cKrxk/L3; arc=none smtp.client-ip=57.103.71.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="cKrxk/L3"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-9 (Postfix) with ESMTPS id 5472E18001CA;
	Thu,  4 Dec 2025 22:41:12 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=c2F2p+wn0xZCEoaf8JXBtRe0Mp2CuMfUefkpFwUhx4g=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=cKrxk/L3oe2zcKG6SdH1jxsdCfiYDQ8iP4x65DPXwLr/VY0A7iAY34/a5QjmzfEviefjomTFRabfuATlb8f5zIlN57Ne89KEIjDL2MDOYVwI71auqQO11FVH+TP2e/7RmBehMWaW8Dje5dWLhqv60cWa2CtD4u62uck/NBv2ARRfZeD30L+rBrK1w28jmWTDEsacc7sEXmwekYTcOY94C0g2ATEryfXBt1lW/s5XxfxZtHogppr7TdOl5eJar8bBBM7i70NOreDs6BrPqfEB8Uth7jDHb2JvxjZxCuUDJoOZ9+CzOfA1SHnrBDeNPnJ50IqNV4vU5YhTgIO/yYY6oQ==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-9 (Postfix) with ESMTPSA id D3C69180018E;
	Thu,  4 Dec 2025 22:41:09 +0000 (UTC)
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com,
	miguel.ojeda.sandonis@gmail.com,
	dakr@kernel.org,
	acourbot@nvidia.com,
	daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	Brendan Shephard <bshephar@bne-home.net>
Subject: [PATCH v7] rust: Return Option from page_align and ensure no usize overflow
Date: Fri,  5 Dec 2025 08:40:07 +1000
Message-ID: <20251204224006.353646-2-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDE4NCBTYWx0ZWRfX//lheRCwl/qx
 2ev/XMyxPOqPlOPw8VVDRGvihMoRVvpJGgNzxt0KTqJkxTZ75kddcw9Jkzd4RPNS++N430fCncZ
 BcMbC0SrncAM2yap91lAwa7BfTQIBCV8+BYIZDzvq4VlCX7EbfNMA1g2h3fBZIY79pSqCmhFDAF
 9rYZ5Cz9tyRo/aZ9Q60v6BVX05vBjfkJ+SIrmeat1ujattedjprxCUN+x0lysgiJmcqQEfcs8ib
 0xgStdAxK3Dn4bobR/yBmxoS6p4rUWhZ+XPGAC2JTjYEQnzyQG+vuHuThbg8iMPbzth8APfddU/
 vI3SGANpX3adwC99ItS
X-Proofpoint-ORIG-GUID: BTqDrhEVPdVXg5hRctrkoZeLd1idrUvK
X-Authority-Info: v=2.4 cv=b+S/I9Gx c=1 sm=1 tr=0 ts=69320e08 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=Ikd4Dj_1AAAA:8 a=JppZAXPjAAAA:8 a=QX4gbG5DAAAA:8 a=0o5Cv9durJIS_GGn4MoA:9
 a=mTXuAFqUwmiQvsSFmwXH:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: BTqDrhEVPdVXg5hRctrkoZeLd1idrUvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=677 bulkscore=0 malwarescore=0 clxscore=1030 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040184
X-JNJ: AAAAAAAB6ASzhbR/5w4BLeQnyANPricvaw+QpDTSdvJFQJzXL2OdZpX/xhIF9fXZG7K+zDamu0qSjjwo+Po+nR2Xo1Ko2YQa+nAtGB/kJVPjmkb5OqYgHx4ZQcARq70yt4jcVX2vCQRviOHVvFD7elw6K+TYHkuQbshyxm1I8K1Gb7BAD1yzLt459hER2Fw8HH6deFWAGiFv8ngjA/9jntrpd4lD3+wdXCcvahbdEcxKZqPjqnqJj/JVVkBRuAsia0pUnbpnidRFFj36ae4Fq/iaoZf9wzCBIbHbcT5RYytCoXZrTXRxxP+QnxS8bQt1Nt4O3dbRVBx3XPny93D/kE1v8y2AZWJAUsxUU87yuUqNIxlZ7U7MUVmVGxrbL0DZz0Flg4gHdH1z4TEe5Qoav5TIf0AYXKaKTDJ0T1iDJ8htGJBNl1zEyq1MdGOxGE7zQTPAGF1KgZLioJvIxy/X1tr76kIvRTES409aZwgv4QH0yaP+Hbeh2453Y6Yy257qwx1MZUQl2+iYI61777EIg+x1KTJ/fvL8h7nLvRqzq2i0N4Fy3iGkh9EkK9ShGDq6V1e6tP0v9o+EMFieJ8HJw61AeJLCYr99oi2qSyKUeScWL6e7O1ybMqAc2P5S/kEJkU/zqG8PgUsOMd5p+NR2MJf15goORXuHI2BuaT7Fid+Z6uEhQ2eGpuU36fPvGvT1/xtS4kMs3Q==

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

 rust/kernel/page.rs | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..3c94654b190a 100644
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
+/// ```
+/// use kernel::page::{page_align, PAGE_SIZE};
+/// // Requested address is already aligned
+/// assert_eq!(page_align(0x0), Some(0x0));
+/// assert_eq!(page_align(PAGE_SIZE), Some(PAGE_SIZE));
+///
+/// // Requested address needs alignment up
+/// assert_eq!(page_align(0x1), Some(PAGE_SIZE));
+/// assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
+///
+/// // Requested address causes overflow (returns None)
+/// // The check asserts that `None` is returned when a value is requested within one `PAGE_SIZE` of
+/// // `usize::MAX`.
+/// let overflow_addr = usize::MAX - (PAGE_SIZE / 2);
+/// assert_eq!(page_align(overflow_addr), None);
+///
+/// // Requested address of `usize::MAX` would overflow, and subsequently returns `None`.
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

base-commit: e6640487845061255af9614ec0a192e4fafa486e
-- 
2.52.0

