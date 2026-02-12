Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE27F337111;
	Thu, 12 Feb 2026 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907903; cv=none; b=eE3O5Ai5gCK6uTNR3viI1dzORqVtDHYEyhC8HDnKOC/MYz1a1d0KzvZMiI25EjPth5gTe2F9kseEYkbXFMl0oIL+xjO/Ar1G863Ld1SYtN5qki8UnYUjkkalUha02G+27Yo6DoJmwl6o3xkLucVVESxvkDHk3mjmzbRMonfuWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907903; c=relaxed/simple;
	bh=MSoxOO/aajimGBe8zSRRwjtwt1Ctq+tdq12YYd+aCkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NF4/rf9ILVRJQL4ovqp6XpoTg+xVcDiJZnbN7GVwV6fK0y1ToRIze3dWa+l5dIFVdlnGbjsRJpzdLGCgGtvQx1xvjzzDLsdSO2uXAD4l7o9SrMVwmpndk6q3IKQBgsczt4fihz7FSVn/fZhYyDOaakpJ1lXi1Dhyh/NSZA/gzto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H30/4GJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H30/4GJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A36C4CEF7;
	Thu, 12 Feb 2026 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770907902;
	bh=MSoxOO/aajimGBe8zSRRwjtwt1Ctq+tdq12YYd+aCkc=;
	h=From:Date:Subject:To:Cc:From;
	b=H30/4GJHvmb2ovRLb7mfvVV4WxcxrD2JQvwhZskCY8xgRnyl1vkg417pq0BTaA+D2
	 nSWaAdmTMoztVfG38s+mf8y0yAHDktQ6yFgthdyvIML3ohhL6V9gzwZIgCNf16Ykuv
	 LHeQBbg86SqPTL3k7KxxjywNVkvDHRfaZeQrYaUGGlUuHpFONbQPU4+m//qjNxnxHF
	 BffF9V2yuxMexU28LSjYTB42rIV2XlftQ3C1KXFDKwPb5w7N51hubuB6ZAvEBexHox
	 t7IzU819lV66jiuplRZo4GuljKdvUSqIR21kq0W/6P1JhpPR2uULDwSnwTq507nk6U
	 WCaOQbpsCZtGQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 12 Feb 2026 15:51:24 +0100
Subject: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOvojWkC/32NQQrDIBRErxL+uhajmDZd9R4lC6nf5FPRoEFag
 nfvbw5QZvVmmJkdCmbCArduh4yVCqXIoE4dPBcbZxTkmEFJNcheS7Fa9moKdqPAYRLSeG9GY+T
 FaeDamtHT+5h8TMwLlS3lz/FQ+5/7Z6z2gjV67TRevRrM/YU5YjinPMPUWvsCmJDiw7EAAAA=
X-Change-ID: 20260130-page-volatile-io-05ff595507d3
To: Alice Ryhl <aliceryhl@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7789; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=MSoxOO/aajimGBe8zSRRwjtwt1Ctq+tdq12YYd+aCkc=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpjejsNojknJFrAiG/CbKml6BEsNEmgecCiaHNR
 Q8PBjVx1YqJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaY3o7AAKCRDhuBo+eShj
 d81YD/0fIbnhnOMjfFl69SJjgreHTO81HbH3GkxN/cUdkLp3WBi+jEh+Qs4oEJIogwzqKB1JyH9
 QvN/JH+tXz4mAvAz1v9vhwiIq1CvCi7y/BkCLPU7GOXjVWM2uzWoxtcnsQBGxgD5GojTfRR7zG9
 IrnexWOCWvoy3WcN3SDLLK492CU3lknEoOfEhcHY6KI4DEsK6ZOm9Yj1y7Z6aVx3X/dzb+1d1mR
 1rBuA1451N1ju++qvqFGsu2wkOnZYhz+rf7YGt0QvvbdxaDfT4KqEs5NYnCpsYlh1lag3Hq+hTX
 AlAi5uEAhpMhL+/T0wsv7ui4g0pqw6TcCskdEsAVWTsnaTu6ub5Mt42D4lb68qi+DL85qk3Mq/x
 HxXhrGpnM+Pc/VSLsy9GK0HwEcX4DxY5vKxv2AvFCI1B4ym2n7NM2tLlcfwuwSDFEtl+v7mJXmP
 x/WzcQYYKY9e9tyleqQOFcvTUx1l6M8ojxZtvdo7NS2G+lG1d6QRWnxttUFanHfcpkeXjermxw5
 eNfiadTQOc55e+JbSX9lZWzLJmIzSo8ilRoXxYa1VUpLb9m+XWB00Nzn6HhNsWu9sWIwoaUqAo0
 NKLaJINCrYWBzQpeInF98rNwfam/7GvRLtJ2RirSWUp4kpUKyrSQPtff2aK6nOOWAusKGyqEzyw
 eYjNBk7vVVkNS6g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

When copying data from buffers that are mapped to user space, it is
impossible to guarantee absence of concurrent memory operations on those
buffers. Copying data to/from `Page` from/to these buffers would be
undefined behavior if no special considerations are made.

Add methods on `Page` to read and write the contents using byte-wise atomic
operations.

Also improve clarity by specifying additional requirements on
`read_raw`/`write_raw` methods regarding concurrent operations on involved
buffers.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Rewrite patch with byte-wise atomic operations as foundation of operation.
- Update subject and commit message.
- Link to v1: https://lore.kernel.org/r/20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org
---
 rust/kernel/page.rs        | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/atomic.rs | 32 +++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a8..febe9621adee6 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -7,6 +7,7 @@
     bindings,
     error::code::*,
     error::Result,
+    ffi::c_void,
     uaccess::UserSliceReader,
 };
 use core::{
@@ -260,6 +261,8 @@ fn with_pointer_into_page<T>(
     /// # Safety
     ///
     /// * Callers must ensure that `dst` is valid for writing `len` bytes.
+    /// * Callers must ensure that there are no other concurrent reads or writes to/from the
+    ///   destination memory region.
     /// * Callers must ensure that this call does not race with a write to the same page that
     ///   overlaps with this read.
     pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
@@ -274,6 +277,34 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
         })
     }
 
+    /// Maps the page and reads from it into the given IO memory region using byte-wise atomic
+    /// memory operations.
+    ///
+    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
+    /// outside of the page, then this call returns [`EINVAL`].
+    ///
+    /// # Safety
+    /// Callers must ensure that:
+    ///
+    /// - `dst` is valid for writes for `len` bytes for the duration of the call.
+    /// - For the duration of the call, other accesses to the area described by `dst` and `len`,
+    ///   must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
+    ///   function. Note that if all other accesses are atomic, then this safety requirement is
+    ///   trivially fulfilled.
+    ///
+    /// [`LKMM`]: srctree/tools/memory-model
+    pub unsafe fn read_bytewise_atomic(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
+        self.with_pointer_into_page(offset, len, move |src| {
+            // SAFETY: If `with_pointer_into_page` calls into this closure, then
+            // it has performed a bounds check and guarantees that `src` is
+            // valid for `len` bytes.
+            //
+            // There caller guarantees that there is no data race at the source.
+            unsafe { bindings::memcpy_toio(dst.cast::<c_void>(), src.cast::<c_void>(), len) };
+            Ok(())
+        })
+    }
+
     /// Maps the page and writes into it from the given buffer.
     ///
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
@@ -282,6 +313,7 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
     /// # Safety
     ///
     /// * Callers must ensure that `src` is valid for reading `len` bytes.
+    /// * Callers must ensure that there are no concurrent writes to the source memory region.
     /// * Callers must ensure that this call does not race with a read or write to the same page
     ///   that overlaps with this write.
     pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Result {
@@ -295,6 +327,39 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
         })
     }
 
+    /// Maps the page and writes into it from the given IO memory region using byte-wise atomic
+    /// memory operations.
+    ///
+    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
+    /// outside of the page, then this call returns [`EINVAL`].
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    ///
+    /// - `src` is valid for reads for `len` bytes for the duration of the call.
+    /// - For the duration of the call, other accesses to the area described by `src` and `len`,
+    ///   must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
+    ///   function. Note that if all other accesses are atomic, then this safety requirement is
+    ///   trivially fulfilled.
+    ///
+    /// [`LKMM`]: srctree/tools/memory-model
+    pub unsafe fn write_bytewise_atomic(
+        &self,
+        src: *const u8,
+        offset: usize,
+        len: usize,
+    ) -> Result {
+        self.with_pointer_into_page(offset, len, move |dst| {
+            // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
+            // bounds check and guarantees that `dst` is valid for `len` bytes.
+            //
+            // There caller guarantees that there is no data race at the destination.
+            unsafe { bindings::memcpy_fromio(dst.cast::<c_void>(), src.cast::<c_void>(), len) };
+            Ok(())
+        })
+    }
+
     /// Maps the page and zeroes the given slice.
     ///
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a2..8ab20126a88cf 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -560,3 +560,35 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         unsafe { from_repr(ret) }
     }
 }
+
+/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
+///
+/// This copy operation is volatile.
+///
+/// # Safety
+///
+/// Callers must ensure that:
+///
+/// - `src` is valid for reads for `len` bytes for the duration of the call.
+/// - `dst` is valid for writes for `len` bytes for the duration of the call.
+/// - For the duration of the call, other accesses to the areas described by `src`, `dst` and `len`,
+///   must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
+///   function. Note that if all other accesses are atomic, then this safety requirement is
+///   trivially fulfilled.
+///
+/// [`LKMM`]: srctree/tools/memory-model
+pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, len: usize) {
+    // SAFETY: By the safety requirements of this function, the following operation will not:
+    //  - Trap.
+    //  - Invalidate any reference invariants.
+    //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
+    //    operation and all operations by the Rust AM to the involved memory areas use byte-wise
+    //    atomic semantics.
+    unsafe {
+        bindings::memcpy(
+            dst.cast::<kernel::ffi::c_void>(),
+            src.cast::<kernel::ffi::c_void>(),
+            len,
+        )
+    };
+}

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260130-page-volatile-io-05ff595507d3

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


