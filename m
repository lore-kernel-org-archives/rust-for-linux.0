Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01339A7F6
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783859725; cv=none; b=kQxtSFefaCcp2yrbquwR80ML/00qiA2DjjoHjpFviO4WRD6AgN0b+NbsqPaVkCKPdqo2Ffsfhu0giNrqkwnU9hEeGs6vv10Qn6x4jLSCgYl4TrnRq/++xbDBBmNayjqQTRSyAiCJJXCUK8GigrbIY6V2+cuHoC0DcgBIhbOPo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783859725; c=relaxed/simple;
	bh=Qd6fADU3tgLMNu+GFgH22sLsNUV0tmxxK98IifKu3oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BFBN9y0+qE6rchKn7twkV1egAchjMcARh2cbNgBOnEJ2deefGMrELPsfnSUZho9DqrkgfDPS42Pk3CSh/RkYRgNmfFGGFsnujMXcwha3c3Id15vl38L1QWiYLUPdYnUGjhXD+6KLc49pJ1c5F5jmVLz9AV8A1FrGfIZ8vXztY4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFz/Z/7b; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFz/Z/7b"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so1557908a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783859724; x=1784464524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WA/Yp2D4HqvQ5OTI3/NmFxLywTKNdInMVr/lxCPnUI=;
        b=MFz/Z/7bkLH05MWxnfvB8R6iGkRYqE1u/U3P1f5zn9kiUtr9EJ/vVt1AeCK5gaSgtK
         zqWBQzGAvPbm5AdcAHx/ltxsz2KU9fj2V1vk4Tfm1vhpANtmsUg7/E+YTaYc1SsolT6r
         eLHcdNOCv3TfD89H//9CM4jiZXjEd6+szRTiLRYPqs2vA7Sg+W1lKj3kZPh9dXknIYNr
         jKgYXcu4c7yWZETsvREo87AObIKYFsrmCb0bOQDhjY/uq0DdUZE2ZylLKl2sFj8ZXI64
         zMrGlh8nupoWy+XjF16gpTgN3vgjf/kvXKOXR7l70tXotxoUhKgLwB0rtpAHll4FIONY
         u3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783859724; x=1784464524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WA/Yp2D4HqvQ5OTI3/NmFxLywTKNdInMVr/lxCPnUI=;
        b=GUM7toCy4NKeNTK8titOCY4QTfHngY1RvfclIzFCRSZJyIyJ7VtBQtM8vtIUWAOBs6
         ta5FXCQKOcEkV9K8KBk3lp8if1uQ/gb4A+rsrfQPcYE4+/kqdogZEFbUSXFN1b1xI94D
         WkWAs1+IZvoXb07iLZ13KA5MM/xdmFRNd8g3vuBCVlIm3JJS5ZKCTA+V2OYotOhlofAI
         2lGpvrBqZsn4DLSuqsD/C1pwHwnUOqr8JLwXI5v3r9ixASSjWxfZCUr9PfJa/lG+1z9M
         pNcsP/WTAKxtVOW421CKRSBwwuWKXxjLrraEatt+ARo2Ogzj6iXSIisDZwokvNTPFy/w
         2CMg==
X-Gm-Message-State: AOJu0YyhMx3R/pNTRpRCOhMl3XkTjh4XLT5NO4y9UQcfxdlnR3quOAw4
	Poe+x/N1YARCwIbqNZbEL71B0jkMrMcw9GvPMpz7XiRxAbIEPWo6hO8F
X-Gm-Gg: AfdE7clN9pX+SAvuQo7772QphiWkhJ76v1c1MjcfO8W+Sa/arsUjkWWuiAMtsPTwnm1
	yFjI3Os2ay1I0UBtdkhWIjotG5KMdEUZYqdkzWe1HVm4bsCzLv/3weYpUSWFXVkMqTmK1h2/pav
	zV+4EdXw9jThISa5IZEw+KVxBZg9szBLKdMbCniIh6teJSaAAvhVvZKe9WVm6jPnYSOFUohh4d/
	ISy0XCOTseSRjNUx7p+Ogz+/P7dM7s5vW4+92k+4KwpZUzXXrraEJrjCoI3JAd6t2EqRy4d374w
	2lWPgBMMChOD72HSpddgJ8CGGIJ6bN0q5QTp6Nszr+PjJ4GSFa8boRg95d1GuooxYDa5JBUzaHA
	iWVRXx5QlcxXUGIAqSXTZM3716SmddeB/lTl5iSJ3Mw3pcME+/quF7eQaqerBrPFfE4YHjXOSkw
	04cwIWPv+s7SdNgbUQEXsXagH6SAB3nY1d6UAHdJjh
X-Received: by 2002:a05:6a20:c998:b0:3c0:9c1a:893f with SMTP id adf61e73a8af0-3c110f7f555mr5553017637.71.1783859723782;
        Sun, 12 Jul 2026 05:35:23 -0700 (PDT)
Received: from Excalibur.localdomain ([157.51.238.219])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm16540072eec.29.2026.07.12.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:35:23 -0700 (PDT)
From: Christopher Joshy <christopherjoshy4@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christopher Joshy <christopherjoshy4@gmail.com>
Subject: [[PATCH]] rust: kernel: add SAFETY comments in aref doc example
Date: Sun, 12 Jul 2026 12:35:17 +0000
Message-ID: <20260712123517.392-1-christopherjoshy4@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace TODO safety comments with proper explanations in the
`ARef::into_raw` doc example.

For the `unsafe impl AlwaysRefCounted`, explain that the empty
implementation is trivially sound since `Empty` has no data.

For the `ARef::from_raw` call, explain that the pointer is valid
because it is derived from a valid reference.

Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Christopher Joshy <christopherjoshy4@gmail.com>
---
 rust/kernel/sync/aref.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index b721b2e00..932343799 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -124,7 +124,8 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// struct Empty {}
     ///
-    /// # // SAFETY: TODO.
+    /// # // SAFETY: `Empty` has no data, so `inc_ref` and `dec_ref` being no-ops is trivially
+    /// # // sound.
     /// unsafe impl AlwaysRefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -132,7 +133,8 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// let mut data = Empty {};
     /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
-    /// # // SAFETY: TODO.
+    /// # // SAFETY: `ptr` is derived from a valid reference and is therefore non-null, properly
+    /// # // aligned, and points to a valid `Empty` instance.
     /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
     /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
     ///
-- 
2.43.0

