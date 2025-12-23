Received: from outbound.ci.icloud.com (ci-2001i-snip4-11.eps.apple.com [57.103.91.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3800D2DCF41
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498372; cv=none; b=TZsLv7FAXtNnQ6N1H/BJt0kgz1ar6cCtBeCCFLEYoncVD+7TN/t2wVBU1Fa7rRkfJ6Rxt0eLmZlYNySDDsVx7IKpWGfQ+T5CqlJjF8VkBQPSTO8UaYQpE112ZIua3VxG0iqOexwhgCR4SH1bRjfx7xbAbx7UPMw2XEfalJBGyy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498372; c=relaxed/simple;
	bh=mhmTdsP/w9E2XnhNAikzCSucBjacB0T2gtnej+Ehk6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GkirnjC8y3cnrTH3PAGXhvH2/CToPOiHu+S6D+bH5XCzFLwHyoTKPm/otbc7Wk0sERNb5cTRFdT/I9xFuI4dX8NN9mGNXmo+AnRVsOjEQaZ40NiaozJdPNws5KWzRCuFSrOaWPCN2CE5EY48CKKrKQp2llbNDcaeou1wEBrZtHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=kQcT6Jzz; arc=none smtp.client-ip=57.103.91.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="kQcT6Jzz"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-14 (Postfix) with ESMTPS id 056D9180008B;
	Tue, 23 Dec 2025 13:59:23 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=4GLUURIbbmGoXgSYRGqg/PlhHIgWAiP+GUolDaiEfBQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=kQcT6Jzz1WZa7+2Hup9xSp+i/Di0tCkYZ4VWKwUgz0R5vmpAbTPfcT3PCIkmdqvqddqq4Kk6I+UeSxQc36aVnthk4XWBsHba4TyqD3f7LwEHu5/iofszcbRaHqHDt5T8wG9awFRvybg8sBqt1BXo3l2huKAlJ50YbzikytBE9S/5JXXlb0d/2+LsJW0rLjkTH5DqoBofApl0aY9WGyhlPqB8lEC0tZQnuaGWinmOl0hih1L3qgx9cI2NnhBmXpAP8NnYLNVoCnYniyDX77T5y642t6SR6sqX0umFUeQKdniNu6ZQPc9AACwwbJ0SE8l3zwsWVvHL7rEzVEN97MGX5Q==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-14 (Postfix) with ESMTPSA id 7A69318001F9;
	Tue, 23 Dec 2025 13:59:21 +0000 (UTC)
From: Brendan Shephard <bshephar@bne-home.net>
To: acourbot@nvidia.com,
	aliceryhl@google.com,
	dakr@kernel.org,
	joelagnelf@nvidia.com,
	airlied@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	Brendan Shephard <bshephar@bne-home.net>
Subject: [PATCH v5] drm/nova: Align GEM memory allocation to system page size
Date: Tue, 23 Dec 2025 23:59:02 +1000
Message-ID: <20251223135902.35767-1-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info: v=2.4 cv=TLJIilla c=1 sm=1 tr=0 ts=694aa03c cx=c_apl:c_pps
 a=2G65uMN5HjSv0sBfM2Yj2w==:117 a=2G65uMN5HjSv0sBfM2Yj2w==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=frRGVck-aN2bEsA2AVkA:9 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExNSBTYWx0ZWRfX1tWZo8kC9pUw
 t2DxLAH5CEaiyjPAKv2K7UI7CZ94xzNG89VeRKy3SeVWUfoRpEURIr7w4FaQFUm13t1XWcNBkh8
 n3xaYIZcIUummm5ymLaKzLSzWmuS0B5EDt8KGFrwHxQ4j661hdCCTLel2olP3gPwf1K+lRyRz+C
 puaP2seH0OsjMrhcNj5kG3DQSC+YtZjHa+xUvHF0b0r1ChPyGylqPQVDTIkCe3El13UBTedDn/9
 YQQ422sSfhsiSnl1Xj1aIkgXbJA5eic0YNpTrWeWLZfcAbpuyRVOdTRDNGsqzWaG3uPX/Fhm4z8
 gVeF5CtNaFD/JdTKp8O
X-Proofpoint-ORIG-GUID: WKxpM-3LuiwYNVuVE4NxfFhRzOIPXINP
X-Proofpoint-GUID: WKxpM-3LuiwYNVuVE4NxfFhRzOIPXINP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 clxscore=1030
 malwarescore=0 phishscore=0 mlxlogscore=708 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512230115
X-JNJ: AAAAAAABevaXqdLRU88xTt0WzkI/Mvcj61PIYeD2hmcF6ljMkyyaZcZLBldUUoMzgqG6dGDz6Itwwczlons4acUuBz5TgzL0P7RYVBFpDcIljr+zB0TBuAiMoOS50GiOHWqMdg0MDsojUWMSmCSS7yGnGlWq0YFt482ZZ2al/Vs4uwmYNNqSDwEw4U0rAK+ZUH6XuPTbjz5S2V4FnGJnltbdWsmuEzeaooa+Ilnuvo0AbG71J+jOePkos7Ln3XAuaQnvLDrDB7qpA37dXW0ELPjo3UcXKLtn5RzfA2vmrTlUSNHVIemxDSHK8wehRdS8m/oQwx359LEMm782lqPC0HQiTlsofeSi38EPfQ1xXTOPvtRY28qX2tqtUiAn9SmFHPOvnduyg5xUFmTwGyF8k+eTORhtHexpar06f1OhV4uU/Oje06Jn1P/bwkQC3vmlHiYXKrcabbZ1n2YSsxYu0HcV2E70c8+HKjaqVCdPOvDiHAJiSaKH9WJ4Oe6skgjmlOtt4YDwXF70rHuoT9OTMm72CBjyOSkFssJWRjApFZAz9P/XPfL7clZ+x1XlJN3/yN6lrB15arCGRckhP5o3XJTFR5TbqN8S57r4F/iy5N3ylf8UvvdSkcAVsH5t/61TbZyiJNfEyEwFfSA9Y4d5fucCbbpFkdw22e0HERnKMUGmG2xqqLlisQ==

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

Changes in v5:
- Remove unnecessary variable declaration.
- Consolidate page_align call to use ok_or().and_then() for returned
  Result.

 drivers/gpu/drm/nova/gem.rs | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index a07e922e25ef..e1b57609b8f7 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -3,10 +3,7 @@
 use kernel::{
     drm,
     drm::{gem, gem::BaseObject},
-    page::{
-        page_align,
-        PAGE_SIZE, //
-    },
+    page::page_align,
     prelude::*,
     sync::aref::ARef,
 };
@@ -31,14 +28,12 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
 impl NovaObject {
     /// Create a new DRM GEM object.
     pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
-        // Check for 0 size or potential usize overflow before calling page_align
-        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {
+        if size == 0 {
             return Err(EINVAL);
         }
-
-        let aligned_size = page_align(size);
-
-        gem::Object::new(dev, aligned_size)
+        page_align(size)
+            .ok_or(EINVAL)
+            .and_then(|size| gem::Object::new(dev, size))
     }
 
     /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.

base-commit: b927546677c876e26eba308550207c2ddf812a43
prerequisite-patch-id: 7154ef17c3e40275152c90eff07bffcb5ef5e5cb
-- 
2.52.0

