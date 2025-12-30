Received: from outbound.ms.icloud.com (p-west3-cluster4-host8-snip4-10.eps.apple.com [57.103.74.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C567D26ED25
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088137; cv=none; b=q/hVEmPxzt63n8XQ2q+S+MCNACPfqhfoCMOyZjI79v+w/9BE1UDUMdxfkh5WSlyETtbQB6NBwRRL2BoWwxCRQBSQ3+mTnfYIOQBmtz2YRoX50XAF+I33boirATth/y+zodeg2GyHJ4RYBxhc9vYEk35qDqbjl/49Dx5U/7AE7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088137; c=relaxed/simple;
	bh=SBP8e9UqXIjs3B9KlEC9Cv6xZQBf5yqu20l6/nSFkhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gTPrPSbXQwR+Mq9XzyrcaKkej/+kpvoIPqfMh01ANJpqW/WYmpi4YbvQr69AUt/IOuaaKQ6Ziu5cVZoRw5aCPpRpbtpffYtMgmtiZnZgDCdmDNugw681I9HERrD/tm8q+NjkBWZhLj6U+CAHAN6tsaKYb4lM3YUET8kNnenpU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=IYwuKCvJ; arc=none smtp.client-ip=57.103.74.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="IYwuKCvJ"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-10-percent-0 (Postfix) with ESMTPS id 7750B1800100;
	Tue, 30 Dec 2025 09:48:52 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=WAfqurt205UYSsUGKAjfPC2uLje6kUlWJNEl16+9wTc=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=IYwuKCvJPyt3JmjSQMlIg7r2weXGdKOAX/L/WlHDJZmw+2UENFntDIiCvBzsaVCTYr/PntlizFSYsi+S2TuwGydGJNFD24LzugXJeR81GAqu/ncRSqo9mm2rmVhY95O1KQX2CqmBKe5JYGXKLMqyrCaqlp1Ya7h2MLjt22D6eBIABe4eEm+03jgNqHP89AqllaJ3zTLyjjfJUeGHBbcChrt81l9h8WqnzU/G0u2mMSrxd5j97VbxBxsUxIIPPzIEsIHbdXP9xN79Cz6UigrFAS4sK5xxJgSe5As8rtbtD8CxmzM/Zm000DZxEYO5scQSCBjTa9X0897R+hnw0fao4Q==
mail-alias-created-date: 1746336505199
Received: from fedora-g16.bne-home.net (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-10-percent-0 (Postfix) with ESMTPSA id 42E13180011B;
	Tue, 30 Dec 2025 09:48:48 +0000 (UTC)
From: bshephar@bne-home.net
To: aliceryhl@google.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brendan Shephard <bshephar@bne-home.net>
Subject: [PATCH] rust: Test page_align usize::MAX boundary edges
Date: Tue, 30 Dec 2025 19:48:41 +1000
Message-ID: <20251230094841.76830-1-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4OCBTYWx0ZWRfX7dVSLQn+9RZQ
 30zkexKtcWsMBWMzg69DaeLoGRcZwnDBIRSXwZErNQIMTJ3LJEV2mOmdDW0TziL0WvX4vdTR/yn
 XGSAZqp/FKhqLe6h6427f2FtvzAF578pbZ47ytqMrgoGkVajdm8MhvFKU+rnFDK2PiEn2BqHuK+
 WQgAvZ/K1+7aMJV6w6Ci9gHHvDecZI8qigTaA108FUhdJeW3vTGU5IyzaxsRguuixwKruhNpf+l
 1ruku0OmS+CrtnIOhRP7iSh3Bo+kZ69hEmmfRLMt6RVyz5ibb1fmj/TyKe8bfzKQyO0kaslcPpd
 OcvEDMLX8UmZXcEQdq3
X-Proofpoint-GUID: Gf5ONyvWc2ShQi0c-_67pPfwp-V5Evjb
X-Authority-Info: v=2.4 cv=a8A9NESF c=1 sm=1 tr=0 ts=6953a005 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JppZAXPjAAAA:8 a=W2ZBZt_SNlrk6TKUfwYA:9 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-ORIG-GUID: Gf5ONyvWc2ShQi0c-_67pPfwp-V5Evjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 clxscore=1030
 mlxlogscore=842 adultscore=0 spamscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512300088
X-JNJ: AAAAAAABKJKhbGoIelncA6EOSHZHcUcxh2qqXKGgbJay4xmp8vxSDf7sFd40wI1VU1lCSy3jdlENrGiQhUDUti9/JbtjagR7zJihMbTX6ynj36XjijVgzAZXKG+bLA9tMvadJkRWovtkXrWhLNYtSl0JrytwfxVh0afrUuqhoc/w2wj8pAF3I4RkkguUHn0Sc4bM3G1jGyHQNNryA8HwhLNC7xtL2p2BLAbRypLnSBlfRKZOkxvvqVEe/3016CAze0YeRbTbhHcR81zmBCU0JzaCpmDAAyE/Kk29EVFoodTyrxxbWOCtMJkXPT1bCXcSVoEwAQdGLfd1LVuwTDstQ8434aoaax9jWHIw7qXx8GyuVrrZ7do4wdDTe32xMjl1VuIBW28sdM+2mHbF/1r0sV42W9VvG/z4iv1Ckcf2rDH5YyCJt0dD+QfOgu4nhgWlDaZ75I+z68yF5NBRjLUipzXSwmsqzNB+iToTaA/REEKNYCxMURLrM19FLhzkmSWdIDQasfK6m+w5xqfjnXHJ9ELrnFH0fxdYhy4AE8kd9/nBik2mDPRaAwY6twe8zp39ktzQkk9FOLW6O7HFEvmj35LHcSrC3yVGwB/YrMNcnOon/KYCBNWSfEJlMyRJ/B1//2RMRrAueBTHGRfBrOZhxbrHinYsWKRYu8NaNuH9O4fqqM06Rc+iNEbcqVBD9Ges3kyhn5etfagn+dvXLRo6FMFqpTKNzLuh0yPwT4gqAtVZmq/lpxQmWKCYsc4rcKZMrMYUJsg4SWDKl37P0agVtpaOqAqtvGLZ8mQ=

From: Brendan Shephard <bshephar@bne-home.net>

Update `page_align` doc tests to test `usize::MAX` boundaries
rather than arbitrary middle of `PAGE_SIZE`.

This patch is a follow-up of:
"[PATCH v8] rust: Return Option from page_align and ensure no usize overflow"

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
 rust/kernel/page.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index adecb200c654..d602d4231f56 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -45,9 +45,10 @@
 /// assert_eq!(page_align(0x1), Some(PAGE_SIZE));
 /// assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
 ///
-/// // Requested address causes overflow (returns `None`).
-/// let overflow_addr = usize::MAX - (PAGE_SIZE / 2);
-/// assert_eq!(page_align(overflow_addr), None);
+/// // Testing boundary conditions at the end of the address space.
+/// assert_eq!(page_align(usize::MAX - PAGE_SIZE + 1), Some(usize::MAX - PAGE_SIZE + 1));
+/// assert_eq!(page_align(usize::MAX - PAGE_SIZE + 2), None);
+/// assert_eq!(page_align(usize::MAX), None);
 /// ```
 #[inline(always)]
 pub const fn page_align(addr: usize) -> Option<usize> {

base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249
-- 
2.52.0

