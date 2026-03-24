Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F8D221FB6
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 00:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311528; cv=pass; b=kiHS2FwZ0jsWoCBBKnUL9KtPGngSFUZSBsDy3qyqheFv3PuF22OtftqlXwO7moTWyR07HGND0JXks3njk4TMhHsSRT/yg8MzxWsyowyiTiRwL43QXS/flx72lceDcIjlI0w9esDLv5ND61BQ+/Bt4SDTCBmWhHzApvwNQQtIWOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311528; c=relaxed/simple;
	bh=TYEdoU1zwslXb0KMnrr0+nLN8KO78Dq9rlOOiegf9ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OmpOwLgAdzoZ/GsL5n1/vWZxTeXI/C4QlV9+89WQWOkvneN0LKkBH3RYZtoxBDrTVOgcZdcZ8H5Lzj2d9Y9FXHV1ilszV38VM9lew2XzWXnJDT/221UehLUNm3YZQ2z01vmAssQ1rrczLP47eKzmJgshluRHGZzsGhrnVCDitnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=KSIEvKaz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="KSIEvKaz"
ARC-Seal: i=1; a=rsa-sha256; t=1774311506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QUegx6mofNODLPeZ3Ct6Xdgam2hMr5bxrh6saZoHbXSToHy8+YDd9z6RlPSg4gr6mINkSuEbmhvnykJybAdfdVn8qnTVzIiRLO+n/NhsWkK+NpODpjTitYVMDNOqUtG68HUFvRHjKdNvjUMA/XmrQVLyITZwy3b6WYE59bbOCqk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774311506; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4+RgS92/EWoSjpmuwKSsluUf92gmBEDb9YVjt6U5Qro=; 
	b=gdDfmcZTxUaUZQ8N7nrRVmgX8DvmJpYHlUYlOn9WyXVLFZJNE+uV8ELopu+Spx7xm5hC+B1fuA/wRsx+xrUfO/EHCRwJTv39iWdz1xiVQCNwRn2yoaicfPuLE2KBtzGik+68beExHKc5EV0xe7OavLresvgMrd12iRujpxno5kA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774311506;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4+RgS92/EWoSjpmuwKSsluUf92gmBEDb9YVjt6U5Qro=;
	b=KSIEvKazKDWqWDh/5syaXqiyWx3JPtl8GnwJ+foKouDNKZCUN3zZLeBvvDowFaO8
	GFr2j7OG0N7z08tReX5Cdi40xId87wPgCAv5RWo1WEJrLt09dHbGqd7cZt3anc7R9mA
	qb/WaT7NNqUejVo61G1N8GDSHYrYBGGb7R9WjEyQ=
Received: by mx.zohomail.com with SMTPS id 1774311505084759.9681303949249;
	Mon, 23 Mar 2026 17:18:25 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 23 Mar 2026 17:18:14 -0700
Subject: [PATCH v3 12/12] drm/tyr: Add DOORBELL_BLOCK registers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-tyr-use-register-macro-v3-v3-12-a87daf9e4701@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=TYEdoU1zwslXb0KMnrr0+nLN8KO78Dq9rlOOiegf9ow=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkHbziYihV2L09cv+pV1pOnYiETNO8HmLsc1bjCFjN9U
 qvOQfamjlIWBjEuBlkxRZaz9kY94lXvjXTn/2+GmcPKBDKEgYtTACYSZ8LwP33bvI++B2QDIw5b
 FLwXr/G451v6Pmuac+3k7x8bI79slmb4H7RVh0nqslP25oBIf9WLe+b5Tz/82HHfi5Z5nrrenHa
 ibAA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

DOORBELL_BLOCK_n[0-63] is an array of GPU control register pages.
Each block is memory-mappable and contains a single DOORBELL register
used to trigger actions in the GPU.

Add definitions for the DOORBELL_BLOCK registers using the register! macro
so they can be used by future Tyr interfaces.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 7e895b6e7deccc049a0ee3963d511c4b579e5ec7..9c1da1f039ccf9fc118def974d48dd40c17f4305 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -1474,3 +1474,25 @@ fn from(sh: PtwShareability) -> Self {
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
2.52.0

