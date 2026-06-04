Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BD33CF02A;
	Thu,  4 Jun 2026 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603237; cv=none; b=EbX5WbwQkS+qhdGTh9Jy2qdwgTe8zRqV7TLxBW4k9IDI3pvY4jQayVF3GXZxY9XzT0nUi97g5yZii+HenzYhVu5vQGhgf3XefqaDjsXp91u4rMWx0ZeL0gsKxpr4oH7EOyvMAA1DGmc10s1QkEGOMuEh6S9AQVzIOfbJFnluccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603237; c=relaxed/simple;
	bh=oYaezwlxJQpR8UtIF1kAo4ndp1y9jT02xjr/aB92Sp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iYLfcyVmM+GpEJQDbYk7gTS6pVYq7dKuNm7vUIlPzTkIUjS+5nJxPiV827mu/Ok9TkDYUNUPYjtGeKjyB6N0NycFgpO/y1aHFZjZ2tKcQBHa63ogdIZhfzFgvRnNNTn7YIkbm9zGGxBKQeRD+Jy9HrGyj4R96R01jzo95URYuws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Td6OZ0oB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Td6OZ0oB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8091F00898;
	Thu,  4 Jun 2026 20:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780603234;
	bh=p6YuYMOYnDWDBMZ9bbEPIsqKNsVYpVFYY4aODNh2Npw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Td6OZ0oB6NVr21aNjgjcbw9w8ngfB+Z+W7pM31bHdmaKrm8mUW+6P8SMyO01LTBB7
	 aZ28jpYveay9tJ5hxsepy0tMwjd+/K0b0b62mriLyAfadJMX7yOH1xbVLTH+GjxXIW
	 xXYy9mdQsnEBLW5xw1hY9Kx7iB/BqUo8bgnwsoQkDL9Z4TKuBOLPi1A22j8IJPb4Ti
	 Ka+XELivsbPTaK1xUt4+ZtPAvJCiGqPgtpQLJloAD9LeeO44w71KP1xUap4+A46yWV
	 5FvJdE5XAPsDDdly6nKoknfZMmHKtutNTU2Qbpxq6B6s7x+Xz24d0yStjFZQO6gQYr
	 7yMi00M3QyZsw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 04 Jun 2026 21:58:10 +0200
Subject: [PATCH v4 04/11] rust: xarray: use `xas_load` instead of `xa_load`
 in `Guard::load`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-xarray-entry-send-v4-4-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
In-Reply-To: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Tamir Duberstein <tamird@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Harry Yoo <harry@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2450; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=oYaezwlxJQpR8UtIF1kAo4ndp1y9jT02xjr/aB92Sp8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIdjtXXR6p/YMNbWL1d7vr9jQHRbkshID8Gu3F
 6Mk1qpxbzqJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiHY7QAKCRD6UCkIqsW9
 0Hw9D/sExDzOpSwLMZPByJRIDOftL7P3W6n7egMhr5eH9jrbr9Z0/bBmlY2GkTSChDdjCeti3iT
 PVzlvvzpBFAgB4xhGAZc1fFPSzbzCqh4RJPCS0uQJQPIVONDRjtimSwNNnBq96darpyBzlwFvEn
 KjsE5NUuh3cK4rWz1wFY4lmNJYvY2V/WhPSgF5uATxvWeWGOLBpehSE3VVwxLmPHj6pV7bLUUUz
 khgcIVMTUB/gNsL83eoQZ/W5bC2Kn+KxIdS3rHNP914QHRl6SFYIe8JmcLhKOLo1mKY7cx/Qws+
 4MxvLHw9WzELoT2fl28hr+JJvFP98b717NvSCD8IlX1nQtNIGO176AFpvBxQva/iR9H1B/tIKUr
 iVyK/L7Sf6AC85xIEkE/HgiHEYgWDLSgIurtf/qli6Z/acWX218XdPN/t4eBjvX+viDKN2FgU6F
 8tHLcVGzVaS0RSEYlgZdGH2HOWEsoVrPnscKZxlDw0uNJL2bI0DuJJf/pq+QUdwC7shxxbP5aJm
 f0vrRRd58MuAyjwHmuDGjD/mR4jVQ2IocIaoDuGFn/21bOKIoo2viRFX61R0ygKGgslQdPNHbrN
 gTq6DgLkQnZ3tAS9a7ey3JIY2SuAfHi//Uwe6zTdpbn10CTe4EAimfAbEFxVji5kns8Fk9TGqWE
 PbSDm83CaEkfRDA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
`xa_load` function takes the RCU lock internally, which we do not need,
since the `Guard` already holds an exclusive lock on the `XArray`. The
`xas_load` function operates on `xa_state` and assumes the required locks
are already held.

This change also removes the `#[expect(dead_code)]` annotation from
`XArrayState` and its constructor, as they are now in use.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 6d0d4905004a..05e6dc1ffe69 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -216,10 +216,8 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U>
     where
         F: FnOnce(NonNull<c_void>) -> U,
     {
-        // SAFETY: `self.xa.xa` is always valid by the type invariant.
-        let ptr = unsafe { bindings::xa_load(self.xa.xa.get(), index) };
-        let ptr = NonNull::new(ptr.cast())?;
-        Some(f(ptr))
+        let mut state = XArrayState::new(self, index);
+        Some(f(state.load()?))
     }
 
     /// Provides a reference to the element at the given index.
@@ -333,14 +331,12 @@ fn xa_ptr(&self) -> *mut bindings::xarray {
 ///
 /// - `state` is always a valid `bindings::xa_state`.
 /// - `state.xa` aliases the xarray reachable through `guard`.
-#[expect(dead_code)]
 pub(crate) struct XArrayState<R: GuardRef> {
     guard: R,
     state: bindings::xa_state,
 }
 
 impl<R: GuardRef> XArrayState<R> {
-    #[expect(dead_code)]
     fn new(guard: R, index: usize) -> Self {
         let xa_ptr = guard.xa_ptr();
         // INVARIANT: `state` is initialized to a valid `xa_state` whose `xa` field aliases the
@@ -361,6 +357,14 @@ fn new(guard: R, index: usize) -> Self {
             },
         }
     }
+
+    fn load(&mut self) -> Option<NonNull<c_void>> {
+        // SAFETY: `self.state` is a valid `xa_state` by the type invariant. By the same
+        // invariant, `self.state.xa` aliases the xarray reachable through `self.guard`, whose
+        // lock we hold.
+        let ptr = unsafe { bindings::xas_load(&raw mut self.state) };
+        NonNull::new(ptr.cast())
+    }
 }
 
 // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.

-- 
2.51.2


