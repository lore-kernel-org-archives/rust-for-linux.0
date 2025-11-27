Received: from outbound.mr.icloud.com (p-west2-cluster2-host5-snip4-3.eps.apple.com [57.103.68.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B821A459
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764248854; cv=none; b=HH8LCkoHpsQD3Pbx2kAhTzbFxWc5DmxRo3qfP2TnOzTTUZJjxycyTzFvkd1CV+aha4nj/pDoRnKIWKq4o6Z092qYtFFMWc1XcU96kpUMTuJWeHYD8WFPtv/4IzV029gbRIkXg7VlrUKGn7CgmQ10pbzK1+sFU9vkiCxG5KBoxjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764248854; c=relaxed/simple;
	bh=gAfHcBfeXw6z+TTpu2ywPnF6wNc1kMbcKYGrRB1dDAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qg4HOFPkqvAk0A2/7X6T4kAnKpZCm2L5aGHw1+fjDiuXATpRwWISW2wnwZzveMSY3xfoKP8jEmlAUVM6o+CD3bjDTjSDKA8PlHX8qq3Cp3iWlicExB2DHnWUotUPKcoOD9t5T+cisw0985Y06XLrP2ivC3Bvt72w4lRYdbbu6aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=cPT6Zlt/; arc=none smtp.client-ip=57.103.68.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="cPT6Zlt/"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-2 (Postfix) with ESMTPS id B32AB1801C32;
	Thu, 27 Nov 2025 13:07:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=t64/D5LUlJWAc1hXQ63F7LBmpL4ZJWhY8Dh7FiTOgvU=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=cPT6Zlt/ub6Pyb4gn53cuodEY2aUjMFwC3INUa5Qp9aQw664FyZeDQG07EoSvMQx/Td5sscQJJzcGU/NfDcRkBG8iSNHsIb/9r2fOGTgPigv0MxTGr4D2sTFWETmYl2tY6EmtfTKXRb83IDs7tzRtSL9/IsXyrcRqLaqtEGW5CCKf+1UW8uu2gyHtH0r4z9qzdOpZsxmoFulV9vJzblxP2l4aWICbf7PgkF7/j8FYsJDvcJKV+GYMyPZsVPL7zEk3UYA2ezInhNQPa78iKekbjC9eYzSDenSYm7BpMke9s5rUmWpUonGGkRWZiDSh39RngAkvMJ0dTcChSSb6TTYvg==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-2 (Postfix) with ESMTPSA id B7F051800498;
	Thu, 27 Nov 2025 13:07:04 +0000 (UTC)
Date: Thu, 27 Nov 2025 23:07:00 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: dakr@kernel.org, acourbot@nvidia.com, airlied@gmail.com,
	aliceryhl@google.com
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
Message-ID: <aShM9CAyRPe2gYpK@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: eXdPPA6pgQjafM2UQhsEj3NSjxZYNSxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA5NyBTYWx0ZWRfX0XBbTxUoidUJ
 /mjxGiHUdatbySVYs+T4HRpRUJVOHA1ixlhqjWOk10SacliS0RtH6PqYQWSWJxfmzh74o3O1aCS
 TjWInDP8kUuTjTC72+YaoqX814YbbUm0M9ZXa0F6gQdSwIh7xgEmivSgMhkotKzO4AJawS7vAdS
 s0zlRJJU+JAyyDmQ8RBMESNNIOgJ1ygbu+BWqbWXKX6sz0EXtJLQnzVt+43j5ugHae5zB2Z/Zb2
 8OigfONZJbWybmMPlLIi5JAiTGJYkrtK3Ktse4wQuiay17QmcGHHNS4NftNVMC7jTEoVu7ORsgV
 IYxRJIoPw1lY7NmGLkB
X-Authority-Info: v=2.4 cv=Vr0uwu2n c=1 sm=1 tr=0 ts=69284d13 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JppZAXPjAAAA:8 a=E8rjWuRsiTkYYbGZz-IA:9 a=CjuIK1q_8ugA:10
 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-ORIG-GUID: eXdPPA6pgQjafM2UQhsEj3NSjxZYNSxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=436 mlxscore=0 clxscore=1030 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270097
X-JNJ: AAAAAAABUxKYy9zoC4Z8xbeFlY9qjR5pJOYgFeOtwQqKcYy2TLsOdRznq4khYeLch7AjCPt68Sqh/OfG/nplsr0xMaqdjT8O6WPPYnstPY+6pofBgYKH+3Z/R0Zter4ca3Cpm+DuR2cr+18mJAJ2UIlijAzqupZmaf4Zwfzx9khdemj0NJ+eIzYMMoaSWDdXM9rO8Ne4020LBepU8E6XXVbCPGmjeEOaLviIIXd9FTLXsuGXiYcjphKPx9IN6Z6sEXkWYxit/6DA9kmSr7t6WQooeosfnMpR0TlW4yxNGQqTEufHVP4azEG12Pgpws3Rm58/0Is5/phYR9qFbhLtuy197xB8WWZcZw4K3eEUtNfbMJnpDxjjxVZLgekHZkdDKwAEys+ziDbuYsiBUn/VWk6xRRa7BreuLVOisME5YHZetq5IXZaTbw1s3Pkzi9z2Wn5Pdu/fAuWqEpFxmtx9chbq8Ad3krs4aL/CwEdAP0c2uZGpJvoMD0Kr9H/n+AigoVL0OeltJffiN+v8oRn8Td0TCt/zFAw0+HWiykv4zda3re355IACrv7rUdODaOmXolBSz+GzlQivHhNol2FhQ3jGeHW169c+AcyZTfw6uXf6XmA7pA==

Changed page_align() to return Option<usize> which allows for validation
of the provided addr value. This ensures that any value that is provided
within one PAGE_SIZE of usize::MAX will not panic and instead page_align
will return None.

Callers of page_align() should raise a EINVAL when they receive None
from page_align().

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
 rust/kernel/page.rs | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..b78473b67003 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -26,13 +26,12 @@
 pub const PAGE_MASK: usize = !(PAGE_SIZE - 1);

 /// Round up the given number to the next multiple of [`PAGE_SIZE`].
-///
-/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
-/// [`usize`].
-pub const fn page_align(addr: usize) -> usize {
-    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
-    // cases.
-    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
+/// Return None in cases where the next multiple of [`PAGE_SIZE`] would overflow a [`usize`]
+pub const fn page_align(addr: usize) -> Option<usize> {
+    if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
+        return Some(sum & PAGE_MASK);
+    }
+    None
 }

 /// Representation of a non-owning reference to a [`Page`].
--
2.51.1
