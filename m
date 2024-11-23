Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BDF18C34C
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732358982; cv=none; b=nJrA9OE1R9SX0GCGx5gD0sEq7g/voqXSeL/b6c1ot1+EraBrybRzfeCiK3BXRAPJB91gYULan0OImMi/IjpqscrQmS2ATG7y4M7hwG/z0iSj7PgsxdjrczKdQiIqR11VZbrZWpIKZ+CiIqwzNAuSJEfK40z18mkeAqaJuk3b4dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732358982; c=relaxed/simple;
	bh=4LQngUM9wFi6GnxYds/BQLZswpcp+UNeKo0wQuumWEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHJBRizZnx4u85RCmSdZdd6wkIYpvTKgOcbIL6no2ryjFy2RDkVPYFWJLZUdbOKwDKTBCLvcZs7NJ1O2FvjksjXP5Cal+tqtwiprd3bDcnNbVqvLokRFAybxvOws/Jj3Wpb/T9Gu+iuoUnPsPMnv3BEUC5aJCubh2aMUlPH7Vt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=ahm/zLiE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="ahm/zLiE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cfbeed072dso3582992a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 02:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732358978; x=1732963778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMUHGCrmsLFv1U2x7NsltZJCyHZkjoqPOaFXcyq4cj0=;
        b=ahm/zLiExCNyHsNZXR483F7L+ix7mOcC8/iYenunJ23GwJspvbcC0oFeTEJuAm95rA
         YpUsv9N4rrdGjq5H1wJLY2phOmSqq33XjVjlPIqwpCIadOD8Gs1E2MGZL+6Lgi1993My
         bOXLNKHs6N8WYuXi8BG7+91l7JsIMNza++sj5JS77DrMCCaxWCNfahIZx8nK4gbsbeJK
         oTKNrZZcu9CseHPZtwviGccQC/oLxvFVx/6GQzCW52q3RFJw2lmZ+Mb5b6TX5S3szgFR
         zADMq8uBLRu7+AJdlFxNpu3aKatbnN7CR1qoSBN7uwa6OSRDGYDq++Svf/aDLiFYrQ6w
         EdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732358978; x=1732963778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMUHGCrmsLFv1U2x7NsltZJCyHZkjoqPOaFXcyq4cj0=;
        b=nvis5x1SEhLpepa/e3w/WfhxAEZcjcfIakjR0wCF6FpyV0g91W6VFe+Vfmm0u5LsYZ
         pNu0kan57Jh6aRJJj52LKxzIUzc2FGRIWc+vW6EazWnKYxyD6m+VW7Z2soRzLYi+a3RG
         1LY8Mf31eQHrrdfikp6Lb9VVAPR/ANb+gGNEhcjV3pRrq2Jvqncowy0NpkMWAqzUTm8P
         WRAoTxPIlm/XSKezFr9GX6TkGilT0QH51yu020HbmY46QwVZlQ7B9yB7wPa0BhYt59+4
         FILn6Zi6kZLV95OcWKtn0R2N53Vn6gd0/bSiFW5qZWPkj4ni/A4rfrMkxpjC8TbDlqaA
         vYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGBhc0cjB1iVjmgN2O4J5yz++aG6wEXmEdmctYIRwOSiySQLKKcfuGT++m9RuZdmPaVJxZlLP3f1lDKQpkGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr4roJwD5ajC5RRSdbNd2yEdS9HAlFpOsbaOGwXGWSUus9DX8d
	HaIo+2W9HIbf52zyLmwCYSQWTaSWohfWxXdftGspngpL9jVFkIqr9XQpOm/Ne0U=
X-Gm-Gg: ASbGncslWIZkB7tqk2Fz1FVw/x+sUN5AOSKNm/TVM/J2gh0j8UaV3HE1kwFSeuMsIU5
	DAZ1tRWEWSrxIGQ8IpVw8Z1wBb7uJ4efhPH6wNStS+ELB/gWySBRMDcl3gbSJcts/LnJSrSzZ6u
	0MEIuGHnyjDIdM/4Uzyifvtcj8QjaPtJLQuWIl6P2QntvJopTyAstn6fOXjdwRTB+IUoF6wuTPA
	Obaz/42NXQSskxyNSv4VHVtlQbIIqESgPcgiQ2KW2w=
X-Google-Smtp-Source: AGHT+IFPAukvqgTP27aWhHysmSsGBh5a6b146R4ApA7i0cI93t2imMl5PFX5WXhF8Sb0ZbEWVk2ayA==
X-Received: by 2002:a05:6402:2807:b0:5cf:bfab:f0ca with SMTP id 4fb4d7f45d1cf-5d0207c2db3mr4094624a12.32.1732358978622;
        Sat, 23 Nov 2024 02:49:38 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3b0fc1sm1908463a12.28.2024.11.23.02.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 02:49:38 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v3] rust: error: modify `from_errno` to use `try_from_errno`
Date: Sat, 23 Nov 2024 11:48:57 +0100
Message-ID: <20241123104857.49385-2-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241123104857.49385-1-daniel@sedlak.dev>
References: <20241123104857.49385-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the from_errno function to use try_from_errno to
reduce code duplication while still maintaining all existing
behavior and error handling and also reduces unsafe code.

Link: https://github.com/Rust-for-Linux/linux/issues/1125
Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
Co-developed-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/error.rs | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 52c502432447..236b3e4719e6 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -100,20 +100,17 @@ impl Error {
     ///
     /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
     /// be returned in such a case.
-    pub fn from_errno(errno: crate::ffi::c_int) -> Error {
-        if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
+    pub fn from_errno(errno: core::ffi::c_int) -> Error {
+        if let Some(error) = Self::try_from_errno(errno) {
+            error
+        } else {
             // TODO: Make it a `WARN_ONCE` once available.
             crate::pr_warn!(
                 "attempted to create `Error` with out of range `errno`: {}",
                 errno
             );
-            return code::EINVAL;
+            code::EINVAL
         }
-
-        // INVARIANT: The check above ensures the type invariant
-        // will hold.
-        // SAFETY: `errno` is checked above to be in a valid range.
-        unsafe { Error::from_errno_unchecked(errno) }
     }
 
     /// Creates an [`Error`] from a kernel error code.
-- 
2.47.0

