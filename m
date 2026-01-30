Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71652310782;
	Fri, 30 Jan 2026 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769776443; cv=none; b=BDlD92ap0WRW825i9PmoRRf+k915Hh3ehZOE3AU+R24YnEt4Pk262JzBjCH/BOm4XBuJaGUqu3w6yJx2gu6z1+fcrh6C8fEeHrsyPDv5kVPiV20xxSZpAnjpT8NrfaNSv8BBNJNplEzor/kAE6474A3t4EMIbrHy5aMYwAIBzVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769776443; c=relaxed/simple;
	bh=iZzpNEAujmycUgTI/h9S+Zxb+pjdstnZT2VsHNdpb6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hkUw03iD/aLaZWKpEONbszXsiwUNnm36a6gopzGcKzoj5SoqLtiE2PvACwCK0PapLWr9rsapLNcS2cJKXH3W24QO9KGdCSTxLL9jZPBdQcE5SHiJlQ2DZ+R78X7/NlVMxfopxKQwiTtim1wA6R0KpR27wmZhk9Ben/OaCILkTGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPSciKCJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPSciKCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31197C116D0;
	Fri, 30 Jan 2026 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769776443;
	bh=iZzpNEAujmycUgTI/h9S+Zxb+pjdstnZT2VsHNdpb6w=;
	h=From:Date:Subject:To:Cc:From;
	b=UPSciKCJW3vx0x9g39qyILSkxW/plroKdQf3kg+IaLVG8W4qqoYLi/oKXVCYf0dl6
	 /ibOyaxK2uC4Wd0/QhqtnpWml6NLF2xwf2+wpJsNinzbIbyd7hp/xPMmRFyEvpVMJH
	 fgAhkWkWHxGTSVpL2/y03k/QBX389tE0XOINdl4AXG6myO0Lcnn7PeqF0K+nfIUeQx
	 P/BdJ/GoFWBWcNhYA2F6AxTlL555lBbcSzJEuEQKkPGkwbS3x75s2qZGxOZVX1C+sE
	 Z5QxQ9LbnUnNKIy2ZxlNwGWKWoiZdjBSqiFnr/+TZ85OxmmcAoBmgxgfy3Gg9cCa4w
	 /rlsO3X+QqmYw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 30 Jan 2026 13:33:38 +0100
Subject: [PATCH] rust: page: add volatile memory copy methods
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org>
X-B4-Tracking: v=1; b=H4sIACGlfGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ2MD3YJEoFhZfk5iSWYOUDJf18A0Lc3U0tTUwDzFWAmoraAoNS2zAmx
 kdGxtLQCfFwNbYgAAAA==
X-Change-ID: 20260130-page-volatile-io-05ff595507d3
To: Alice Ryhl <aliceryhl@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5554; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=iZzpNEAujmycUgTI/h9S+Zxb+pjdstnZT2VsHNdpb6w=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpfKUtQhVPsKXzyLGXH3fkMmnJyCtj/n/+nP5+f
 MolQXKgF+OJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaXylLQAKCRDhuBo+eShj
 dznoD/9P26y0YDv1cPE86Bh1YGhktvCuaw1sp27fWh7YxQ0wX6O0WA5IlgEaGSx8xF2hOHJi2w+
 LJeLQnALyrOPIvSzNPzAfx2pPBNK6w0QQxXiU0ebgMtk+UPHFbQMS64irBjLi0bL3xQoesmOrP+
 2bB99pbdVY4gC0Dq12XeoM9HfDUIYAOurPpQfpIpsUKAPiIEDhesIr5AuZJsi/AdNxirHuDiqdT
 S4+OWdHaGeHte6w4qjZl2fujURG66lxR1MVsaOdhs5ov44CBROneErN/q0EMqXCdqnzXGBk6ieF
 66zeZxekJHEaTK+HFXPBOIOKu4Bpl8Xs+FAa5e6axWbZt6JodaOaOmYH05l550eQLsGFl3Ambz6
 eAI6AuhlcnmnYADQzAjks1mzQHCQZptXzxs3Y0cV0gfbbZ+1PtTI/xWTeXKkju9iKM3A7w5PdUE
 T9j9/jJjaZt0oeD73MKrU+eZCX1fcigGKLhc7zLs4YwuXQd29q4K7fKKgNzSDn6vvlI6LP5s2D2
 wi7AOHKisq/Un/Tt6DzSvzH6DnHXJjjYJ62AkuJ02PLXMQaUnSodNF60W6uDwkB2tMl+AJ2ElsS
 tAQXWMJrendvBe6gPjwEmuc+cDFYTxfUrBjjsTiHnvSklJdVA/U62bIgX++vjhdrzWe8qP5t39P
 KzawbSp67BdAooQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

When copying data from buffers that are mapped to user space, or from
buffers that are used for dma, it is impossible to guarantee absence of
concurrent memory operations on those buffers. Copying data to/from `Page`
from/to these buffers would be undefined behavior if regular memcpy
operations are used.

The operation can be made well defined, if the buffers that potentially
observe racy operations can be said to exist outside of any Rust
allocation. For this to be true, the kernel must only interact with the
buffers using raw volatile reads and writes.

Add methods on `Page` to read and write the contents using volatile
operations.

Also improve clarity by specifying additional requirements on
`read_raw`/`write_raw` methods regarding concurrent operations on involved
buffers.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a8..6568a0d3b3baa 100644
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
@@ -274,6 +277,30 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
         })
     }
 
+    /// Maps the page and reads from it into the given IO memory region using volatile memory
+    /// operations.
+    ///
+    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
+    /// outside of the page, then this call returns [`EINVAL`].
+    ///
+    /// # Safety
+    /// Callers must ensure that:
+    ///
+    /// * The destination memory region is outside of any Rust memory allocation.
+    /// * The destination memory region is writable.
+    /// * This call does not race with a write to the same source page that overlaps with this read.
+    pub unsafe fn read_raw_toio(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
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
@@ -282,6 +309,7 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
     /// # Safety
     ///
     /// * Callers must ensure that `src` is valid for reading `len` bytes.
+    /// * Callers must ensure that there are no concurrent writes to the source memory region.
     /// * Callers must ensure that this call does not race with a read or write to the same page
     ///   that overlaps with this write.
     pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Result {
@@ -295,6 +323,31 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
         })
     }
 
+    /// Maps the page and writes into it from the given IO memory region using volatile memory
+    /// operations.
+    ///
+    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
+    /// outside of the page, then this call returns [`EINVAL`].
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    ///
+    /// * The source memory region is outside of any Rust memory allocation.
+    /// * The source memory region is readable.
+    /// * This call does not race with a read or write to the same destination page that overlaps
+    ///   with this write.
+    pub unsafe fn write_raw_fromio(&self, src: *const u8, offset: usize, len: usize) -> Result {
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

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260130-page-volatile-io-05ff595507d3

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


