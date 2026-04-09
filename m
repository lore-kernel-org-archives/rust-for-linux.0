Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF730171C
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757149; cv=pass; b=s7gHAXp9vht3PIea5dlSH1WrLD4RX65hPRU+nQUOeNdmWLWP1wrIVHdoB8N3GjM4rxSGLw91iPXu+zZlZwN4ucQHe4ILza8byJ8tVN4B7qgH1SfftbCbCsdfLCJRiImT3xpgLk05XzCH9/JW/BNqr9HsWWFnvk/aA+wUbrV5RRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757149; c=relaxed/simple;
	bh=U4Mo5qHAfN23C3Us1pKDw9Vrh5J4p2HnA+B5El911Zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5xzpS9LraAykvBBbesPln2f3wMSXP5iMDsPaharTJ52C/pvkdkNGoEf1eNtQQFyaAqCTuWP1VBEWZLpaJeKjR17VhB196tT2VBpxYBTJAnux9XX1dgbst34493SbNbNcd9k4vjbHTHNgB3hCZbaaRe7YosBHW/laQryb6WyHJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=hzH4A8XZ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="hzH4A8XZ"
ARC-Seal: i=1; a=rsa-sha256; t=1775757125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VGmyfbuN8o3DKrZlll3LzYeS5tkrHyRneGUgj/Jt2ZXuN4JqXLR5yrLF0NMcyRwxSNC48xkiC3U94sYszVPPBzVlFmQWPR0ZrQmDD7JkgaM6lIj36Ztcj9dWlqutpLfCMNIc7WNw18lfG6uNzdRIB7SUF3+MgJAugwMTbwIHN7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775757125; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KKykM/DOeYzsGOYyYX+F0L5DTqjjPlEeuUNJeIEiJtw=; 
	b=K+ncvds6V80pzTYObPlg1QB5gIqNX5JF2nyh0W2m9No4/qOM+mewTSsyZ3HDO7lb9bYztUDd5NxsDCwKCGW5xqFO9xLAayiY/W/UC1NqVD/7Bogl5m253q8ZTwAo5bADdKPW2ReJ1cRpOwZC+YV+bSaisRrsCazvlZYFpnayGiY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775757125;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=KKykM/DOeYzsGOYyYX+F0L5DTqjjPlEeuUNJeIEiJtw=;
	b=hzH4A8XZy09PR6PylJGbds2uaOtPbaD9uii7EpzOuAcVcnenudFZnJ6ptWwwgeQl
	c+sS0foJx4ZeNsi5r9kGV6pXoPc3waAJWueQxXTTuw7mhzxm+vxYH/mIG5mvwpcVyWE
	asMIdD0SoY/CglWBZ9HV38HozDQIitYhX6rHsL7Q=
Received: by mx.zohomail.com with SMTPS id 1775757124561147.77731403905454;
	Thu, 9 Apr 2026 10:52:04 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 09 Apr 2026 10:51:26 -0700
Subject: [PATCH v5 3/6] drm/tyr: Use register! macro for JOB_CONTROL
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-b4-tyr-use-register-macro-v5-v5-3-8abfff8a0204@collabora.com>
References: <20260409-b4-tyr-use-register-macro-v5-v5-0-8abfff8a0204@collabora.com>
In-Reply-To: <20260409-b4-tyr-use-register-macro-v5-v5-0-8abfff8a0204@collabora.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Boqun Feng <boqun@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Dirk Behme <dirk.behme@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3847;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=U4Mo5qHAfN23C3Us1pKDw9Vrh5J4p2HnA+B5El911Zs=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJnXnzuoX6huZF2a/iou916OuaXCh4pKiwVCSXPZrk290
 qoR/zCuo5SFQYyLQVZMkeWsvVGPeNV7I935/5th5rAygQxh4OIUgIksUWD4Z9qRlt1y+mXxh4aj
 6+LbVWYapx96dcGse6Pr5rL53Zqu8owM/Z8mCVa/OpyX3p/V/td5aqnNgUuC89fO8vrfucB3b70
 RKwA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Define the JOB_CONTROL register block with the kernel's register! macro
and replace the existing hand-written JOB IRQ register definitions with
typed register and field accessors.

This adds typed definitions for the raw status, clear, mask, and status
registers, including the per-CSG interrupt bits and the global interface
interrupt bit.

This reduces open-coded bit manipulation, keeps the JOB_CONTROL register
layout in one place, and makes the definitions easier to read and
maintain.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 58 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index f7eea9bd81f1..946bb795d4ab 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -28,7 +28,6 @@
 #![allow(dead_code)]
 
 use kernel::{
-    bits::bit_u32,
     device::{
         Bound,
         Device, //
@@ -893,14 +892,57 @@ fn from(status: McuStatus) -> Self {
     }
 }
 
-pub(crate) const JOB_IRQ_RAWSTAT: Register<0x1000> = Register;
-pub(crate) const JOB_IRQ_CLEAR: Register<0x1004> = Register;
-pub(crate) const JOB_IRQ_MASK: Register<0x1008> = Register;
-pub(crate) const JOB_IRQ_STAT: Register<0x100c> = Register;
-
-pub(crate) const JOB_IRQ_GLOBAL_IF: u32 = bit_u32(31);
-
 pub(crate) const MMU_IRQ_RAWSTAT: Register<0x2000> = Register;
 pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
 pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
 pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
+
+/// These registers correspond to the JOB_CONTROL register page.
+/// They are involved in communication between the firmware running on the MCU and the host.
+pub(crate) mod job_control {
+    use kernel::register;
+
+    register! {
+        /// Raw status of job interrupts.
+        ///
+        /// Write to this register to trigger these interrupts.
+        /// Writing a 1 to a bit forces that bit on.
+        pub(crate) JOB_IRQ_RAWSTAT(u32) @ 0x1000 {
+            /// CSG request. These bits indicate that CSGn requires attention from the host.
+            30:0    csg;
+            /// GLB request. Indicates that the GLB interface requires attention from the host.
+            31:31   glb => bool;
+        }
+
+        /// Clear job interrupts. Write only.
+        ///
+        /// Write a 1 to a bit to clear the corresponding bit in [`JOB_IRQ_RAWSTAT`].
+        pub(crate) JOB_IRQ_CLEAR(u32) @ 0x1004 {
+            /// Clear CSG request interrupts.
+            30:0    csg;
+            /// Clear GLB request interrupt.
+            31:31   glb => bool;
+        }
+
+        /// Mask for job interrupts.
+        ///
+        /// Set each bit to 1 to enable the corresponding interrupt source or to 0 to disable it.
+        pub(crate) JOB_IRQ_MASK(u32) @ 0x1008 {
+            /// Enable CSG request interrupts.
+            30:0    csg;
+            /// Enable GLB request interrupt.
+            31:31   glb => bool;
+        }
+
+        /// Active job interrupts. Read only.
+        ///
+        /// This register contains the result of ANDing together [`JOB_IRQ_RAWSTAT`] and
+        /// [`JOB_IRQ_MASK`].
+        pub(crate) JOB_IRQ_STATUS(u32) @ 0x100c {
+            /// CSG request interrupt status.
+            30:0    csg;
+            /// GLB request interrupt status.
+            31:31   glb => bool;
+        }
+    }
+}

-- 
2.53.0

