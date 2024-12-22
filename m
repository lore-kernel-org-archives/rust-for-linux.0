Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDE18A6B7
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Dec 2024 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734885448; cv=none; b=tnxv+9uKN8ULgJ4UZGB0Amd06JDE+aod2O6mp8VlADSI5qPl2D0Ny2gWhEEjnothlhsX25H2qwnZKsH1ii5z0wySiBi0/x5x58P9EtEncFsJfY1L59PBUIoJrn1solgTriT4nLWH5W0CRIwuNybQQfoyL3nBilstm5AV4H9ijWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734885448; c=relaxed/simple;
	bh=EKi0CAk0tUH/l2OalckY0LlnSnu2GP9/fvYo1HK34Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MF5mzWPefjljyHu1jsVqhcukep+a0PJ1qP6i/R6cvQbOQ9HMS2hJFn+UAl4IMWk0BTCWLCOC73hGWEOsbmOQ5yGKLTL1bGkKj/joOCNmd3hokaObxRfK9Kguu7W3tPYpCaMTyYv9UA+A8WdWCrsFYawRLNTyNtzuhy0hXZJ3QoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkEsOmF3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkEsOmF3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2162c0f6a39so39800195ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Dec 2024 08:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734885446; x=1735490246; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4Lk2EZj09yApStb5mSmSoqlfVOHqR1lJjhDNpaudGw=;
        b=IkEsOmF39o/LYLIhnmGPTys++/YV3O/XosZp1CJVP4feZnzI51z0nIB7RBX9W+LkVM
         Sah5JU3PfXc5q2oX4ini5lb82x8oM2hBCO67q/paAvrs3UF//SgS9UXEGQ20aTuXC9aO
         MXkLqOfIBDOZBM+7EXxcpg2I5+gUMHSrx9ldYXlkEggp16WeFFsG4Tm+a5IB/AONRqlG
         SHSy7/NjEDYUIT0GLvrV8GMnaU04Kzh9e8eqv8U2bfKK/XxuF3gDg4Fzc3ZWQQ9qEBCa
         EqC041bQ4JWVg/Gy/Cqy3ZN1EDcoV9JJE+z4YHChkBlH5GVB95hUr8B4dmU6NaHJtbHs
         VqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734885446; x=1735490246;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4Lk2EZj09yApStb5mSmSoqlfVOHqR1lJjhDNpaudGw=;
        b=smapIa/citT989BGK9S9KOLYLaGMKl9ZvRhS3yW+NIU5Scuw2Gmxz+mMYh7kuelAMb
         wrh49eARLPBdpvV17+TH+lU3ySat9bsfCIEyY/fd8eEmSJDir8QUYSfOS5a5ARw31FyD
         2o/FZDB3nOEaW8BQXLh6Of3kA63q8VG48jkPrJ1nuvcVpERXZOGQfvVo4GzxPiGxucev
         64yntFDTg50CQTj8qS2U3y9zm3JroTkLoFE9d7X0aWKa/WfxLhLEEiqnDJ+UKYL1/Q8d
         f64hpJarYc3BcZ9mi3gw2LctUY+O8V77B5AQGN5lq3EgCmo4quKA9gBbwx+uFXEXl18j
         dNQg==
X-Gm-Message-State: AOJu0YwsoT+58CTsAUrL/sx01mADNMMgAlWoRfSCBSBymYo9b1Ivm+WU
	pkr2UzgY0MtCirULIDewzDiMROxIeAn5KtblNLBla8QPT6N5KT95
X-Gm-Gg: ASbGncsq5YMAxkMw1QX9xqg0RK/n1NjH43PEps4c5vVl66Ud3ezoWlFbKDEDGmywOhj
	l6p1JEa5tO/j0Ez1W752KwTDysRolDbzC+D9CMfRGA1Qr4rt2e7L0vq3CWRfMW+P28ZDGASk/+J
	8VZa7EF1SaBipN2IrtJb/zutJLYR83DbKg+9Xwvy5FgEejyZyMusvQiK5j7GK7eJBbEv+WMqvad
	M4H6/rXEl/k4W4zXzFuh+VJT66YweeS717XpqQzCDXXnaA1AW/ro1vZSfQTjvDa
X-Google-Smtp-Source: AGHT+IFLGgPTzglMte6ASxjiYU2dRHYLjak98ga9e+nm5RqOLurGREGu22aLd2RTbJ/RkTb5vP4fvQ==
X-Received: by 2002:a17:902:f689:b0:215:2d2c:dd0c with SMTP id d9443c01a7336-219da5e3b97mr204747485ad.14.1734885446407;
        Sun, 22 Dec 2024 08:37:26 -0800 (PST)
Received: from fedora.local ([2804:d57:4e50:a700:a12d:2a91:966f:2aae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962c31sm58819265ad.47.2024.12.22.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 08:37:26 -0800 (PST)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Sun, 22 Dec 2024 13:37:02 -0300
Subject: [PATCH] rust: generalize userSliceReader to support any Vec
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC1AaGcC/5XNsQ7CIBCA4VcxzGIKFEQn38M40ONoSdpiQImm6
 btLOxknO9zwX3LfTSRh9JjIeTeRiNknH8YSbL8j0JmxReptacIrXjPOOW1xpM9ylHoPSCMaa/q
 elglAdVWfQCmNSiIpwj2i869Vv95Kdz49QnyvzzJbtv+5mVFGGyM51Foa1O7SDsb3BwgDWdzMN
 1i8WEcH2lRCIjj8tcQGSxRLoGqYVVZYsN/WPM8fgozsRV4BAAA=
X-Change-ID: 20241222-gen-userslice-readall-alloc-8049c668e65e
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, Filipe Xavier <felipe_life@live.com>, 
 Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: b4 0.14.2

The UserSliceReader::read_all function is currently restricted to use
only Vec with the kmalloc allocator.
However, there is no reason for this limitation.
This patch generalizes the function to accept any Vec regardless of the
allocator used.

Link: https://github.com/Rust-for-Linux/linux/issues/1136
Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
---
 rust/kernel/uaccess.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index cc044924867b89f6116c7f9ec216d8cea2b3f8d7..719b0a48ff5550acc19f2e607c0a09f818145def 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/linux/uaccess.h`](srctree/include/linux/uaccess.h)
 
 use crate::{
-    alloc::Flags,
+    alloc::{Allocator, Flags},
     bindings,
     error::Result,
     ffi::c_void,
@@ -127,7 +127,7 @@ pub fn new(ptr: UserPtr, length: usize) -> Self {
     /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address.
-    pub fn read_all(self, buf: &mut KVec<u8>, flags: Flags) -> Result {
+    pub fn read_all<A: Allocator>(self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
         self.reader().read_all(buf, flags)
     }
 
@@ -281,7 +281,7 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
     /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address.
-    pub fn read_all(mut self, buf: &mut KVec<u8>, flags: Flags) -> Result {
+    pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
         let len = self.length;
         buf.reserve(len, flags)?;
 

---
base-commit: 0c5928deada15a8d075516e6e0d9ee19011bb000
change-id: 20241222-gen-userslice-readall-alloc-8049c668e65e

Best regards,
-- 
Filipe Xavier <felipeaggger@gmail.com>

