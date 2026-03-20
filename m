Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78CA3C465
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 01:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969541; cv=none; b=J680dOHGXwOI33G2Jvtwc/W9VU6d8mW13Qmt5FCTs4ZebcJ0HNWDh6roOPs8TeDsGtzYHO3RLYJS/xFMRkJ0vassCsMyRlAp/kpa2M4HFp9Ks/gl8zmhnZmM75I1auS3mQ7urLcEliDwXQAmKZWyXtNqwg+izlW9wgfUNZdg508=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969541; c=relaxed/simple;
	bh=Dvv7FCQXwftSfEtJ2PPKDAc/T04U6Qi7t3AbtKrsVoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gw3HdBh3z2S16QvfBG3kfFutKXzqldLJ7E0xh9CQBoMLA27H6kkx3/JEkYqffSZ6sT82oJRRgrTs2UzZXdl5DS3JTxyjHdoajRhJIe5bRk7vOtKA4boO8znxC//yfskGgtk0LkPy0xTOezRwJYghqu0F1McevvBjXQJ2nAUraBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaKfwKrd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaKfwKrd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82ae379000fso129768b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 18:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773969539; x=1774574339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=268QgRuBzYqK3nEBycJxYeLhUCXbX3XREYg0KvqgFKY=;
        b=IaKfwKrdj7OHU+hqaOwEZ9j+hTLkyOzWD72modAtc1TsrT+bLFoSPpNFqyDsyXtdjk
         CrTt+Uan+AwXwNLuTlfC7AHgJoTDrl94OPEgf2uO0cQDaHytbW0jUkDR1U9a24ZGIjMn
         wiFRTAZyKs26S9aJ9KHi9YWX1X6tsu4pD57hbx5qZTvSRMN7GlsKbDr1IQnphG3OzkRL
         eiX2+gjmbvDlwbtoX2y9N4gsO6RzMmsxedoPJyySrhUanOLpP6d/963Wg9x39U/Gha/R
         82iW05rPd/nrWsyszqaC+W1egmzcnuQQGNHin0lk+kFUlFlgtopyeqHvRLgsG8+LrK/O
         Z59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969539; x=1774574339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=268QgRuBzYqK3nEBycJxYeLhUCXbX3XREYg0KvqgFKY=;
        b=M2NIG9lYPChHDct5RPAq3f9Z74eFvNYWNRlX8rw36C+vkVdJYtGoyyIHJj9MLi4sSH
         CH08IcHzlbzzkqqJVanJByjQbwL2oetr1rhaPAhtUbpqhm6Gn73JeoGv3pAWu4UOoYgJ
         x6uvL/S3k/hTMfd/NOe1qwcdi4smKKsGEvd9a+gjb5rfe4MZSbKhm2SvxaNuQvs6jCE5
         vc624LyFYcXouhdM3XyViMHn6Ri050yeHI9SQoWVcAdjf8f1fE7zRHDGo3XKZzI+nJMc
         Ew51hxaSHs2qFseYnpTU4Ii+XICt3n1CMZb79dEQCoNmFS3TVFBM889EzKKBFX4jWfMX
         jF2A==
X-Forwarded-Encrypted: i=1; AJvYcCXICqa2HpFtvEI6Ma/RkKid5SP81qQLNu+6nCp1vYzEnhaXP5JwWL+gYmsbstePENmCnqnwNDM/+hW2IG0Z0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEg5xtgeywjWfBL1t1lj+J+nm/TSuVwkdtaS/G4uj+A8TkjUE+
	KFswKXD7X5CuwyHyhdp6U2qwiwgifQWkuqn4z1zX/7+UZf5Gjh6pAZVY
X-Gm-Gg: ATEYQzwwIg1DVEcvcH0rb7KuQy7daaVAESExMND4zzS6SjdYrOpv/KuA32yEWQ9MULv
	y9Z7prkEr/veGIAfDXe3hr0nk6UJ5x8rs76IRQ4ntMJeiKUc19QGC7JIaJpPV+tPZ7ZZEOH/bAW
	5EJpPzkVMdtceNarK8FT5x1DhhgGQXWy04biaFHrZHG649VSVAocIooboyBf8tP2fbngdXUI0ur
	wrabRZQc32eyolt1JWLf5iBYwuGn9BlBhs2dKRhqgMnjDLSO904KpxT20iJGLsBPb5NcR6BCn4M
	PsNbKI4R0vi8mpqONBvbNDxG23HrQw3ncHujAL2lIYg4vwDEs0fr9ZvgpiN5kzFA6PLmFhXBoks
	QecO8XFqkY/fv1LULFHIfQzsWImLxPc3o+W0NT7g0GlMcmJ4Cwy6QYuIpaUTvHhegu3/m+vyGMY
	NUaSR/zpEHFa4fw5EsfnyNqLsaMwwS1u2AjH8rKwNE
X-Received: by 2002:a05:6a00:3a18:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82a8c2a1df5mr857680b3a.8.1773969539151;
        Thu, 19 Mar 2026 18:18:59 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm387310b3a.60.2026.03.19.18.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:18:58 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] rust: Mark all from() for Error functions inline
Date: Fri, 20 Mar 2026 11:18:44 +1000
Message-ID: <20260320011844.2264931-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Mark all of the existing

impl From<...> for Error {
    fn from(err: ...) -> Self {
        ...
    }
}

functions as `#[inline]`

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/alloc/kvec/errors.rs        | 3 +++
 rust/kernel/error.rs                    | 6 ++++++
 rust/kernel/ptr/projection.rs           | 2 +-
 rust/kernel/xarray.rs                   | 1 +
 rust/pin-init/examples/error.rs         | 2 ++
 rust/pin-init/examples/pthread_mutex.rs | 2 ++
 rust/syn/error.rs                       | 1 +
 7 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index e7de5049ee47..985c5f2c3962 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -15,6 +15,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl<T> From<PushError<T>> for Error {
+    #[inline]
     fn from(_: PushError<T>) -> Error {
         // Returning ENOMEM isn't appropriate because the system is not out of memory. The vector
         // is just full and we are refusing to resize it.
@@ -32,6 +33,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl From<RemoveError> for Error {
+    #[inline]
     fn from(_: RemoveError) -> Error {
         EINVAL
     }
@@ -55,6 +57,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl<T> From<InsertError<T>> for Error {
+    #[inline]
     fn from(_: InsertError<T>) -> Error {
         EINVAL
     }
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..935787c2a91c 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -216,36 +216,42 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl From<AllocError> for Error {
+    #[inline]
     fn from(_: AllocError) -> Error {
         code::ENOMEM
     }
 }
 
 impl From<TryFromIntError> for Error {
+    #[inline]
     fn from(_: TryFromIntError) -> Error {
         code::EINVAL
     }
 }
 
 impl From<Utf8Error> for Error {
+    #[inline]
     fn from(_: Utf8Error) -> Error {
         code::EINVAL
     }
 }
 
 impl From<LayoutError> for Error {
+    #[inline]
     fn from(_: LayoutError) -> Error {
         code::ENOMEM
     }
 }
 
 impl From<fmt::Error> for Error {
+    #[inline]
     fn from(_: fmt::Error) -> Error {
         code::EINVAL
     }
 }
 
 impl From<core::convert::Infallible> for Error {
+    #[inline]
     fn from(e: core::convert::Infallible) -> Error {
         match e {}
     }
diff --git a/rust/kernel/ptr/projection.rs b/rust/kernel/ptr/projection.rs
index 140ea8e21617..7e37390da6c6 100644
--- a/rust/kernel/ptr/projection.rs
+++ b/rust/kernel/ptr/projection.rs
@@ -13,7 +13,7 @@
 pub struct OutOfBound;
 
 impl From<OutOfBound> for Error {
-    #[inline(always)]
+    #[inline]
     fn from(_: OutOfBound) -> Self {
         ERANGE
     }
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index a49d6db28845..46e5f43223fe 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -172,6 +172,7 @@ pub struct StoreError<T> {
 }
 
 impl<T> From<StoreError<T>> for Error {
+    #[inline]
     fn from(value: StoreError<T>) -> Self {
         value.error
     }
diff --git a/rust/pin-init/examples/error.rs b/rust/pin-init/examples/error.rs
index 8f4e135eb8ba..96f095398e8d 100644
--- a/rust/pin-init/examples/error.rs
+++ b/rust/pin-init/examples/error.rs
@@ -11,6 +11,7 @@
 pub struct Error;
 
 impl From<Infallible> for Error {
+    #[inline]
     fn from(e: Infallible) -> Self {
         match e {}
     }
@@ -18,6 +19,7 @@ fn from(e: Infallible) -> Self {
 
 #[cfg(feature = "alloc")]
 impl From<AllocError> for Error {
+    #[inline]
     fn from(_: AllocError) -> Self {
         Self
     }
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index 4e082ec7d5de..aae3492d3958 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -49,6 +49,7 @@ pub enum Error {
     }
 
     impl From<Infallible> for Error {
+        #[inline]
         fn from(e: Infallible) -> Self {
             match e {}
         }
@@ -56,6 +57,7 @@ fn from(e: Infallible) -> Self {
 
     #[cfg(feature = "alloc")]
     impl From<AllocError> for Error {
+        #[inline]
         fn from(_: AllocError) -> Self {
             Self::Alloc
         }
diff --git a/rust/syn/error.rs b/rust/syn/error.rs
index 6fa0faf7f4e4..636f07d56d05 100644
--- a/rust/syn/error.rs
+++ b/rust/syn/error.rs
@@ -405,6 +405,7 @@ impl Copy for SpanRange {}
 impl std::error::Error for Error {}
 
 impl From<LexError> for Error {
+    #[inline]
     fn from(err: LexError) -> Self {
         Error::new(err.span(), err)
     }
-- 
2.53.0

