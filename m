Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAA62D3EC1
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757153; cv=pass; b=k9WVb67IX05g/W3Qw+7Pq/Oe4LRe44cW7khiZTygHsUkWKrOOv6j6y7cKxt4sIlaB6SyAY970PUjXQ5VTT/XjsHrTN3x+O1oqperOo9q2nl0Sag6M+QfEta5g3FLr3/Ey2KbgqP4BnEts/ObioeIgleCSv/JWRtmRuJmAP5EFCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757153; c=relaxed/simple;
	bh=cHgzZgQLQAOK84w4BfVsSPdNFngqxTZOnfGB3SV3IX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CdycFuGKxKOuFtpeJaZXUBsn4BzmNYPUjTuePQ6uH2EZgNEdYsmWvFGuan8E9kKe/c1g2d7WWN1Xo3Pue+b+quPPzGDI1hYLAeiwsnLpH32BlRvll7ovUbyJSy3sviz5rMvtdNrEYnDHkg/8aduXIMAqNcQ4JIPuOoARR4kqO0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=CVaBKQD6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="CVaBKQD6"
ARC-Seal: i=1; a=rsa-sha256; t=1775757129; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I4oeKTNm4gcP+LxsFCO9ERY69FDV+3n4ICYSX2d+B1Vw1g4FshS7BOFnytQVyNY5Qh5MpskKjtmJOEcLIre0ovn/3EVj5XcM5sXiwq09HZKxC2GhD+ZiQNhAUrtaZyBAlmp+xvcJE+dhYdmDKK652pyvBc3t2MjudBtkdUSmxoM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775757129; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SO5AtVKALT95olzMBkfm8nKp0IfRYXgzoabCcR0BZVQ=; 
	b=HZRlQbLtZnLtRCSMjNy5kg/SZIBxQ6zusE6zv//bVWPB5BTFTWLvIQkCCXfgY7270QJCaSoVA084R4qhFmpFzuWg+gtl9lDqvFjZuwTiarbuMXTlVFe59N8xJdb6ls40KvX9uNHM2YTXlHmLtn9Bhj7K+QfaCK2XVTJJsk3ciPs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775757129;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=SO5AtVKALT95olzMBkfm8nKp0IfRYXgzoabCcR0BZVQ=;
	b=CVaBKQD6J7X0fXg9qdbq865YcCMqFCwIkNs9o0zTLa5wccH/JzPQPskidSsFDkzg
	kdvQjAX6VQGSgy2aYJ38YfVQX2Wutewm0NP+frNiwW0SRYynuV6y9PVtxqYyYE/qOOE
	95/KQ7J41/KLNbG2gWnocpGv+o8eoXCPb4WtmTGY=
Received: by mx.zohomail.com with SMTPS id 1775757127467615.3333939400851;
	Thu, 9 Apr 2026 10:52:07 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 09 Apr 2026 10:51:29 -0700
Subject: [PATCH v5 6/6] drm/tyr: Add DOORBELL_BLOCK registers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-b4-tyr-use-register-macro-v5-v5-6-8abfff8a0204@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=cHgzZgQLQAOK84w4BfVsSPdNFngqxTZOnfGB3SV3IX8=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJnXnzs0+8ke//jGoVn4XHtCr6S1zbMZokIPKmcatnD23
 HD/61XSUcrCIMbFICumyHLW3qhHvOq9ke78/80wc1iZQIYwcHEKwETeb2dkuPhh2bb1Lq+OhFa0
 r0ubNP/Pi/9FYhvsstP3eZ947PJjzxVGhk/LLhzUFHowbQaPw5I5WoFTJqpGHXU1Vm04Wp+vmmo
 uygkA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

DOORBELL_BLOCK_n[0-63] is an array of GPU control register pages.
Each block is memory-mappable and contains a single DOORBELL register
used to trigger actions in the GPU.

Add definitions for the DOORBELL_BLOCK registers using the register! macro
so they can be used by future Tyr interfaces.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 97de0a735ff8..9963294b8625 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -1631,3 +1631,25 @@ fn from(sh: PtwShareability) -> Self {
         }
     }
 }
+
+/// This module corresponds to the DOORBELL_BLOCK_n[0-63] register pages.
+pub(crate) mod doorbell_block {
+    use kernel::register;
+
+    /// Number of doorbells available.
+    pub(crate) const NUM_DOORBELLS: usize = 64;
+
+    /// Doorbell block stride (64KiB).
+    ///
+    /// Each block occupies a full page, allowing it to be mapped
+    /// separately into a virtual address space.
+    const STRIDE: usize = 0x10000;
+
+    register! {
+        /// Doorbell request register. Write-only.
+        pub(crate) DOORBELL(u32)[NUM_DOORBELLS, stride = STRIDE] @ 0x80000 {
+            /// Doorbell set. Writing 1 triggers the doorbell.
+            0:0    ring => bool;
+        }
+    }
+}

-- 
2.53.0

