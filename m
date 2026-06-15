Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BDA3F4DF3
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527029; cv=none; b=ajtSwNzsSh8BalN/i+uUwUps5Njcdk60DVn/M7jHztCZn5WUxBMO6WaBkzz4VpMGUn/k435BqGyPeC9D0i2hHhrEX/tCZOCdKwNKAwGRvIMbwiUMlPB7WCNx/VHiy4/57nX1PULfvND5Xskvx0ImBoGk/yZXjPbJEI8vMLDVWpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527029; c=relaxed/simple;
	bh=v5t7p4vMz41Oop9uHooe4i69haiDp+a/7ITddzkXaWs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TrtsZsFaEDbKsn0qW7b748rvR0SxHOFotr8Z5nhoEp/fovS2Pl+2TXcvBN1u8XWJwwzWN1HzkRV/yBKLvHscamBq0gleCLXEloyHCRFOEP0M1YOf4WbuYaDknKx1CCFOz6+4Lb34wWHs7r1NiO9Kg4pcv2eiKR4Q/dT7lbGha3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l/dqAbjG; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l/dqAbjG"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b4d3d3e6so22752095e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527024; x=1782131824; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F7DjiVX4fhURdXgr6E+XvoPlZztE4a1mjK7EeHBg02Q=;
        b=l/dqAbjGXiPVX4nv397YnywgPp+9qFCVQk4u1QcWmH+pLazbNHvUYLZPsZX86gfWvZ
         wdrqdhzXHzuXX7lMHQlzxJRYhDHUe8CxX0yrZ5p7Uqz3qnTVuA3ZOyi6NbN2Jhy5nC7n
         Gtjx8/o3x0Uk1AX1gA9gtT+UMW70T/AuNmgx7OflKZCOe3DZaU8zBQ1foD54UJfL6yPm
         dKu5el/oh7IM/jnJgnzCrdpa3mRFJ+dDz6y80xWNsrip/I0Xe5aE8LlaBOlRzqASuvqt
         mxW8L8GUG5hOdaQyXwOOZH+6yDvRdHLE0ZlmexhULfq2mB7czqU6k9W2levy5CE3UoHA
         p9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527024; x=1782131824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7DjiVX4fhURdXgr6E+XvoPlZztE4a1mjK7EeHBg02Q=;
        b=JA3DE+HyJZcXnDXVkcEnwZXkC2SOW8FPj7Yb9Bt1lSxLz4d3tL/cYfj+W75lveEMzy
         wKhejNHD0MfiEnsAwvCy1qL/4fSWtLtK5vpVg2ell3pUyjtIDUI6caCCpiQsU1P4yZ0E
         jlVGxFoEPmFQvWg6nDiilLHRp2uSTKcsNKkJ3UAj60U4WQA80VSebvW8iy1DrpG8mPxe
         EkZhyT9xfT0vT10OAfHhJylS++Buf69M4fOFHvEbjMceHb1Tod12pMpzrKHYJtLp6G4A
         heVRX4SbX7bVKG++7fR3q9ewyBUfPA6ktI8oeSR7WlRcGxFwnU9L+6fDgZtOroc2aRmp
         6WKw==
X-Forwarded-Encrypted: i=1; AFNElJ+t0rCfo3n3hDJttCuFt+LkSzmj6FWkS8KoBurQyuMAYjBGE4ekHd9oBnV+YP3qZ7TNGMiLzvxjwhtgRvdMUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMoMC7eJz1G8dqaS5yrJF2qfkGDvqwEjMF29+Vot4Snhv7jVUo
	OTV4dipCGLuQtj35B0E6pbEGAHHylqb4iff4YIvz+p5wOet3rNuR98AMnbLe2SuhlfCFlg5gT6l
	NgsqV0uFK375QXzhKQg==
X-Received: from wmol19.prod.google.com ([2002:a05:600c:47d3:b0:490:ae3b:b7c9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138e:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-490ec507db7mr191879175e9.25.1781527022932;
 Mon, 15 Jun 2026 05:37:02 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:36:45 +0000
In-Reply-To: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3164; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=v5t7p4vMz41Oop9uHooe4i69haiDp+a/7ITddzkXaWs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqL/HlbZG5QEjm+0qIwyUbajMurmMwxcfOdqU2w
 bFBKNN+nI6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCai/x5QAKCRAEWL7uWMY5
 RqSJEACoG0jUUPrRL2rfE+L6LdLUR2Z7oZxAh9U6GrxvaPBeoXA5AjnpjNZGsbSGJeFmx13/FZa
 EkJzTSMR12qGuDhdaf6CBCrFWbV0IsnMi+YIP5LOR0LtAr+fE+MQhfJzGTkJByunsSy+qKbTqO/
 pVdTysqeOQXGVTfGls6LxJQ/f7YQbabworj2TDz8/80tLAsChIuRtmzoTqOql3sqIChHxEnqTad
 RhyqfHIKmITnkbhV2wAA7HR7ruilwGI9canC2tR0GMZ083rSRm9WRGDnWNTVY7LYnxZvjLsExjR
 k74yQoPoABkUNyjO3YeuBJdfYka70uwWDhvAYOH77qrOM8PeJOgC/QVN8xgs6oeTQO8KcBH/lKa
 fm5kP3LIt91+BdXo8v9FiMAqx32ytmkZCiT08eeI0NAjByAj9qVS7YgQmeRYOvAupmTr6yWS79F
 Gu2ZBgJRdOlQQCgCqfg0oK3OGeU2RGyCvZ3+ihyaY06Enihrw1Ygkz4nSq1hrJ3pEKi/9epPTLq
 pKt/k89tgjfqwWkKKeI8vPhTAGjGfB8AhB4jlVCqhRy4VrJJgWaFpZcWobRQ9vvV/S8bBbRmwh/
 Z4hE7ZDRhTiIejXI+iwK1xxzbH+jljR7r4XPbzlB1pd4r6UJIj45eDWBmwhwUMR7cq30Xcgxfkh a8YzPl/91R0l4qg==
X-Mailer: b4 0.14.3
Message-ID: <20260615-binder-noderefs-spin-v3-5-3235f5a3e0a0@google.com>
Subject: [PATCH v3 5/6] rust_binder: avoid destructors in insert_or_update_handle()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

The insert_or_update_handle() function currently has two places where it
drops objects under the node_refs lock. In preparation for changing
node_refs into a spinlock, update the code to either entirely remove the
codepath or drop the node_refs lock first before running the destructor.

This also has the side-benefit that we avoid traversing the by_node
rbtree twice. Currently it's first traversed to see if the new node is
present, and then traversed again to insert it. By saving the
VacantEntry from the first lookup, we can perform the insertion without
traversing the tree again.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index c8e9fd0d0472..268d78f8cfb3 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -861,14 +861,17 @@ pub(crate) fn insert_or_update_handle(
         let handle = unused_id.as_u32();
 
         // Do a lookup again as node may have been inserted before the lock was reacquired.
-        if let Some(handle_ref) = refs.by_node.get(&node_ref.node.global_id()) {
-            let handle = *handle_ref;
-            let info = refs.by_handle.get_mut(&handle).unwrap();
-            info.node_ref().absorb(node_ref);
-            return Ok(handle);
-        }
+        let by_node_slot = match refs.by_node.entry(node_ref.node.global_id()) {
+            rbtree::Entry::Vacant(by_node_slot) => by_node_slot,
+            rbtree::Entry::Occupied(handle_ref) => {
+                // The node was inserted by another thread while we didn't hold the lock.
+                let handle = handle_ref.get();
+                let info = refs.by_handle.get_mut(handle).unwrap();
+                info.node_ref().absorb(node_ref);
+                return Ok(*handle);
+            }
+        };
 
-        let gid = node_ref.node.global_id();
         let (info_proc, info_node) = {
             let info_init = NodeRefInfo::new(node_ref, handle, self.into());
             match info.pin_init_with(info_init) {
@@ -884,6 +887,9 @@ pub(crate) fn insert_or_update_handle(
         // first thing in `deferred_release`, process cleanup will not miss the items inserted into
         // `refs` below.
         if self.inner.lock().is_dead {
+            // Explicitly drop the lock so that `info_proc` and `info_node` are dropped outside of
+            // the lock.
+            drop(refs_lock);
             return Err(ESRCH);
         }
 
@@ -891,7 +897,7 @@ pub(crate) fn insert_or_update_handle(
         // `info_node` into the right node's `refs` list.
         unsafe { info_proc.node_ref2().node.insert_node_info(info_node) };
 
-        refs.by_node.insert(reserve1.into_node(gid, handle));
+        by_node_slot.insert(handle, reserve1);
         by_handle_slot.insert(info_proc, reserve2);
         unused_id.acquire();
         Ok(handle)

-- 
2.54.0.1136.gdb2ca164c4-goog

