Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110A18F72
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jul 2024 16:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720714871; cv=none; b=clT7Z68o4zBRdzo+YfHp6fVVTeG/Pvr/lVZ3HbdmkqVrItjJm4/OHEu1datz4g6ETvKCl99cYV2GsqfJTHANklH5UCn+K9t08uupRk1b8whBC9ObfY1a+XBOT6l0eOIyus/m5P3u2sakElYp/NXWW2U5QNq3fyNK3k9stOymUr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720714871; c=relaxed/simple;
	bh=5E3iLBumL/1G/RCHbnaQlT1FC8hWo90L+rrulfKfPgw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QwUTxtgfdccHkQjYz7qc2IPa4Oz8wu9sVWwkEOeYSQl3MYCBESLFPjqbanMOCrkkrfdgpnh+D8/a1uVm1iCF5HXHxNXzi/20DyPzRCd9GpkeiB7mJDgLBuoIk1p+tEHVbNT3q3fvT2QkN1vHMlAAOruwplvB0C6zIOY97U+NiOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8kVNNan; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8kVNNan"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-64b9800b377so26655427b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jul 2024 09:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720714868; x=1721319668; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o+zcTHE1ThmkrmCYXmDjLnqt7KG14tVJ09ohFxCpSt4=;
        b=L8kVNNan6ve67Zmt3hslt9NBVx1JQA+Un9k4rzr4nN8r84hFcJTigS1uOEtz5qNvga
         qtku6JC/BNZu2GQsHYUYiuMFOvwwGEWzPd4nGe/c3sf9MoXKzcsNcfWI8JqX6imfeWlo
         ZFXZ+FdLELiJo71gp2Y0ME3VY7h4pzrI/kMaWmYTyCRlWx1hV0PZxaDh4WmVkMi1ov3j
         MWcgFCl3TkMPqFpoh1ODEtHDJDuwMqk/VgRgJe2K3nfkDuY5UfsBobtVOSJzmGIecrGX
         2xJVR0ZDE7UBDQoiiJiokq8nlUwrA4NlGb6Ppcrr3ggz/EhI+F0mg6JcxSiCTZhsEIeo
         4FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720714868; x=1721319668;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+zcTHE1ThmkrmCYXmDjLnqt7KG14tVJ09ohFxCpSt4=;
        b=jLo81AIv/SoREe7RrRJfvEcWxgXqBuJv0zC27scs/l/z7LB+HbAfmPPNEqydE0c6uP
         DJ2DWZ3EzGq3ysRpDtDqRwyotP03JLopAGt1bdv0cQy2WAYJsOBEbE9e+UjHr3c4+FSc
         YZlHeuMdbZDitCAhasnzCd8pKstTp8NliYTUa7cZEdR1V/fSJ6U3D+hiPHSnmp9ZrGH1
         6nxknIQ4zuhAUWvokET8QmcuKTL2vEkkOapHZ3DpK7Q/h3IaGTDDj3ifgQ6EQWvDQrXe
         rcRf5jc1MDpsqKe2NB+ykkgpCDNArD/ZtUYML4RxZ1Y9yu/GsbdJtKp0nnBJxpXLmnho
         7qAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu0AVJTLVT7Rj9GeuxKJiY+CDK4GM/Ge1x/Q4FvltD5j//tdjyo02DXncFKgT0rQLb+cGlWK57H4ScRmFZIIZXYgLA4jZpcA8oAVwMg60=
X-Gm-Message-State: AOJu0YwgL2i7HUlecbCpIgGQw3s+ccJCY8/oBjv6MMzOepdKM4phZZ9X
	SwjnED1Cdsy8dKVv3HA1VjwltZCZyATQn6pw5ajgItK2eYh+rf/u0Eq3Czbj7EdmjoHwXS+LMKF
	29G+OuuUFwDwkPqRkOfgATW4WSQ==
X-Google-Smtp-Source: AGHT+IEEJ0AZjgrUy8/Qp/N0onLgSQ1zPTUNHFgC9dg0zytm8+lAlbzeJiu7uU8uVJZ7CI5M6jltg+b0v4MZ0IykUIw=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a05:6902:100f:b0:e03:52c8:ad30 with
 SMTP id 3f1490d57ef6-e058a8c5ebcmr158276.3.1720714867842; Thu, 11 Jul 2024
 09:21:07 -0700 (PDT)
Date: Thu, 11 Jul 2024 16:20:56 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGkGkGYC/2XQwW7DIAwG4FepOI/JxoSFnvoeUw9AnBRpKxWpo
 lVV3n3QS2lz/C1/v2Tfxcw58iz2u7vIvMQ5pnMJ5mMnwsmdJ5ZxKFkoUIQKOum1zP6amaXzHh2
 gGcGBKPuXzGP8e3R9H0s+xfma8u1RvWCd1hYNry0LSpDWdkzMTH2Aw5TS9MOfIf2KWrOohqJtq
 SoUPCI554lg2FB6Uo19S6lQUsRImiwE3lD9pAaopbpS6FnTYJwfw4Z2LTUt7eqtZuTyN7Zfb7e u6/oPQ05XWo8BAAA=
X-Mailer: b4 0.13.0
Message-ID: <20240711-b4-rbtree-v6-0-14bef1a8cdba@google.com>
Subject: [PATCH v6 0/6] Red-black tree abstraction needed by Rust Binder
From: Matt Gilbride <mattgilbride@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>
Cc: Rob Landley <rob@landley.net>, Davidlohr Bueso <dave@stgolabs.net>, 
	Michel Lespinasse <michel@lespinasse.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="utf-8"

This patchset contains the red-black tree abstractions needed by the Rust
implementation of the Binder driver.

Binder driver benefits from O(log n) search/insertion/deletion of
key/value mappings in various places, including `process.rs` and
`range_alloc.rs`.  In `range_alloc.rs`, the ability to store and
search by a generic key type is also useful.

Please see the Rust Binder RFC for usage examples [1]. Note that
the `container_of` macro is currently used only by `rbtree` itself.

Users of "rust: rbtree: add red-black tree implementation backed by the C version"
    [PATCH RFC 03/20] rust_binder: add threading support
    [PATCH RFC 05/20] rust_binder: add nodes and context managers
    [PATCH RFC 06/20] rust_binder: add oneway transactions

Users of "rust: rbtree: add iterator"
    [PATCH RFC 17/20] rust_binder: add oneway spam detection

Users of "rust: rbtree: add mutable iterator"
    [PATCH RFC 06/20] rust_binder: add oneway transactions

Users of "rust: rbtree: add `RBTreeCursor`"
    [PATCH RFC 06/20] rust_binder: add oneway transactions

Users of "rust: rbtree: add RBTree::entry"
    Not used in the original RFC, but introduced after further
    code review.  See: https://r.android.com/2849906

The Rust Binder RFC addresses the upstream deprecation of red-black
tree. Quoted here for convenience:

"This RFC uses the kernel's red-black tree for key/value mappings, but we
are aware that the red-black tree is deprecated. We did this to make the
performance comparison more fair, since C binder also uses rbtree for
this. We intend to replace these with XArrays instead. That said, we
don't think that XArray is a good fit for the range allocator, and we
propose to continue using the red-black tree for the range allocator."

Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/ [1]
Signed-off-by: Matt Gilbride <mattgilbride@google.com>
---
Changes in v6:
- Minimize usage of `*mut bindings::rb_node`, replacing with
  `NonNull<bindings::rb_node>`. Specifically, changing
  `RBTreeCursor.current` to be `NonNull<bindings::rb_node>` and updating
  the corresponding functions.
- Update `RBTreeCursor:to_key_value` helpers to have their own lifetime
  (they are not instance methods, using a different lifetime than that
  of the `impl` block they are in makes things more clear.
- Fix misplaced semicolon in `cursor_lower_bound`.
- Link to v5: https://lore.kernel.org/r/20240606-b4-rbtree-v5-0-96fe1a0e97c0@google.com

Changes in v5:
- Used `Box::write` in `RBTreeNodeReservation::into_node`, removing
  unnecessary `unsafe` blocks.
- Updated `RBTreeCursor::remove_current` to return the removed node.
- Link to v4: https://lore.kernel.org/r/20240603-b4-rbtree-v4-0-308e43d6abfc@google.com

Changes in v4:
- rebased onto the tip of rust-for-linux/rust-next (97ab3e8eec0ce79d9e265e6c9e4c480492180409)
- addressed comments from draft PR on GitHub: https://github.com/Rust-for-Linux/linux/pull/1081
- Link to v3: https://lore.kernel.org/r/20240418-b4-rbtree-v3-0-323e134390ce@google.com

Changes in v3:
- Address various feedback re: SAFETY and INVARIANT comments from v2.
- Update variable naming and add detailed comments for the `RBTree::insert` (later moved to
  `RBTree::raw_entry`) implementation.
- Link to v2: https://lore.kernel.org/r/20240219-b4-rbtree-v2-0-0b113aab330d@google.com

Changes in v2:
- Update documentation link to the C header file
- Use `core::convert::Infallible` in try_reserve_node
- Link to v1: https://lore.kernel.org/r/20240205-b4-rbtree-v1-0-995e3eee38c0@google.com

---
Alice Ryhl (1):
      rust: rbtree: add `RBTree::entry`

Benno Lossin (1):
      rust: kernel: add `drop_contents` to `BoxExt`

Matt Gilbride (1):
      rust: rbtree: add `RBTreeCursor`

Wedson Almeida Filho (3):
      rust: rbtree: add red-black tree implementation backed by the C version
      rust: rbtree: add iterator
      rust: rbtree: add mutable iterator

 rust/helpers.c               |    7 +
 rust/kernel/alloc/box_ext.rs |   24 +-
 rust/kernel/lib.rs           |    1 +
 rust/kernel/rbtree.rs        | 1285 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1316 insertions(+), 1 deletion(-)
---
base-commit: 97ab3e8eec0ce79d9e265e6c9e4c480492180409
change-id: 20231205-b4-rbtree-abb1a016f0a0

Best regards,
-- 
Matt Gilbride <mattgilbride@google.com>

