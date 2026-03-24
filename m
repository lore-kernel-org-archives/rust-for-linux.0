Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756D220687
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311520; cv=pass; b=aWkSQN124SK2WCr4vngnKVNlFAkCKCOEz3qfJKcbU0FWn0eyHxqc+Kq4Fj/JHaSS23US+ke8KuXRi+L0vch982TMAOXAo5QnTzrLjv6Ecrx6f9tFRJXVlX+Y3YZpXeOEQnbQBmMa6j8Zl1QaGNOdrmqEWr5aum+yvzyAGLd8LcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311520; c=relaxed/simple;
	bh=ZD0FI9lCzXdkh3ilykwTNd/boiD86hqMgBpYrQI1Qrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qk4RIbaGzDgX1dUoWJ7XS72a9DKG3gxQzHYGiEBD7zqbNtaGasG09UwYHG4Xssl2BF3X93gpXlIpJW/8NCwDtPKcZEQCg3n00KeFdjCL2lcPYrXHMf2uz/BvRZlSVofRAyjWk7dEDs6QyBIP87UmsW0C1FrJaLYvrHY3oN7Sjrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Y5G+3/a2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Y5G+3/a2"
ARC-Seal: i=1; a=rsa-sha256; t=1774311498; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DKNsun8WOeQVkX1bgOiHTIXKKF+AhIbWGdzIAP+1YaUrduDR+udY78JSkk+BCNqbovNy8GYbP/wcxpeDvcVLhjXtyZ96MTyFCM4F+ddlnlBKuNzQ7v0Gi8ShR9rkXAmEKgaFAhpGtnNUfqgxYhUVkrWBMwJcpFlDebBmRqAszfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774311498; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SRLxj9lbK9GZPnGxGYv92gtsUIqFfsc1swIOCPUuwFg=; 
	b=MnEv0G0qegg9hMc3jd/KCuJBTqulxtWIPFIlCuol+HSrlcfDd+E6prVXM4TS90xgJ2SdcTFDOxCkMBApD2MnfUuvBoFu5fz7Y+4k1K2kJ58uyYPXFQ6SJD4iQOPZN8ZLGk+7bjO74wre8FM6TmSFgmi0Vj1CV6nK0A4S3MYLBVI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774311498;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=SRLxj9lbK9GZPnGxGYv92gtsUIqFfsc1swIOCPUuwFg=;
	b=Y5G+3/a21EXqDvLTWMgMdMlUR4GiCuCcFa/cMrxsInf+NAo1RdsukuGwJSydq8Od
	G7py11PsMfEYrsuFQnzrL6WrM/D4jU5Pwjm6KSLYzi7cpfhyd7/4BH7oTFG+ZNL9Rsf
	TTgfpyLD/txGfQ0EY7I2KCcJqpH0GsPjiKl32+JY=
Received: by mx.zohomail.com with SMTPS id 1774311497987511.8775942826694;
	Mon, 23 Mar 2026 17:18:17 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 23 Mar 2026 17:18:09 -0700
Subject: [PATCH v3 07/12] drm/tyr: Add MMU address space registers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-tyr-use-register-macro-v3-v3-7-a87daf9e4701@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3709;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=ZD0FI9lCzXdkh3ilykwTNd/boiD86hqMgBpYrQI1Qrc=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkHbzhssyhZ9XKSSRGzTPKphzX/W6a9Y16x8vy1Iz3Kz
 g0bZmi5dJSyMIhxMciKKbKctTfqEa96b6Q7/38zzBxWJpAhDFycAjCRls2MDDdqv+6c6OYbY3OU
 eV9jZs5fz0Cn49ddI6tmVk+295xjsJ+R4f7mE3zcMz83y78wfhIiM63gww7uU+srdrTX8wi8ZTH
 JZgAA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Add a new module for the per-address-space MMU registers and constants.
Leave the more complex register field definitions empty for now; they
will be filled in by follow-up commits.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 66 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index f337d99387417a2eca94cd2d7ce8c8fa38bb1cee..428b6d8c4d6bfd341713bbb7d79e0556a2d04415 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -852,4 +852,70 @@ pub(crate) mod mmu_control {
             31:16   command_completed;
         }
     }
+
+    /// Per-address space registers ASn [0..15] within the MMU_CONTROL page.
+    ///
+    /// This array contains 16 instances of the MMU_AS_CONTROL register page.
+    pub(crate) mod mmu_as_control {
+        use kernel::register;
+
+        /// Maximum number of hardware address space slots.
+        /// The actual number of slots available is usually lower.
+        pub(crate) const MAX_AS: usize = 16;
+
+        /// Address space register stride. The elements in the array are spaced 64B apart.
+        const STRIDE: usize = 0x40;
+
+        register! {
+            /// Translation table base address. A 64-bit pointer.
+            ///
+            /// This field contains the address of the top level of a translation table structure.
+            /// This must be 16-byte-aligned, so address bits [3:0] are assumed to be zero.
+            pub(crate) TRANSTAB(u64)[MAX_AS, stride = STRIDE] @ 0x2400 {
+                /// Base address of the translation table.
+                63:0    base;
+            }
+
+            /// Memory attributes.
+            ///
+            /// Each address space can configure up to 8 different memory attribute profiles.
+            /// Each attribute profile follows the MMU_MEMATTR_STAGE1 layout.
+            pub(crate) MEMATTR(u64)[MAX_AS, stride = STRIDE] @ 0x2408 {}
+
+            /// Lock region address for each address space.
+            pub(crate) LOCKADDR(u64)[MAX_AS, stride = STRIDE] @ 0x2410 {
+                /// Lock region size.
+                5:0     size;
+                /// Lock region base address.
+                63:12   base;
+            }
+
+            /// MMU command register for each address space. Write only.
+            pub(crate) COMMAND(u32)[MAX_AS, stride = STRIDE] @ 0x2418 {}
+
+            /// Fault status register for each address space. Read only.
+            pub(crate) FAULTSTATUS(u32)[MAX_AS, stride = STRIDE] @ 0x241c {}
+
+            /// Fault address for each address space. Read only.
+            pub(crate) FAULTADDRESS(u64)[MAX_AS, stride = STRIDE] @ 0x2420 {
+                63:0    pointer;
+            }
+
+            /// MMU status register for each address space. Read only.
+            pub(crate) STATUS(u32)[MAX_AS, stride = STRIDE] @ 0x2428 {
+                /// External address space command is active, a 1-bit boolean flag.
+                0:0     active_ext => bool;
+                /// Internal address space command is active, a 1-bit boolean flag.
+                1:1     active_int => bool;
+            }
+
+            /// Translation configuration and control.
+            pub(crate) TRANSCFG(u64)[MAX_AS, stride = STRIDE] @ 0x2430 {}
+
+            /// Extra fault information for each address space. Read only.
+            pub(crate) FAULTEXTRA(u64)[MAX_AS, stride = STRIDE] @ 0x2438 {
+                63:0    value;
+            }
+        }
+    }
 }

-- 
2.52.0

