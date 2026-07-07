Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C163E00A8
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420156; cv=none; b=hd3UvfHm1u7nNrdLTSpJE/Ui7uI7CNHBlomEBRtpCGLOsZWfTk8fNdNWBljqXKHkO6DG1vwA6WYnjlHar9YpH+l2SSCNfvxf7OazDHIhQhT/u2UN0heroGDEdt+5RfFTqB4jQR2j5KpkY7/GqWMHqr4uTHb2Kb6JHJeNMD3Abm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420156; c=relaxed/simple;
	bh=Dm7DLjyA/0YFo2n8HGYKh/2g5tmtioJGMhv1EAnd0+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VOEw5XwfM9Aih1Mq7qy/KyzoOg4j2RTqshshCUBL709oSQGdTctzOUupvG5F0DMD7VptgJLyExa/UOuDJ/ssbrmMgidgnX0AQt2Nx/F1PbT0ZWRl1jCv/TpD05DNNEMwbLJL8ktqabJj0IgWHho6dqIyQdOOoijx5i/jztckYc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EN0j8LCJ; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EN0j8LCJ"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-698c181a258so575270a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783420148; x=1784024948; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yJZeikqCfZ+RGISrrvlqGimYKSxqRzssrq+un5j19kA=;
        b=EN0j8LCJlawzGFp/httWGituLbbfI+46vXfFEm6vohFCo/kzxgwXva4H0Lk7kYXtkm
         TxmR553zoLRINF5v4hp0JbtgmnwmW4R7pqnPKNfBi6/G2r5+WkJq7MwxIZXcSX7phDbQ
         yHChWzJBHyeHJbcTfDYC8dxwD4gai0ffO1rcNcTypUELjV/l0ZpYZ0AUDSyh6JajoM68
         gpM4VOdmvlu/uuyFLv1lTRWC6UaQt1lF2e4aUwDdLR3EjTG7ZgUGCUI+NbBvHKb77yLf
         CbaOr+tP1TtIKExkzoh5pmciZH9Kg/ASzWtZcTb1z4dxb7Zph7EAC6iZfcSN3jY7ZsBi
         4vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420148; x=1784024948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJZeikqCfZ+RGISrrvlqGimYKSxqRzssrq+un5j19kA=;
        b=RRfrvtcqnSTx8lcD5QG0MC0cSVHP0oroTagsMD1jWjeWBkjXCe61xMpqyx5fVp+TuN
         F1PBUERj9FzqtDaZWXdJNxhXPAzn6FhMu7RJFTa42Tcaz7NB0d0aNFNXucWti3eEIJs7
         666Hw9v2U5hQfrcO9VWHyoTi4R62JWupLw/iKx0ki96B85/ji231/3iTQvqkdqzqE/CR
         xTcbbQwhks0m1qYNhPr5FPqroK9gc7eBtVDeVMR35F+Hw1X4IgWXSyq0O9UhrO12h9O1
         3R8w+bWwEy2Vf21U3GMDEQW+ZmF0kJeeZhJ+RtFY21lYUaCKFIpEVqaIDnVXgg6LF0AX
         5tAg==
X-Forwarded-Encrypted: i=1; AHgh+RrnQZ5WFYNThYKv/3laQa6dxmORQHSWDPRjwxO2H1menE+0dXDGuqiGB0O0D9i230t3EnXq7apw8KED0fSTrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGTRiS32VX9tWcf0rNiqjc019PMrWa7rQnInebvRhn48GqsGfw
	9djgW/elQrG9LlP+Dn9Jh6GoxlrSc48/+CsaTINovQynCHFfCOY7QsgZQYE5l9lJeD2L+O1n8Eh
	Hycw4nLhVR7jg0/j9Jg==
X-Received: from eddn17.prod.google.com ([2002:a05:6402:5151:b0:698:506a:a456])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34c6:b0:698:9251:2f72 with SMTP id 4fb4d7f45d1cf-69a85bf7a22mr2711358a12.35.1783420148079;
 Tue, 07 Jul 2026 03:29:08 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:28:55 +0000
In-Reply-To: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3167; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Dm7DLjyA/0YFo2n8HGYKh/2g5tmtioJGMhv1EAnd0+8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTNTqfZ7jUARCuKNEqZtcM1T1VLmR/m7dV/XVi
 QgmZbhlkhmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakzU6gAKCRAEWL7uWMY5
 RvUdEACOzGDSVhBtSulXakjRS+irLVlMXebEleYdsUQ88f/ZaTFANXBrlWws0lzk3YRfhxRGsGS
 YOYVfGMLRzCVO6+DQRN6OVOkGlGFc4S125h2NrBsndpiZa7ws+5dt0PguHROAwpxEXAUYMfWxGA
 Oxgs8gWs9YGOl4saWZuWxVNGPT61Nc71232CIIMdpe/fzM/RVn12NC37cCTEGguDun39GSlB5hS
 FVWunXTrjpZuFXR6dqs6pKfoNtILkJJ3fmAeNrPtwto74uVfGBk1966wtqbWr1VANS0LKxbcQyO
 7UPCBKKdCG72+GcrHBGhbk/1FhDVWiMyT9iBWBha3NjFTDdGlcnVaVzQ5/Sq6r8C/FYn9cV+yZg
 fIu5r6OgPsmzjRH2wbgb22wDNJKMs67NtUKmOXTmpppAmOQALI0fm3iK+JaTCzXC++Cj7WW5yoz
 TqOGhetjprQLY43DYUlXGpgeKnkJSm7fADA209FHUgYnFj0pMNdSpO98or2geiZbTz1unEkqPwx
 D1msbPSIL4H0jh17aR00k6ZnyborOiszUIPyRCVjELDLF2kIDUpGHkJBXsdybRYtIqtQ9McX4/T
 mMnSPepslYKcSFOQMMDyJ23bmJ1M6U9k11O/G+D7zH9qHdW6xxM/eQcpa7jqUQXMQOtPpprU7Vy ZnGGGt/+3tdBIWA==
X-Mailer: b4 0.14.3
Message-ID: <20260707-binder-noderefs-spin-v4-5-7c3c8bc16339@google.com>
Subject: [PATCH v4 5/6] rust_binder: avoid destructors in insert_or_update_handle()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
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
index 410218505417..04d39e5fcb63 100644
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
2.55.0.rc2.803.g1fd1e6609c-goog

