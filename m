Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21EC263C8A
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845895; cv=none; b=BVL/J2Pzrhrt7+uyiSP806Z2u7Y7UQLEoiGbe3XHTiPzoqx47ER5+2IFqjIWf9IKWhnBKFzXBgS5Kxwj+yeOatoxJ53TC9ixTq19CkHqWK5F3FHf8+n/IfmJm2Ahhf39nsy0jwrem4pyoPX0o3Etg5coeK1p9c3BKMdBSaSjDcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845895; c=relaxed/simple;
	bh=zWmWPrNOhUkM882JMpbDBfEGQcxG/fITkb9z+Trg0V8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mQGXBCsj90lzx0ec8wKZI/TuZWfEtLh6gyMuSd0SqcZeyTlY/KFn1Go49ifRVaBbAfypaNFzjyNvBHXtRrAnA+JG52GxUXXJPGRruUJASgMsYyqsHvyLdolKD/QNiu7UAGPobEH/7a9cTpYLGy7NnG1BtRbIO3ikT6XZlgstrCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=irvSTSY0; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="irvSTSY0"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630753cc38so6709570a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845893; x=1766450693; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEnDmHEq/pjEOk2KbWPaIkOgwqje/3X84mpIIYgLImI=;
        b=irvSTSY0F9l89sut/Y3Rx4BbbLpj4feEMCN8G+IkECTrg4a1kdzYbxKZdKh4d1n1x7
         uFUKKWj+8KxvIjeyP1d6/zr37o7u/HY0DZCimmd7y6oRLSUcQCGJ+HWtJNvP1uOJq68d
         jtlh54nb+fgkI/Y3vL+CHu01fouGs6WjYSHY9U98836BOOq+ZDzHwVuYh53R5xMpmWa8
         Wj2gVg5DnYnfzENSVWGwPtn1xZGFvFCU4Tmx7QS+NznWzIfCumu43ew1t0JZSCwhiFS2
         j+xqGiFMAereyVH5W3N1sWFvS9v7z5Z/Og2sFN2sHko/Lw1qQWPFRDM7++DFZbdthxWO
         ypmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845893; x=1766450693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cEnDmHEq/pjEOk2KbWPaIkOgwqje/3X84mpIIYgLImI=;
        b=I8PyHKMZKXPX12g7TV75Zfafq7b7Ds8MMMKgODzu2tggcCrHaQjFBGhBLgUNYT9B+5
         Pm26d7TBTSu8n/S019M/ZH+LrG00hfQy1jQ5ThiaAqAp6QiESk7W9uf/X0r4QpROQNS9
         /elqUCD4TMz0eejWqXwnQQkcjRy0xb5fsbAGSDfeTk7xrlO9BAubvlOebyXHHhjVQ8vr
         HXyiZEicnNCBFRprOgFgajf7SOuinK3SkYVlUkROv3IsC4ZUS+beM+QckEpAEg2rhuXb
         hvUKcLAIcwYX9TLTphofHh7nGGHffArap/7JbA/grIzcqwyBRVjXop/unSnddMUQMP8y
         QcIA==
X-Gm-Message-State: AOJu0YytFRDPYI59BTGKFI5+L2SaFIZIYX7MzHVJxZeoZqj2hoGCTyyO
	dqc1XByxTVb+pyOwlekPPvfK9PnDCoGP7WjsJQgys0Ot4PBMVUysfxL4vZbYiTud9KL6T2m0tzR
	70FpcHLP1JA==
X-Google-Smtp-Source: AGHT+IGRZPMQ2yBe0NhIvb5hOnB2DN4D4G61oVHxl7WF0Mdjz4pPXx29w9FfD3xZ46WBgKt50LDhqF9T4TV7
X-Received: from dyki18.prod.google.com ([2002:a05:7300:7c12:b0:2ac:1eee:fdb4])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:df44:b0:2a4:7fb3:7a96
 with SMTP id 5a478bee46e88-2ac3014694emr7291095eec.36.1765845893134; Mon, 15
 Dec 2025 16:44:53 -0800 (PST)
Date: Tue, 16 Dec 2025 00:44:41 +0000
In-Reply-To: <20251216-transmute-v2-0-b23e5277ad02@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845890; l=3786;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=zWmWPrNOhUkM882JMpbDBfEGQcxG/fITkb9z+Trg0V8=; b=gi00nijuT2TpF/lR3rXX31OTfUtcwxGU0aW4+os2xhsYPx12A8zt05wJ2d5wQPaQFFxPyYnAT
 Ws6J/pxRM1vAe6a2m82ebV7KlIBKOmy5JfQtFfWVgt065/ITyEPrYC1
X-Mailer: b4 0.14.2
Message-ID: <20251216-transmute-v2-1-b23e5277ad02@google.com>
Subject: [PATCH v2 1/3] rust: transmute: Support transmuting slices of
 AsBytes/FromBytes types
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, we support either transmuting a byte slice of the exact size
of the target type or a single element from a prefix of a byte slice.

This adds support for transmuting from a byte slice to a slice of
elements, assuming appropriate traits are implemented.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/transmute.rs | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index be5dbf3829e25c92f85083cc0f4940f35bb7baec..5cc5f4fde4c31cea3c51ab078b4d68f3a0a2caa1 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -122,6 +122,78 @@ fn from_bytes_mut_prefix(bytes: &mut [u8]) -> Option<(&mut Self, &mut [u8])>
         }
     }
 
+    /// Converts a slice of bytes to a slice of `Self`.
+    ///
+    /// Succeeds if the reference is properly aligned, and the size of `bytes` is a multiple of that
+    /// of `Self`.
+    ///
+    /// Otherwise, returns [`None`].
+    fn from_bytes_to_slice(bytes: &[u8]) -> Option<&[Self]>
+    where
+        Self: Sized,
+    {
+        let size = size_of::<Self>();
+        if size == 0 {
+            return None;
+        }
+        if bytes.len() % size != 0 {
+            return None;
+        }
+        let len = bytes.len() / size;
+        let ptr = bytes.as_ptr().cast::<Self>();
+
+        #[allow(clippy::incompatible_msrv)]
+        if ptr.is_aligned() {
+            // SAFETY:
+            // - `ptr` is valid for reads of `bytes.len()` bytes, which is
+            //   `len * size_of::<Self>()`.
+            // - `ptr` is aligned for `Self`.
+            // - `ptr` points to `len` consecutive properly initialized values of type `Self`
+            //   because `Self` implements `FromBytes` (any bit pattern is valid).
+            // - The lifetime of the returned slice is bound to the input `bytes`.
+            unsafe { Some(core::slice::from_raw_parts(ptr, len)) }
+        } else {
+            None
+        }
+    }
+
+    /// Converts a mutable slice of bytes to a mutable slice of `Self`.
+    ///
+    /// Succeeds if the reference is properly aligned, and the size of `bytes` is a multiple of that
+    /// of `Self`.
+    ///
+    /// Otherwise, returns [`None`].
+    fn from_bytes_to_mut_slice(bytes: &mut [u8]) -> Option<&mut [Self]>
+    where
+        Self: AsBytes + Sized,
+    {
+        let size = size_of::<Self>();
+        if size == 0 {
+            return None;
+        }
+        if bytes.len() % size != 0 {
+            return None;
+        }
+        let len = bytes.len() / size;
+        let ptr = bytes.as_mut_ptr().cast::<Self>();
+
+        #[allow(clippy::incompatible_msrv)]
+        if ptr.is_aligned() {
+            // SAFETY:
+            // - `ptr` is valid for reads and writes of `bytes.len()` bytes, which is
+            //   `len * size_of::<Self>()`.
+            // - `ptr` is aligned for `Self`.
+            // - `ptr` points to `len` consecutive properly initialized values of type `Self`
+            //   because `Self` implements `FromBytes`.
+            // - `AsBytes` guarantees that writing a new `Self` to the resulting slice can safely
+            //   be reflected as bytes in the original slice.
+            // - The lifetime of the returned slice is bound to the input `bytes`.
+            unsafe { Some(core::slice::from_raw_parts_mut(ptr, len)) }
+        } else {
+            None
+        }
+    }
+
     /// Creates an owned instance of `Self` by copying `bytes`.
     ///
     /// Unlike [`FromBytes::from_bytes`], which requires aligned input, this method can be used on

-- 
2.52.0.305.g3fc767764a-goog

