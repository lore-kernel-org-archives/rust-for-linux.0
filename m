Received: from outbound.mr.icloud.com (p-west2-cluster6-host11-snip4-10.eps.apple.com [57.103.70.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAED2D73B4
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094889; cv=none; b=Rm0SHORBunSLVdq1S74vc2/3HaSjHN/xcR+sAmIpPpITz+W9OYeXZulJUd4EIAG3Pi/ohDZWgjLFqg5mSFgjIiykMU2PWSYDM00HdW0GROI93ZZ4IRMLNlhrnug3Vj4E8oIdN3n1Ciy39Fa0C4hTeQi84N1bh7mOjELxJP2X7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094889; c=relaxed/simple;
	bh=UzM2OVlNY8o2MG91Eb1UnWgQx+jmb7aRtup0xK0A3SA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvpNEfs6AMY3KephDXZYV2nm/JXDK/QnCaqEYgZWqAEbjbbfyHif2aJtqDHR9Ehxzg2bIKN/t+oyI5ip7uHlpBcj1CWjGEaW8vsmSCftcMvxjSYto8OdbB6fBaZw0ACygEJdGCJOrW4hYvwLsrt4j6OI7wTqirQTzavcel2KwAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=jaZyhkgm; arc=none smtp.client-ip=57.103.70.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="jaZyhkgm"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-8 (Postfix) with ESMTPS id 1622918001DB;
	Tue, 30 Dec 2025 11:41:23 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=ggYLBMvaykf4rMZdqtcloQRFZz5xZPrUJndHsUSseU0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=jaZyhkgmbPY0rkEcB+J3fnaE/68FjNM6TwQxhmPIWSCRlbgsnkQqraFSQX4qNGu2v3XpxfowonTQvKb3TpmRRXoJkms0jmL9RdcCiooc1zd2TXa1KA1cp6hgavN3ZTgf7uqr5f528eZ49m4yyVOc0OQM3M13ewACR2z/1d0PdWs0fni8JEa8c92iDe0Y6Y5zEIwEFOjQ32/JCd+zQ2LpCF8JFdJoMdwJC3Mh41POjVE/59jSC8B4CyhGFvswj0bQg2CV9dY8gR9T5k/X+povQOm8UfY2lvxNNLWWVf7XyaK+Xamah8RWxwWV05ZfLs7gk7wLTJfSAXX0zufdCIZLag==
mail-alias-created-date: 1746336505199
Received: from fedora-g16.bne-home.net (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-8 (Postfix) with ESMTPSA id D25D2180032E;
	Tue, 30 Dec 2025 11:41:18 +0000 (UTC)
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
Subject: [PATCH v2] rust: Test page_align usize::MAX boundary edges
Date: Tue, 30 Dec 2025 21:35:50 +1000
Message-ID: <20251230113550.82666-1-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: carxnywWYml8JtP_bfebN58g1FgHtMvd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEwNSBTYWx0ZWRfX8M7cBbS5dK2P
 gJu8b2V3TqPP+ktUMmg1gwzZE80Av7a/qyNoK4dDqyGGie3n/sIlpSIBuRc/HU0AE6uGVMfhrU+
 s853APhVDHnLVEQIgfgoKB4HODKqv1Wgj4T/c0bwT4iZi9CmMnxgE32GrRngvML9lZ4eXTsDQ7n
 h6K1GBww9HBsc/gwAexk8LKTIg6eXijRT3to/CV++QXqsGIUWzqPxbisqiurhQWnS3y5Bu79eK/
 vtOar+d2KWM3TV9Ni0ujFrHDTu5vibsyhdNdgWNqbyaR+JeIFXUoOtePzp6WlRZEMS+OpA0Uyxw
 HCMLYMlhacuawRf/uJ5
X-Authority-Info: v=2.4 cv=DJ+CIiNb c=1 sm=1 tr=0 ts=6953ba65 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=JppZAXPjAAAA:8 a=b_JMli5UIlt5Tm9dsTYA:9 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-GUID: carxnywWYml8JtP_bfebN58g1FgHtMvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=942 phishscore=0 spamscore=0 suspectscore=0 clxscore=1030
 bulkscore=0 adultscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512300105
X-JNJ: AAAAAAAB16aefhdp9z/pkituRZI4nAfgWhi3MOouJuVIdITiC4iSSb14pKOKsU7JVkNdt2jFdPMClFVciE8dXljuGNANzrh0H3qYYo7Sz3SXhyxBaEdqn06GAmhlfljLrZyf64ImjQGHPrB5aTCoy7rSHKAVXGaZrt+0dWQlAdHpODfq+WUV05UZ5QYDsX7gy1QX6ebczLqqQ97+KRY77FXpzG3YsrVC8V76V5wy91MWcLHo/fI88lmwsGjab6FrnMvBJD5fuHjcW3tBXUMBFwdjSGkznHdkRz9dti9tOFhqgtAr3XX2H7aCzHtmPy3SpBgR2XjJTtefZ6gOA/qxP/67II0qg/PrQA+61N1xIyydH7C1pWAB88IqMvFMoAnv8nu4NcIhB+GkFBMuIWAdO+YIBWQOZz+uu0+aqI6zamUw0wM06/82MbRq8yAUm+YV9QUHEPYdBvRTcISgV3y52BiwXQ6bVIpvoVs6Z+/Icjc9vzzkO6BYVMHxkc6t8TN5H3jlOXP4ZS+3gv0Svd+h2meJtuN3+z7fa6F4yOXIr9ImGhanCqurBuqqBS+DC860qT0B+X4u2txsUuEf8tSEAyH+8YEOxp29Oj6iW0CFzO/faMj8UswfjtBP6keDSBbQ+Bb4eEcsSbsLRAxG4LgxcmqQQOdxkEJeFlaT7SJkaeSGEZEKGB0/qdy5eetrc4DTcs5UncI2YA53d6bej3TGq/HRJ1DRSU7fI4iqMzM7ab5TTjdps/uBMBxtDG6YWZXNfieH4jePC31cQy/mekfoq8lBuew5np01VGLjPxDHeFbKgnwtmSDS

From: Brendan Shephard <bshephar@bne-home.net>

Update `page_align` doc tests to test `usize::MAX` boundaries
rather than arbitrary middle of `PAGE_SIZE`.

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
This change is a follow-up to:
https://lore.kernel.org/rust-for-linux/CANiq72mLPvB_6Ow3bW5-V4-km=RyA59chQ1g1x9qUt2P-zZweg@mail.gmail.com/

Changes in v2:
- Change test comment back to explicitly mentioning overflow condition
- Updated commit message to remove follow-up comment.

 rust/kernel/page.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index adecb200c654..c8dafdd843d7 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -45,9 +45,10 @@
 /// assert_eq!(page_align(0x1), Some(PAGE_SIZE));
 /// assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
 ///
-/// // Requested address causes overflow (returns `None`).
-/// let overflow_addr = usize::MAX - (PAGE_SIZE / 2);
-/// assert_eq!(page_align(overflow_addr), None);
+/// // Requested address causes overflow.
+/// assert_eq!(page_align(usize::MAX - PAGE_SIZE + 1), Some(usize::MAX - PAGE_SIZE + 1));
+/// assert_eq!(page_align(usize::MAX - PAGE_SIZE + 2), None);
+/// assert_eq!(page_align(usize::MAX), None);
 /// ```
 #[inline(always)]
 pub const fn page_align(addr: usize) -> Option<usize> {

base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249
-- 
2.52.0

