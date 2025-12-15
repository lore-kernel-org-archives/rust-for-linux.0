Received: from outbound.mr.icloud.com (p-west2-cluster6-host12-snip4-10.eps.apple.com [57.103.70.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4B32765D4
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765787682; cv=none; b=nGFdr77MX1YhFFp7bGp4yP/f7Y82rewAFAF3P3DgnE+0ivW5PSW4gogdBRf3Wlv38i1oirVNe6D9d9WbdIDrri+GJ72CvDrkDm1QeAAR04JKhDfDjFLq5MZf3LDi/VnbhleZy0U1Do2fdEQE6t2LeEXKL3LYXj2RhngAFBz+x9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765787682; c=relaxed/simple;
	bh=ovowXJmaa4+1ksLSq28rOa5+6pED2e/vkEXEKFLeH/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9fgr1fM8hLl1S40kNY/f0GCmejdeFV2UJhYUZO3lJEWzG2cqND/D/jSptSK1jpP/OEK1lcMvzzXMCIsNnTVLgqQfS5DRVVlSavf/pJ7jHSakSTL1zAqUFhLktJ0E4DqmEBq45+UvO9Rkng/F6VxkTjHj5m6j4rn8gLLcIR/xD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=hyl6IPV+; arc=none smtp.client-ip=57.103.70.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="hyl6IPV+"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-1 (Postfix) with ESMTPS id 2546F1800105;
	Mon, 15 Dec 2025 08:34:36 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=uwwg/9McXJj7Oq330haHnzUQq3y2iibMjqrcmLMasbY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=hyl6IPV+t+rQ2huSH+ZtvMSpipnjCX6WWU28mjTZUXfmtEcqabEjb0L9v3RzQOXbRNKgUujvL0HuAyvsiLU41/e/czG6Rm7jmTZTkstKs+OxAM3Gko6AVAZ57LAs5zYsLVyxBe+Ew4jd2MyGb8ZLpJIvGgZfBlK4BJfqZ7WmU7SoRtOhiDbn9YtPmGzfYbMS2HI8pkDEYOYipXHn3PEWh7fhmzys/jkLi9rpbdt9g8aVy7ytiY9tHQzRqyNIihEmKzc2WBI/7399r33LAfbHfMcWKH7SSToHNBxVJ16n4y1Ra4+xLxiaQt5cvF7lTtxNtRw4xrcBhQYvBFDvyHDkEw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-1 (Postfix) with ESMTPSA id A807E1800110;
	Mon, 15 Dec 2025 08:34:34 +0000 (UTC)
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com,
	joelagnelf@nvidia.com,
	acourbot@nvidia.com,
	airlied@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Brendan Shephard <bshephar@bne-home.net>
Subject: [PATCH v4] drm/nova: Align GEM memory allocation to system page size
Date: Mon, 15 Dec 2025 18:34:16 +1000
Message-ID: <20251215083416.266469-1-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WN6wJDRvtD-yUFu_zG_72qyJaUihvnuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX5MiCzsRH1NNY
 H+BoFLmlUPzz3zt/mQ87IzaJy4+VrPyi6Si2H89d2kLa1G+426HP3d9MT5bCnt1geJh5i3/Id3r
 JIsWOvLLiPOV+5aAgvOimLwcNplgWeSiY6VPRj3OPtCSxZj9AtV33bXWuFTGXHm9yKD24YG9KYF
 V2ja+7/G/pK6DSLw8HjjGNCwJyxWejSPtIQgBbeXmU2CKJE7kGGkAD7Fuh5meYsUqHz5JfTS4QZ
 C4rARJcPzFSJFjQrs7WZqLB5R7mlGBvB1Dw4FcLpX1DGyO0Nc0ibRSA/R4xxWYqPHrn9C9FHQwH
 cFL+5BsGGBHaXDpMU26
X-Authority-Info: v=2.4 cv=UNLQ3Sfy c=1 sm=1 tr=0 ts=693fc81e cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=frRGVck-aN2bEsA2AVkA:9 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-ORIG-GUID: WN6wJDRvtD-yUFu_zG_72qyJaUihvnuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 clxscore=1030 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=671 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071
X-JNJ: AAAAAAABNlK4TaBqZ4GA9dhroElKp3CeyRUf3F0p7DxwjpwOox9uqnbK5vklEhwfaVv7BlckK1pBc4bCO5HDFTbO3B8c8JJ311eyu7rTK3IfZW0BUOTZcFxnBjuflFEMqd5dCtQcvrTuCY35eE4JEzkkO2Po4huyNQ5ruDH7kE50HH9jcy9X/y2eGX2JmFhmwTnU/pOEYEu9nbV8sLlS5vpdRYIiVhtruHFP3ii6VP97rZCgIwb20UF1GO/7gvxtyi2ZogRNMj7SG/I/YUngCM5wSTwmXW2x1YjCTI2l9gWSaUTlwyFREX/KefNBKachQBiAFbs81F/gkPi72fV+TABRMp5TcWRavQICEJpfn9H5Plxy1EmGI3W5X92AOdtmbUXB76+RTrAZlT8IEKrp4pBFt0qn+81DfiRmJPZVco7sxB+EI78lKPZOVjAi2tRdZoyvpNdYhFQFGCMQ5lOc69Oam47Dto1rh026vxQMpBk2aTIFPM1WR2Q4iLsul5wO71zJtaZPWmalYRv97xy2+QbflQZOdkX/YmMJ8jOqtb3DIUMciaj56Tf+dsckdf/S4xiuQTNpuBB8A3OKzMpB7QZ8eoxMYjWry6pU0kb6y2b6vcIPOsFhFOeUiSrcJJBGBcuWgDxVAhSuC8nCGOQqS0N5n7pG+clLearXS3xqiuQZXNinlf8Z+Wvi7hy/Dw==

Use page::page_align for GEM object memory allocation to ensure the
allocation is page aligned. This is important on systems where the
default page size is not 4k. Such as 16k or 64k aarch64 systems.

This change uses the updated page_align() function which returns
Option<usize> for overflow safety. (See "rust: Return Option from
page_align and ensure no usize overflow").

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
Changes in v2:
- Updated to use the new page_align() Option<usize> return value
- Prerequisite patch:
  https://lore.kernel.org/rust-for-linux/20251204224006.353646-2-bshephar@bne-home.net/T/#u
- Link to v1: https://lore.kernel.org/rust-for-linux/98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net/

Changes in v3:
- Add back missing semi-colon after ok_or().
- Reword commit message to be more concise.
- Link to v2: https://lore.kernel.org/rust-for-linux/20251208064405.573026-1-bshephar@bne-home.net/T/#u

Changes in v4:
- Add back the size == 0 check;
- Rebase on latest drm-next branch
- Link to v3: https://lore.kernel.org/rust-for-linux/20251208071810.653223-1-bshephar@bne-home.net/T/#u

 drivers/gpu/drm/nova/gem.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 2760ba4f3450..3a3a41e8d4bc 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -3,6 +3,7 @@
 use kernel::{
     drm,
     drm::{gem, gem::BaseObject},
+    page::page_align,
     prelude::*,
     sync::aref::ARef,
 };
@@ -27,11 +28,10 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
 impl NovaObject {
     /// Create a new DRM GEM object.
     pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
-        let aligned_size = size.next_multiple_of(1 << 12);
-
-        if size == 0 || size > aligned_size {
+        if size == 0 {
             return Err(EINVAL);
         }
+        let aligned_size = page_align(size).ok_or(EINVAL)?;
 
         gem::Object::new(dev, aligned_size)
     }

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.51.1

