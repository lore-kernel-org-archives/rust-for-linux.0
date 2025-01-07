Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5247E1F2C48
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736277958; cv=none; b=ur9vpbIJfZE0wH8l5GE7JeNg0pP+zhHWpsb/P1a/9lHqhu6mK9+pApHwmSjWgxmNKoLZQHbuT+1MPWVsK/aEzt0pbBqv7R/Oiyuop7biXGn2DX5IeRo6zAeoBxZXoUPtsOsa5asiAgGHem+8X+8IFi+SuyTCB/rsuCZHM0FQwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736277958; c=relaxed/simple;
	bh=dYsGWRnulJdbfSWlN7pVv1x3ob3bIuW2JGDxxyRyMVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P49/qTXlhNYe7dg8Pao3Omr1P94MJxYMzMYs35Gd17V/jJZ8Bac6PqGZlaGyIAav/Zh61inT3G5pxpb7+ot9mqxKuYnSBKnO5gfEginhMeF01rxuGLl3QvZrTRRyrVYShs3cDbu9u7vjZKPs7mYSRFqPrj1bT2V6Gc1aeCs3UyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDxXnxyz; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDxXnxyz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso17349455a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 11:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736277954; x=1736882754; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=unsOP1LTIRQtPtFksLGg0xqqMMd0uoUu0hBUdGxfdW4=;
        b=SDxXnxyz5mmvHHMwy0eTNjQphvSU4InlhetqyWauocI79YI0xFZylJ4MaUDuoq3Rss
         hwJrGiBlsL/dc+5+8DaFkl/gUZ99YcGIDe7uLemG0WNRqy4aAJ0gbU5TsxeCK2MXah+f
         qnpS5j6IxoFDTfJLyEBQLx7/6Xc8l4JrQAeqvlzX0jPnw4BEizpT9rNDZAVYP3MIJ/IM
         F/pwHBK6G4PXTqh+n396XuhfWGeWvZMyEuOL82FCkgEeHtiGUTcHxbYWwcCCiv2yB9Fa
         6BrK+yKlFjOHdB+Q5vbIettEyoNqiOuhIQ2XvrevsQw/hTRPV4RwTTRa5Pv+lableYqU
         ygNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736277954; x=1736882754;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unsOP1LTIRQtPtFksLGg0xqqMMd0uoUu0hBUdGxfdW4=;
        b=D6f0Fxe+nCvTnZhNv6DQOTJsAL/uJjDfWB7JOb8zoE3gBJUVt7rDW5L9wtx/gsTwuW
         gY7XaAat62oVs8M3QmaIqPQLSUeugRHjgOXYHjssxZYQKk92bl4uAGaGRJJi5rsKwcnL
         NuDxJWhXul3NkC1oCszUtbOxswLqnW3OimZ4fWaC77LwJLT+wOTn6bukLT1pCCMleFpb
         MQMe9gzUDSqFwUM1HiIEHEuSGgNzeDOcLCyY0qUsmBYhv2a5nrZpqiO2mpwKhMlBW/kK
         QbfdigQ1sRhRE5GIU5/yKIDtsS8ge5BToZiS0bfonCCXT8FSK1666vUjvHS0oBnvyStc
         dCpw==
X-Gm-Message-State: AOJu0Yx9vEyV43eqG5znHOiQRq0MR7NALlr+w77kPIHh5mL9FZ72AdCb
	sxpuNIqokS8VNLaWkyQfCTn1NJ8tVGxgZ45gOVgyYAKc7fiRzrrDlIii/iNGPMM=
X-Gm-Gg: ASbGncu1O95VSQMs7FtMvC4pgYnbWAQLAHbj3nNNpZFTMXYZoSvDDAWdpql3+Iu0nBy
	S0ddXPKfjS0jpku/QcfJxu1PmrEJ1BtSxTvvYIuD/aelXEAmztSh74Cfd7A9N2UATP4DxWU1FO3
	dT0Al+/hiupnBfXpuf4NSfp5tkNlUIRLGGuOdGsH9vOTN86tp49p4+xhjJBfJelxSlkjKkk8KiR
	vi4fhzrCV12wrLUZHzLkszN8blDvzsKf0lVvPixvLvxUXAhMvIRR0gj7DHurd3A
X-Google-Smtp-Source: AGHT+IEqQLD06XC797Et0O8P0YnnpNcnaA3E9h169RfRG/a+WQ00x3BmgYSZ1cRkSl6yCnZ/Rs7Ikg==
X-Received: by 2002:a17:90b:270d:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-2f548ebf526mr95047a91.14.1736277954451;
        Tue, 07 Jan 2025 11:25:54 -0800 (PST)
Received: from fedora.local ([2804:d57:4e50:a700:a12d:2a91:966f:2aae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm312431175ad.214.2025.01.07.11.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:25:54 -0800 (PST)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Tue, 07 Jan 2025 16:25:39 -0300
Subject: [PATCH v2] rust: generalize userSliceReader to support any Vec
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-gen-userslice-readall-alloc-v2-1-d7fe4d19241a@gmail.com>
X-B4-Tracking: v=1; b=H4sIALJ/fWcC/5XOPQ7CMAwF4KtUmQlqnCYNTNwDMaSO00bqD0qgA
 qHenZQJMdHBw7Pkz+/FEsVAiR2LF4s0hxSmMQfYFQw7O7bEg8uZQQmVAADe0sjv+Sj1AYlHss7
 2Pc8zITdldUCtDWlFLAvXSD48Pvr5knMX0m2Kz8+zWazb/9xZcMEbqwAroywZf2oHG/o9TsP65
 n8DVd3UrjrU4MsvY+02w4Y+kK3ao7GlVISefi25wZLZkqQb4bSTDt23tSzLG0r2RpOiAQAA
X-Change-ID: 20241222-gen-userslice-readall-alloc-8049c668e65e
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
 Filipe Xavier <felipe_life@live.com>, 
 Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: b4 0.14.2

The UserSliceReader::read_all function is currently restricted to use
only Vec with the kmalloc allocator.
However, there is no reason for this limitation.
This patch generalizes the function to accept any Vec regardless of the
allocator used.
There's a use-case for a KVVec in Binder to avoid maximum
sizes for a certain array.

Link: https://github.com/Rust-for-Linux/linux/issues/1136
Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
---
Changes in v2:
- Commit description: added use case on description and send to memorymanagment on copy.
- Link to v1: https://lore.kernel.org/r/20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com
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

