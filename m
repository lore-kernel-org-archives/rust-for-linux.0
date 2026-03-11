Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7A395253
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270290; cv=pass; b=av7vOsoKzIB5tE54coQT/LDB/GPvktbq+RnS4F4NBlbcbsmyoXX02M2iTFVhbexMN1xqVU4xzCNOnqwEqO5ZHi/OSti7LvSra9/mSlRVRiZNTh5/yNAEVxs0dtL8QROHACJjej7E/kcQqReKnTSy4eoPzi0o/nagivRt6NYZhyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270290; c=relaxed/simple;
	bh=06ExSGn24vWLOw99M3+30bvXstMl4EQK0Pnzp69ZYog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qX/ZvA4GPCnUIvRosvopXTuI99KStaYjiAemXM8qGKHeL/C71chJvHwABEsQQSLzn4KzNmxuTNjqR2kVT2ACt4vFfpRfeo5UhCVjfLQt6yqUu+W3Ye/Q8ogIphS8KNblOp/xInkgpZlzTJuqXsWj4o0ZMwOmTtHC7XbPPtVdSoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=MjRxNsc+; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="MjRxNsc+"
ARC-Seal: i=1; a=rsa-sha256; t=1773270266; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UVw2Y7/nhZ7lmuB70zKQIKnHTgMj4PL5p15apV+Y4IMO3cE4vaNm2zmvswDKMW+5tKUnTZcckLqhicr1R6eha/ZJDG/icSuZMIWEXn/Bfx/9N+n2JMghaT1qLM+Zh2gdBnkGMbOK0DqjGc+7RHc/1Vo/6LIJTxlQDsSZq3JGlto=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773270266; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/KXitcpVSGBz2SJuIGeE+XwDvgTO+qpkt0vckACesbU=; 
	b=nH/njdIlbkDOmsGsit/MibEzs2bPV9ESt7Tco+VHSTNJE9dckX28O97HEb809Qu7svAy9f96FNj5lc1SW0HuD6s6wU9KEDEm7qwZxohlV1+uDoEUBJGSb6e8mEF93/S2J5EVRqImed0lQwwIo+lVBxxiFK1s95lDYFRdmq8oag0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773270266;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/KXitcpVSGBz2SJuIGeE+XwDvgTO+qpkt0vckACesbU=;
	b=MjRxNsc+WoeBDgeWXDj2m0GOpyBJsp4Q4HGENzYs5Bs8cyvGbGp5aWtvEPt8HLKa
	7FPlhuEs/GS0NLXRgrYP5XHMMvtAop3sIPwE5PhqIlJ3FDqazsk1PlI4o/u+l0Ib+tv
	/d/QQqzUiBXaV7LwNwIdEEroitB3ZKrCCviJlk9w=
Received: by mx.zohomail.com with SMTPS id 1773270265121368.4417805027597;
	Wed, 11 Mar 2026 16:04:25 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Wed, 11 Mar 2026 16:04:00 -0700
Subject: [PATCH v2 3/5] drm/tyr: Use register! macro for JOB_CONTROL
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-b4-tyr-use-register-macro-v2-v2-3-b936d9eb8f51@collabora.com>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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
X-Mailer: b4 0.14.2

Convert the JOB_CONTROL register definitions to use the `register!` macro.

Using the `register!` macro allows us to replace manual bit masks and
shifts with typed register and field accessors, which makes the code
easier to read and avoids errors from bit manipulation.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 58 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index ba61a3dbe2a3e6fa1169b03d4f62e82769041057..686986536297ac2cc53ff14b162b19eaa759c192 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -28,7 +28,6 @@
 #![allow(dead_code)]
 
 use kernel::{
-    bits::bit_u32,
     device::{
         Bound,
         Device, //
@@ -628,14 +627,57 @@ impl MCU_STATUS {
 
 pub(super) use gpu_control::*;
 
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
+pub(super) mod job_control {
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
+            31:31   glb;
+        }
+
+        /// Clear job interrupts. Write only.
+        ///
+        /// Write a 1 to a bit to clear the corresponding bit in [`JOB_IRQ_RAWSTAT`].
+        pub(crate) JOB_IRQ_CLEAR(u32) @ 0x1004 {
+            /// Clear CSG request interrupts.
+            30:0    csg;
+            /// Clear GLB request interrupt.
+            31:31   glb;
+        }
+
+        /// Mask for job interrupts.
+        ///
+        /// Set each bit to 1 to enable the corresponding interrupt source or to 0 to disable it.
+        pub(crate) JOB_IRQ_MASK(u32) @ 0x1008 {
+            /// Enable CSG request interrupts.
+            30:0    csg;
+            /// Enable GLB request interrupt.
+            31:31   glb;
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
+            31:31   glb;
+        }
+    }
+}

-- 
2.52.0

