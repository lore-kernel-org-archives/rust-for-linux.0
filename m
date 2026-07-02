Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DDB47CC80
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993946; cv=none; b=A3WNN4F81sUWxLGFVGM9fcX0yhjgOLta4yxT+kZo2w3L+ecEgZUua8fMwqJevQApNKhyytZZBkL9iHFOWSLR7UpqcaVABv2/MSbYiKXQ5V9QA4IkNl5fexEKK28ZRvbc2ZEv6hK5YB6JmsgdCCtxNRRhq/22OaUjG4l26/9MLA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993946; c=relaxed/simple;
	bh=QT3wnmwBKravwpBtjf1E3QkDfkeR+gAXke8tzegpcBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mGU/zCsJl1lOkemSk+LBes9PmYOTXBhC4g5x/9fGSi5Cd3B3YXNJPebtKOt+VAquOC7nj5PnkCA+keKCaUvYQe+E8Dcq+MTJxpdVwlsf5h4W3cL9Vqu3dhy/+7iF75ni55yxopRq6pzfhG2qQpEJlJvb7D4XVFWUeusmnaxvOAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=GHCDjzpr; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="GHCDjzpr"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-73b909fbb6bso987334137.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 05:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993942; x=1783598742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xv536fNaoYEArBq1hqEwEiGIOw+jADuSEkc+GlzLZk=;
        b=GHCDjzprcGReEHWU1BXkH5BxFGYwohak8Ncr3v8vLs3P7GKQVmGMEe59oCR6ES2p03
         /0GrSMJLLXpmQSslHvziyBxLZRevZQwtGhU1sATfA2euwHJvba82onr0/SWxeug2Yo06
         sI/ValDPVIE7KokYK3DlLDFKnKPhX87uRcwWB9yu2p4NyxUbx7Uj77ROWJP4OJ3kus/m
         n2cuDOHbbDA45S/vjlHOT38vl+UgLx7OD7uTumHor1xzWLuQ9165oo/QUNU93E13XTvj
         5C1Ro8SBKgKc4EPoid+37LIa+WJhTPlCfmRrBKzGPhKkNTSo18Lf7DARTskx1jjIK/LI
         vFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993942; x=1783598742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Xv536fNaoYEArBq1hqEwEiGIOw+jADuSEkc+GlzLZk=;
        b=TnWbiYH/K151Nxq9YtCgenYYWawOEgFpekNrJ2uMzfkyabz3TaVYRL//HSG0lL8fzz
         aPPQIOhFBl74fyBq+by6XNH0vQnJGLWPSuZ136DXlcGSz/QIjKXOp0vmzvT3yGj+Tnrq
         bioFUgbcpyX6V98r5VzMBqI5w6K4CC53WSCvhYbpnSpMITYiLs589U0+GQg1q2IUeKMU
         kER53d0faQQqVTvUGbBBEt/uXTnDicU2DvIXEgKjxX6rtWmcgKRgk+uubxIsKqYWkLYJ
         dLlGzdjww7p6T9Jmf6bkNjHqwkXqnl7MKtsl2xNKnxXVTiSTvINVV6VHYMf32exAmgCT
         VArw==
X-Forwarded-Encrypted: i=1; AHgh+RqNU6vdwFo/z88yEvrcqGVABlsr4PeOkgkABlyBkvhPLvaERUp6SOERPDrMVQc9JfDqKih6NqIMYGXh4M0bTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEPaekJ7TaJz5U4s3Z15mtK3KAEtU89Y2N25vQR0LUKepCAEAD
	/JMsZGUen+NXzsS2sjgiKiLhx5766M+lIDTevh0B4tsTGJNDISnjRBQTnXLNaOVQIY0=
X-Gm-Gg: AfdE7ckORpZXFXM8vLRVUWYwk1BMBn1TtIerJ3zGs9rbT4jprCrTWg69PBT71GNATnh
	TcGAJDmjVgDQ8DqUZSGTBpFztLMumufVJ8vQdJ+/X+FqR7D3vCLhE0/7BRWnJxvRupw0h8+ODqt
	zuJvXOtcWlsSfkcxDtPHEP6JzIE3GHsaj1On47nD0Ng8ksVkYfIsg/A1CPCSuD6eV6v99CJup9D
	6IhtP2FYszHdyigwiEW3iPsgIUZ+I9fg7yme68q8rKiM5MeStHTKIzv2OGdCFRPJbSYwf4PWE13
	/nDJnwe0ObvOnMdqSWq/Z6h2Yyv/Ok91ZDDaluYAmBgpvaJtE4Q2+ba08TH5gLXsDGYJndKmFgk
	bEGTqgk6iisg+DczS7qNuS4Oc/sbP7RDGXsAvASbwfzwkYRhosq03v629YId2fpPvLslcQKUTON
	m5wO0DaD9ryIBUWSc=
X-Received: by 2002:a05:6102:441c:b0:729:1a8d:b2d9 with SMTP id ada2fe7eead31-73da9cf0b77mr2617416137.22.1782993941774;
        Thu, 02 Jul 2026 05:05:41 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:05:41 -0700 (PDT)
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
Subject: [PATCH v2 1/5] drm/nova: use `zerocopy` in firmware.rs
Date: Thu,  2 Jul 2026 09:03:20 -0300
Message-Id: <20260702120324.40388-2-niyudi.honda@gmail.com>
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

