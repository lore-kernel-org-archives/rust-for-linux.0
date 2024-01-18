Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268D2C199
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705588629; cv=none; b=aLMwEppSuZojG9em+hG1TyZ6kiyuGrEpJ0qd7220ESDUqmG2t/aBWuIWdhMqIXX7wnqCp8LoD5VTZtzS02YNSM+rs68pgUIiHwa6T+5EiWXdihGaqFB0r2Z04Ng1uL/JE907V/IqhnYsXxGi0BleQKmHi/X5ua+NMO54xza2rzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705588629; c=relaxed/simple;
	bh=Rjntesxc4Gp7fQsAcEOP8Q1PetN0laArCpHrp7LWq10=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Date:
	 In-Reply-To:Mime-Version:References:X-Developer-Key:
	 X-Developer-Signature:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=V3LrsKIdRq/T+5fwvSkz4sF0eaO6FIT1Ihcp3RL4zvin9iM2GXRH6OMIP7txohHsQHmDHt73Eluv1aJb3N1WlOs4u9k7Iou/qE1go+fiE/AMqA9DRXiKPQH1NqW0/jyuUZ/pCgp7KOvvLsmPChM7d5cLdBVAU1dIm56bsYDn7j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kbQWgdjU; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kbQWgdjU"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5eb6dba1796so213913167b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705588626; x=1706193426; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/zksQHteOqmwiH8Woeh3fMsvz589jdcXJfGHk3odNxA=;
        b=kbQWgdjUkSg22FTp0jLf3z/quZTL8PZSUbAGYIjsENXnLOwvImLvez31PPVdh3tCjF
         +mnbWHy8SrJHgRsVXpCVh6wP/19JwVjxBY2ALNElpGe6N1t4nYYWEyaJt2GkArvPr+kj
         yH0WN6hx9enihyirTL5DDvkcF9JKf/TdDQBGn6lVL0Nv6bJbCxzXwmpAbTJx0o2d+gKX
         5buwOvQyC70227sfEqAwXMJXdpI0d2GkEBXpmM3QWsgU2aJEQK3NeL+wWRo3V/tHvGFl
         BErQ2D5lF+GyNq0lTawJEb1pyP2fh2ionNoPm4CswWuaH5Lh4EoGnrgN3NvzE3KPevZw
         sY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705588626; x=1706193426;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zksQHteOqmwiH8Woeh3fMsvz589jdcXJfGHk3odNxA=;
        b=V1yHXBzHD+bpyDLC+fWEgFOkulbuk41P6nr0LJvx7AEAwgjlLjD7EEwQV8+wDRhs1V
         w2IdLBq9BC11ebuVGLzdGbqVGFYjVOkukjEcasaElmhDGX3uCoKw+fIptSMOY6UIL25q
         Tcf6kWw67AaF3PSU41qxRHycf2K34sxE3pUXJfl6uwoj2rjzX/mg6r/CqDJUj4zZVBSa
         q57E8lgaBK/hHmkKlgo52wOT5A5PJsQXQEFsGt8AFWkbHjpfdmuEX9koT453gjNOceO8
         N+9Z47l0eS9UdQKRtkl854D1e9W+CH9d7oW4+k227iNsu2gYGuDNu9hGYOoTyjQnCPLj
         HgOA==
X-Gm-Message-State: AOJu0YxDAly1FcqSMeTBxi386HnEDkzD68bAGkDqhWwH2TB8q6aZM3Ne
	OJB4oFHCDxYhVmSV6BvVcezX+jIkINCkRU8yqZmVaXnKN76/mPzGs60vt7+1O+ZvV0s9THQrTGZ
	VPv4gwHUf8VLJ3A==
X-Google-Smtp-Source: AGHT+IHiYqPMk1T2LRzBz+HcP4g/t376gt1K0Erodo59xIhSsLG8kAdYdN17gjS2uM71m4zh73QU4bVm1rDDabY=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a81:9851:0:b0:5f8:bd56:176f with SMTP id
 p78-20020a819851000000b005f8bd56176fmr405938ywg.2.1705588626767; Thu, 18 Jan
 2024 06:37:06 -0800 (PST)
Date: Thu, 18 Jan 2024 14:36:46 +0000
In-Reply-To: <20240118-alice-file-v3-0-9694b6f9580c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240118-alice-file-v3-0-9694b6f9580c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931; i=aliceryhl@google.com;
 h=from:subject; bh=kNwOkaV5Ia31XQPZJQTI0yhdRPo15fqa5k6zJvfVgXg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBlqTHPDKdb7jNUOZgmUfWPgNvDVE6eaX4RWU5Zy
 bdHEBvHrc6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZakxzwAKCRAEWL7uWMY5
 RlRcD/9Pfdw5ZyeHjQMrfDqVlF2EJsl7k1szpDxWHbLCa2UP8RqF7+XIr3mGO+hk9dCCNajvQ4j
 NKBRxTd1A5qm49D1/dZnycpjcYdCyx/NqPn3fC5uvIRqCIcmI1bHWKnuF9wfzH9M4SGxVhrOqWy
 4IkB5cGqIE+gG+4C5R0aJvLHaBT5V7r0CKk2nreku5w8H63DEYjWbDXVcwji4Kf7QRoDlOwyHcU
 0/X1a8Hbh813vqxBztHwq0kCBcV8j24xTBvAzRg0C21c1psxidMjMs1vtw8HqVn0jiDrY30Wr7L
 cNaoUvPvzJXQ1QEEFARgPIeFJxacrryDa5hjbyv/fcNVEDMSXbqvDTy2oqy6mq3ZfbQ1OHDMh6q
 oHhUjhgW2L5VDLRt2G7mTpTmi1OAGDgH/BKLh7+92fjnzjWbvR3cX32ooZcaNdVG6j80Tt+/zaA
 pYDKg1qE9JlZ23w115zXe3hqqTIwsJuIyDVJ8zYwY4ldQgSu4TqGt9i3dM5plhsBntRzHoipATr
 QeVXIojpPaobUtETrJNkct+UgfDWRhPfWySavPL7u+XEJb6OJI1AdRH/zI6cPLP1GEiabOFOYmw
 D9/Y3JhLfb512OlgM1E+7g76kzyG13CTj6c4vHqDe02U3faI2z7a0DKXyQBh4TX0sRD2b3PD7EC XYmcB+yaIOAhZwA==
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
Message-ID: <20240118-alice-file-v3-5-9694b6f9580c@google.com>
Subject: [PATCH v3 5/9] rust: file: add `FileDescriptorReservation`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

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
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/file.rs | 72 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index a2ee9d82fc8c..4213d1af2c25 100644
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
 
@@ -245,6 +245,76 @@ unsafe fn dec_ref(obj: ptr::NonNull<File>) {
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
+        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`. We have not yet used
+        // the fd, so it is still valid, and `current` still refers to the same task, as this type
+        // cannot be moved across task boundaries.
+        unsafe { bindings::put_unused_fd(self.fd) };
+    }
+}
+
 /// Represents the `EBADF` error code.
 ///
 /// Used for methods that can only fail with `EBADF`.
-- 
2.43.0.381.gb435a96ce8-goog

