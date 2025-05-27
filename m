Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0826FA7B
	for <rust-for-linux@vger.kernel.org>; Tue, 27 May 2025 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349283; cv=none; b=ryoFKbtA8d2BTwWT6adv5w1xISfRVTZ7PbCxzY8DLph7Fvyzc3rykwCx5lyvz4EO8AgqO0fyCyYJv9TL3u1Ygr4ZRU4ZAXzNBdev/0h4m4a4bO6Pibs9xV7wW9jE3boIox+ePefmH5w9x/EMWGvS0TnFxtfgcrlAwITj8zJcR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349283; c=relaxed/simple;
	bh=5+gHeZnaQYgZutQTtX+EknJ3CS9JtqVgxYuIsi38bhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r+gxhQdsb9USfzMykHPMhfJZEQAL9NsyH4kC/5gwQA6OPnI+lj+A0/q+HkdO2BaxtgyLUo23lIls9SxQbFC6mtf/XZuSVKaVmsh/1Vr6Wk8FBSRgNgEcruhO6czDbHoeFNOOmlHq5OSQD2NHnredc4V8OfEB1kz9IR/VY/LAUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e0twGWY+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e0twGWY+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso24822475e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 May 2025 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748349279; x=1748954079; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eKsBs7x+60dOtIZ1nxd8ao5TOBopIAlwZSl9Z1b0iQQ=;
        b=e0twGWY+5bgupR+r/q1FdB1f4tXIWvWNabFG4Kh1Mzkzx/ESXvoaocxLvElC/HZJsY
         zXF8M9doFmwCZ8TX8YrmUjWWyUIc0ymBb7mOT00dQmfm9DSNL5xGU+K5PZoCuMwBq8c2
         hOcNwrWEUNzjnWSs/5T6wI/w7DFKFpghF/uRqwonSyFFAyqPsGluREPZ0YybOwi0rile
         UB3VUcU1oC51C0I0FE8D5wbLFNebZej0ii23VRUYqeX8embE1yCZXL6sjp13C3Oo4IoV
         y6d5TFVrbx9pd2iVDg4r/sskllbeF7KFwIpi/vjyGmPvuACgiyE2/peOpjzsNiIVRx+/
         DAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748349279; x=1748954079;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKsBs7x+60dOtIZ1nxd8ao5TOBopIAlwZSl9Z1b0iQQ=;
        b=U9B4C9oatmgGSLZC5joj671wg4jqJglOqJ3kJWhacDaJ8FZbVoigs0f0tplsKB3RmA
         ZquUY4kAm7Mi4yrU/2eqn8etloa/hQcisziCOi6EYnDCaAFs6HWdB+jccR6VaEqpkWBn
         BAqKjOgNC91VHG4gt6sT9B6sWkHAItI2B/WSDUpPMnnRZH6aH9qQcY/mM2eKkgwytTR9
         7AgD9p5QskkU9VdWUiE2u2GlslTNwWwKSbxN8xMnsVFNF8MYz+sPHW3sm+j7Dnubu7Q4
         Ic3MZITqv3q/5VCVeNO1s8tkhoPZCmbBH0w/xX4uACwXLUAUjHfH0FdmlQ8KzgSQ0J5j
         mE1A==
X-Forwarded-Encrypted: i=1; AJvYcCXR2Pl3NMFVEP4re7aflaY+ApluRoDjloQa85jBgH0WIP47e4gUTH23RqgsJMxy0xxBUjSmEmz8xG7ZpyLjpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCt4Tnf6VZoVnRdDYCXKRm7JNVB8lPqhho4A0Aj9OyIXFc8WM
	UHk+vZa94CZK9uy4oJqKdKBfwVTNZqOxR+wBR/ND9H4ghUxyHjf7QDASyqY88+0kwRos9qgCCHx
	RJzW4tzwoNuZcR6zp4w==
X-Google-Smtp-Source: AGHT+IGnRHVSmtxKdrmGRlE3xDGcS+8P/Z4lRJJObbM07yTpLPawvzcWIixbwi4EVPbUM3Zpb6y++7QHKHZeG+c=
X-Received: from wmbbd24.prod.google.com ([2002:a05:600c:1f18:b0:442:dc6e:b907])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154f:b0:441:d438:505c with SMTP id 5b1f17b1804b1-44c935dd818mr88577295e9.32.1748349279399;
 Tue, 27 May 2025 05:34:39 -0700 (PDT)
Date: Tue, 27 May 2025 12:34:23 +0000
In-Reply-To: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4347; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=5+gHeZnaQYgZutQTtX+EknJ3CS9JtqVgxYuIsi38bhM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoNbFZq8+H1drpShhcgu1FngxGyqqZO9Thkhg1b
 7JRmMj1EQqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaDWxWQAKCRAEWL7uWMY5
 RvAPEACrquIC8lth9gbCh0iIxp9HpAna/Eo0e/qu5zVLnLC5FbHncx0JUfVyVY4AMS9GQf+KqLl
 6ksFsGPzOhv+Dn5dZWpSkM5QRfpTkkXRMYrkn4vBcMZVPtViaEhU8J1mEJWeMkj25XI2haNSwjs
 Iv4imAgno8X9MiVAz9zosKxzqKD9aw8H0DdKyBxYpHu5wN8pEPpenx8EJTiPkas7OldeV3wm085
 720TLayH2SOUv7hQTPteT7tN7q+jDw1sfg2YnLdS21AHsGlgNJqDhNEuvrWa8JXx97EJelDCbWx
 XX9I1+BrTazrvnl1e4YOzb6ksgp5YFNVHG84GX/FJArgyM4VEzRRbCljBWFX5rj4HlMZJwLiET+
 OSGOKYTyy/wCFS2LwJDFFcvAdvWPR8QyfxHEQDOcQy3zFXBqQygAzcIDQz4NEiNPbKgjPLUCM+P
 /NeqSo9qqZZgnNOaC88eblTbAEQBynFFYDFo/0djY+5JCt/HaFOXuW/gf81rtXjBTCZl1IWhLU2
 oPtmoko7px7PLm6TcaJAHBKfnnJrq7tuoqSbqil21KFF5+aGk5PROYOMyZDoHMhmp3siyVt9XLY
 diqZyHx6oJsXlc2tlFM5woDbpDZ1XsGgF0HF0AkcQDblzTEbkqiHAvJZ4MSy77rOG3xP7X7kSG8 xFcvIrouFd626PA==
X-Mailer: b4 0.14.2
Message-ID: <20250527-strncpy-from-user-v4-2-82168470d472@google.com>
Subject: [PATCH v4 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds a more convenient method for reading C strings from
userspace. Logic is added to NUL-terminate the buffer when necessary so
that a &CStr can be returned.

Note that we treat attempts to read past `self.length` as a fault, so
this returns EFAULT if that limit is exceeded before `buf.len()` is
reached.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 56 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 9b1e4016fca2c25a44a8417c7e35e0fcf08aa959..e6534b52a1920254d61f8349426d4cdb38286089 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -293,6 +293,61 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
         unsafe { buf.set_len(buf.len() + len) };
         Ok(())
     }
+
+    /// Read a NUL-terminated string from userspace and return it.
+    ///
+    /// The string is read into `buf` and a NUL-terminator is added if the end of `buf` is reached.
+    /// Since there must be space to add a NUL-terminator, the buffer must not be empty. The
+    /// returned `&CStr` points into `buf`.
+    ///
+    /// Fails with [`EFAULT`] if the read happens on a bad address (some data may have been
+    /// copied).
+    #[doc(alias = "strncpy_from_user")]
+    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
+        if buf.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: The types are compatible and `strncpy_from_user` doesn't write uninitialized
+        // bytes to `buf`.
+        let mut dst = unsafe { &mut *(buf as *mut [u8] as *mut [MaybeUninit<u8>]) };
+
+        // We never read more than `self.length` bytes.
+        if dst.len() > self.length {
+            dst = &mut dst[..self.length];
+        }
+
+        let mut len = raw_strncpy_from_user(dst, self.ptr)?;
+        if len < dst.len() {
+            // Add one to include the NUL-terminator.
+            len += 1;
+        } else if len < buf.len() {
+            // This implies that `len == dst.len() < buf.len()`.
+            //
+            // This means that we could not fill the entire buffer, but we had to stop reading
+            // because we hit the `self.length` limit of this `UserSliceReader`. Since we did not
+            // fill the buffer, we treat this case as if we tried to read past the `self.length`
+            // limit and received a page fault, which is consistent with other `UserSliceReader`
+            // methods that also return page faults when you exceed `self.length`.
+            return Err(EFAULT);
+        } else {
+            // This implies that len == buf.len().
+            //
+            // This means that we filled the buffer exactly. In this case, we add a NUL-terminator
+            // and return it. Unlike the `len < dst.len()` branch, don't modify `len` because it
+            // already represents the length including the NUL-terminator.
+            //
+            // SAFETY: Due to the check at the beginning, the buffer is not empty.
+            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
+        }
+
+        // SAFETY: There are two cases:
+        // * If we hit the `len < dst.len()` case, then `raw_strncpy_from_user` guarantees that
+        //   this slice contains exactly one NUL byte at the end of the string.
+        // * Otherwise, `raw_strncpy_from_user` guarantees that the string contained no NUL bytes,
+        //   and we have since added a NUL byte at the end.
+        Ok(unsafe { CStr::from_bytes_with_nul_unchecked(&buf[..len]) })
+    }
 }
 
 /// A writer for [`UserSlice`].
@@ -383,7 +438,6 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
 /// initialized and non-zero. Furthermore, if `len < dst.len()`, then `dst[len]` is a NUL byte.
 /// Unsafe code may rely on these guarantees.
 #[inline]
-#[expect(dead_code)]
 fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {
     // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
     let len = dst.len() as isize;

-- 
2.49.0.1151.ga128411c76-goog

