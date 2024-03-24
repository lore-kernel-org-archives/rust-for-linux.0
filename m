Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CBB14535D
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Mar 2024 23:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711321995; cv=none; b=iWKDxpDnKwVYyk4qn4UqVNbdAKiuiEJlzcSABM9hDKHZRAAJ/lX51ChwU4eU8MrSxvViNOD7VmL80ERZcgO4C1ZraciCPPIMgPj0NGoa3uCgngVDQh3Nks6rAi3z1MuC80in6xUazUJ5sMu7u+hyjebBLKBowZ7KdIBtHj+0V8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711321995; c=relaxed/simple;
	bh=8qGxdPp0ebqQ8BJrXZEREU34pnPm9lzorTk5SAfMphc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MO+o0EtWsn4KDuvYFn6KFjfyEpFlQw6Y1MQhPMrkWYTdNaMHDC5q9PNYBPFuEBGfSEq6v1MwIAv/VP3tH6+VapQ9Zs4KHbZX2K00qALrGz4LOZOudjXQjbPjIUUwalHQs7erv7XaFj387xT9UeqVi6hY3K8rIw4CJwByNmsXuTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c71Civbf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c71Civbf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-414866f92beso4286895e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Mar 2024 16:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711321990; x=1711926790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fP7Ls7uWKfPWUstbGnxIlos5de3ZaTK6YiZZAdmhw4c=;
        b=c71Civbf+H8bnjhiNH429wOHMvS2isPtnyGCYFshNGC2Xf51vGW+wN2JXwPOGHUDFI
         5NGWnSL6PdZtYobDLSOUh+MewmAvv6ejGMj87CeGsODVl86WtL+Lhoi8jvp8rbYKpu1F
         ObEpxzw92T/ARl2SJqcOLR+V4qUmCm2r5uHBpWDEtzLeudaAFUBv4DhSvw+r+I/cuIj2
         VpfMVjrcWniVL5MX7+aK4t0NF1yGa8ZsoqkzSx6SrDKKW1+pVr4LzTuNDpbjkZPIqVBu
         kd6MPT4zD3hu8t4Caq2e4jn4fmV6g2TicjlKO6Fv0d8Pk1dR7NBWZeKYhbuGIdEq3g8p
         f5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711321990; x=1711926790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP7Ls7uWKfPWUstbGnxIlos5de3ZaTK6YiZZAdmhw4c=;
        b=DFRFKKojsPdHMtBQLn5fVz1cgHsfNl6zJoJrahapL+Lbfy4SRkIx5YEOKkUqurIWOi
         fUKw4vX1GwNEuKUBIV2QXI7eQb53fleUdBMoakgzwgJW61ObEk3n20SUO03uuwECYJRN
         zVKawFVV/He0cuOyVtDQOrABNjdzEL8fqzBuoTQDIhe1YnSDVnk8trIWmiNvjBy1DQX3
         8DWvhqfqHtGzlQSpqBdswuXkQH6Dw9zoJcvewZ2tEDQFY7iHj3coKBqAToeb2ZSpsU+V
         YWlQTjHAlGYeTSisAKBPbyQdUkJez2a0geaHMhl8+SpSSS80zuj9GIDpZjmmbMBuCNXu
         BxUw==
X-Forwarded-Encrypted: i=1; AJvYcCXt2U5ipfXgqgKrmupblaRttwsOdA+th8gzwUMxs9UOp3Q6FYXGE8Ux+w54ib77sOnPwlRDJcHOCmFvao2wSb96mP9fCBU3pwiTLzFLuFw=
X-Gm-Message-State: AOJu0YzFe0+mq4ZAhvtXlq8tkuTG6TbofxNWfPIE3BkCbdoQka+ADN9n
	2q6AqdlORg/kOOOti3bP+JPOtT7L8Ff6WnbPplJ934wvtkpD21iB
X-Google-Smtp-Source: AGHT+IG2jj6gWe+/MM3BJICF9UsClYSPS+4BsMgfrq1SgbuUyWKag/EKGUr2kxdBnsuLOD0BTyDqVA==
X-Received: by 2002:a05:600c:3c90:b0:414:216:2cd1 with SMTP id bg16-20020a05600c3c9000b0041402162cd1mr3384828wmb.5.1711321989993;
        Sun, 24 Mar 2024 16:13:09 -0700 (PDT)
Received: from vincenzopalazzo-arch-dev.fritz.box ([2001:1620:71db:0:3841:133a:fab8:35a3])
        by smtp.gmail.com with ESMTPSA id h17-20020a5d6891000000b0033d202abf01sm7822505wru.28.2024.03.24.16.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 16:13:09 -0700 (PDT)
From: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To: ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
	Kartik Prajapati <kartikprajapati987@gmail.com>
Subject: [PATCH v1] rust: kernel: types: Add `ARef::into_raw`
Date: Mon, 25 Mar 2024 00:12:09 +0100
Message-ID: <20240324231236.145086-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the function `into_raw` to `ARef<T>`. This method
can be used to turn an `ARef` into a raw pointer.

Link: https://github.com/Rust-for-Linux/linux/issues/1044
Co-developed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Signed-off-by: Kartik Prajapati <kartikprajapati987@gmail.com>
Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
---
 rust/kernel/types.rs | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index aa77bad9bce4..b2a243bb810e 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -366,6 +366,38 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
             _p: PhantomData,
         }
     }
+
+    /// Deconstructs a [`ARef`] object into a raw pointer.
+    ///
+    /// It can be reconstructed once via [`ARef::from_raw`].
+    ///
+    /// Note: This function does not decrement the reference count.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use core::ptr::NonNull;
+    /// use kernel::AlwaysRefCounted;
+    ///
+    /// struct Empty {}
+    ///
+    /// unsafe impl AlwaysRefCounted for Empty {
+    ///     fn inc_ref(&self) {}
+    ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
+    /// }
+    ///
+    /// let mut data = Empty {};
+    /// let ptr = NonNull::<Empty>::new(&mut data as *mut _).unwrap();
+    /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
+    /// let raw_ptr: *mut Empty = ARef::into_raw(data_ref);
+    ///
+    /// assert_eq!(ptr.as_ptr(), raw_ptr);
+    /// ```
+    pub fn into_raw(obj: Self) -> *mut T {
+        let ptr = obj.ptr.as_ptr();
+        core::mem::forget(obj);
+        ptr
+    }
 }
 
 impl<T: AlwaysRefCounted> Clone for ARef<T> {
-- 
2.44.0

