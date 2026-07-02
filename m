Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6055047CC80
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993952; cv=none; b=UKKEwKGGsnxIWQUui/WISHQYbAW+8R9nNnfiDe0niTVFNkitesQLtZ8fdE67fzbuca8gP2aPeWVbFA7LkN44B2/U7bMb+hdr1iJQHh8mm1QK83PDUPYvowLs/GhDHYPI/Nkw0+YeRe7TQLZxbF8kgT28T7fKKonulWLHc9/Vn1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993952; c=relaxed/simple;
	bh=j6gduB0AvMpfaZ6PkGQqj85oN4E9h+Fs6tZSvCEwBnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eKL/+iPe4fNIou6rJv4XoZM/7kX9L3zpmKxamUQC4YoAR5qzL/wQzFdqH+KFAqcHpXnoVQ9RfpNwgGOyU9pHOJyNWcxXzkvX/Cotjzcm7iKbUKXQzB58AmrzIB+wLhjAXt0Ha5RMkM8PZlYOTwKcX56xo7Kj8k2pldgxwBCQHHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=LUPwW6kc; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="LUPwW6kc"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59d07df448bso758185e0c.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 05:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993947; x=1783598747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzHdYWFcDkZu4PsS/Wd20QSDadRqyTQZHFMjtpnEEdU=;
        b=LUPwW6kcnyOZOXOlPEukS+4keGv8KPQsQSaXWD8hdv/1I1BjlxxiquvnJMD1w6mz3k
         5RYwhS/ESgj2i4EPlyuGzXvQYDlHH6GctyOhXjlGTw/63M+exDIKQn4Qmy/zhZg2FRVD
         cHwZAicB0GidZAMg4pMuKZ2taUDojmNlhOVRRLycWEC9Cxyr8j/tbt3eLEeE4efJyr93
         fwh4vi8jgeka3fHs2xGoDfM+dJ1SrjNfVB9pFoY1Z1meXCklFNgfksR+iLb88RdJVanJ
         ec7KNyd6S2I1wvR5/sf/n5UC85ManRSDrhEeJO+tgy4AEDDvswcgR0ra5dBL9qj67Kol
         Et4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993947; x=1783598747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzHdYWFcDkZu4PsS/Wd20QSDadRqyTQZHFMjtpnEEdU=;
        b=EXTIFRZlNCI9BOVtvJiFojqs+5rDw6/iUR01xbwSw8q4CAVdzN0sZ1TZ35X9jHEXNv
         bYMn3YMYdcsBab30htNjdsa/FhiMGH5/z66Rqbp24dXwl63FVa9J0gXMFtY4hJ1AvVWu
         woRxoJDLTISUKAMX29a1kKTpydzcBJI5KQHARrLf2uqQZpoqFjcVYs8e+yuK8pYNx9gG
         cBfvUX0yf9oPdgbDN5x2wjCgdQB5qWYlbG5e5TgxWvJdJ1/Fq3aWoeeTtOuC4cIh91Vd
         pCcT79Wy6rf1g0gB8gUAZQVxLRGS+pGRdHqSS8MtyRYmrhcp2ovaLo2eqpGmgVTHgk4D
         DjmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGFGL9kChfVEqGdkInrXFlD+0xLTXU0f+ifNlMKb3HgIY3W550L1UNhICz1k3FooxtYG4r/b3+Bd0EcvSGNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMnpY6HbABaZhw81sDe66qVdA3IPFtDBFHJgEgMGjlgpcHMRQ
	UdtPLKaZjZcRqA7BB2wwfLJjGwxSOIKn3EbzZSo7GltMijq5wo6Bnlii4ad837HsVaI=
X-Gm-Gg: AfdE7cnXffnv6Io7FzOzkE1jdE0Gxyev6ze1SY1Metjywbud5Ibgs5PG+ywpNJUPwqs
	j1c6Vqs8pTIFt5NKgIRHJFJHGg6C9w21axj2VOhy/DFo6UmQ8mUW6UFkzX8x5k6zwob44w2tREN
	nBHh8Tg6beSOAS163+3lZwHLGp5Ouw/+3Nblc6ecQcJj8GZv8Qiq8p3JusNg/TZB4f+j359ke3j
	RLYiXSM3Hmb7pA4MpJVb1OJUaYzdnKk5baxNMi5HEBucfkZKTPwMEW193k6iHUAI1ZSwnRRbM+L
	BT6jHMFsjavSLDmuN3EXNWuWxGfpdz69Dsf8i4qpUHNFhTZ5CZpuMWG2rDFqdapJxCe6a/SKDUU
	Q9s2Bap0VROpTNPKDoe8zUd1f4Hi3falSeZjTkXWxXsc05KRwwlGcZLmD62fRpT9NCYMwHIlw9J
	MUp41PosBVMb+EOyU=
X-Received: by 2002:a05:6102:5125:b0:737:2ce5:7b2d with SMTP id ada2fe7eead31-73da8a57499mr2742053137.9.1782993946770;
        Thu, 02 Jul 2026 05:05:46 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:05:46 -0700 (PDT)
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
	nova-gpu@lists.linux.dev,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH v2 2/5] drm/nova: use `zerocopy` in booter.rs
Date: Thu,  2 Jul 2026 09:03:21 -0300
Message-Id: <20260702120324.40388-3-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702120324.40388-1-niyudi.honda@gmail.com>
References: <20260702120324.40388-1-niyudi.honda@gmail.com>
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

