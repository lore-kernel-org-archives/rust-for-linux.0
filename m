Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B21DFF0;
	Fri, 11 Sep 2026 00:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085202; cv=pass; b=Wtqve+P/uflaIBYVRFK1wR/nl/ErHOVVZXKziRoGcz4x+pR1XIn+RgcrgAY3gt04rCvj7K4M2uscCP3l34wejAaMyiTLbJNrRTwCm9XfAuKNUJclneUc6ObQ/fJr2hpqyVsr+06lLF0cCPIsoIJ6tEEVpy9nH4Ar9qsYW35DylA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085202; c=relaxed/simple;
	bh=tKjdn9Vn3pQSgt7PGipa416Xnyoc39Jsc48mxcEuARE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y525irrQ3Cr/Wz9qSj0Hyg9zK4cTp0knY/TrhBB5iJ6Iq9JlAyP0b4E6CQ/Ooy7in5Oa9GiCWZpOn7shfe3u16n39irFu5qRSLVFSX0wz3j4j74dsSTZoYzQUZ8EQy6JmP2WcxRBAIwH/cZjKBiHDYku1b60zbmmwg/ClIek6K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Fbj5gbsY; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Fbj5gbsY"
ARC-Seal: i=1; a=rsa-sha256; t=1789085189; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eDUETEdFEs03QNAP4rG9m9EaPhHMhzP9QlCnDXvfuE19bpXD98khTSzk4Uq2W+uo/oi/3DORdT/firTYeuvN9npDo+um4+WDfiytFHjy2IgIdWeCvcxSX/2INMlR0mwl8m1qrgBiMQj5hALLYeuJgDG3d1cqh/tQcVgWa+5syLQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789085189; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xwnBmmACncmIplPNRZzLr43OgRegovVIyfRRBkQb6Zg=; 
	b=IJazjr+01rgQi+oDrJ/qiZEMq7hiQGmyLDhPLj0PHCK7SCBGcfVrVQvSaZ3ouuECYReQclUjt4xLZYstR5arSFDagLuCpxwABpk+N4CopQevkA2Hkdet7HJ4+pxRds7ihYE0GxsPccrP9+iCedUzfNYQUkN/t/HDSNhobEj87jg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789085189;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=xwnBmmACncmIplPNRZzLr43OgRegovVIyfRRBkQb6Zg=;
	b=Fbj5gbsYKyczQ9oaXFrFOmMsn/iI1siiWPpymzS4C+LUKpXr6nfZht7tsvdfY611
	ZBYPHL0y2FsIMqNW6FAUORT694z07hHQ7zjwHnlKfqbEOPVFE9cNgOWk+w1YWgetHNC
	Y43+9W1A/ob9uiLBqrwYXN/7O4Y+y3QhiQq9gk2U=
Received: by mx.zohomail.com with SMTPS id 1789085189322917.5264316778831;
	Thu, 10 Sep 2026 17:06:29 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 10 Sep 2026 17:06:26 -0700
Subject: [PATCH] drm/tyr: use bitfield! for non-MMIO fields
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-use-bitfield-v1-1-fdddfccff73b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3M3QpAQBBA4VfRXJuaWT/hVeQCO5gS2kVq8+42l
 9/FOQG8OBUPTRLAya1e9y2C0wTGpd9mQbXRYMiUVDPhkOPlBQc9J5XVYsHGcJ6VVDFBrA4nkz7
 /se3e9wPEH8uTYQAAAA==
X-Change-ID: 20260910-b4-use-bitfield-512214360810
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, gary@garyguo.net, laura.nao@collabora.com, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2867;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=tKjdn9Vn3pQSgt7PGipa416Xnyoc39Jsc48mxcEuARE=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFmL3Vg0nv7QXf36wrK3v1/f4F78tdOub8ZGbpuDV+oz2
 i6wfIw+2VHKwiDGxSArpshy1t6oR7zqvZHu/P/NMHNYmUCGMHBxCsBENCsZ/hlHvt5wV0d33ldt
 y1u3zJZNj60rkF7r27Tse/PjTWvC9xsx/LNV1tx+Zv5ZhTsq15v1LRjeaD598uJn6nvNdXdn7jn
 oy8kEAA==
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

SectionFlags and MMU_MEMATTR_STAGE1 describe bitfields rather than
hardware registers. Use bitfield! instead of register! so they aren't
confused with actual registers.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/fw.rs   | 11 ++++-------
 drivers/gpu/drm/tyr/regs.rs | 11 +++++------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
index 7edb5eff1707..8d11f888a9b9 100644
--- a/drivers/gpu/drm/tyr/fw.rs
+++ b/drivers/gpu/drm/tyr/fw.rs
@@ -14,6 +14,7 @@
 //! [`Section`]: crate::fw::Section
 
 use kernel::{
+    bitfield,
     device::{
         Bound,
         Device, //
@@ -27,7 +28,6 @@
     },
     num::Bounded,
     prelude::*,
-    register,
     str::CString,
     sync::{
         Arc,
@@ -39,8 +39,7 @@
 use crate::{
     driver::{
         IoMem,
-        TyrDrmDevice,
-        TyrRegisters, //
+        TyrDrmDevice, //
     },
     fw::parser::{
         FwParser,
@@ -101,11 +100,9 @@ fn from(value: CacheMode) -> Self {
     }
 }
 
-register! {
-    base: TyrRegisters;
-
+bitfield! {
      #[allow(non_upper_case_globals)]
-    pub(super) SectionFlags(u32) @ 0x0 {
+    pub(super) struct SectionFlags(u32) {
         0:0 read => bool;
         1:1 write => bool;
         2:2 exec => bool;
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 0c419c4e1186..3377b8fc5029 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -986,6 +986,7 @@ pub(crate) mod mmu_control {
     /// This array contains 16 instances of the MMU_AS_CONTROL register page.
     pub(crate) mod mmu_as_control {
         use kernel::{
+            bitfield,
             num::Bounded,
             prelude::*,
             register, //
@@ -1130,14 +1131,12 @@ fn from(val: MemoryType) -> Self {
             }
         }
 
-        register! {
-            base: TyrRegisters;
-
+        bitfield! {
             /// Stage 1 memory attributes (8-bit bitfield).
             ///
-            /// This is not an actual register, but a bitfield definition used by the MEMATTR
-            /// register. Each of the 8 bytes in MEMATTR follows this layout.
-            MMU_MEMATTR_STAGE1(u8) @ 0x0 {
+            /// This bitfield definition is used by the MEMATTR register.
+            /// Each of the 8 bytes in MEMATTR follows this layout.
+            struct MMU_MEMATTR_STAGE1(u8) {
                 /// Inner cache write allocation policy.
                 0:0     alloc_w => bool;
                 /// Inner cache read allocation policy.

---
base-commit: 73e5616f3d197c1af5a04a481fe0f13aa3913bd1
change-id: 20260910-b4-use-bitfield-512214360810

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

