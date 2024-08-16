Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D604A8063C
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Aug 2024 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723841286; cv=none; b=DOdDvwswHPlKJ27aApzJ1CJpVUajW5XqTp7igFIMwwkOUly1r+Gkr0JHshRU5JZHvepUT2dYaCn0Qcv9WEHD5AG6IQMzjkny2sHEQoUPe/iC7+kIOPKGE4XAtGNYe3geXI1Lu/6FIHKYxru8U9ScdCCI+LJgjIr6xliK4u3LLtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723841286; c=relaxed/simple;
	bh=se2QpLd9+JrVU44C3cYlSxM5ujSQ4zB3x+Z/ispC4OE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MwPVdtBVYQDvSddgpOEzIGIcyIIX4psKPaV0tl1BMbi/DkOkZzA58FwVHHEGPzU++tVwlccBb/Y/HzwUprL0OF00/kzV0zX9/0TMmmOKnwSjObUr8QvgHPAKql+GrGtP3GWhCMG+p7s4SqNe0RYPSdjX26hKS2Q2iJ9wDOSHSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xCeOSCZf; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xCeOSCZf"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e02a4de4f4eso4121822276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Aug 2024 13:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723841283; x=1724446083; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=De3zrU4AhwJ8TbEd63rhQgoe4tjOb+K9QlXrgBECF4o=;
        b=xCeOSCZfZUXKkW2uK1n6PItr0K9YCMj/5k3D6OVa4GEJxh443B3ijzqQ2qTW/KqeQZ
         XbAi+iYnImXSOyaRJSnWPeFvueS6BD3/U0TOcDQwnpFbSIg3oMxVZBJnYHeYVfgh4WD+
         yo9HW0HHkabEoaJUtrzIk1VROZAYhvH6vj/7SYESaSaPR6UuQugCbNuxhUPonre/Lxcf
         PoCtYXOcd07ZBXS7QRsP0lK9r0ncMbW/QAT3jy7hoHvDHPKqTA58wB9u7lv2zxeBMXi+
         dvOqLybu2Kd6uFIgd4f04PY3nqdew96phCZ5NJv7yq9lnnK1FD5ZrXu/dZjfKeV1ihjL
         F++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723841283; x=1724446083;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=De3zrU4AhwJ8TbEd63rhQgoe4tjOb+K9QlXrgBECF4o=;
        b=WUCWuWadC4+oMB4mILwk7a4OnlV7Hk10ewpxyIwbYnXdq9ntghTpYoMDPV643UcKUn
         1izpu98YUMFNG9aX4NzWuhGlsTUAaEMCYxSdDLUub0O/25WY6SHICVCGT8m15hTLPN+b
         99ndym44v6vSxOIzGu5K5QNsYtWSBJm5I0L+ZXZa41ZoKETWpBf6hbo4V/CkOw0zGKeZ
         78QfuGR3javF+AQnk8a2d7zsrVjKbQrlmDRH9jKrEpPdMB+d6FcV9mNZn0WLeUdxa0yO
         4radduLc9wGAD+pK/ME3exbhWpLz5ot0UHuii0tHc1lH06O+5n5liecxHrclnnhbjocW
         C2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe5bRsv/Nr+bBLyZ5t4NI/ffyBhunVyb6aAToE68LlnQHyll1DdQOp4b/BhCaDwYhp7f3+DbphX38AKZGCnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqc25rbEE++ib0346ffhOCs8pmnhnJxcP978e6LMcY9jy9DKps
	pbuCS78yEMHMf4nxAu9VhyZnEwU9iyYdFQ0JCxKz9XInMqt77/xgDNuuhRpeE4V025qIhy3lg83
	GwWqXR75capjXxaEHdZxK62XBpg==
X-Google-Smtp-Source: AGHT+IF3FMUxE/LGiAQVvcvW92i5AtssVO9+Sk3mLJJMYOu68CRLXvLa7mmJ2ws8nvFtEGdHqU6NV6mx40bw8Q/2Z1E=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a05:6902:8d:b0:e11:5d3e:83c5 with
 SMTP id 3f1490d57ef6-e1180f74e4dmr7032276.11.1723841282569; Fri, 16 Aug 2024
 13:48:02 -0700 (PDT)
Date: Fri, 16 Aug 2024 20:47:57 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP26v2YC/23QwW7DIAwG4FepOI/JxoSQnfYe0w6GmDbS1lSki
 jZVefeRXkKUHX/E9xvzUJPkQSb1dnqoLPMwDeO1hO7lpOKFr2fRQ1+yMmAIDTQ6WJ3DPYtoDgE
 Z0CVgUOX+LUsafp5dH58lX4bpPubfZ/WM6+naYmHfMqMG3XWNkIiQj/B+Hsfzl7zG8VutNbOpK
 HY1NYVCQCTmQAT9gdJGLfqaUqFkSJAsdRDlQO1GHVBN7UrBi6XecUjxQJuaupo2664uSfk36dp
 /dnUbbRFr6gpFGyQh+9gHPtC2omY3tS2URbyPzKmMPVBf07amfn1wgw6Ae7Zkd3RZlj+PD3JVQ AIAAA==
X-Mailer: b4 0.13.0
Message-ID: <20240816-b4-rbtree-v9-0-425b442af7e5@google.com>
Subject: [PATCH v9 0/6] Red-black tree abstraction needed by Rust Binder
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
Changes in v9:
- Rebase on top of Linux 6.11-rc2
- Address feedback from v8
- Link to v8: https://lore.kernel.org/r/20240727-b4-rbtree-v8-0-951600ada434@google.com

Changes in v8:
- Fix small style nit (use ? operator)
- Fix doc comment pointing at a private item
- Link to v7: https://lore.kernel.org/r/20240726-b4-rbtree-v7-0-aee88caaf97c@google.com

Changes in v7:
- make `RawVacantEntry.rbtree` a raw pointer like
  `RawVacantEntry.child_field_of_parent`, since the latter can
  technically point at a field of the former. We prefer that the
  implementation be explicit about the safety guarantees of both because
  of the relationship between them.
- Link to v6: https://lore.kernel.org/r/20240711-b4-rbtree-v6-0-14bef1a8cdba@google.com

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
      rust: rbtree: add cursor

Wedson Almeida Filho (3):
      rust: rbtree: add red-black tree implementation backed by the C version
      rust: rbtree: add iterator
      rust: rbtree: add mutable iterator

 rust/helpers.c               |    6 +
 rust/kernel/alloc/box_ext.rs |   24 +
 rust/kernel/lib.rs           |    1 +
 rust/kernel/rbtree.rs        | 1303 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1334 insertions(+)
---
base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
change-id: 20231205-b4-rbtree-abb1a016f0a0

Best regards,
-- 
Matt Gilbride <mattgilbride@google.com>

