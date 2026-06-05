Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E323911CA;
	Fri,  5 Jun 2026 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655677; cv=none; b=hnN6ZBbUf9pIvt+66tt6+nBTlLhY9XPcSJCW2zznh9UfFoPZPHwI857WkaiZ+PgWSS+ZInqqV9UUPytBWdPOQkzvtnObdtDOPKv1nIZXW1fCvTf5ESEuCfRPtvUDD270AWcALbqYFSuzJx1hqqB6DJ3cqSkXWoFW5l5IOZwZe3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655677; c=relaxed/simple;
	bh=DX8++9L27SP2fzIpUixQUyM6WiazGqLQWDakH66n1oU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AnHUc52hROKrKF2hxo5g/z3qfEies6ix8443PnjSHppsad54QWZLYxQG4mZ28XoR64KnpUKzO+FdpjGlK+QidcABQ/v5iBVm/459jI4oOKwW8TNKoHdb8OAC+2X3ghakxtFaQ+WK+yNm9sJ2Md5EUceVIINPINnFQQW8mj7ZhFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvGlW61y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvGlW61y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CFE1F00898;
	Fri,  5 Jun 2026 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780655675;
	bh=+7JQf8IUtRGP37hIV4LYjpS7Iz51JvjpcMlTL4+STF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IvGlW61yjtcZvNvfpsz8yYcP/YVEMZHbe342EhS45RnmQwwoDZs+vt62/lmCuslC7
	 O5TlQ7DD5SZqj3LobjPRTEJe717h6ycoIFa1S65p4beAOngF4wngZqGA67ARGikh5X
	 KljHOYUEIm1PzUhCpRdAdjIX0U4ZHiajCpWu/vSiLHgMXRWUsNFp304/0oFs/cTaS9
	 jfP8RkvLLbVjhGKfi2hI1VPyuMw2vKVtIqz2y+QpWcsTadrr2COguCRyAWzEOVTytk
	 6voLYSlN0m5a6ryoKi4kgtbMbqSXcbE6bpjWW1JNrZGB4KGH6T9J8ieFdOxBzBlOMT
	 zM3daR2QHGDTA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 12:34:14 +0200
Subject: [PATCH v4 2/2] rust: page: add byte-wise atomic memory copy
 methods
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-page-volatile-io-v4-2-0e217d9bf11a@kernel.org>
References: <20260605-page-volatile-io-v4-0-0e217d9bf11a@kernel.org>
In-Reply-To: <20260605-page-volatile-io-v4-0-0e217d9bf11a@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5384; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=DX8++9L27SP2fzIpUixQUyM6WiazGqLQWDakH66n1oU=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIqYqBtBaekmbf4rV8ceuwFuR1DUVbhBXdQxvs
 6JRnWUKVbyJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiKmKgAKCRD6UCkIqsW9
 0Dt4EACDRgLGFbSSmO6aZi4d1MvDVtc6UJr49O9Mj/u9i9d6Z8lMYIlaXwuVqPrSOJSzQ9EOPv4
 QEb8KWZvGyZ1ZFBZsAHk85tnp0/vHY3d0RKRraMJv1gHnUd+a/bYu9+Dur9T0T34CaVCCXYR6Ox
 HNg1BUkyztNBystgcH8amPU3O42Oz/7ZSrueGexznPiGb0FaGN68v6WycMhZDDWZqWOm76J07zr
 0GMRNY5QX86FBsfpSLYXd4wZ+/tRACuEjHRozKWsxdbsnm2jGuyZISaHSoiqg6rDSL3Sk8N//r2
 JGWPNL/spaaC9tH7HjHuU4LxW2/aluG14bZUtoSIqZaTuI2l6rlDvPnJbbQ6ttXmogkJrrCQN9x
 uj4hZKNFURbI0jtLaUdLPjci+uS1Uxrw1eOq/YbhxhC0eHCbOPyszWvZS5tavW+TNvDAkQtEC3V
 ywp9MRaT/G5hSIYruo5U3YWFOR2b9I1vKOFtiT+ex+EkwV0arqPNHi7uzXC56fM9VJ9v9JkmrK0
 hOv0tocKxONG951TG+S8k7r8Vbxww4fiMLrO3oDJZfZx628DOUpqzUBJRrWAT0Adu1Y3+R3yTh8
 E5q8qwZX+yZLgr3qw9ui+6qY7rk8UDnE7dKYdgQLeRu1WTaGypp/mNSH9v0ihZDVBIQHNlDDpu0
 6XihUunKp3R/1Gg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

When copying data from buffers that are mapped to user space, it is
impossible to guarantee absence of concurrent memory operations on
those buffers. Copying data to/from `Page` from/to these buffers
would be undefined behavior if no special considerations are made.

Add `Page::{read,write}_bytewise_atomic` to read from / write to a
page using byte-wise atomic operations layered on
`atomic_per_byte_memcpy`. The methods are asymmetric: the parameter
buffer must support byte-wise atomic accesses, while the page side
held through `&self` only requires the absence of concurrent writes
(or of concurrent reads or writes for the write variant). This
follows the intended usage where the page is private to the caller
and the parameter buffer may be shared (e.g., with userspace).

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index adecb200c654..7bb201442679 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -296,6 +296,38 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
         })
     }
 
+    /// Maps the page and reads from it into the given memory region using byte-wise atomic memory
+    /// operations.
+    ///
+    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
+    /// outside of the page, then this call returns [`EINVAL`].
+    ///
+    /// This function is guaranteed to perform byte-wise atomic memory writes to `dst`, but it may
+    /// perform only normal (non-atomic) memory reads from the [`Page`] `self`. Accordingly, the
+    /// safety requirements below ask for byte-wise atomic discipline on `dst` and only for absence
+    /// of concurrent writes on the source page.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    ///
+    /// - `dst` is valid for atomic writes for `len` bytes for the duration of the call.
+    /// - This call does not race with a write to the source page that overlaps with this read.
+    pub unsafe fn read_bytewise_atomic(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
+        self.with_pointer_into_page(offset, len, move |src| {
+            // SAFETY:
+            // - If `with_pointer_into_page` calls into this closure, then it has performed a
+            //   bounds check and guarantees that `src` is valid for `len` bytes.
+            // - By function safety requirements `dst` is valid for writes for `len` bytes.
+            // - By function safety requirements there are no other writes to `src` during this
+            //   call.
+            // - By function safety requirements all other access to `dst` during this call are
+            //   atomic.
+            unsafe { kernel::sync::atomic::atomic_per_byte_memcpy(src, dst, len) };
+            Ok(())
+        })
+    }
+
     /// Maps the page and writes into it from the given buffer.
     ///
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
@@ -317,6 +349,44 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
         })
     }
 
+    /// Maps the page and writes into it from the given memory region using byte-wise atomic memory
+    /// operations.
+    ///
+    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
+    /// outside of the page, then this call returns [`EINVAL`].
+    ///
+    /// This function is guaranteed to perform byte-wise atomic memory reads from `src`, but it may
+    /// perform only normal (non-atomic) memory writes to the [`Page`] `self`. Accordingly, the
+    /// safety requirements below ask for byte-wise atomic discipline on `src` and only for absence
+    /// of concurrent reads or writes on the destination page.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    ///
+    /// - `src` is valid for atomic reads for `len` bytes for the duration of the call.
+    /// - This call does not race with a read or write to the destination page that overlaps with
+    ///   this write.
+    pub unsafe fn write_bytewise_atomic(
+        &self,
+        src: *const u8,
+        offset: usize,
+        len: usize,
+    ) -> Result {
+        self.with_pointer_into_page(offset, len, move |dst| {
+            // SAFETY:
+            // - By function safety requirements `src` is valid for writes for `len` bytes.
+            // - If `with_pointer_into_page` calls into this closure, then it has performed a
+            //   bounds check and guarantees that `dst` is valid for `len` bytes.
+            // - By function safety requirements there are no other writes to `dst` during this
+            //   call.
+            // - By function safety requirements all other access to `src` during this call are
+            //   atomic.
+            unsafe { kernel::sync::atomic::atomic_per_byte_memcpy(src, dst, len) };
+            Ok(())
+        })
+    }
+
     /// Maps the page and zeroes the given slice.
     ///
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes

-- 
2.51.2


