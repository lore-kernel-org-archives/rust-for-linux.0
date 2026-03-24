Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC617B418
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311518; cv=pass; b=Zyp+OeCRzQLRARp+rB/2jEdwax7E8bSbJmIrV90zOlxLLaKuRnfKSgZEV8zvb4Rh5dgeubr8BfQN0y+IlkCN0EjnqhW8xp0aNAAUSQYjnwzOMwiXjUT6lcOLhzSfN/Fz/TaMvD4fUomYCQW4oyzYyzOeo3oybjETw/Lcb+E/8v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311518; c=relaxed/simple;
	bh=OmIqGZDRmOc8/bnH9bmJn0sqwWZy90kkqhVRRZLR6b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5JAkEoW5DBPJDhrAOZaZzQPLPLM5n5MsRjlUxKOtjcyuh9FgOeTSPdwGxwZn2Az3B1uvZ0mfSSOdI5YMPuEYwHb1XWc+K4jM8yuuqk7HrEYhXK+NUzwAwRVRW3TNmwUDJsTB7/78w808mAm4WLVgaOis1QyrJjClXsTC2XOoGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=cnitm5UD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="cnitm5UD"
ARC-Seal: i=1; a=rsa-sha256; t=1774311496; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Sj+DQsvqopMycLoFbh0EGdikwZ3/GibY8lx8dVQL29VCuE5r+XW0uEkE1VUHXU2sR4bigq6FOXlWFNKILmebE02Vmpxa8iZGjbUoCfWd9BicDV+hCE2XFPAEayMvSAWZ25e8E0E5l+HNFEZpuSuGlE9wS2SQtlZLPeRlD+jQyLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774311496; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qXRvJd6+m3O5G4DlURQ5Y7lTgpWTQVsqYJTF/FLYwV4=; 
	b=TOh9OzvUlWc6x36mvG17Pxj8TrSIQH4L2nMJm9dBU2RypC3Gr2AblutSsDaGaEwNXfjTz6g21abHzkKZF0If4UN2tTPjy2DZj0K2/Mgc88xFIXMY341WMOQXG7aCrxJ9zkPUrI81F5JdtqqMAA6h0QekDVyhGkQoi/a4Qva/RQI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774311496;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qXRvJd6+m3O5G4DlURQ5Y7lTgpWTQVsqYJTF/FLYwV4=;
	b=cnitm5UD6TjJmrhM8lbH4JVpQKohO824InzfGpF0cXqtSdwHG3VlmHEp1DSAOG/0
	R+Mj7uJgWGLzFF48vdUDKbLajGQ6XMWTO6BYB9k6BO4R06FPGrZSFnYDzrnxXY+C9us
	ZahiupgxBkWY7U2KrC1X6RF0rN5wtCMjMXdrLVhE=
Received: by mx.zohomail.com with SMTPS id 1774311495798139.93157095048173;
	Mon, 23 Mar 2026 17:18:15 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 23 Mar 2026 17:18:07 -0700
Subject: [PATCH v3 05/12] drm/tyr: Use register! macro for MMU_CONTROL
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-tyr-use-register-macro-v3-v3-5-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3448;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=OmIqGZDRmOc8/bnH9bmJn0sqwWZy90kkqhVRRZLR6b4=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkHbzhknY+vCPh7+9XND65PrO6zsbTI3WhlZRHJ4VhVe
 vDJ4c/FHaUsDGJcDLJiiixn7Y16xKveG+nO/98MM4eVCWQIAxenAEzEegHDP8v9IV81l34MUGdc
 87F00cJJx3O5Dh94kDjXc8Px1P9uJ1gYGVrfSaorOl7YfE2oSatOadnLu1NixLlXB3rlLFz3tyN
 JlRkA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Convert the MMU_CONTROL register definitions to use the `register!` macro.

Using the `register!` macro allows us to replace manual bit masks and
shifts with typed register and field accessors, which makes the code
easier to read and avoids errors from bit manipulation.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 56 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index bae3f917dd3ad3fe0dfd8425a119347f9d1ebbe8..869bad81d988b4c3d4d65e014d646b6db568e919 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -786,11 +786,6 @@ fn from(status: McuStatus) -> Self {
     }
 }
 
-pub(crate) const MMU_IRQ_RAWSTAT: Register<0x2000> = Register;
-pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
-pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
-pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
-
 /// These registers correspond to the JOB_CONTROL register page.
 /// They are involved in communication between the firmware running on the MCU and the host.
 pub(crate) mod job_control {
@@ -840,3 +835,54 @@ pub(crate) mod job_control {
         }
     }
 }
+
+/// These registers correspond to the MMU_CONTROL register page.
+/// They are involved in MMU configuration and control.
+pub(crate) mod mmu_control {
+    use kernel::register;
+
+    register! {
+        /// IRQ sources raw status.
+        ///
+        /// This register contains the raw unmasked interrupt sources for MMU status and exception
+        /// handling.
+        ///
+        /// Writing to this register forces bits on.
+        /// Use [`IRQ_CLEAR`] to clear interrupts.
+        pub(crate) IRQ_RAWSTAT(u32) @ 0x2000 {
+            /// Page fault for address spaces.
+            15:0    page_fault;
+            /// Command completed in address spaces.
+            31:16   command_completed;
+        }
+
+        /// IRQ sources to clear.
+        /// Write a 1 to a bit to clear the corresponding bit in [`IRQ_RAWSTAT`].
+        pub(crate) IRQ_CLEAR(u32) @ 0x2004 {
+            /// Clear the PAGE_FAULT interrupt.
+            15:0    page_fault;
+            /// Clear the COMMAND_COMPLETED interrupt.
+            31:16   command_completed;
+        }
+
+        /// IRQ sources enabled.
+        ///
+        /// Set each bit to 1 to enable the corresponding interrupt source, and to 0 to disable it.
+        pub(crate) IRQ_MASK(u32) @ 0x2008 {
+            /// Enable the PAGE_FAULT interrupt.
+            15:0    page_fault;
+            /// Enable the COMMAND_COMPLETED interrupt.
+            31:16   command_completed;
+        }
+
+        /// IRQ status for enabled sources. Read only.
+        ///
+        /// This register contains the result of ANDing together [`IRQ_RAWSTAT`] and [`IRQ_MASK`].
+        pub(crate) IRQ_STATUS(u32) @ 0x200c {
+            /// PAGE_FAULT interrupt status.
+            15:0    page_fault;
+            /// COMMAND_COMPLETED interrupt status.
+            31:16   command_completed;
+        }
+    }
+}

-- 
2.52.0

