Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D635392823
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 01:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224716; cv=none; b=NG1JVrl9VN+IBve5995AoXw9o80IW8MNkmNZi/Dds1laD2BFgjXKRxOCsWCwcShL6S3TKsu5dZ/0yKdDCcq24r+fxC8NOqI39YYAaillhvFcLhz5PIauqYuySsOUPfmNsnFTGvYuGZV+ZkGExljI7Z+1eLQQ9/qmicqPt6BCSsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224716; c=relaxed/simple;
	bh=S/AOyWuaiA3NHvzmTE2CNReBuvvkbVK6T+Yewj+2g5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HCFdvvrV/bDDtdSh6hKdpHupH5L2dV9fp1t44fy7zCLpoXxGkJEVQDgDLVNrFcMNKos/r7pRJBkTt5fbrlDhLYW2PvEEbFl+23TQ6p1wy60mqDw/P6JElFGrCYLYhtLQDzMGl6kdGmXULMbC+AiYlu7q/LllHA3LA5un4QZWsVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fd+bz32y; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fd+bz32y"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d9004f39d3so24633245ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 18:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224711; x=1788829511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxuwZq03lYI2TGgQtjkc9QJfZ6xOq7ziiudQrg9Xx9o=;
        b=fd+bz32yCWvfXhKEUaxlixgV3kiy6TsUmNr5WbxryVjQpBcFI46cP5ABP7pCz5XlBU
         3s0W9Rv+ct6iQSD08ircYVhfzpDJmh6EwZwD/GHWzMGQ8h7D8KgjvTR29luloQFpgtNt
         mt5c8n7k9kDfShQU06bWnRXsxv/KOVQwoZGRslhvCjYo4lf9h2Qav4vK0Gm5B1e4SnhF
         St+MQG0l1tM5umdMm4zGBSlgnYTA7RZuS8/TM7yp2GR1qy/6G3m5q2Cl9B+6LhnVuHRO
         Lq0WTaNI9lk5BNmNIujFUeTBROi8DFqEneJIhS+RM/icgq+oCc5txVxH1AJ6PGSH0FXA
         muAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224711; x=1788829511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZxuwZq03lYI2TGgQtjkc9QJfZ6xOq7ziiudQrg9Xx9o=;
        b=jZdzO8QXLhq+gOEqUjvBTIbLASL2k1mHTSZDwgUNHNhV7TKEtMvfUZ+4nZfcyYNc81
         4j6py1Nhry8GaPBvQEOSTz/3pH/Q1STCMrYG8pT2YAyHrcVqdJ94h/3Y7HzYFLV1bH63
         EKgz4LvzhfZMCgY0hfE7CDj/Elhqipxyp7zCaEySP48c4VgeCKQOOnNGFp0JPdSOMXxC
         5uCisY/0oZqF9x3+aWJelE5JWcyh4pDwhKwUUEhuUPn6Nh9MODxjcWO0Vh7JVSs3Bdps
         VywGW/5BmHzCG66+9R4yKuuttIb3JNooJ5FFyaltbqxfc61K08YHPnXL1BZFR67zb7hz
         Viyg==
X-Forwarded-Encrypted: i=1; AKwUvBzsHm4uI9YUlN1v0PJJZSlZdIzSy3ckEf7xEjX7zoy8+K0b7LOq8RsL0/nxHzoVYRf4VSP9sFkT/OX5b9BZzQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lu6fch7PSgPI5PB+tWhcKqE0udABxplJRKUPKnHBWOl+mhUDt5
	777zhsnPE6NjCdAxXrC1IUAiR81kzNEAO0Fm/vwph33+Wze5p64p+dsLX4RA8w==
X-Gm-Gg: AYBFou2OLMhPJ1WVxFacC+EfXJNCAPorJqm3nOwcZoCgRXjsyQY+h0EJO74tH7v1SVu
	MCYF2ymlE+HgEpa2zM9gmWVN9X1Xcsa3jmz/kIhACtwGVlkxCmxZSboMsIeYtnm9wAI1lkJYrs/
	3beV3DFxwkI6gDe/Syz2YTswd3uVXEROaR2y8NoVcHfRdlekOoF/izGpCiyDUrqnUa3NjI2BzEY
	doYfkaDwldx+Z+VLq1Hq3gU1cuA9fvuZD9f0eGxFXBr4jYqaf7rkKzNYPNzebyOqYZ39L3hSEHt
	7bQJBFM9K6X3wkgTfnCEcx0de8JfJ3RA3zmqQ4Cn6/qRPpEGQOmpWIP3uwmlQmfLh1d6SlvXXCF
	SOMcXsbCAvzqOHKtcP5l0bn5kcTbGHaqZu5X2Zth2OU04aSBtOcc/224fs98Je1uBE+cOXU2d6P
	InfifIML7axbS0hT3lFUdropxJmtGYNVM3Dka/YHrnP1S+seQhSsaLyhUqdBp0ZgNwcFHJiIZFu
	+KZgd/n6FJL7SuJ
X-Received: by 2002:a17:90b:5281:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39907aff83dmr6183862a91.5.1788224711002;
        Mon, 31 Aug 2026 18:05:11 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:05:10 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	djbw@kernel.org,
	rust-for-linux@vger.kernel.org,
	lukas@wunner.de,
	alistair@alistair23.me,
	jic23@kernel.org,
	linux-cxl@vger.kernel.org,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: gary@garyguo.net,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 08/21] rust: error: impl From<FromBytesWithNulError> for Kernel Error
Date: Tue,  1 Sep 2026 11:03:34 +1000
Message-ID: <20260901010347.2614656-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901010347.2614656-1-alistair.francis@wdc.com>
References: <20260901010347.2614656-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Implement From<FromBytesWithNulError> for the Kernel Error type as we
will use it in a future patch.

As this is now generally available we can remove it from the test case
as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/error.rs | 18 +++++++++++++++---
 rust/kernel/str.rs   |  7 -------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index e52793f77196..84e6466f54c2 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -12,9 +12,14 @@
     str::CStr,
 };
 
-use core::num::NonZeroI32;
-use core::num::TryFromIntError;
-use core::str::Utf8Error;
+use core::{
+    ffi::FromBytesWithNulError,
+    num::{
+        NonZeroI32,
+        TryFromIntError, //
+    },
+    str::Utf8Error, //
+};
 
 /// Contains the C-compatible error codes.
 #[rustfmt::skip]
@@ -358,6 +363,13 @@ fn from(e: core::convert::Infallible) -> Error {
     }
 }
 
+impl From<FromBytesWithNulError> for Error {
+    #[inline]
+    fn from(_: FromBytesWithNulError) -> Error {
+        code::EINVAL
+    }
+}
+
 /// A [`Result`] with an [`Error`] error type.
 ///
 /// To be used as the return type for functions that may fail.
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index b3caa9a1c898..a556788bcc5e 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -433,13 +433,6 @@ macro_rules! c_str {
 mod tests {
     use super::*;
 
-    impl From<core::ffi::FromBytesWithNulError> for Error {
-        #[inline]
-        fn from(_: core::ffi::FromBytesWithNulError) -> Error {
-            EINVAL
-        }
-    }
-
     macro_rules! format {
         ($($f:tt)*) => ({
             CString::try_from_fmt(fmt!($($f)*))?.to_str()?
-- 
2.55.0

