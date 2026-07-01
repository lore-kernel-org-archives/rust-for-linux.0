Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755E4BCAC3
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Jul 2026 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927680; cv=none; b=An8VcXq08Ud1ew5ZWroF+YHeaUZ/rAn6McMJi4xV0K4DI2pDTzVi5WO6kJ8g78EduW9oDkml8fFoceEojf1py84VUsb/nOCkL99YpAAU8gjZNek9joLdLzRTL3tl3OU6VJKQ57IqpIl3hYJ+iV2MErmyeLZAefmWB9wqHq94QXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927680; c=relaxed/simple;
	bh=j6gduB0AvMpfaZ6PkGQqj85oN4E9h+Fs6tZSvCEwBnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IMYg2aOkQ6sDpB+aYOz4PvBJtKLv03JBpODbk7B6soGC7UoBjE9WTwvJu+Nmz7G/BgS7zVDecpSZy6ecsor2iLljYsZpdJ0eBg/d8AD9OHNHjl0vzEUHar0yq9sz+EMdv24Hh8VOpRrps5jhkKRvCSJ6v5X7KYW9NTIQpr2pcNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=Z16+tfDS; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="Z16+tfDS"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso753514b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Jul 2026 10:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782927676; x=1783532476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzHdYWFcDkZu4PsS/Wd20QSDadRqyTQZHFMjtpnEEdU=;
        b=Z16+tfDSSPfp3KIVYO2Cd7EUZae8TgVk1nBC08wO6EuPuAcyWtlWV7MpMBp6cdAe7J
         dXLrzQ7dLQ7U+AM+2KfVwTsEgPZuofyd3feAEuGwfcGZzgORuZaKKOpk4/i2MmVtCl/y
         r8ASK0JPpnbDsz6m7FNXp+QlpPf0w6Nr8Ddt+S8LuET/QnCQtpJjGr53bNNwuYuosLsF
         H1OALnPn4jO50ttoxMZYuJSVuviQgJaUwkQ3aTsP0MFhLYUwHH/hLhhvqhnFPnWAJdPH
         3tdpbIFFa5jWAma6zgKLnZhDpv5WAfQ+AGfWNWoqrhECeR8AKWmEfnodqF94IKXSTmpc
         fZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927676; x=1783532476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzHdYWFcDkZu4PsS/Wd20QSDadRqyTQZHFMjtpnEEdU=;
        b=Fvj3c4NseGk+XKSai4BnuSR4cxg72+63GlYOQLRZBW/qmGtgTghkygzzkUhSaay+74
         FjBjGUvjL1VFCHCD4VG82ZwMDCOZhStipCV14sojABNbky/KDKfKZIdEHn4X1g/OTQA2
         tiDyY2z4nr5J395mEA+X7jKhwApFLrYcwHGfRX0mTkLA8+RNpStY4TnBPcOGUfwts2Ao
         Snljw5ypGIjQvTdId/xgl99GjNtJebl+3O1qCqQ01HUK9NI3/cPgDNUzy+EP8VqfFSA+
         BWc6Vr/lCDs/PvG4erU4Hurwftjdf7vE4a1y8i9+s7J5JSo0z6JJvqxDfjrMYNBAfF5P
         H9UA==
X-Forwarded-Encrypted: i=1; AHgh+RoQ7kJj+SC2eyvsUocgXoJtEgaSp1OoH6QQcdhfZzxOwZaaZ4LMwVxULk3z/fBcyqdNd2uI4nSRrzkxC/uWGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7QryAUylXMaEW+PNuccRD4bypU0nznyfop2nFGsH8LuEaVU6
	4+Jb0QUM+zBUU0VzVSnZrr/9NgEmAAO96jw3ODEAGx5l/6if406F2/4jNVutgmNqxCM=
X-Gm-Gg: AfdE7cnTeuVtoNZhomYObUMOu2CCT+LUd7Ssy9W/u5VlwWFbHpzCvtSopVGJEgdv6Oh
	E330Ol6Eahpl8Hfb9aX5SUdRPHmkgCAUWj74vQ1rL1PM/9aelRjP8C62fFf+lTSr05x2PlVuLt/
	Ihqx1SlPh87ua1zI2HXqLgxGqAwkAjXqkqeP7iooHJ7pjh4Sqr67zR01Pti8fD6kwEX/6vab9sF
	h/KBBvqwLaXpuJMv+PGLaYLo+QxB+u4mD5QAgx6kysxQ7Mds70Th6Ep8RLBJZzG0Sp8EpyEKLJd
	bWWyCbXkYNhMiEPPTNjqVLvrqI2lOwaFCFizQxhqs8NShcTObfo3I4EEtzUiraz634fKzhk0KVj
	cX+TQVUYbqgcQ9jAX90fnyo5njv4qjQx+JgvbhV2gqMWVRcbQ7QFZeS0gFW9WHm8mCGDCrGTn70
	d95D4TZc/VQlaG9yCKgWfgLoI2sQ==
X-Received: by 2002:a05:6a00:3485:b0:846:bc60:5bf8 with SMTP id d2e1a72fcca58-847c0673eb2mr2342327b3a.5.1782927676058;
        Wed, 01 Jul 2026 10:41:16 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc4d0sm150943b3a.3.2026.07.01.10.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:41:15 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	apopple@nvidia.com
Cc: nico.antinori.7@gmail.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH v2 2/5] drm/nova: use `zerocopy` in booter.rs
Date: Wed,  1 Jul 2026 14:40:53 -0300
Message-Id: <20260701174056.12604-3-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701174056.12604-1-niyudi.honda@gmail.com>
References: <20260701174056.12604-1-niyudi.honda@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In firmware/booter.rs, replace the following `transmute` traits with
their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware/booter.rs | 26 +++++++-----------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index acb7f4d8a532..fe9389b84b90 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -10,8 +10,7 @@
 use kernel::{
     device,
     dma::Coherent,
-    prelude::*,
-    transmute::FromBytes, //
+    prelude::*, //
 };
 
 use crate::{
@@ -43,7 +42,7 @@ fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S>
     let end = offset.checked_add(size_of::<S>()).ok_or(EINVAL)?;
     slice
         .get(offset..end)
-        .and_then(S::from_bytes_copy)
+        .and_then(|b| S::read_from_bytes(b).ok())
         .ok_or(EINVAL)
 }
 
@@ -52,7 +51,7 @@ fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S>
 /// Such firmwares have an application-specific payload that needs to be patched with a given
 /// signature.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct HsHeaderV2 {
     /// Offset to the start of the signatures.
     sig_prod_offset: u32,
@@ -75,9 +74,6 @@ struct HsHeaderV2 {
     header_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsHeaderV2 {}
-
 /// Heavy-Secured Firmware image container.
 ///
 /// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
@@ -144,6 +140,7 @@ fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>
 
 /// Signature parameters, as defined in the firmware.
 #[repr(C)]
+#[derive(FromBytes)]
 struct HsSignatureParams {
     /// Fuse version to use.
     fuse_ver: u32,
@@ -153,9 +150,6 @@ struct HsSignatureParams {
     ucode_id: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsSignatureParams {}
-
 impl HsSignatureParams {
     /// Returns the signature parameters contained in `hs_fw`.
     ///
@@ -170,14 +164,14 @@ fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
         hs_fw
             .fw
             .get(start..end)
-            .and_then(Self::from_bytes_copy)
+            .and_then(|b| Self::read_from_bytes(b).ok())
             .ok_or(EINVAL)
     }
 }
 
 /// Header for code and data load offsets.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct HsLoadHeaderV2 {
     // Offset at which the code starts.
     os_code_offset: u32,
@@ -191,9 +185,6 @@ struct HsLoadHeaderV2 {
     num_apps: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsLoadHeaderV2 {}
-
 impl HsLoadHeaderV2 {
     /// Returns the load header contained in `hs_fw`.
     ///
@@ -205,7 +196,7 @@ fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
 
 /// Header for app code loader.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct HsLoadHeaderV2App {
     /// Offset at which to load the app code.
     offset: u32,
@@ -213,9 +204,6 @@ struct HsLoadHeaderV2App {
     len: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsLoadHeaderV2App {}
-
 impl HsLoadHeaderV2App {
     /// Returns the [`HsLoadHeaderV2App`] for app `idx` of `hs_fw`.
     ///
-- 
2.34.1

