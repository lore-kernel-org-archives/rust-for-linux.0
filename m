Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916442D7817;
	Sat, 26 Sep 2026 00:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382395; cv=pass; b=onDwj8asuf1Gn+fNLZzc/RP0D9YNOrXI3gMi7fWJTK3MxZ7q59TKoGLngyf5y6PgeqCngkJdwI7uXdJhOV9FRstCIFR+3HwkXAw1gD7e8/E+83Bb8KsfI/VFAgKYveDdMX+ArxJaOUC/pGGP9QcGBfEI3LfXBsv5CdOwC7T1xk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382395; c=relaxed/simple;
	bh=PBKKcIb4x7vkAuXdgVhWKORjRk5Ooj6YTN+6g27oGU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nC22C+0mR0OSWL2t9g5Or+ZW83hjBUfKJsmwRMQPq9oaEr6rXdoYZYpXoFlQwW8SzgpkEjPDRJNr2faZvf5R5im1Tk7UEBLrLFXPxR/N76m+ke8NIGyZTUxilQk68hekBdpQV4XDYwRxydnFbw7bt4Q2d31+XvEjwX4UOCb+K3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=ZDSQyQSV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="ZDSQyQSV"
ARC-Seal: i=1; a=rsa-sha256; t=1790382374; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dsFQP8vjuv12SGonwrGySuKPzZ7Lj6zD3khoPvpF/DRN+VCLMQThKDJV9kq2HKY20/FRZjyMHg3yu6pNaTa78M6EImfKFSn5jioJ9QUQ5YnHL4ilzHmfC9cEJEu0sMNkGU1NL7PuOArlzFTFcUCQMKNBcUZEEA60w6NQtH9MRY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790382374; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2doe4JgPHXKOL+ZhJIaQEW0w8eMvpmZvaI6OVwJAMT4=; 
	b=hCLtoLY5v0y6douCdo95xLmJKly+xC1CQClfHjpf/D4eKi/9VJm3xKOItTCVZh89DwoB2lWAOUq8ubzWK3Frutx+EC2t/MOJetGaaQLtGAV9MPKb4oAu0oHdmmpYVjT1kPsG1n599E5HZ0XrfGC9PFlAjNhClqi33jisP7+rT4c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790382374;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2doe4JgPHXKOL+ZhJIaQEW0w8eMvpmZvaI6OVwJAMT4=;
	b=ZDSQyQSV1fEw2j17XpVo0BymdKEEpngsP9DGgtdf/5KNLwTxvwBS2yrBWJhfUBXg
	OOISNSF91kj8WoD5TOOomqnbMOmaAT7GtOwSuoyOyFa1N3HHfcqzNGnAVW177/C0ETY
	5EZyQgaQW5T4xk6d4npZvcnSUWNDdPEPX+jiCYPE=
Received: by smtp.zohomail.com with SMTPS id 1790382373592300.4460771649002;
	Fri, 25 Sep 2026 17:26:13 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 25 Sep 2026 17:26:10 -0700
Subject: [PATCH v3 2/2] drm/tyr: safely write GpuInfo to userspace
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-b4-gpu_info_intobytes-v3-2-e19bcb71980d@collabora.com>
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
In-Reply-To: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2694;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=PBKKcIb4x7vkAuXdgVhWKORjRk5Ooj6YTN+6g27oGU0=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFnbBZVmHQ3YYDr99Rz2436ZC05tk/2qOf3GW4sc3Ydcx
 +6W1d2V7ShlYRDjYpAVU2Q5a2/UI1713kh3/v9mmDmsTCBDGLg4BWAiG74zMvTr/zpaFGktETDj
 L9cS1eRqrbxO1fRHe3N1FQwZy9pPP2BkeG9x+vKn/9k6gbtvtnpMk98qOv2y8I69a84tKr96YcI
 EE1YA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Tyr creates the struct drm_panthor_gpu_info from the Panthor UAPI
bindings. It initializes this struct by querying the gpu and then writes
the struct into userspace memory faithfully byte-by-byte.

Currently, the struct drm_panthor_gpu_info does not have any implicit
padding, but if implicit padding were added in the future Rust does not
guarantee that it would be initialized. Then when Tyr writes the struct
back to userspace it could expose uninitialized kernel memory.

Tyr implements the unsafe trait AsBytes for GpuInfo whereby the developer
guarantees that struct drm_panthor_gpu_info does not include implicit
padding, pointers, or interior mutability. This allows Tyr to safely copy
the struct into userspace memory. However, relying on the unsafe trait
AsBytes is fragile because if the Panthor UAPI changes, the SAFETY
guarantees may no longer be accurate.

Instead, use the derive macro `zerocopy_derive::most_traits` for struct
drm_panthor_gpu_info. This macro will attempt to implement the zerocopy
traits for struct drm_panthor_gpu_info. If the Panthor UAPI changes so
that the traits IntoBytes or Immutable can no longer be implemented, Tyr
will no longer compile.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/file.rs |  2 +-
 drivers/gpu/drm/tyr/gpu.rs  | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 9f60a90d4948..ceadde976502 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -54,7 +54,7 @@ pub(crate) fn dev_query(
                     )
                     .writer();
 
-                    writer.write(&reg_data.gpu_info)?;
+                    writer.write_slice(reg_data.gpu_info.as_bytes())?;
 
                     Ok(0)
                 }
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index e1b04a0c5159..fde5bd0f87a1 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -16,7 +16,6 @@
     },
     prelude::*,
     time::Delta,
-    transmute::AsBytes,
     uapi, //
 };
 
@@ -134,17 +133,6 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
-// SAFETY: `GpuInfo`'s invariant guarantees that it is the same type that is
-// already exposed to userspace by the C driver. This implies that it fulfills
-// the requirements for `AsBytes`.
-//
-// This means:
-//
-// - No implicit padding,
-// - No kernel pointers,
-// - No interior mutability.
-unsafe impl AsBytes for GpuInfo {}
-
 struct GpuModels {
     name: &'static str,
     arch_major: u32,

-- 
2.55.0

