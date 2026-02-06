Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5462C30E830;
	Fri,  6 Feb 2026 21:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412311; cv=none; b=k6C31KaBK+YDTbWJzixwdf1nIX2el7vJYkvGa0ghkV2tKr2wbUMBOjCTtldMc1fdGMCM4LaqVzPbPqjoW/BlIOgcBHqtDzMZYED9UI+FyrU923/449OEk5PnzgdIBPYD8pdWWJXA0WqZiP5X0CYnnhlePxdq/lWekyiwg6YXjBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412311; c=relaxed/simple;
	bh=2aA6TsP5TqOXxamqOrEM+ulf/tg/RPrxh0tZsqKQ8Qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mih86/LOBONYRoE5RZ3zbcul7fUDBLmqJgXrh58wPzsnsJ7DzxM06Qkt4DmdXdo0XddQtkfrAQ2WS4ZVTwPO1rF1vyRKWBZ84c8ekum3RAIJysLGJTueHYh45rP9SEXB2S2EXBu7f+RJKHEcQ3Jjbp3V5k8PP85wtokzD0BJxeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhBEKlTs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhBEKlTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7702FC116C6;
	Fri,  6 Feb 2026 21:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412311;
	bh=2aA6TsP5TqOXxamqOrEM+ulf/tg/RPrxh0tZsqKQ8Qk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rhBEKlTsP62RAZDNXL4f6dTWS2K126rDj/IyPLRJ9fZW85Dhc0DG7jYthxD5w0iMs
	 azv0CWMNz2OaTIjSVyKOPoZn6wHpdz8xmO5Tfm0uGZD+9Jkddc2azvX+jFgX0fJ1ap
	 DMaQ5S2sebc4qRDD7FAfwPSIzixaAwphXH27Otk7KqchRQ5LGWaB92agMNmjW2EnRS
	 xJXG7gzfAJdjKjVBiGs8Y9o2LgbJJyuEUN9BrA5aQY9U86ITgX7eTMKW4AfIqFLPEj
	 +EK6tFG44dEQhQPqjuADRRkbk3zMWlPylpJsQrOGn0M9dSzxBA8BrRl0KKh/3o8ypb
	 1GBrfia7yZKPA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:50 +0100
Subject: [PATCH v2 04/11] rust: xarray: add `XArrayState`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-4-91c41673fd30@kernel.org>
References: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
In-Reply-To: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3142; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=2aA6TsP5TqOXxamqOrEM+ulf/tg/RPrxh0tZsqKQ8Qk=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljkR6yFU74Qctxwfi+Hjmm+uCS+oAhwJVObd
 03DdYekpUGJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY5AAKCRDhuBo+eShj
 d7NJEACUN4BBgh5y31PGzMdcKchA+Aw6rT5w2nYg1DwlVMsSRzL7BZOOsYX0BrXCfJtsmRg91dM
 dLzCLv7Ar7zwcI80iJnrAG8sr+wg5wtepKUfDrTMbSyi6vJp4u+XfwqB4QS8iP36nQTIZ/ostYU
 7xwkrXbTLtNr++3c+mo0tU1yUB9cFSYFHcfOR+KU4OI+OaV0agbPhkCur+W+yFgaE+yXzsJfuj+
 /faayPfcGoTSrap9G3p78GaKxMKDiYTSVko8qtgbqoBvamPr7ZAokSztOfM/wLhu7lJD2CMAN5H
 f6FfU4KMs+gZXuHR3iyhDOVBXqpW60wdbvE4+etEFbY7FkY4SAUpXtLdgRb4YwW2M3lOOMUgFzz
 H5jeeUQhUFkib5dWWmahTU7iCe8BMDctvKP/BaK0M9y0g5FdyW2OVS75nG57V6rO/jsMUeM4b2Y
 ew/cD84r8n7LV1J5W/A5oiiPHXbSKQ+fHIJNSWxZ/zh+TrdED5Moo1ul2gBXJKJ2kguc1+Yx2+0
 xVBGydN2BIb8KXmQbJr5gL1gSGnuuk0iJCKmDKYCW5baQhMbYwxTc4yXO4hNY548Xc+BepwqoH0
 +Ujvysi8N7EqQPhESEe2AHlSXKCrLA/HEUHWrtdJlujsGqNVdWiTk+ZSXyZPETCnTzfxXLHjaT2
 O0AcmXow/xyhDvA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `XArrayState` as internal state for XArray iteration and entry
operations. This struct wraps the C `xa_state` structure and holds a
reference to a `Guard` to ensure exclusive access to the XArray for the
lifetime of the state object.

The `XAS_RESTART` constant is also exposed through the bindings helper
to properly initialize the `xa_node` field.

The struct and its constructor are marked with `#[expect(dead_code)]` as
there are no users yet. We will remove this annotation in a later patch.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/xarray.rs           | 41 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422..58605c32e8102 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -117,6 +117,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT = XA_PRESENT;
 
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
+const size_t RUST_CONST_HELPER_XAS_RESTART = (size_t)XAS_RESTART;
 
 const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE = VM_MERGEABLE;
 const vm_flags_t RUST_CONST_HELPER_VM_READ = VM_READ;
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index ede48b5e1dba3..d1246ec114898 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -8,7 +8,10 @@
     iter,
     marker::PhantomData,
     pin::Pin,
-    ptr::NonNull, //
+    ptr::{
+        null_mut,
+        NonNull, //
+    },
 };
 use kernel::{
     alloc,
@@ -319,6 +322,42 @@ pub fn store(
     }
 }
 
+/// Internal state for XArray iteration and entry operations.
+///
+/// # Invariants
+///
+/// - `state` is always a valid `bindings::xa_state`.
+#[expect(dead_code)]
+pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
+    /// Holds a reference to the lock guard to ensure the lock is not dropped
+    /// while `Self` is live.
+    _access: PhantomData<&'b Guard<'a, T>>,
+    state: bindings::xa_state,
+}
+
+impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
+    #[expect(dead_code)]
+    fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
+        let ptr = access.xa.xa.get();
+        // INVARIANT: We initialize `self.state` to a valid value below.
+        Self {
+            _access: PhantomData,
+            state: bindings::xa_state {
+                xa: ptr,
+                xa_index: index,
+                xa_shift: 0,
+                xa_sibs: 0,
+                xa_offset: 0,
+                xa_pad: 0,
+                xa_node: bindings::XAS_RESTART as *mut bindings::xa_node,
+                xa_alloc: null_mut(),
+                xa_update: None,
+                xa_lru: null_mut(),
+            },
+        }
+    }
+}
+
 // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.
 unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
 

-- 
2.51.2


