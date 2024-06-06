Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31789197534
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717685422; cv=none; b=dxEwhelbbWXV5J+mgXD3wdA6oQGHLtdIAzszAArkhnNBTKbLQkoonmsjjKwKxRSwTO1L6/qLKrT3y5FdY1y0Taky69UkBje9ATuqTvp6hHBXLYktu4bJyINa7Yoa1y/wGiKVQeTcoBr18PS1wTyGEZZq1RuB+MjJbgoDcKIQtec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717685422; c=relaxed/simple;
	bh=nNzkTpZJ7qh9/otKbRVfsT4Y09H0DA5UH+VJfpL9/2g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mXmCn0p0wDolueMnbW3qvrzLvfaNQJZ5GcrGM9ZQKdWJD6QWDnV1WqO+zgxTDQR5jMFgpj6AGakb62HsbduVEJfhdb4/7G5ui0sEav/6/Evpb16flZSHWknOHaQhJwbWc1s0ktHHxGwWTuE/PsAGkwR0CcVtrl2TBxekLrDgPR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gESt/CPi; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gESt/CPi"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62a088faef7so25560377b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717685420; x=1718290220; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YbF+MHEIuz2j4yWwye2pV8E1rRND1f3g4pzJjU/SQzI=;
        b=gESt/CPiSNgWGF3RSKgF7XALR+pxtQilhZF6qaS8nrTOd2GKLlNrircD+2H6czun8b
         Cvuv76X5ITAkQBUVy9YoGuCc0k4AzaAXnBDHyZxXAMBUpwI+GnDycpX7eQ/Q06t5wk7p
         99tJwwnyQfGDcSwVDIZp8xMVSZlUYGtPDjJXUeaCAqKt2cGuQjIVv1O17zmIWTdhFBx4
         Q8VhbaqrlFpXcFaL3QiTfIuFL/LmHJRpqo+MMlp6efKIHrU/QNtW/n03e6Ye6ru+5JcW
         P7GQ4MH2pkHVEVBAkqt3NZlm96gB3+wnsRpg3I3lOKtMyBAB6nVQmF41lVAxayK/Cvja
         SiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717685420; x=1718290220;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbF+MHEIuz2j4yWwye2pV8E1rRND1f3g4pzJjU/SQzI=;
        b=W5KyyVU7eCuCPBqsB+ZBNz0/MTvT+asw5FqWwv5xaiIlnvLR6QVDYY1zqreoHuGNkw
         /mqx0mpdZyMxYhLRL5SQqTYXKOshR9R3rCjNMrNgv4BfPI/VVwOzbIav03p1YZZIzC8H
         RzhCCEwwmAsmAkyubXuzt/hnMJ8NR9Mq7dNkDKn+CGIALSZteqyVv9VR71ihU89O4Ejb
         7NwMIERXwhq8WhlHg7LxeA6GvVUDafVRVRP+6tMJbYbMAmjBkrNpQnvzbl/x17eUpmHg
         tbDfF1Jzdqg6VpFz8u3l1UL4pAjCtTJZz8CrPDEgPaB/CQqGiH53pGQ3oJ2kFbqAlJcP
         mL9g==
X-Forwarded-Encrypted: i=1; AJvYcCVWhwmY6wHygOPFInLrsgs8a48c2Hq+o0tm9+Lqw/AHGZO6icMYvrznbhHvCHiwPtsw3fdNWbOiYV/OL+J79c0YzsfWCi9G6tvPOJA0csg=
X-Gm-Message-State: AOJu0YzbicvQG4FHXvQqCU4zvE5awa+CRRiaHkbSROYkpEo1oa0apolH
	Bb6Z5gaE16qLwRL/kXgtCtXlV6xHpL7Neh69TrCltzzlCEXzWac1TS/OsWzGEa8o85HIsM02Z6U
	Oo1aYFituVwTH7ZKp4Hh4YHRK4g==
X-Google-Smtp-Source: AGHT+IGJLuwS6IvKPZXMNSnzngsVamcYvOj+g7XUXgZKcUCcREBgTLsv19tfUudBGp+EcaAkr9Xn0Ygn7TJSh7jK9fw=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a05:690c:dcf:b0:61b:e53e:c7ae with
 SMTP id 00721157ae682-62cc709c399mr8543147b3.2.1717685420049; Thu, 06 Jun
 2024 07:50:20 -0700 (PDT)
Date: Thu, 06 Jun 2024 14:50:03 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJvMYWYC/2XMQQ6CMBCF4auQrq2Z6RQCrryHcdGWAZooNYUQD
 eHuFjZiWL7JfP8sBo6eB3HJZhF58oMPfRr5KROuM33L0tdpCwWKUEEurZbRjpFZGmvRABYNGBD
 p/xW58e+tdbun3flhDPGzpSdcr2tFw39lQgmyqnImZqbSwbUNoX3w2YWnWDOT2lGs9lQlChaRj LFEUB8o/ajGck8pUVLESJoqcHyg+kcLoD3VK4WSNdWFsY37o8uyfAHCHDrdVAEAAA==
X-Mailer: b4 0.12.4
Message-ID: <20240606-b4-rbtree-v5-0-96fe1a0e97c0@google.com>
Subject: [PATCH v5 0/6] Red-black tree abstraction needed by Rust Binder
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
 rust/kernel/rbtree.rs        | 1279 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1310 insertions(+), 1 deletion(-)
---
base-commit: 97ab3e8eec0ce79d9e265e6c9e4c480492180409
change-id: 20231205-b4-rbtree-abb1a016f0a0

Best regards,
-- 
Matt Gilbride <mattgilbride@google.com>

