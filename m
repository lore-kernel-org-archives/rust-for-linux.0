Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1BF267731
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 04:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768797318; cv=none; b=g9DM2FplI4QLUJPHhK+CfbE1f5PQctYBfBIRqtxbOsKvnWMb2123Aa1pibyUXtU+2D6UwT+uLTti4d9tamAVdeZ2W+RqtVieiPZSNk06cI7Asfa2Tl8arLa4tMve1sSh9KigWyCY3jNOHOYXC11wVErHHOEKfBnWgh9hWYm8qNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768797318; c=relaxed/simple;
	bh=sBOZFFRm5WpVRC1H1Lsqxc7TexKOLXjJgUUtx20PpOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P66SmSwGiYioGBa4R3LlTpHYXwjOi7YmAmbMrLxAgc3/lLMafF77NSpsRL4rxhgqtyrDmsNBuP5ysLU/OwJzgwQye+eeGXbz4rbM9aXM28+I7UkrZE0gNDjO9TqALnhJyuaFncaUolmdLJEh9HK5pJG1cK+r7/3lSERoGoyOG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0fe77d141so25420645ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 20:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768797314; x=1769402114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQ0XMnJps3bF0FCBc9X/r4ObhgL2JP8UsYTceI3EWlI=;
        b=qCWdQQkH60q3A07sxPi4oOD83ESczxwE+XNP+SbWPDVPebsWuWq1FHPwTx/xSNCPh7
         jhbXw4zpTMWdkO0KQRpU4fx76VLJ4JFVp0FY1Lzko3K4sBwkrf6PwmkdfSrkM8qsnTBk
         xCm/aQx3jJ+2ua14g6uOA3bqovueA+zvYLWJwcpRiNvN7+oPmBSbOeJLOucnPVE7gtOO
         J4oupROMfH1wWRhVxdxYxUWsL8ou6Q9I5rJoTqBc96EIQ2DkaHdWF6YIuuDgAo68hm61
         6We+gMrpqp9I1wTNbyWL0W4r0eGe2h0dOoO9dwn3PRDP5PdJoQehH42pw9Rk5rOYzODH
         B3SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzWaAb8b1aekRaZxTU99SNw7zGriN74BClAdhigljRA7LCVbCnagkQ14GjWxfZGcToNdgIR13j88kEZK1XSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kI9fapKhf3E7wT61ghQ2EJByx7ughk6xU0CSV6vVezltPrre
	ZqOjJjgk7Tl8KFTgjm4OwteQKBrcsE3TlrCeFE+Bdf384pAWwBov9/WO
X-Gm-Gg: AZuq6aLOrhx3Z09D7l1VQlb/ZlFwDRz+YMjrjpZcPAfyWk1YoDn9hbcnuRhlAkv4QZ8
	Ww+TEMF9vq0YhRgDrMa2RRryCGz0cJtxcpSosP+Fk0NqVerl1P1uqLBs6VnRzJ09EmhC41XgJMU
	aoasu7g7RXSqI7z01YS/lyG9lnqyfVkoNWM0786EicASSn7KoKcbKa/xIeOeDeBkvKUFI3fKLjW
	h7RN7qFq5xOR54q4l5YjCBHkjsF9M9saAVnc5q3RLN2W0urVOuviLNbfuAm3tOigi8AhdnRwzNl
	YmFFebJ3UZGAKOGBOm0+RcX2CYZmFqEgEdBnav4Ubdc1XfdpzK/HjC3gSjeRIQ5xdBC+AQq6FGK
	8GkQRmO0jdzQaybvX3xF7AtP9MgY4oTiynrUyft6KxLIVnXrHUxB7kWu1pyuEB9XnAIhEMeGAJe
	KtlGR4VRajCz/1xPZar+iDm3KwfAGppfmTOUN+mdjvxh8F
X-Received: by 2002:a17:903:9ce:b0:295:fc0:5a32 with SMTP id d9443c01a7336-2a717518e27mr102740185ad.3.1768797314077;
        Sun, 18 Jan 2026 20:35:14 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a719411cc0sm78952825ad.85.2026.01.18.20.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 20:35:13 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v9 4/4] rust: fmt: add RawPtr for debugging pointer formatting
Date: Mon, 19 Jan 2026 12:35:02 +0800
Message-ID: <20260119043502.1534349-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033006.1453006-1-sunke@kylinos.cn>
References: <20260119033006.1453006-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RawPtr type that formats pointers as their raw address without
hashing. This corresponds to the %px format specifier behavior in the
kernel.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 6052d9f8628bb..d023aa00c7470 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -6,7 +6,10 @@
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
 
-use crate::bindings;
+use crate::{
+    bindings,
+    ffi::c_void, //
+};
 
 /// Internal adapter used to route allow implementations of formatting traits for foreign types.
 ///
@@ -233,3 +236,43 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     {<T>} Adapter<&*const T>,
     {<T>} Adapter<&*mut T>,
 );
+
+/// A pointer that will be printed as its raw address (corresponds to `%px`).
+///
+/// **Warning**: This exposes the real kernel address and should only be
+/// used for debugging purposes. Consider using [`HashedPtr`] instead for
+/// production code.
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     fmt::RawPtr,
+///     prelude::fmt,
+///     str::CString, //
+/// };
+///
+/// let ptr = RawPtr(0x12345678 as *const u8);
+/// pr_info!("Raw pointer: {:016p}\n", ptr);
+///
+/// // Width option test
+/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
+/// let width_30 = cstr.to_str()?;
+/// assert_eq!(width_30.len(), 30);
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct RawPtr<T>(pub *const T);
+
+impl<T> Pointer for RawPtr<T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        // Directly format the raw address - no hashing or restriction.
+        // This corresponds to %px behavior.
+        core::fmt::Pointer::fmt(&self.0.cast::<c_void>(), f)
+    }
+}
+
+impl_pointer_forward!(
+    {<T>} RawPtr<T>,
+);
-- 
2.43.0

