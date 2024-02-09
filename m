Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C23771E
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707477550; cv=none; b=cV0RdMTAahCc7D4408zY6RdDFpGfRnSqulXIwICpMFEyjk5WkMzSs7astwmS2q3bgnq0b+xCoN24/71N1hiaocj/gEnDq5mnJbRzfU2hAYxijRNWUWktr/X98b5iw3Wg/P2Q8gTF6JmrOawJMTh5pOenOyg49ZcbQAaNuOHHFWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707477550; c=relaxed/simple;
	bh=jpdPd0bnKJx0v5IohdnvKzMyKCUyMI+4XjIMSwBUtJM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nbhrz8WwajZSvrBt0fouQxe1wFklsX6l6bxlWw/qTFQMZaSvyOa/qbEuvo7HBRUvf2wAziAb/NhiSrNcM5/Y7J96v8x4qIs4VoGMm1XP+65irIMgFLfJHZ044/3df8ee/GHZeOlG5STG47YCZtPw2b/4Fb5quABL5sau/yXt3R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMwpJ181; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMwpJ181"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-2d0d1cafe68so7708861fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707477546; x=1708082346; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dH78NmaaVu9DkNui20oQ6e4x0KTKrZZbiJBCrE6Owok=;
        b=fMwpJ181JsBSwEf+xWaG3/SYXBV5CQTgm1fer7YnRjhCUr5NquV/xRfFcboy8INDkb
         Wnx1ERJ9xVZhflkG7NnCDayOEv8HGbkC52S2tl/rqNP3VIQbVRoMIuGV9yFRKBa2lsyR
         9Rj2kUB/1jwG/MMtrUpoHc4voNBRpwQuWhMybDKLG8FtpPnQz3Ic3DTBjc1WVsJKqd/u
         nnAaqg1jv9r1wV/VOkJFE83Q/Lm0GLUfodwwIoGzCj9/tqJEfTVrUmeps2YgaBQI3mYS
         YJ7nrUsXUUcT8Epn9pBekTXpz1vkD+hO0YxeHftcIMFgHQSsC6wSIhLCIeTx2aFQzvmT
         EwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707477546; x=1708082346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dH78NmaaVu9DkNui20oQ6e4x0KTKrZZbiJBCrE6Owok=;
        b=tAgpaWGHrgOge+5pXdbn9TnZBsFD8t/CDYTXMTxzhHeGL30Z5niFthzCUxw4unKqfC
         c4c/x3lMRsDlZvajgLLJ6L3eTMtjTDjuhvPzqHPjAhluEJNYtuL3McJc8wUtsaDk9ctO
         z7oBe3CHRSaRoOqMITXIH2BPUctg7JkZzaW2C2fEe7oZ1EpcCPnyEjUu/hTjUImz2i/2
         fu1OYXFmIJsqIgdQTovxLsoO6Ahyosw0F3bJ5kaz8TiFxTgct8qXMe2BkAhpEBLREnVq
         1u+TfOgVux+u0SauMWdEDPqgVhWfQ+9rFhsi1wSpAzAEegaZqOFzaJMKtMFrdNIOXyQc
         0V/g==
X-Forwarded-Encrypted: i=1; AJvYcCWtsml63PpjdYvom01uIE3gAP0CtFPhcvDqXzPZuh5GHPD9Ke7qgQsYJeFw89iUz1JgJlbTPWtiPE6GG033jhzYfnE/cjtuCoFwy2PQWvs=
X-Gm-Message-State: AOJu0Yzm2/M1SpuBzLiMugdJH1h9gv8bIrJB/YTm/nFNnJQ9lT0USllS
	O6dg5TZO8KiMoFepknmHYJjNbUcj6Ked1jldZJdmcay2EiR7j9lrLBwchfod+znL0+aoogQPIvd
	uDRPQ/UvhKZ2Bgw==
X-Google-Smtp-Source: AGHT+IGS2oaZYt1srNujLjVmLRS+TgMSmBPm6JQj4xflUDKrNakN3Id603Ljx2qc+uq4Olgz3CXsgeZodx6cTZ8=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:651c:3c5:b0:2d0:d4d5:ae1c with SMTP
 id f5-20020a05651c03c500b002d0d4d5ae1cmr1228ljp.3.1707477545846; Fri, 09 Feb
 2024 03:19:05 -0800 (PST)
Date: Fri, 09 Feb 2024 11:18:19 +0000
In-Reply-To: <20240209-alice-file-v5-0-a37886783025@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240209-alice-file-v5-0-a37886783025@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5091; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4MEaahIDL8tWEqa8QqxP69ykw7VMt4xM9gXmsdnnpis=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBlxgoTvYPgkAnbZVxHmgiO+gQPznHds8k46wwuJ
 MredE562XyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZcYKEwAKCRAEWL7uWMY5
 RtJQD/sEDIZSqHxDN3nJargoXJ16TZZD2XdbWOh/p5vtwMsyAeGLE9OeZDO+l4qmX/vzv1c2Shm
 JwyjAWkpt2FRHvpmP3XXi/3JIefGh98lCSC345lEzOWIMkk1gOa/PdxzPT+vU/f3VahQTmCaKHv
 oBPiBtlh6qYQiM+gUE0KzRgWPfNphRjYc5ZX7EFKL+3Z9Pkpxsc3a+BDxhhF5rsfaaFyQMQ56zS
 Nr887zw1Q5B/A9NOShHBQYe9TwazetkTKpQGBru+2TiYEqqKdohhWoTTqMF5Cb3YCUldHySQTNv
 FIEYF7Ix/wa1GnwChc9xfCiojLbJY1beQw5wRmDJ9Xj5pNZDDni6XlQ6evAxSaOMMraDEbNiHs5
 VnAYKCgEA9BAMYAL7vW9yq5Zjxzn2pzE6NnS1Th+mbb8PTQ8L9v1sPknUdr60rU1M7B2zDZaIkA
 jw84LQ+PxUeZJk5ilgtzk6MO5Cb40lMYJ7S9efrYIXaZb6OBfvRtWWaYizRsCpphAX2Z3p3P/R6
 9mhNHhSHJkVWE3Bo86kKyKz8lp1d48r2OepUJsyxAL0rz5AcOsQnp4T7+1otubS9PQ/PJCJdwrW
 MNAokD2n0VSroP021QoRGx6IJvRTAS10mN+pDIDaNX5N4+F76IotOXUe8V8Rat52C6n+94RpgRT pb5OJWjKzH4EhkA==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240209-alice-file-v5-6-a37886783025@google.com>
Subject: [PATCH v5 6/9] rust: file: add `FileDescriptorReservation`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="utf-8"

From: Wedson Almeida Filho <wedsonaf@gmail.com>

Allow for the creation of a file descriptor in two steps: first, we
reserve a slot for it, then we commit or drop the reservation. The first
step may fail (e.g., the current process ran out of available slots),
but commit and drop never fail (and are mutually exclusive).

This is needed by Rust Binder when fds are sent from one process to
another. It has to be a two-step process to properly handle the case
where multiple fds are sent: The operation must fail or succeed
atomically, which we achieve by first reserving the fds we need, and
only installing the files once we have reserved enough fds to send the
files.

Fd reservations assume that the value of `current` does not change
between the call to get_unused_fd_flags and the call to fd_install (or
put_unused_fd). By not implementing the Send trait, this abstraction
ensures that the `FileDescriptorReservation` cannot be moved into a
different process.

Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/file.rs | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index 3a64c5022941..fb903b7f23fe 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -9,7 +9,7 @@
     bindings,
     cred::Credential,
     error::{code::*, Error, Result},
-    types::{ARef, AlwaysRefCounted, Opaque},
+    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
 };
 use core::ptr;
 
@@ -248,6 +248,76 @@ unsafe fn dec_ref(obj: ptr::NonNull<File>) {
     }
 }
 
+/// A file descriptor reservation.
+///
+/// This allows the creation of a file descriptor in two steps: first, we reserve a slot for it,
+/// then we commit or drop the reservation. The first step may fail (e.g., the current process ran
+/// out of available slots), but commit and drop never fail (and are mutually exclusive).
+///
+/// Dropping the reservation happens in the destructor of this type.
+///
+/// # Invariants
+///
+/// The fd stored in this struct must correspond to a reserved file descriptor of the current task.
+pub struct FileDescriptorReservation {
+    fd: u32,
+    /// Prevent values of this type from being moved to a different task.
+    ///
+    /// The `fd_install` and `put_unused_fd` functions assume that the value of `current` is
+    /// unchanged since the call to `get_unused_fd_flags`. By adding this marker to this type, we
+    /// prevent it from being moved across task boundaries, which ensures that `current` does not
+    /// change while this value exists.
+    _not_send: NotThreadSafe,
+}
+
+impl FileDescriptorReservation {
+    /// Creates a new file descriptor reservation.
+    pub fn get_unused_fd_flags(flags: u32) -> Result<Self> {
+        // SAFETY: FFI call, there are no safety requirements on `flags`.
+        let fd: i32 = unsafe { bindings::get_unused_fd_flags(flags) };
+        if fd < 0 {
+            return Err(Error::from_errno(fd));
+        }
+        Ok(Self {
+            fd: fd as u32,
+            _not_send: NotThreadSafe,
+        })
+    }
+
+    /// Returns the file descriptor number that was reserved.
+    pub fn reserved_fd(&self) -> u32 {
+        self.fd
+    }
+
+    /// Commits the reservation.
+    ///
+    /// The previously reserved file descriptor is bound to `file`. This method consumes the
+    /// [`FileDescriptorReservation`], so it will not be usable after this call.
+    pub fn fd_install(self, file: ARef<File>) {
+        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`. We have not yet used
+        // the fd, so it is still valid, and `current` still refers to the same task, as this type
+        // cannot be moved across task boundaries.
+        //
+        // Furthermore, the file pointer is guaranteed to own a refcount by its type invariants,
+        // and we take ownership of that refcount by not running the destructor below.
+        unsafe { bindings::fd_install(self.fd, file.as_ptr()) };
+
+        // `fd_install` consumes both the file descriptor and the file reference, so we cannot run
+        // the destructors.
+        core::mem::forget(self);
+        core::mem::forget(file);
+    }
+}
+
+impl Drop for FileDescriptorReservation {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants of this type, `self.fd` was previously returned by
+        // `get_unused_fd_flags`. We have not yet used the fd, so it is still valid, and `current`
+        // still refers to the same task, as this type cannot be moved across task boundaries.
+        unsafe { bindings::put_unused_fd(self.fd) };
+    }
+}
+
 /// Represents the `EBADF` error code.
 ///
 /// Used for methods that can only fail with `EBADF`.

-- 
2.43.0.687.g38aa6559b0-goog

