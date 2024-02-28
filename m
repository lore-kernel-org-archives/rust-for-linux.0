Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B0573508
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709125252; cv=none; b=hdjUXj7XZyaaMB0f+W+sJXi5F0O0zlQ71Xsupld/AF4CdEzPEBss2SNGvsMvd+AVhjRPtUMuk79yUBZczuoDIwYfyywHJtJxyr6zSldNQvKMty83W5ER7r1/8hXnB8pkGLbBzKmGb+jKEc18rDd7XlmxiTWS8/37xuGicluvhlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709125252; c=relaxed/simple;
	bh=Nj37dTNA+S1wcq1tppsexfMfgfaLNdIQ1D2ci40uNXw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TU86Q15GzvP1PotfOIxOVzy6pAWv+x5eD8ISuYgtO45gHbHXcf6f5ss9jHNnUhK+p8RuL6QU9Q5pIvWX7OYAcMyLUR3JuqoRCvmI+eitXpmK4zMW7hoFirmZTOtkTd58Jr2Ny4oQP4nYK8nhKipUCJHOVWuuYO2kLT/ObwVm6KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+miCPkP; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+miCPkP"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dbf216080f5so9099685276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 05:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709125249; x=1709730049; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=58MmYrc9jKoQcHyoSO2oYsUT2tLUNZNAYGFscRmlNOo=;
        b=S+miCPkPK6yqmfN+0CLQdgD2xL+UqFqQBC28VdnTHZ23A3VcR0yJTfnFbtBhUeX8UF
         whtjI+mJDxyq+oSbG4s9tE3WB76ZjM/vFp4j1hyn8l6HX0TMNyKVe5EDH9BLiAQOMcLx
         YU3S38fiJ/T0xQKf5itXoUqAsT8ocCIDxxEVU7/6YqaTKouSshIPeYUcIYACC9ZQcn7U
         SU1NFTIpEB8tGFPCKN3Z62YnN7UUyLoVQ7VwQhfXjg2RHdhKjxL6R52pb5a+IA1clBpD
         u6S5IjNsBaNPUAQgwmcAoNTtCJMX/BNWqZTH2yZmkhWiwn6HCdK67QWPHM/c6xObCVDt
         gkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125249; x=1709730049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58MmYrc9jKoQcHyoSO2oYsUT2tLUNZNAYGFscRmlNOo=;
        b=jd4ClkHBPPx1IkwPQ/OSQIP8TfC71uEvOURoNW4clq6zSCnB/4lYUKjxK57bC47YqX
         wWhP1D5x0sDmjiPNVr1mIdGrDIZGal2P+JGZjT1xu++cVcGJzEbcDd7b9uvA5LTE5B5p
         HOJiUgs8z/T+4Wb3Fr429N4z+TsVlUDpiT9n9uNBvJ5Y4Y9w0IjczTTFDmxQjfP2TeM9
         WA+JlREmVbugAjrKi9QmDyLYiSUg1czFAxY8sIOzyWQSZYfAiaFqngG6KZI8OxUAEOaj
         fZ3LbkqIGsrfMKft6zxbKIHwUIKW0yDgUc7yoW8q4LieeroGZrAkYsgXjafmm64NJhed
         xf7Q==
X-Gm-Message-State: AOJu0YxVxk307hsBqd54aJbbx+ipdGN0mwVwHkVUhwtE7Xw8ETV6AU05
	gWhPq1FCoAf06q94ps3xnb9RfxdzqZxXJJOhExT7JIfAVEu/3DyCwblrY8lzQx1PxNMC/bBgp2B
	kLo3umtf+N6KiyQ==
X-Google-Smtp-Source: AGHT+IGKoKzlbJKruBGsjpfwCKBmrzAFn4hmSUJpkOs2Es3HUYosdX9GWxeB7n2Z942JAX1X5RNnM+S3wHhiDuU=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a25:1f04:0:b0:dc7:68b5:4f21 with SMTP id
 f4-20020a251f04000000b00dc768b54f21mr612409ybf.9.1709125249379; Wed, 28 Feb
 2024 05:00:49 -0800 (PST)
Date: Wed, 28 Feb 2024 13:00:35 +0000
In-Reply-To: <20240228-arc-for-list-v2-0-ae93201426b4@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240228-arc-for-list-v2-0-ae93201426b4@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Nj37dTNA+S1wcq1tppsexfMfgfaLNdIQ1D2ci40uNXw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBl3y547VYE127NHyhYdMBtASpkMLEEcq2SAKhmD
 bq3LPrMKZyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZd8ueAAKCRAEWL7uWMY5
 RrIAEACkCyxKP3rlLV9pBCpojwlEa4sTsFFQk5nneY/FauWA18/iVQXIAtRN0jXdwTC5KbYtQc0
 TgEzmPSLrvmulGq703bQu5BXBbk1+5/eLIYRUTuKuc+VHHVdqvrFr8xYcNDkyKU8a9wtzy1xrpf
 fJV6DAfMTzjIsGEyHBdn5WPeW4baDdJH5VTvnUTceipJx/KeMsLbpI9+O5LV/l9AeO2R12svGDs
 cuyvLGdh5lGqvBq4dWZOAQQ/rh9YQqx0kjBvnmq5SIO4fwdWdDVFw7tMsG04GjJZc1syzfZ5lMW
 UoE4qEpa9RkDe+qjuKEYp8lnbE2Flep5Xkp2GwT6Jb5T1U7nctoSqXDbiI71ACIFuRaxUyc3iW0
 XdM+M4BFxBArn5v3uI2Vt+E91a2Qy6MSMk1IFmlklvMMax69hU6Eg2KK3ZyQ8xj4QDYsC6K9bs7
 RXGhegCFMlMNlkN37PQGH8gcjPXeF0I00BeCyhaeUbavoEBaUA89ugLeROc7LxiKrnpNAUEYGYe
 pV33/ylsz3e/LxKnhXl4bewu2h0W/YPhExKQHaLIiWbwkI14Ge1rS80TxnKoduj15gH3MkD1m1q
 QNVJaTtx5lSEw088ZDMl9/UQ6FCXz7+2kDq5PEVwn8SkhQJ2i80+n2bQ+ZkEYWx2l90FHTR/bTU ZomqEwmu5LoiAFA==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240228-arc-for-list-v2-2-ae93201426b4@google.com>
Subject: [PATCH v2 2/2] rust: sync: add `Arc::into_unique_or_drop`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Decrement the refcount of an `Arc`, but handle the case where it hits
zero by taking ownership of the now-unique `Arc`, instead of destroying
and deallocating it.

This is a dependency of the linked list that Rust Binder uses. The
linked list uses this method as part of its `ListArc` abstraction.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/arc.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 53addb8876c2..df2dfe0de83c 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -290,6 +290,37 @@ pub fn as_arc_borrow(&self) -> ArcBorrow<'_, T> {
     pub fn ptr_eq(this: &Self, other: &Self) -> bool {
         core::ptr::eq(this.ptr.as_ptr(), other.ptr.as_ptr())
     }
+
+    /// Converts this [`Arc`] into a [`UniqueArc`], or destroys it if it is not unique.
+    ///
+    /// When this destroys the `Arc`, it does so while properly avoiding races. This means that
+    /// this method will never call the destructor of the value.
+    pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
+        // We will manually manage the refcount in this method, so we disable the destructor.
+        let me = ManuallyDrop::new(self);
+        // SAFETY: We own a refcount, so the pointer is still valid.
+        let refcount = unsafe { me.ptr.as_ref() }.refcount.get();
+
+        // SAFETY: If the refcount reaches a non-zero value, then we have destroyed this `Arc` and
+        // will return without further touching the `Arc`. If the refcount reaches zero, then there
+        // are no other arcs, and we can create a `UniqueArc`.
+        let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
+        if is_zero {
+            // SAFETY: We have exclusive access to the arc, so we can perform unsynchronized
+            // accesses to the refcount.
+            unsafe { core::ptr::write(refcount, bindings::REFCOUNT_INIT(1)) };
+
+            // SAFETY: We own one refcount, so we can create a `UniqueArc`. It needs to be pinned,
+            // since an `Arc` is pinned.
+            unsafe {
+                Some(Pin::new_unchecked(UniqueArc {
+                    inner: Arc::from_inner(me.ptr),
+                }))
+            }
+        } else {
+            None
+        }
+    }
 }
 
 impl<T: 'static> ForeignOwnable for Arc<T> {

-- 
2.44.0.rc1.240.g4c46232300-goog

