Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A414D28E
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262131; cv=none; b=SOiuBNh571qfGDn3S+2cp9PvOUjUhwxZWlSId7fjo1P15pMOfG7/By74HHDI6dZiBk7yqUY0HUGmzVMtzbq+bQZMoaIkq62V9wr9oc1sFH5Rbj8xImIR4BZ7ENvvUc2XWsKl3zYBpnmaPqPEousurIN40tsS/+mrYh3yPr99QRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262131; c=relaxed/simple;
	bh=KmRFi1FwSRS9v1Ei0rzLK1xkSHaz7WOPSbWTpc52UJs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ioAaKhn2siQrALFXAL/yWk8OjmfqLPW5+rTKvbDvhutX4xb5ifxjU89hg7YmPkq1+TJdlQU2MTQ6soK6tGyBYLq95StejtwGip0CZ5SH1Hh7lopKoJjEfYyngd6PMHPzSg/XCe3JPNWek4E5Cem9yjS10fEG6lvzNqHwUfcAg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ibvJcJG; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ibvJcJG"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ad97b9a0fbso9387b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 10:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724262129; x=1724866929; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AB4KoZC16fhRtFUGOboRbdVF+tSsgpZU8UUX7dT390U=;
        b=4ibvJcJGpBFe9VpwYwysTlsH8NpAkW00Y8cGGpTvmaq7luqiyqgXxNMQ9UzsWgwvf5
         ajvAbpfbBXXExYxQe3bTKbekG70Te/H8QqF5s/sGkfB623eaA7U2WnEr/7vRYAzn5xMM
         3YHEty8/u7PpoYnJ3kesVRSxTZ/tfd1pwdLxCgGFpWJ4lehS1FaVhhswHWSn8n5YQRZ+
         rlMJLTdavWBNo2GdTQk9rL9y9gB91GJtgX9anXZRoXLPalgjjDEVGBsIErV+kuWgHhQp
         60i4lbQqtn9dGxCAbjtlvLjHgDfzmDkgeSpt19mintyKQEljnzE0VfvyxVxoH+A87tiT
         4B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724262129; x=1724866929;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AB4KoZC16fhRtFUGOboRbdVF+tSsgpZU8UUX7dT390U=;
        b=NEkxu/sRkxUpgEVbqWBJos44N5/9U3G4zHlAHREmBH4clso8HrG3Lbb6anyg+qp5XM
         7bonchbDK6Y2JF+UOyvtPKa3cOjE+XNUOzMMt6XpuXw9oOybfENw0VqCCcNeHdac1WN/
         jhiTExuFr/RzRr4UGsRH/LVIvXX7B/hNzIyrM/gOy2vDcRc6bZPvKtH1q/ejC2YMkNnJ
         5ng5mdOfX0w/HUjpjrIPFKDrcbK+C+muhGsCy7bLRQtVTL/P80Kby+/fDhnvjEuGvTkv
         GhOvLabrA3mz7dH74LrYeOEGHZqs/quaAaoD2AcR0/ZDwvaHqBsguZ692/AKyuf9VbgJ
         o2aA==
X-Forwarded-Encrypted: i=1; AJvYcCVs6mQF5SLb+Yt718YRObJ0cB7zGG7HKam40soQOzFDXf1H+iWRFzhlX3q6VqZmhVxLCFk4RjkoK2uS0kkOJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylsQumU68s2XUWQXaUS1dcOIM8dbXBTn+AsCFyR719vK4oYoZ1
	Qh236TogRxJh+DrX9UaY7uvyzJtqQJNE+252uXE/SqW6kGu0ExoquzMpCuO8icHstJfs5u8wwUG
	6+1pW97Czzj9a3c4u4V39dO2l8Q==
X-Google-Smtp-Source: AGHT+IEuZFs2yLPO126ZoD1OOKLmQAzVNFN3ySgktNgHgcHzmovvL1Kwb11KLLL/liOHk3YChgVsLRGCrMhJ1F23JXs=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a5b:4c2:0:b0:e13:e775:5a3c with SMTP
 id 3f1490d57ef6-e1665418144mr4904276.2.1724262129201; Wed, 21 Aug 2024
 10:42:09 -0700 (PDT)
Date: Wed, 21 Aug 2024 17:42:06 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO4mxmYC/23RwU7DMAwG4FeZcqbIjt0k5cR7IA5O6myVgKJ2q
 kDT3p10l6Yqx1j5fsfOzcw6DTqbl9PNTLoM8zB+lQPi08mki3ydtRn6UjAWLKGFtoncTPE6qTY
 SIwqgyyBgyv3vSfPw8wh7ey/nyzBfx+n3kb3gWl1TGPYpCzbQdF2rpKoUEryex/H8oc9p/DRrz
 GIril1NbaEQEUkkEkF/oLRRxlBTKpQsKRJTB0kPlDfqgGrKK4WgTL2TmNOBtjV1NW3XWV3Wsjf
 t/D+zuo16xJq6QpGjZpSQ+igH6itqd119oaIaQhLJpe2Bhpr6mob1wS06AOmFiQ+022jAXdeuU LZtZLaSvbYHilDb3ccirDuOFG3i3pPkHb7f73/+O1K+uQIAAA==
X-Mailer: b4 0.13.0
Message-ID: <20240821-b4-rbtree-v11-0-2ddc66f26972@google.com>
Subject: [PATCH v11 0/5] Red-black tree abstraction needed by Rust Binder
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
Changes in v11:
- Address feedback from v10
- Link to v10: https://lore.kernel.org/r/20240819-b4-rbtree-v10-0-3b3b2c4d73af@google.com

Changes in v10:
- Rebase on top of rust-for-linux/rust-next (e26fa546042add70944d018b930530d16b3cf626)
  - Adapt to changes from "rust: kbuild: split up helpers.c"
    (876346536c1b59a5b1b5e44477b1b3ece77647fd)
- Rebase on top of "rust: kernel: add `drop_contents` to `BoxExt`" instead of including it in the patch series
  - https://lore.kernel.org/all/CAH5fLgj2urZ6OD2ki6E=6EuPqW3Z8BGg8jd6Bgo4OOrNiptnDw@mail.gmail.com/
- Link to v9: https://lore.kernel.org/r/20240816-b4-rbtree-v9-0-425b442af7e5@google.com

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

Matt Gilbride (1):
      rust: rbtree: add cursor

Wedson Almeida Filho (3):
      rust: rbtree: add red-black tree implementation backed by the C version
      rust: rbtree: add iterator
      rust: rbtree: add mutable iterator

 rust/helpers/helpers.c |    1 +
 rust/helpers/rbtree.c  |    9 +
 rust/kernel/lib.rs     |    1 +
 rust/kernel/rbtree.rs  | 1285 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1296 insertions(+)
---
base-commit: 68ad5e31ad2ccab128468e829f53191cf60f601f
change-id: 20231205-b4-rbtree-abb1a016f0a0

Best regards,
-- 
Matt Gilbride <mattgilbride@google.com>

