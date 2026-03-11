Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0D036D4E0
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270299; cv=pass; b=dqGf5JKKHEEYw3crScfiJFokZ28KJffWfTTYP7/xz6bOCB7TkeZaj6ESNBf7zQjVlyOH94fSYKlSLH4PixNTtL2SfDOLopc98Sj7KpdENjZVrc0PIovV0DrMDiPSKGUppXyAWqhbpd4StOuuNTUoIxgYOB9krqOaLOf2FsXj554=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270299; c=relaxed/simple;
	bh=XfCIAkRr7xzij5JValLmVVK5z0Qo2v7kZ4LG7dnmeHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tMt6xVs0mXA+OjO2lf54ue307zJkn0sNkIXPKS2a65J+IYDEvutwfkUYTDzFa/qmg1pXeSFSO3GVwiy6TJtnAvlmyKpsYpp6WuQXHfLgV/r1kIyFE4ypMP4LXAO0SabBmBXLdtS1Qw87VICZ328nTr5CHX8TuK6xOrJQ/Qcsl+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=O46IjCmL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="O46IjCmL"
ARC-Seal: i=1; a=rsa-sha256; t=1773270268; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SQDZm37uLwpZ4ZaDLqBKBFVrffi5OBD51jgyHNfxdBYXePZAQtNUv3pp6YDJFvFYAXgOfUEAV+lfKH+y+VWXGmDLqP3/gv+yPUwXmjf3ncTcCLaYBuZcdP2qETKSbPgYTZJGk+LUP+PpCpT0IwN1w3nNZm/DE02Y3a+fA4y9rx4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773270268; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YWaQCjur1qLs7EHJuXgC59FC6XzP9m/AUs9dOVn+9mk=; 
	b=bl7noRPuoPxuQNsZ1A34USo3WhkiyGDNJMBcZMfNTo39i1OfWWuPj0oIUphRDsB81qHPEWooNnQlRe2oIQcsjVzATFuKKERi76V2xISzO7JPbDPhcLeWmuXxTv1O7SNk7M+KsGvuJlP8esKramjUHjCxCaW07sTuYpHaMdM8FDo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773270268;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=YWaQCjur1qLs7EHJuXgC59FC6XzP9m/AUs9dOVn+9mk=;
	b=O46IjCmLITY+yDOmr2asYgQ7z7K2UTfZfkZBMr4o3kz5OXWyKHUtG76Aqe+2wyGu
	tc9wdJICkLKwCLTGj/ImsXL29jtZut/MXygzKmB7/YjG4lMDD/sg30QYlvqCnMgw22u
	Y1QI4oOSLAr6xIjyAKmNL4qkPNU4wQD/qraLL8GQ=
Received: by mx.zohomail.com with SMTPS id 1773270267115446.49329034703123;
	Wed, 11 Mar 2026 16:04:27 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Wed, 11 Mar 2026 16:04:01 -0700
Subject: [PATCH v2 4/5] drm/tyr: Use register! macro for MMU_CONTROL
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-b4-tyr-use-register-macro-v2-v2-4-b936d9eb8f51@collabora.com>
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

Convert the MMU_CONTROL register definitions to use the `register!` macro.

Using the `register!` macro allows us to replace manual bit masks and
shifts with typed register and field accessors, which makes the code
easier to read and avoids errors from bit manipulation.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 56 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 686986536297ac2cc53ff14b162b19eaa759c192..6c16a041ab3c36f8aaf785487ad61925be65a026 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -627,11 +627,6 @@ impl MCU_STATUS {
 
 pub(super) use gpu_control::*;
 
-pub(crate) const MMU_IRQ_RAWSTAT: Register<0x2000> = Register;
-pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
-pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
-pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
-
 /// These registers correspond to the JOB_CONTROL register page.
 /// They are involved in communication between the firmware running on the MCU and the host.
 pub(super) mod job_control {
@@ -681,3 +676,54 @@ pub(super) mod job_control {
         }
     }
 }
+
+/// These registers correspond to the MMU_CONTROL register page.
+/// They are involved in MMU configuration and control.
+pub(super) mod mmu_control {
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

