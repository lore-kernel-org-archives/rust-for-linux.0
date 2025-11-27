Received: from outbound.mr.icloud.com (p-west2-cluster2-host2-snip4-10.eps.apple.com [57.103.68.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C9D333745
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254462; cv=none; b=GCTAjsNMPxQx9/dJS2TpmA5AU3wWtRd7Hwl/XSNBO9ymV7cXYkNKrmDvtjtZ5gaJLxfx0QzQrR5wjL9qoBZNnvZeMnsQxp88IS6vGy/i+RemNPToqi6eZl3sim8K1kGHx+8byNBdShF5MnmzfZ4VU+OKSDwLZXp1H+aOHajeFKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254462; c=relaxed/simple;
	bh=MG+feKzQON36gXZhJIOyrOpUCzYMCunAF5DkJY6oWYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0Sj2jBrtEHfNRM6lCUm4mLh0p6Xfb1vvKsAbVjOtvQwgAVQIQ+X4Pero35lvRGHA+/AuV8jflu3r1oVvwdExQ4b56zy89ZMS2U3Vk2NIbpS9iadsAAXa5MktWnprsBuGySh3ZVXKy2iOVlXbCnEZgHTdTc6HBu4V7ejlBN4WzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=at/m7wte; arc=none smtp.client-ip=57.103.68.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="at/m7wte"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-0 (Postfix) with ESMTPS id 3B98D1800253;
	Thu, 27 Nov 2025 14:40:59 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=p6LP1o4gWc1ZU0cppC+r36ISCXIqhAbULFiWMZkZjaY=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=at/m7wtebuJwJ078Iy1/HbcN3liRmB/KIuiaw5PFnqX2VhcTMBaQ1rdKlqc5osczp/qaBxIYorLh9uRxJVKQhb21yzr/F9tACTKk57SPIIa30A659a9VqN7V+0q+bub9Sybi0tK1g9n28brCKEQx3Iy492xvjhz5NVfB//CaazX40/2xmwpzCMdybDq5D5RbXKHf/NQwi+Hut0gT8u6DPW8e+hbepMpwqrPMe4GC3wxBoVVKU/tFEdB86cgwkahCc/4Pn5Aju+w06fj2ui/5m+ZzOdp1fjKQenXWRya/90hvPCoyLwnbrsuaA/kaEJvIasnVZ8RwTBC9Ht3l+ui4cA==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-0 (Postfix) with ESMTPSA id 676DA18001AE;
	Thu, 27 Nov 2025 14:40:57 +0000 (UTC)
Date: Fri, 28 Nov 2025 00:40:53 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: dakr@kernel.org, acourbot@nvidia.com, airlied@gmail.com,
	aliceryhl@google.com, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: Return Option from page_align and ensure no
 usize overflow
Message-ID: <aShi9fAhQzRzWj9X@fedora>
References: <aShM9CAyRPe2gYpK@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aShM9CAyRPe2gYpK@fedora>
X-Proofpoint-GUID: Z_6WATft99-jg3xco2cVgjFQ7uR3j--K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwOSBTYWx0ZWRfXzSEjPo1yVbzR
 Fwio3QVDOKoXY0dT1DyBF2M98J3TuxAp+THUJVBMILyG7lAtnk+r9KC3g/vBpSzdZNwHM6czIDP
 lvPdhNvL38cixWXWPGhikHH0a3Z2KxtU7I6zm01nkuPTNGmVGfEwMCz1W2Y36HyniBLD10k+LwI
 T/cZOYz9Q2zj/L5p+OSSyaZLjYVkklSw6LF09nReYrVvmb5A4AfNs0h7KMVf2+UmGs9H/BFrihu
 98hbpgCo1Paq8xYivuxz1ESbRbLGjUlBOW9BcJIOJZXrYNwDj1jDxXee3YXILOaxZDufk9Yx9k3
 imKax4aRUki3qaKJjGm
X-Proofpoint-ORIG-GUID: Z_6WATft99-jg3xco2cVgjFQ7uR3j--K
X-Authority-Info: v=2.4 cv=Ce4FJbrl c=1 sm=1 tr=0 ts=692862fb cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JppZAXPjAAAA:8 a=Zc3AnxJhfqoO1Zi5iykA:9 a=CjuIK1q_8ugA:10
 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1030 mlxlogscore=575
 adultscore=0 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270109
X-JNJ: AAAAAAABgVVyZXRGVgagyT7VrKO6413aqzOVtdTIPrKIxGE9zChgC2H280N2TMCHfm4X+HE5LN6+y8UGpQkr6y974FT/myTZm01B/8hmhZefk/D8P/8pnzCffXk8TFFsamvGvqjWgRyUYqaZU2AF8PVi440RhI62oVUCRXPOPiJvj3tIjlZnTon33dYuaETzazBzTBjLbahUi2EaI1cnuyjDbVpsegYyVlXyktD+FdnfGe2Fs+4jJ62YqZWO+edA6dGpalX0T7jJp2qndRgpXVABFDQOqUzBnqFEsoI9syRUQa8bopG1rcqQMjlLITks/yb/vpQdcALaWbonvXrtGZSD+pU0pUD3KxzD3TwVvge0mTt6F4mJiZD05XAU6pepLUBksrXvZszyMDUGDbcKJZejk92Vvjv/jtsAzTNKlMixFDYaFfBcE0UB7/jVdeh492yiYrJ4qxgpAnmRW4N3aRN/UU+Qv1LlSfUo3wJb/2N3xmCFAYFAmIES0i04qM4VMbgRPmnXnh0SkVGaSF3JSL5dLyJk2wbti+CJjz8wOTVT1c7vUmSDKAJz0hSIeII2pAuYLZTe1cnPwqB4OcJU8pTvzGKJwsBTu7DqwPw/FQNLOoNF7JvBNe0t0COhkskORi0X4qPg/0z/KzI=

Changes in v2:
  - Reworded commit message to follow the imperative form.
  - Expanded the documentation to explain the `Some` and `None` return cases.
  - Added a period at the end of the documentation comment.

Change `page_align()` to return `Option<usize>` to allow validation
of the provided `addr` value. This ensures that any value that is
within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
returns `None` to indicate overflow.

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
 rust/kernel/page.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..d5cc340c0689 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -26,13 +26,13 @@
 pub const PAGE_MASK: usize = !(PAGE_SIZE - 1);
 
 /// Round up the given number to the next multiple of [`PAGE_SIZE`].
-///
-/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
-/// [`usize`].
-pub const fn page_align(addr: usize) -> usize {
-    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
-    // cases.
-    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
+/// Return Some [`usize`] that is page aligned. Or None in cases where the next multiple of
+/// [`PAGE_SIZE`] would overflow a [`usize`].
+pub const fn page_align(addr: usize) -> Option<usize> {
+    if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
+        return Some(sum & PAGE_MASK);
+    }
+    None
 }
 
 /// Representation of a non-owning reference to a [`Page`].
-- 
2.51.1
