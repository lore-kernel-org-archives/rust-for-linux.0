Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED62EAB71
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769631705; cv=none; b=g/3nA3lO2/g2sOvBt6qyAGVSquxTTh2BAYThiPBZB03ZPaFRMoubmc0868YVsD0pcOe4bfL+7sr2iY2nvfwqnFG9zw/XjMuoyhxpG+0OBhQFjjlroab1+LRC078yF203YH+gq6asRfnDGdl0SILE+wtoIOcCCvTPvcmubeWMQ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769631705; c=relaxed/simple;
	bh=fxSRMnS+DTdOe/9PQuED4usCl8i1K+SEzjMJ8MhoJtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=buMOoQesbAbk1mCz84LwSiDBDIigdlDCE9BkTHSCCKMfR9f4LB6xFj4doPKfXzrj47lB4TubqIOzqQA03IrN1ry05yIXKejIV6sHZgVGzNZCdqAbPGJ2je41rpCperA/Nu2eOd9OAGzTV1N906ABgMBz9AGYe4q9SDuWfvvLqQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTpaboKw; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTpaboKw"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a7bced39cfso1616375ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769631704; x=1770236504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHGLmxFDguwmEL7MTwAtIpFUj1gQFdHnrXFkxEwQ3gA=;
        b=kTpaboKwK5CXaVp53TOAGFvBhypJpCfr+nEK4TPDuHVk2HKhqoF+V5H2eRf7w+ylbU
         ctXV5bttJuqj5rszDr6l2xOsujEdw+H8whZ4j1BG4x2AcWb+mGFBD0UjjUf61CRCL2WH
         lsFMilhkarXr+uvImfcisJAb5HlgSwL0Nh20My3AnsqcjqIXrpmIaD/8jWKmUQ8nzg2n
         FHy3zaYOtdzYY0nFcNUSAPemWrJNX19RHd7W2TBMEWVXOxtVOFRTUk7Kim2ccHP8zNjX
         Ffpvfn4SKFifJahwHVS8RJkq/5Oi8qtnlOLkeZ7WkP9b8KzRpta5zuq7RiOQO9VlXm5z
         kcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769631704; x=1770236504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHGLmxFDguwmEL7MTwAtIpFUj1gQFdHnrXFkxEwQ3gA=;
        b=oCdVsf9Yq9V/5rwvCFsrcLMfq69GlrNnTrNGiHFxcyeJTFrm9Sis9/yZLn/lUxk/HX
         uHvJvWNdocBeBw07h6+gxESpb70ZvgEvb+bhDbVGS1P0bSup3W5GiMD90Ycn5hUU9pe7
         jmVdoGnW2RgHy7UGnzfZhcLrnXCy+UrQmG+Ey+0h2zXBfZ+ngiAEeL75cfBbfudxKdQu
         pXAC41RCyMs4i59m5Scsp44DJiMGJk6tSJVCLDYYQ6uItecsVsfNm71lbQQXvBUIChNn
         C0Ng5kFLU1JFSD/JpaR5InCNA7G4fUk47K6L72Q8nvCp9dxijmgq/35+33WJE2VTK3i5
         EvTw==
X-Gm-Message-State: AOJu0Yw7rxrTjDfHPAmqvlfkLDSZJh48nLN7RIbmgsvf6uXCHZockcn9
	N72Ytfvhs0RNm5ioph87FhH25p/xJd/3ilWJP2c5fGKW5MEQDMlwos5i
X-Gm-Gg: AZuq6aIeQBgKYbJlDMN1ilMHDpZ0J7ZaeLkVhthAN4czs3W8N9bEEdZBMjo8YmgqKtX
	TAJljtvtSuSt6WEXHtC48nsv/2LBuk3B5PJrfITTHdGzyw4ewVtfdy8CzVecL+hnNmUegHxSMS9
	w0GDrWkJG1IHC1wIpnYXQEYe45mIQdEjo1ZbW6o3mf+0/xf+HTOrsXY/WbgKrRnStiYmW4eU7NY
	gdWEUWtiJTpyuO2Jy1SH9bYXS/mvtaXJH2Odd67WsSPWSb0YxR2d1wj7MFWByKUFBmgaoubYbf+
	VCt2g4Wh92x47qgtZeNfMltEC2rN8X5l6O311ZiGh9oIOV6xo4hSq0sR8ASqY+brtjrGN/VktXl
	/jVAHm1sMNufKyuvSaumkdsq9NnxbH0EsczRHZNXu6/+c64dvP2fiXWCtRDTPIHG2oKr4HKf3SA
	7kAcQAgY+pTxRyN05Du6ECO88e
X-Received: by 2002:a17:902:ce83:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a870e19191mr61737335ad.38.1769631703952;
        Wed, 28 Jan 2026 12:21:43 -0800 (PST)
Received: from xozo.localdomain ([117.250.76.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3deasm30691385ad.57.2026.01.28.12.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:21:43 -0800 (PST)
From: Shivendra Sharma <shivendra02467@gmail.com>
To: ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shivendra02467@gmail.com
Subject: [PATCH] rust: kernel: document safety for rust_fmt_argument
Date: Thu, 29 Jan 2026 01:51:30 +0530
Message-ID: <20260128202130.196419-1-shivendra02467@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, `rust_fmt_argument` uses a TODO for its safety rationale and
suppresses the `missing_safety_doc` clippy warning.

Following feedback from a previous attempt [1], replace the
suppression with a formal "# Safety" section and update the internal
"// SAFETY" comments to reference these requirements. Additionally,
add a comment to the C header file pointing to the Rust documentation
for safety preconditions.

[1] https://lore.kernel.org/rust-for-linux/CANiq72=b=Z+6dk4XWK6QWcKDJx7SYXL0obAFFfWp8xpE1CFkkw@mail.gmail.com/

Signed-off-by: Shivendra Sharma <shivendra02467@gmail.com>
---
 include/linux/sprintf.h |  7 ++++++-
 rust/kernel/print.rs    | 14 +++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
index f06f7b785091..f915829cbba5 100644
--- a/include/linux/sprintf.h
+++ b/include/linux/sprintf.h
@@ -25,7 +25,12 @@ __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
 extern bool no_hash_pointers;
 void hash_pointers_finalize(bool slub_debug);
 
-/* Used for Rust formatting ('%pA') */
+/**
+ * Used for Rust formatting ('%pA').
+ *
+ * Safety preconditions are documented in the Rust implementation
+ * (rust/kernel/print.rs).
+ */
 char *rust_fmt_argument(char *buf, char *end, const void *ptr);
 
 #endif	/* _LINUX_KERNEL_SPRINTF_H */
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 2d743d78d220..30da8b974398 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -14,7 +14,12 @@
 };
 
 // Called from `vsprintf` with format specifier `%pA`.
-#[expect(clippy::missing_safety_doc)]
+///
+/// # Safety
+///
+/// - `buf` must be valid for writes until `end`.
+/// - `ptr` must point to a valid `fmt::Arguments` instance.
+/// - The `fmt::Arguments` must remain valid for the duration of the call.
 #[export]
 unsafe extern "C" fn rust_fmt_argument(
     buf: *mut c_char,
@@ -22,9 +27,12 @@
     ptr: *const c_void,
 ) -> *mut c_char {
     use fmt::Write;
-    // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
+    // SAFETY: The safety requirements of this function (see above)
+    // guarantee that `buf` and `end` define a valid range.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+
+    // SAFETY: The safety requirements of this function guarantee that `ptr`
+    // points to a valid `fmt::Arguments`.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
-- 
2.52.0

