Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B623AE62
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 03:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210292; cv=none; b=Hd/Io2jZNy6kxy3WxAJXzIunHBeucf1uAchlhM9XHTLo/pSNonHK+dXH0FNSXStRMV5RbEVd8O/0blUBMWRIlzN574PeEfa3d1x6QtuTEs9YpYUpznTkbxyZxhWEG4C9w1z9IZmrUQg7KCosME4T3pHhmmChdnl8ymUpampiZDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210292; c=relaxed/simple;
	bh=ERpyWsMPE9+dpw78Rz8jzNcLrivxWjKPOe5Lqw+ayKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuKSSBsC6CSHmMyollrUmmoagQ4VTHcTyu1WjKQvkKgpcGPLvfARSJlz2WjKLmtERdF20xmEseVvJvqKzuO18CWo4ZlbItGWUnpcYz8C0SON0cWaNwhSQ9dUlLbZfcPs7zy0fuAS5oMwf1UM4juPhrGXkchIt/KWQkwacmXmncQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yj6Z0kmp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yj6Z0kmp"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso14672415ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 20:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778210289; x=1778815089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dr4Me0446pI9Lo+v8fcchBIKe8OPGzCDfNPYgvjsMc=;
        b=Yj6Z0kmpi9AVb6Nd8h0wWN5TlgvMLiVNfReWogBnZH4w+otegDoFB5XF2212PfcZ4u
         bCqNS2GxYyMlHd2PTOezbhqkYMycoEuDnnYRh6H4fAHqzDsubjkFdJOFzgC8YWK1bhrB
         Wtg3Wo4wuCg8dkwC3N5FeuNHJFo3fXNnofhPNYgLCg/DFRNnALlGntMPdokrDyb6/T94
         s8Oz9/7E5nborARV7YccVyWYfW54QLNzALiKSXqW/oz/BjFOFrRfHWhp/e6v9SyrjkeC
         pJUj2imTw+UIyyNpBh7OrpI4n136yyhAqUnoVncFUmvmuuxaS+IgCU/5IQWalPXFaCOt
         m4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778210289; x=1778815089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dr4Me0446pI9Lo+v8fcchBIKe8OPGzCDfNPYgvjsMc=;
        b=FYv55VZfg+eS2+L8m4dvuqpT98Gujx7z58TTWsmv8eEizrPatw0IHEpeWAp9VEeXVA
         U76qmROgp9ClC8ZebsVfGoLWMEIFNZlUHfFttFBBeBO2XGyIfGi//7DpMUW/B79BevuU
         nBPVLFhp8FX+FZeNQ7c/rDlZTfGGHNsW3Htad9X5o+7wBd7y5yFbkFMr4/r1vFFV9x3z
         PQrpv1Z8bZHA7kZ8XyIwlVGAM7qzVuFckFeClks4IeFpM3NpZl8HUMUMJaP766xBFcht
         gn38+fJiJfAmOZ1xlSXAiUbla6PdLQeh2o5lWC+p3IdZiGciSj3c8fhzircXbHh9oCoo
         YZzQ==
X-Forwarded-Encrypted: i=1; AFNElJ90JLrMC2+qOWfCfS26LOCu11RZOKqmpanRiF53Vqx7qzUF5afUoEBI32B1/3/9e5qJSpqbGFAGgUF+Og8Jpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4BL96HJqKpCfCo0MAGuyPAMkpM2I20y5o4QGSrJLNu1YxHvz
	Eys5UmdNLl7Ap8uCoLh4O8JKYR9aKeiozRFaPjqhvX28vtrMDbnD85a6
X-Gm-Gg: Acq92OFnhrxdrXMn+vWVGsGCKltByjAyXrCszRUJydfDXXd+wE9gZjW5C3kGNHQu2tI
	ZhS44pgFEFN+/ZuPaNcc+SMguRTJ51Q1x/8eMU1bhcyiuM163Ke2Wjv1RlBYKyklLLgycPdi1Lj
	VEz+eW2ikt21AKoPFn6QW6SAXkXj9z6KJ9FUqfY/937Tzw/H50UfEeWAk1oDp8uRj6+3biE/U39
	8NhPDTaf4jqQc6db9TSyGmAff5zaXiNxquwOCZn++tAsgrJCfLIqht1yame1cKttsrakOajkyUc
	qPm1JCWu//JxZ6NFNZ6eh8mCqvE5yLpi472JZGCKxufbOQE54GUvKDiSOukT+E71Fu2/N15UqR/
	ew6Wyior3hx1FKD8giYKaCYtg0rKiCsGMLbPVR1VdVIqSbs8hYMCYy3jPvNNEdClUZm8oqhwGQt
	2D0gaKcG9wu4U9AEYs4egA5eF0gz6DN0hES6I7Dv8i
X-Received: by 2002:a17:902:be05:b0:2ba:4a19:fc89 with SMTP id d9443c01a7336-2ba78b485d7mr69407855ad.5.1778210289439;
        Thu, 07 May 2026 20:18:09 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm3220685ad.74.2026.05.07.20.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:18:08 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: alistair@alistair23.me,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	Jonathan.Cameron@huawei.com,
	bhelgaas@google.com,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-cxl@vger.kernel.org,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	wilfred.mallawa@wdc.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	ojeda@kernel.org,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 06/18] rust: error: impl From<FromBytesWithNulError> for Kernel Error
Date: Fri,  8 May 2026 13:16:58 +1000
Message-ID: <20260508031710.514574-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260508031710.514574-1-alistair.francis@wdc.com>
References: <20260508031710.514574-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Implement From<FromBytesWithNulError> for the Kernel Error type

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/error.rs | 8 ++++++++
 rust/kernel/str.rs   | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 05cf869ac090..5463addbfd95 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -12,6 +12,7 @@
     str::CStr,
 };
 
+use core::ffi::FromBytesWithNulError;
 use core::num::NonZeroI32;
 use core::num::TryFromIntError;
 use core::str::Utf8Error;
@@ -258,6 +259,13 @@ fn from(e: core::convert::Infallible) -> Error {
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
index 8311d91549e1..17070dde0e35 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -419,13 +419,6 @@ macro_rules! c_str {
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
2.52.0

