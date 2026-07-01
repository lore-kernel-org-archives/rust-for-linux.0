Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D7C4ADD94
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Jul 2026 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927676; cv=none; b=fIs59DDb7jkU+UW1RykVqMg5oSy8hJEw7Rt8uJmpw+aMKMMP7Q1ynkmnrjuU3IBCIKq/NDy9I0qUVROACcThOSZKYxuMLVVInNH6DY30UtelSsQgAhz1ki19o4QhJl891KX1gkWIxwtrPXU20mFheKisVIR/0wfXqGci4yNSwPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927676; c=relaxed/simple;
	bh=QT3wnmwBKravwpBtjf1E3QkDfkeR+gAXke8tzegpcBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jS8fiWYp35ws82hgXN6DPf1HyYx+Hgx7jGndTLUOi4GvwoDMAaEy5gt7K8+wEbRPlKpMvZU1Z8HYkZCVWWkbF/XTNng9hCeSfXZYF2wxGLnpj7e96P4ni9c46KcFsgGJ9HwRqtZL3ql4fj6d9pmGpzdbmBrKbtTr2oEbX0qRXHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=QRNwlRAB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="QRNwlRAB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-847921eed4aso775224b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Jul 2026 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782927671; x=1783532471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xv536fNaoYEArBq1hqEwEiGIOw+jADuSEkc+GlzLZk=;
        b=QRNwlRAB4JjtPLGg2SSUbeEPTaKDd5dbv5+JOSB7HXKZAPSc0B+JGI8jcP6e0MQv1u
         qAp11bTH/UjWLfzmp3q3Vede7zWNLgXWhJ0tSLeDj+azpzLmwgjdD209iLOhlRaiGy5m
         UdcOEqdCB7pt1FCsWkQGoHmuRaZyHmWycx6iARWi2lBPkNbgqmtqoKStUMHd78U6B8aK
         l64BkTk1xq9QcOHzPHUioEYKqCrvc933B3azMOhY07OIdJZFG+rXG09L3rMgN6Cr9zyB
         kEVtCKvyrOBqHSdvrvSkt2sBk7PcbGCOT3X/xLBBAyz9yo3yQoTg6T7KALH4cGsWOoOe
         iB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927671; x=1783532471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Xv536fNaoYEArBq1hqEwEiGIOw+jADuSEkc+GlzLZk=;
        b=DEU51mTJQgXFGyBhQawqtw6AxqxPi4AfRyTS6Z4wXrH7LGU0GO8G6/9S9R03hChLk0
         6HhpWSRS7VIlxW1UcnLJcMw7+1b7lITndbFMst5Q2L0u/fsv/mGQBbfgB6KxY/tK7ZdF
         pa0EkN4FxASHoEyNEq85Vy5Nv9GVz5/P9VaKiEnRVV8A8+YazT3hEsntzXDIxM6y4j3G
         nn9+b1MNNxMv2eHboU9SeFs62IkXAO8w5BCGD3T9Nig/+K6O+kY7B14+WBRSTWHP9n97
         s51U++7KOZ9fmwLxemSrRwe9y4OKlWgxlsBzXFeuNEc73Gy3QagaZ0rTaMPplPlH5o2D
         DGHg==
X-Forwarded-Encrypted: i=1; AFNElJ9+gzECz0Uo09qK3IQo67y4pODXLciZiBU2/I4qoZkw9OXGWmbKh8KXciQy+bsoZJMHlQfCNBanp/Y1mAFkZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHwblMA8hDPs837KnNpBS1x0Ts0q6qZ869LCbX+R/0fRlM473Q
	BDJoS5Jx2P6d99zY2h4vlpBctKCrxo3PZjX8bkf7zzlyycVOrM2XjiMA/Ox6hg5UEvE=
X-Gm-Gg: AfdE7cnXdfbYiFiKvK2ZZ1RgJjVvxXVdgcZQeVdlMA6kdASrTDw2oOm4f0NG58tk4sB
	1bxH3sEz1eQy1HGZr0Pn3blqR4b6C6qToJDA8+zmTEwgJ6yScwECZ6Q9jcYIpraSjrjPZsfXEY3
	+eP+argQlusQ6wUkxCH8kyniJL+EWCrAPs9lH+CCeMJxZoglnEPW+8froxloozk7N9Pt+FGtphl
	/kXmfB3dHZ6xjNVvW/zMg82BIFJdv0Ie+T8ge+EzROu2aXMLohqWwlPWMdsYLotaJISvlPCgxeI
	JgSdD09RlwYrCVpy0OlrQTFavpVex8bwbtx+/1KXoQPJTR0KUJDkn2YvcEPLJQkpK7WYKBoD85U
	ytwHHhgwYLEA6Kw6nGufw7mQpddi/q7jw0Czw5M+5Zjam7hPfh81m2UsTRrGnJ92cdpeKZSfMWw
	I5yIxLkEmZLFxccJg=
X-Received: by 2002:a05:6a00:1787:b0:847:7f38:27c2 with SMTP id d2e1a72fcca58-847c516d6demr1852632b3a.50.1782927671425;
        Wed, 01 Jul 2026 10:41:11 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc4d0sm150943b3a.3.2026.07.01.10.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:41:11 -0700 (PDT)
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
Subject: [PATCH v2 1/5] drm/nova: use `zerocopy` in firmware.rs
Date: Wed,  1 Jul 2026 14:40:52 -0300
Message-Id: <20260701174056.12604-2-niyudi.honda@gmail.com>
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

In firmware.rs, replace the following `transmute` traits with their
`zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Note that the module `elf` is untouched, as the bindings generated by
bindgen do not implement `FromBytes` for the structs.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware.rs                  | 10 +++-------
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  4 +++-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a94820a3b335..80ce0df244a8 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -11,8 +11,7 @@
     device,
     firmware,
     prelude::*,
-    str::CString,
-    transmute::FromBytes, //
+    str::CString, //
 };
 
 use crate::{
@@ -347,7 +346,7 @@ fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
 
 /// Header common to most firmware files.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BinHdr {
     /// Magic number, must be `0x10de`.
     bin_magic: u32,
@@ -363,9 +362,6 @@ struct BinHdr {
     data_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for BinHdr {}
-
 // A firmware blob starting with a `BinHdr`.
 struct BinFirmware<'a> {
     hdr: BinHdr,
@@ -381,7 +377,7 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
 
         fw.get(0..size_of::<BinHdr>())
             // Extract header.
-            .and_then(BinHdr::from_bytes_copy)
+            .and_then(|b| BinHdr::read_from_bytes(b).ok())
             // Validate header.
             .filter(|hdr| hdr.bin_magic == BIN_MAGIC)
             .map(|hdr| Self { hdr, fw })
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index d9fafd2eea5b..66b9f4d1b41c 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -25,6 +25,8 @@
     },
 };
 
+use zerocopy::FromBytes as _;
+
 use crate::{
     driver::Bar0,
     falcon::{
@@ -150,7 +152,7 @@ pub(crate) fn new(
         let hdr = fw
             .data()
             .get(0..size_of::<BinHdr>())
-            .and_then(BinHdr::from_bytes_copy)
+            .and_then(|b| BinHdr::read_from_bytes(b).ok())
             .ok_or(EINVAL)?;
 
         let desc = {
-- 
2.34.1

