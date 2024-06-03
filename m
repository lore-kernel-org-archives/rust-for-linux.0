Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F912DDAF
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717430727; cv=none; b=Qpy0qq+9TTHvqwbESV8BpmoJ5uLvDpW2/ry2dZxHOtSSMWiC231Zy/pTjP+3loAUeA1Wyk2Kf3eL3IajfOVWNlb09dZpB6J8oFeotFr62zHsBCJbrnN0zJUdyHNXDAxih4acjMwfyzcPlqAeiwrjVcvt4/MHunY5XbhyE7h6GZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717430727; c=relaxed/simple;
	bh=l5Sj3lxRWfk0XbHE+F1X72EAMcWezz/9Eep9qLPQEKc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i5owF698Uf/fhzbz4aDC4/dEX7X2mNCdhUKA/xiBlOuaq49YXuc9OQvILv37a97k4QOpjZnGGhA38mEU6MdOYz8Mp5i+YdghJyo/AzI4cn//TEo8y2sg6XatTxZ/BlAxil/tpKvdPj87b9OnyoxgwiUAO+CSlLXEPk/CNxE4hHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZqQfM5x4; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZqQfM5x4"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df7a6530373so8438885276.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jun 2024 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717430725; x=1718035525; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9RncEJdeszyiLUwbc9/gvhzsxiXteWPzB4eFyiRN0N8=;
        b=ZqQfM5x4Vpyb/oAFPQ4cIQozWOU9wFiP/UMqckh5MiBeF0k7LrsWBVaqkD/v+mXo3F
         aJOJe8zkh1JCqpJaO/8SCHAZ0Tmv5iG315Y6B8b++PCy/8wIqslSXaEL1RjCZ5np7gSP
         ExmPangvnCnjrO1uWEzQn6IK4meiqP+pWdqLS/mYvP6GlNnDNrDAOS6XnRSIbPge4iEN
         A32Rj/9MFGiSNiasPSIfyNkM8KNhUqstdiLOfTRbKwbK/+N6QbO9EFz7RJLfSrHdkCKU
         SZlL4m9KXh1P+pgu+LjrLLciIkbp9kAndchca3gsQ8PgK9CruKBpAIKMkPtji8PbGXd2
         71IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717430725; x=1718035525;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RncEJdeszyiLUwbc9/gvhzsxiXteWPzB4eFyiRN0N8=;
        b=v/t+jMQqbyk7yVJr/vhCwkzN51CuJn/5iQ3ugEUxKl6o98VIvSSogX2XIxu2wP/J+1
         nXSclWBBLOrsrLdYAg8NxxVP+DSmvWK5xoMONNxwfl7UZSl4MOPOK6wIsNpuqjZABOkh
         ClfOPPZQ+Kkbi2eQjukauk1/H1Lq98lByhu+BOiKRaxAao3slmTT0JsdQSHn7mPiPcFz
         l05o4IlYOA/xFI+hgFSqNRPTejrqIubC8rNig0HS/4N8immT9uGn/8deuBYUx+leE9Zv
         IRP+FSBR0kjgkzuKRl5omeGD/yskNRi4OCP/4s5lXYckdwVUXJ673a4Xcx+E4dL3Qove
         UbFA==
X-Forwarded-Encrypted: i=1; AJvYcCVYyoOSaTnBxT092dmeiXP2MSun9su0sFzp3+djtYhAo8ouov58iPFgqIoK/cFV8T27RyLR2mraU0+x0jWDrBuW46nVwroTDHP4kA0YJ4I=
X-Gm-Message-State: AOJu0YyWydmYfwd678Ygb4b6WPZQleos6DD1fBADtQqbGM9EAFqVvX5V
	6AErI49dVe9Vl2VK2hlk+E+3rkmG1hIGdy1l5lO3mLefaN2QxZXtyZxQzGS3Ik1UJ51hldfr0rZ
	KaMohVeYE204yRPbCuVwhLgZYHQ==
X-Google-Smtp-Source: AGHT+IEF46odfivoyPM2DQFm1oNxtmDXUHZTym+yTOPzz6LNosEPi+jZFXbQWp4sCSEPT2Gmodf8a3z9vvaEKJ/Ac1k=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a25:d6d8:0:b0:de5:a44c:25af with SMTP
 id 3f1490d57ef6-dfab8ba28f9mr2748276.5.1717430725042; Mon, 03 Jun 2024
 09:05:25 -0700 (PDT)
Date: Mon, 03 Jun 2024 16:05:15 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALvpXWYC/2XMQQ6CMBCF4auQrq2Z6RRDXXkP46KFAZqoNYU0G
 sLdLWyEuHyT+f5JDBw9D+JcTCJy8oMPzzz0oRB1b58dS9/kLRQoQgWldFpGN0ZmaZ1DC3hqwYL
 I/6/IrX+vrest794PY4ifNZ1wuS4VDftKQgnSmJKJmamq4dKF0N35WIeHWDJJbSiaLVWZgkMka x0RNH+UflRjtaWUKSliJE0Gat7ReZ6/8LtFvBkBAAA=
X-Mailer: b4 0.12.4
Message-ID: <20240603-b4-rbtree-v4-0-308e43d6abfc@google.com>
Subject: [PATCH v4 0/6] Red-black tree abstraction needed by Rust Binder
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
 rust/kernel/rbtree.rs        | 1278 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1309 insertions(+), 1 deletion(-)
---
base-commit: 97ab3e8eec0ce79d9e265e6c9e4c480492180409
change-id: 20231205-b4-rbtree-abb1a016f0a0

Best regards,
-- 
Matt Gilbride <mattgilbride@google.com>

