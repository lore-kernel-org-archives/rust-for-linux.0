Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270E5332EC1
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 20:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420754; cv=none; b=S2VimUgQ7cgBfvLusjD/xbeT71gS3IO7gC0glm8zNl/BF1fzciRsJNCm5/TEpqqdsEoVoOh7ZL6haPkPr1aFr7p8nQvcqSLoLtiJikPah0syvqMGlAmUe2BlENdhjkS6ML3cy/GdDhFXke7vCj6oHX9Se4mM+P9ZfSHE0zXEV28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420754; c=relaxed/simple;
	bh=xTBnnZIRHNXyqcH/AMqAc+n4pvXKuXvBMMdPOnty8dA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ArMqIUJgi90bmIyYYmfbmcKwX+ZmBHo1hy0Y/NGx7M0pvUvE24IW1I2mEnrw4BuviObkxtlkzlXPN7u6bm01YNe3Os8xuSeVDMvRzo6wD4ZmCkXm7P2Fm0yqkQGh7X8Qcf5RdmNZZrfVnMnFHx5Z8V6aA8VQoDjj1PJOnKInLR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=jytkFqpE; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="jytkFqpE"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304f590dd91so425797eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420752; x=1783025552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOafAK7HDkFPoXdNsVBZ8vVOqlRlb6xT0ugQxmB4YIM=;
        b=jytkFqpEt1UofZwIFpe+yrYXEVh8pZK7StAK+Ds/YXJq5mptwVqKEn1mGRnlENZM6u
         ajWX6LcElffmSssH1N4Z20M3tqltMYCS/3PJRwNagh6aNbssR2fjqf2N8gGyaDeAn2S6
         9n3TLSllGbWTBZpHcoDB3RsIxiNy+zwGqr8n0n8oNEpMyRQJ0Oo8cmY38n4TFzCkvwhD
         U00Ny7bDRThdyipb+RiirThOnAguP37uO2CuSBAxUhyuFb3PauIQoiw5p6lZvz1HpvZB
         eXhyD+NTOW1lXwYFanNaYW2uxFTgwvB7jvZqI7fVqbRmmLuIwVrDv+2E+46DWNoGiHRX
         Wg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420752; x=1783025552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WOafAK7HDkFPoXdNsVBZ8vVOqlRlb6xT0ugQxmB4YIM=;
        b=VoDyD84j0sPsH9myJ9OR6sZ8MCyWhBVJZzsHFv8Ofo4Qx9qt3KHaQl4vzOGXeSq1dq
         7lbjOxsvqrFnnY1xlw67F4/vQLFXs0T+5pn5JPCQD4wq3VwHeNSl/XK5c8rGQ7f49pQd
         C+jAcIuRIh11lb5GVf6QrvPbeQBRQyb0+YDPTVwfqINXTqj+ks0I3lUM89UsG9tsr1Zo
         EWnT0LtViFhsGPXPKZ/Z3LjiNy58ZHBSp3+ftkj8EunYPWS9RPsGk4Hu+Vqc6Eluk2yi
         AewMjCYPla6Pv9GNeGn8wZWLxaiPJqQXKNJkuMzg2LJeFXQbbwoBjpO2MtNYPsf+wbhg
         np8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqTYAXSwb0c6f68VXESwKE/IuQ5sZTjlkhTBKpilpp9RB/gMJiZ241MOOhqAxjjsvKgb7jyk/VCluJSIS5oXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPs97E358vBnMnsax76a5AuKdkqMnv4a7GDZ2+C5KIiIaPefAc
	XMXv4vw/K0YVMYaZbCaQyqt0x03QHpQfEv3ufRCSvRqbdeYJp/Vh9MVAfZmtzUWx+bU=
X-Gm-Gg: AfdE7cmENJzR7/9WcQCZElE8BxfKZuBRM495egMmlScUvAWPekT5XgNpM/650FZd/Gy
	JmgzTyoJJQXUVgsMtFqoRpxDW/eYZd+Iw0tyz9q/54CuUvRWORjdCgv/Kgk7beEbefp5/V3EK2U
	B1bGizuShSm2QsF/0K0dy16ht7ohwhe+5vGMH38YKFftZHGfyxqCaOWDjWWVJe3p93WEqmFU/+I
	WoWKjnAEa3F9WrXNJZm/PZpRNRwjqe2SiA/BdDHEkqbGNd9cUAOlWqyEkPR45sGeqFAtMeXA1+C
	A+9v+2WarnrPR6QCnYjmC6TCRYbSC7bAw30LqQYSy5XGlG6HfvSdHOYb0Nn4JjbMGvSFmm7YbYJ
	RNeg8J3wQ0IZaqVU2l8PqTnJt7RIBG2Zo8fp3HAEWk0pz5c7tjz/OeoAYgMPR3CNIaSCJvylqTb
	M2NGmvTiV0cBwQ8Sthp85rG6qm3SDC1JZf9Yfr
X-Received: by 2002:a05:7300:8c2c:b0:30c:2af0:1cc with SMTP id 5a478bee46e88-30c84fdf0c5mr4811586eec.34.1782420752189;
        Thu, 25 Jun 2026 13:52:32 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:31 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH 3/7] drm/nova: use `zerocopy` in booter.rs
Date: Thu, 25 Jun 2026 17:51:42 -0300
Message-Id: <20260625205146.5047-4-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625205146.5047-1-niyudi.honda@usp.br>
References: <20260625205146.5047-1-niyudi.honda@usp.br>
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
index d9313ac361af..0cda2c50fbbe 100644
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
@@ -44,7 +43,7 @@ fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S>
     let end = offset.checked_add(size_of::<S>()).ok_or(EINVAL)?;
     slice
         .get(offset..end)
-        .and_then(S::from_bytes_copy)
+        .and_then(|b| S::read_from_bytes(b).ok())
         .ok_or(EINVAL)
 }
 
@@ -53,7 +52,7 @@ fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S>
 /// Such firmwares have an application-specific payload that needs to be patched with a given
 /// signature.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct HsHeaderV2 {
     /// Offset to the start of the signatures.
     sig_prod_offset: u32,
@@ -76,9 +75,6 @@ struct HsHeaderV2 {
     header_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsHeaderV2 {}
-
 /// Heavy-Secured Firmware image container.
 ///
 /// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
@@ -145,6 +141,7 @@ fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>
 
 /// Signature parameters, as defined in the firmware.
 #[repr(C)]
+#[derive(FromBytes)]
 struct HsSignatureParams {
     /// Fuse version to use.
     fuse_ver: u32,
@@ -154,9 +151,6 @@ struct HsSignatureParams {
     ucode_id: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsSignatureParams {}
-
 impl HsSignatureParams {
     /// Returns the signature parameters contained in `hs_fw`.
     ///
@@ -171,14 +165,14 @@ fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
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
@@ -192,9 +186,6 @@ struct HsLoadHeaderV2 {
     num_apps: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsLoadHeaderV2 {}
-
 impl HsLoadHeaderV2 {
     /// Returns the load header contained in `hs_fw`.
     ///
@@ -206,7 +197,7 @@ fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
 
 /// Header for app code loader.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct HsLoadHeaderV2App {
     /// Offset at which to load the app code.
     offset: u32,
@@ -214,9 +205,6 @@ struct HsLoadHeaderV2App {
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

