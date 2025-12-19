Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0DF2E8DEB
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 21:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179811; cv=none; b=OpVJoCeWsXb2vlAfsqZPQdeqPfGTWZUd1oLfStHCnpov2RFCXIpJxGcyIJ32jKEo4iXD/WAE6u+m8SPtUr3oQUA1tWgxYJuZAsCsjwoariI8LFovfS2LpuQK/DB33Vj0UzdounMb9GGK69mgenVJOOgv6AZGKti+CThh5luoQbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179811; c=relaxed/simple;
	bh=hEPhKwT/pgywPCq0dB8gQ/MONU1VQk+JP/YIdz6V9os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IJNjwxhrKeqcPVkt6W5zOlUusJJQbnfeVRN0wplL33YLaNEuF//rDRTL53TszQODGeHFKJz3jti6S3Cz4wnLVSJ95EHikxVzzEOgV79EOBRbg5G88z65mWmWzTK1CLiz9k0e3iyU27OfGCLdAnJba6gvNvJkIkl0maQSVk9gdrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFPsJOyl; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFPsJOyl"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59583505988so3289950e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 13:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766179808; x=1766784608; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ehPSmNwMGVcwoZTHlDIBfUpRRJiLXS+Rdg4CTzgEj6Q=;
        b=QFPsJOylYwAFt4vKJXmEzAImxZ9v/d4ppi03EmP2tKQ9/iDDaRmUrzHewj1g7/QBEH
         jyCNJkel0pTWfMI3uJgjuZim4BSFmHiUFlQiPRIuTeplAsVrfkQMChi6WBqlvv8lWxle
         aNe/e17SPitbYjwON7kJmTHyWlSU/0O4/EZCh4/ibxQQp8VlTalEK1YWg8vPjuWLLREv
         9TuTXWKXkBrlPke5AuD0Gmqd3vCDms47oAQ9LqrBBFTO9yy15fIn6PZjW4ENGUk2l7dg
         UvQJJ9PYXMykHfJASATWpuWmtbZc3swC/R18J/mOgLeFSeUZu7rAFiF6jfDbvUlSBrXf
         3ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766179808; x=1766784608;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehPSmNwMGVcwoZTHlDIBfUpRRJiLXS+Rdg4CTzgEj6Q=;
        b=QPQYruqb2fDCkxY4zkDaeFdZMV829+d8aNTTFDE5EEIJJVuAQyI4PS90P/iJLhZwbp
         dfVMAvaHsRSPHPGbOnCbz9B8wtIhS/8uVKHmACXZjteE++IwEkrHYOrVFuH31V6jE4jt
         SA95CxtVSJWrPtd6bHyXbqFRqzsSIR0wDRRcM5IVbR+HDq6q/TgCpfSSZDiy4spxeUQM
         UuzWmoe6UInYzl79RjD/tKI+ob87IG2arV3Viy5mZuCeYV0wyvqExBxjl2fM9YlFsJrn
         szelW8QVr0ahiABDfNPsiY7plHLT+bAFGNZazCAX6w42T87g/P1QonPvyXjdDU99Q9Jm
         /fvg==
X-Forwarded-Encrypted: i=1; AJvYcCWjTVcdPlNSDncS9sqtaplnXQHN5IWLT7RrtyXJ3C66EmZAEeK3jH9dJZAXAW+vK4dIL52h+cDx+Rj0y8vncA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeV8P8/1YXug+SgX1UFlkaVR0orTr57NbVO+fvMU8ZjUrqIPnx
	SVjKavhPsgaZH9WSFK876dxqwbLS75cKLdreQh0CJGtxNllZNh3Ftg4V
X-Gm-Gg: AY/fxX4f4U0ODUDEMYlxE1yFLpF8fuUq+QT/jTCNL19avlByprWlWJDNZaT5O0lkWpQ
	hHCTveDp+MfH+BK3ceM2VUUd/5tjAUnioGh4cddEObE9D06znCD4uGDhzmB7ht2nL0GCPKP7QnD
	YYR8AXj+rbZI+vVIpAlprluo3Aczu/pXVpeBBXDqXvkYDDI4A/kTudxGlF3ZtGs0h7tN6rFAC4e
	8wZ/dT2SXKA2SoP84ySytH2Io7XpezR91u4gN8TjeA5Khq1kF5H6JdopU+95LzZBP656euDy4Ya
	P4GerC6jFvwCE1GHEjD2pJXD5HHmYIiwn4bfngFHKow7MmQvOdjCy92A+7C11Fn8cYvebprLNvu
	ELFj4rZU2q7Nx99zfHi8JWRVkbgdepzg+9RJJHD05UKSLR/KpqzFhZgf5OHPzhiPLRPUNhZ0YK8
	2wUbCr1ISAS4RA00ltLNvGG7lsklluGm/+6lHAmvnEZfqRGeFYBiUHh38xvXO+TVClyckfH/9Lj
	cPYFQ==
X-Google-Smtp-Source: AGHT+IEIvBwkddfsy2qs3/Dkt4Qs6IXl/7tpd4f9MZSJ671KBBAi5GQMyG2sb25sEfyCw5Mlhn1L+g==
X-Received: by 2002:a05:6512:2352:b0:598:f6cf:edca with SMTP id 2adb3069b0e04-59a124e725cmr2485335e87.8.1766179807353;
        Fri, 19 Dec 2025 13:30:07 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-132-227.bb.dnainternet.fi. [37.33.132.227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251b2b0sm8264431fa.18.2025.12.19.13.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 13:30:06 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 19 Dec 2025 23:29:36 +0200
Subject: [PATCH] rust: page: Simplify overflow check using checked_add()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-rust-page-check-v1-1-df2e52fa3bd5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL/DRWkC/x2MQQqAIBAAvyJ7TkhFyL4SHWTbcglMtCKQ/p50H
 IaZCoUyU4FRVMh0c+EjNlCdAAw+biR5aQy611Zp5WS+yimTbwID4S4H5RDROLTGQ6tSppWf/zj
 N7/sB4IAtzWEAAAA=
X-Change-ID: 20251219-rust-page-check-819ccc39c53a
To: Alice Ryhl <aliceryhl@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766179805; l=1981;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=hEPhKwT/pgywPCq0dB8gQ/MONU1VQk+JP/YIdz6V9os=;
 b=hUci18pgOdk6yTb8UpLS8La4oZ7CgBWZEVi4bwZBPyMtxobfJC7ZYdcuiDOOURX8HfAW7o23m
 cDtYQgBI+d4ChqGw1QSAG7qw8CyNnRcLeNZ49DSZtkTAH3F3jDbuiZm
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Replace the explicit bounds comparisons with a single checked_add()-based
range check. This avoids redundant comparisons, makes the overflow case
explicit, and results in simpler generated code (checked with godbolt
for x86).

Option::is_none_or() would be nicer, but it requires Rust 1.82; the
kernel currently targets 1.78.

No functional change intended.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/page.rs | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..a07e6d256860 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -239,17 +239,15 @@ fn with_pointer_into_page<T>(
         len: usize,
         f: impl FnOnce(*mut u8) -> Result<T>,
     ) -> Result<T> {
-        let bounds_ok = off <= PAGE_SIZE && len <= PAGE_SIZE && (off + len) <= PAGE_SIZE;
-
-        if bounds_ok {
-            self.with_page_mapped(move |page_addr| {
-                // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
-                // result in a pointer that is in bounds or one off the end of the page.
-                f(unsafe { page_addr.add(off) })
-            })
-        } else {
-            Err(EINVAL)
+        if off.checked_add(len).map_or(true, |end| end > PAGE_SIZE) {
+            return Err(EINVAL);
         }
+
+        self.with_page_mapped(move |page_addr| {
+            // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
+            // result in a pointer that is in bounds or one off the end of the page.
+            f(unsafe { page_addr.add(off) })
+        })
     }
 
     /// Maps the page and reads from it into the given buffer.

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-rust-page-check-819ccc39c53a

Best regards,
-- 
Kari Argillander <kari.argillander@gmail.com>

