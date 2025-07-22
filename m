Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDBD2E9746
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187639; cv=none; b=BL6g09uu1N5NP3gPB7UOjzR7kZ34R+4Y3xGubFOlb6FxBeqdULzQbNj2AgO88NHlSSiFHJn9juZg0qBTE7JScrSOKQV7wFkzDUKghDy7PVagC+d7A0X4iXgcZ9PO8ax1jlD4E3Ffef4+/8Hs7DBY0BRyzAAI0C/jWc33UrAiu5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187639; c=relaxed/simple;
	bh=bN+xS9l/IoVlBsDrl9dzTtgs+eX0mH/u4d0cvmwE7sM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jq1JogjQwVTI7jFvgna9rJTuPaVwqSGhYwXUWJbjuGm8pJ5uyDpAKn6uCta3CzjqJubeLBlV1XhvWjzEdpqq8b0tbcteWVHkbAi+RiBB1cjmTGMD6k3f40KUTbXA89M8n+pGbfi/0otE1zp6VrbybvA5Rek584a1xI9VjhNKqus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kCch1fbR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kCch1fbR"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso35901665e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753187636; x=1753792436; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vIys7Zrgy3fi/vh2doa1crdb0goric/E95Ha5k97fXg=;
        b=kCch1fbRuhI1MizkfMzzreyfhAzN1iQbbc0ZkzVKbwlfHJr3Fq4G/39FDe7DY26fkC
         PBDIW6oNDvc0YYaBoN7zRhug/KOjnzIXCs7A/EyHe08L5EVjfIIb7bSmAN5QAwewzJ98
         YkYDkD8fd6qbIYL0E27LppPlHXECwOZVyxlE0FVzVEzPz3Xfgr3EjXGUC3akgdZzMil/
         KvJ+eQ2AMap2gk0xS1gpAoRXgZb81F2bK6zs6BAw6QA/omlVXEgV600967VZN+A0aZYH
         fnWUg7OcwQCjQLhjX8s0WjqW3x/4c5/DkckaolN3foVJrlbb+JXVL0jaIuMIfBpVZ+yV
         6tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187636; x=1753792436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIys7Zrgy3fi/vh2doa1crdb0goric/E95Ha5k97fXg=;
        b=GWp1qNNzIi3nhYwyjXbUpNzKkWUSvIjMPTyi1km7XD0VtJB5HldOF+B7q0zjQWoyAB
         qHKsfy6xaiAZM90T+lzBDKh+k8yeSgzxM2PG5DLs0vX5nrGm2JNq4AtNABPXJ60opaGd
         caNppxjnf0Um+WBgbqh6/kI2bsqe//YkhK5pcATDpe6YXarev3gZZCaNkeT6DmK6TQVF
         DwLpMKecK1epadKL0vQYv349WIRLEPkEgq9aV/pyD6iF70ovJlAylOWR4e2ndgOhs3A7
         8CpKM5frwL1TJKYSbL2AaumIjGM6nbk7GBDF1s/13S+z4NIHVLN5remRponf3elJSJFL
         jV7w==
X-Forwarded-Encrypted: i=1; AJvYcCU1nyM7Zkr7El++GUYLC3OIZYpKmqeTNdA5zclEkAxnowNcZv4bY6k7USuMAocsKTizeEWACAuaZPPp6cUb/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm6xo0DmaTCt/Z1HuXKhPvDXOz6875p+XuFi/+/21ujTtvUiPx
	YzWZfrGSBcwFoSNnnUq2IH+K7KhfAMVpFE94vtxb9TK/bey3Q7j45l9XB2H4pyuckd8a4agD/eQ
	AuVRviFQT79ryjr6F+w==
X-Google-Smtp-Source: AGHT+IHLmr8kfvxdQeovMqJvDH4dC+bxCl4yRhEA65mLowxn+aFNuomZDh0NdY/mR5eXodkHtdwQA/9jowq000M=
X-Received: from wmbfp9.prod.google.com ([2002:a05:600c:6989:b0:456:3cf:1e95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e03:b0:456:161c:3d77 with SMTP id 5b1f17b1804b1-4562ec35d4dmr263377375e9.16.1753187636266;
 Tue, 22 Jul 2025 05:33:56 -0700 (PDT)
Date: Tue, 22 Jul 2025 12:33:10 +0000
In-Reply-To: <20250722-iov-iter-v3-0-3efc9c2c2893@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250722-iov-iter-v3-0-3efc9c2c2893@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7454; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=bN+xS9l/IoVlBsDrl9dzTtgs+eX0mH/u4d0cvmwE7sM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBof4Uvl12Pj3ASutOliRdEuJdpOMuA5XJ6h8iwX
 HkcHLisWBqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaH+FLwAKCRAEWL7uWMY5
 RoWrEACccsy66C6M1q5PkZ4R/XPyBzO9mCYnWPyqidHvzcsvZOsxrXtOIQs0yTk+/9MfAC/VgOq
 oJZX90V5CqUi8hxGrYO5lCeavnvqmgZhFcjIlKtrOGW2Ks3uihVTLz9p0OIz603IGb3S2zZw33/
 Z1D547wUKz4gy2b02pokECHbyGnpaiURyoJWdZCbAIQJwXC0BkPZ5J2IiFxes7Vy6Hz6muOaVRY
 LMNWPAqrzkpz8Wg4BtTAooYbI++1MsDheh7Jb3R6cLtPbbWEy+Zl+ZN5C7EnfDwErqIr4zOKi5v
 i1BB31Oynu9jGAURtHsbTr8y97Z9Eu7Z1MgwwB46gl5qY5S6I33dHqbliHnNbZGA3IHy52eBghB
 47TZdZP+BrRS0O+mLsvZN2TC9FchSyGJ8SKeWiOBT4ej1C0FxKG82sdOW2bRoXt7IMCSdVIc71Q
 qd8feD3vwFPuOcdtVdXQ5R5pB80wlm0pBzgrqQkkCb3zaj2fU7Z7aq4HdWHlT3CNMBMOoozov8s
 SBWm5xfc+XNB5IApXGfkx4FbdQ3LshLuIvHp8WHf3djGUyUmpafInnhbU/YYWBaw4HGOWktndq7
 MeKpY4XuaC8wL7boQNwpx6Kq39Z7zYXxlFsZOikZC/Mi8W0qPbeDwgwOCxx1UC1dvimqW0RF09W uqHVCyljoaBinMg==
X-Mailer: b4 0.14.2
Message-ID: <20250722-iov-iter-v3-2-3efc9c2c2893@google.com>
Subject: [PATCH v3 2/4] rust: iov: add iov_iter abstractions for ITER_DEST
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

This adds abstractions for the iov_iter type in the case where
data_source is ITER_DEST. This will make Rust implementations of
fops->read_iter possible.

This series only has support for using existing IO vectors created by C
code. Additional abstractions will be needed to support the creation of
IO vectors in Rust code.

These abstractions make the assumption that `struct iov_iter` does not
have internal self-references, which implies that it is valid to move it
between different local variables.

This patch adds an IovIterDest struct that is very similar to the
IovIterSource from the previous patch. However, as the methods on the
two structs have very little overlap (just getting the length and
advance/revert), I do not think it is worth it to try and deduplicate
this logic.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/iov.rs | 143 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/rust/kernel/iov.rs b/rust/kernel/iov.rs
index a92fa22c856a506f836a15c74a29e82dc90a4721..e31a7947677c0603764648c06418697b2be2af18 100644
--- a/rust/kernel/iov.rs
+++ b/rust/kernel/iov.rs
@@ -16,6 +16,15 @@
 use core::{marker::PhantomData, mem::MaybeUninit, ptr, slice};
 
 const ITER_SOURCE: bool = bindings::ITER_SOURCE != 0;
+const ITER_DEST: bool = bindings::ITER_DEST != 0;
+
+// Compile-time assertion for the above constants.
+const _: () = {
+    build_assert!(
+        ITER_SOURCE != ITER_DEST,
+        "ITER_DEST and ITER_SOURCE should be different."
+    );
+};
 
 /// An IO vector that acts as a source of data.
 ///
@@ -165,3 +174,137 @@ pub fn copy_from_iter_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> &mut [u8] {
         unsafe { slice::from_raw_parts_mut(out, len) }
     }
 }
+
+/// An IO vector that acts as a destination for data.
+///
+/// IO vectors support many different types of destinations. This includes both buffers in
+/// kernel-space and writing to userspace. It's possible that the destination buffer is mapped in a
+/// thread-local manner using e.g. `kmap_local_page()`, so this type is not `Send` to ensure that
+/// the mapping is written to the right context in that scenario.
+///
+/// # Invariants
+///
+/// Must hold a valid `struct iov_iter` with `data_source` set to `ITER_DEST`. For the duration of
+/// `'data`, it must be safe to write to this IO vector using the standard C methods for this
+/// purpose.
+#[repr(transparent)]
+pub struct IovIterDest<'data> {
+    iov: Opaque<bindings::iov_iter>,
+    /// Represent to the type system that this value contains a pointer to writable data it does
+    /// not own.
+    _source: PhantomData<&'data mut [u8]>,
+}
+
+impl<'data> IovIterDest<'data> {
+    /// Obtain an `IovIterDest` from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// * The referenced `struct iov_iter` must be valid and must only be accessed through the
+    ///   returned reference for the duration of `'iov`.
+    /// * The referenced `struct iov_iter` must have `data_source` set to `ITER_DEST`.
+    /// * For the duration of `'data`, it must be safe to write to this IO vector using the
+    ///   standard C methods for this purpose.
+    #[track_caller]
+    #[inline]
+    pub unsafe fn from_raw<'iov>(ptr: *mut bindings::iov_iter) -> &'iov mut IovIterDest<'data> {
+        // SAFETY: The caller ensures that `ptr` is valid.
+        let data_source = unsafe { (*ptr).data_source };
+        assert_eq!(data_source, ITER_DEST);
+
+        // SAFETY: The caller ensures the struct invariants for the right durations, and
+        // `IovIterSource` is layout compatible with `struct iov_iter`.
+        unsafe { &mut *ptr.cast::<IovIterDest<'data>>() }
+    }
+
+    /// Access this as a raw `struct iov_iter`.
+    #[inline]
+    pub fn as_raw(&mut self) -> *mut bindings::iov_iter {
+        self.iov.get()
+    }
+
+    /// Returns the number of bytes available in this IO vector.
+    ///
+    /// Note that this may overestimate the number of bytes. For example, reading from userspace
+    /// memory could fail with EFAULT, which will be treated as the end of the IO vector.
+    #[inline]
+    pub fn len(&self) -> usize {
+        // SAFETY: We have shared access to this IO vector, so we can read its `count` field.
+        unsafe {
+            (*self.iov.get())
+                .__bindgen_anon_1
+                .__bindgen_anon_1
+                .as_ref()
+                .count
+        }
+    }
+
+    /// Returns whether there are any bytes left in this IO vector.
+    ///
+    /// This may return `true` even if there are no more bytes available. For example, reading from
+    /// userspace memory could fail with EFAULT, which will be treated as the end of the IO vector.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        self.len() == 0
+    }
+
+    /// Advance this IO vector by `bytes` bytes.
+    ///
+    /// If `bytes` is larger than the size of this IO vector, it is advanced to the end.
+    #[inline]
+    pub fn advance(&mut self, bytes: usize) {
+        // SAFETY: By the struct invariants, `self.iov` is a valid IO vector.
+        unsafe { bindings::iov_iter_advance(self.as_raw(), bytes) };
+    }
+
+    /// Advance this IO vector backwards by `bytes` bytes.
+    ///
+    /// # Safety
+    ///
+    /// The IO vector must not be reverted to before its beginning.
+    #[inline]
+    pub unsafe fn revert(&mut self, bytes: usize) {
+        // SAFETY: By the struct invariants, `self.iov` is a valid IO vector, and `bytes` is in
+        // bounds.
+        unsafe { bindings::iov_iter_revert(self.as_raw(), bytes) };
+    }
+
+    /// Write data to this IO vector.
+    ///
+    /// Returns the number of bytes that were written. If this is shorter than the provided slice,
+    /// then no more bytes can be written.
+    #[inline]
+    pub fn copy_to_iter(&mut self, input: &[u8]) -> usize {
+        // SAFETY:
+        // * By the struct invariants, it is still valid to write to this IO vector.
+        // * `input` is valid for `input.len()` bytes.
+        unsafe { bindings::_copy_to_iter(input.as_ptr().cast(), input.len(), self.as_raw()) }
+    }
+
+    /// Utility for implementing `read_iter` given the full contents of the file.
+    ///
+    /// The full contents of the file being read from is represented by `contents`. This call will
+    /// write the appropriate sub-slice of `contents` and update the file position in `ppos` so
+    /// that the file will appear to contain `contents` even if takes multiple reads to read the
+    /// entire file.
+    #[inline]
+    pub fn simple_read_from_buffer(&mut self, ppos: &mut i64, contents: &[u8]) -> Result<usize> {
+        if *ppos < 0 {
+            return Err(EINVAL);
+        }
+        let Ok(pos) = usize::try_from(*ppos) else {
+            return Ok(0);
+        };
+        if pos >= contents.len() {
+            return Ok(0);
+        }
+
+        // BOUNDS: We just checked that `pos < contents.len()` above.
+        let num_written = self.copy_to_iter(&contents[pos..]);
+
+        // OVERFLOW: `pos+num_written <= contents.len() <= isize::MAX <= i64::MAX`.
+        *ppos = (pos + num_written) as i64;
+
+        Ok(num_written)
+    }
+}

-- 
2.50.0.727.gbf7dc18ff4-goog

