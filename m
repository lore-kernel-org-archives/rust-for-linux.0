Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1A37BE93;
	Mon,  9 Feb 2026 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647975; cv=none; b=InBp6UezP+1dW9q+YJmeSvWQGd4XJHk9JpcuSda8YKFDVbbqwwAHnzIn5RL0m4AaPAPK5vyiWVAqEAEd4RaahCo/wyUMJMEPp7/jxm22AvuSc+8K9kI9of94w27dmL/+LXA9ssTFwUL+t/FPp3UAHqczhG8Rbrss4eoSbNdrIaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647975; c=relaxed/simple;
	bh=2aA6TsP5TqOXxamqOrEM+ulf/tg/RPrxh0tZsqKQ8Qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSc6Octyd9r0n5XSR7Wr5cUhCYoLrW50bw+sjOT2fu87HZiKO+EIyRzh8YsOdUHa+xqcdpb5DND5FRldPOnEf98FCrEgrE7n/moo1vvKulZXZ9BNN+IkTE3QvXTgxnBfR9WU10/rcHh9mwYyC7fjVky+EtdxLi9bYzSQF0/ALfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3/6c+CD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3/6c+CD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD43C19423;
	Mon,  9 Feb 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647975;
	bh=2aA6TsP5TqOXxamqOrEM+ulf/tg/RPrxh0tZsqKQ8Qk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f3/6c+CDPCNHcWfMSeuShETnmdtjswhGYyK9abyIPkMMLBHgipbzcxoFAn+ZhIw3W
	 THwWkaLF5zs+2Cztg1ctGv0W03mRF8jvkMYsIUASGbyiOP/xL59u2z/vTd6hmaCsvZ
	 aYCrroCi8cfkdVD6cJgS+mfq3Sxq1Au75al6b4C7EkPFqtJtn5ze1qlaTysLNVdmNR
	 vVkuuhB6gkY5RQrr2akrRTx1196traXRoI3MPRJCkZIFN6dOzKNdnYu3cuGZNhouDD
	 UX0hU8WZNM62DlEpSrxc0BAf635t9Rz3J9c393HtV7fOIkWOixLT0PFrJ7EttiYPC4
	 WhHTWO4b4ppnQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Feb 2026 15:38:09 +0100
Subject: [PATCH v3 04/12] rust: xarray: add `XArrayState`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
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
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFY1Yb/s0Cx5dL+ceTrbgCsO2VEgXHKl81NG
 XaSBz9rJQKJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxWAAKCRDhuBo+eShj
 d6GqD/9zwzHqTXewAxq/4Wup8VvXE1kLNVxZpeJpW/OsViwlFsajqwWV7FfAutYCIWFTcnPkTnj
 0KKlFWUqLdmeYmIhfzpePwVrz2E5PlCGWXKO1XlVgVp0Q8iinr6dpXyEQxvsz8pYWXlWCkQSQZL
 eR44WTMOlaPhzuCALGKg+ijVlbokb4zq/j21bPjYozplxqlXPZud2oHZC/Rl2FOchlj5Zn5SVn1
 bgu9ICVxaFx1umTR83cLpYv5sZLz1+I285ESrQwJG4faCrDcA0GrB6nllbYOuf/3mTZC7tem+B6
 1tY7L5iEy8CZKLz1m6GATAeqapHo94gkhOt13tuX08sI9dONC0VOBl6VCUWS5lthQX6j2ousEhA
 S8j3JKNfWmBtsjn9btygkJeN2mVG4sDN3iYuWnMxe/CNtrxMG6jHP/JFa97Ic1lMVbDZoMqXsAq
 n5qlRo7XpyBq+sYqYobnMzRXtKBl092PLTVDY0aY4dCKscf+MhHxF2GnyEuDR7UlMWSvHMwPfVu
 vuiZY7nQXW4LoyQXPak9P5Ot59iYBk6xlG2vB4x+f7MPFVwyQVOq3fNC0iOnsrtEd9Q36ZvV6op
 yazBSX4V79D0JXg+QCpSeCtGjNqI9IfmR26sZGs+X8DCdO8HerDf8MEImi1dwbbM54y1yQe6oZx
 uh9A7d6F+FrrOow==
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


