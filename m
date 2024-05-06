Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE3014265C
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714989230; cv=none; b=oEGiAsw/tUg1qPrtq2XdC8RO6tePpIun8gOAm0ysUYWEiOJzzKVFgxEAYW50iIHnwlsuTUPWDxKmeyGDPi4ldFxccSx5puIDErUqwWMUh8GTtzo2rtHRPiga58haTmM6JLB3scMbT7dANjSN1Bjed7OYgWE8yA6qEWvg2t9wWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714989230; c=relaxed/simple;
	bh=Hi80QBWfC/5dRIWaijnYcqekiBONJQqCWhCgOI8iqLI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=U0cJr2naVzi0QphFk8Lc12+FLL5kGxLoGqCQAFJ/g/fsynm2dLsCMKf34dN7jxFpji4SBb6HX/3TS23ezUof/8oPcGfCdV1xUt/IwKLZW74jqp5+0OXEbKxTp6hjimSegzvP8IUBGDO+lLXUgNw6qnF60jWgkNHtqCAfW4vOlDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4L/8BTGd; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4L/8BTGd"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de54ccab44aso3814073276.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714989227; x=1715594027; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PFOyhj3mllue2b1f5gFvIUhYSIkDkhL478tn4LuhmPY=;
        b=4L/8BTGdr/QwGNnbFp1wb0sZFSoxUW/K5Bs4vakT66SccVR/pRy2FX17oilpYhGFEe
         PfJelVYlsoUoXrUDDT8H5gpTjV1b7YGbEw6CKm6+5JeVxVnYJwQr3REkunctyKAatbbw
         mYpj5nM4nGtgmRlepDKrRBPHYJ4MVfJCXJoxp2slE37/mbLO2XHZjg1f9pyWN51TzFDJ
         I7/W6eu6+pL2ECFF0UqvjGnX6oNtT4+5IRkr9uCHr96u2gr8cFHZ/hAlO/oyoO2OHw5S
         aQ/LLrW2kDRYQMcwgEMCJWjwhUY6vS9Vz6jQDKjj5tvdgU91x8+2XNVQIhRMP/xtjxJH
         Nz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989227; x=1715594027;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFOyhj3mllue2b1f5gFvIUhYSIkDkhL478tn4LuhmPY=;
        b=RbqjNXV92GvSUIp8BIUy6MHud5ANYS98c5UT2inv/Igpe4KCUipEkXbjVfZc9Exqrw
         rGJdmbcodvMUz+MuHHBLYOJuijDxCOWd0gAHilows5N0zW0O52H8/le0mbniX+yRw03T
         cPVrMxWAIhihHwKy12nfeURrTIDPgXAsHp2CoGpFyJlV9EG22niesuj3D16ARZK9bT8L
         SIzJGJ0zOjn6bhma1wkHs1JcfJL8GDhBLH4TOkp4RsDN1EBLjR/csj86vmJScZeQwyAq
         WyLIvWxRmjMZ3EmKwznKvgbn83K+lKui6CZmBWdTiFd47VUlwsoIp0pr6JX8qllYFwjb
         xrzA==
X-Forwarded-Encrypted: i=1; AJvYcCUvjRyRxcPUzIV/OzL1HhC3rGdHH16yn/wFsicsv/WXSyZNK6r8hPt9g2cbhNb9FdKTblROL8LroTSeomRyDyZjzs7DFI3+fTM8lVYkTD0=
X-Gm-Message-State: AOJu0YytAx+3RvoNs632XUFPqMfGCijoCY9+tC6ddpeO/Nt3IAe+PkoN
	lAerV+9mmaVpxOQM3kLatdXD10+wT7hBp53mShKSU385qhYkFseTdFbfAF8SlAZkjsOUx9juupa
	nKTWqOfxAe2oVdw==
X-Google-Smtp-Source: AGHT+IEdnYNKREItAwesKph0cqijLYlseJXC7+D4UxWe7gNaz9ghD2ocRA6gI7fJ0Nd9GyLuZZviGh/ahULtJTU=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:1004:b0:de4:7be7:1c2d with SMTP
 id w4-20020a056902100400b00de47be71c2dmr3371860ybt.11.1714989226858; Mon, 06
 May 2024 02:53:46 -0700 (PDT)
Date: Mon, 06 May 2024 09:53:21 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJGoOGYC/1XMzQ7CIAzA8VdZehYDuGnw5HuYHfiojDhhAUM0C
 +9unSdPzb9pfysUzAELnLsVMtZQQooUcteBnXT0yIKjBsllz6UUbA7xjo5GeTI5iKPSiuveIdD HkvEWXpt2HaknOkr5veFVfLc/h6Q/pwrGmRF2UEafNB7MxafkZ9zb9ICxtfYBZxuqHKcAAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Hi80QBWfC/5dRIWaijnYcqekiBONJQqCWhCgOI8iqLI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmOKiV4QXU5qfIMWlTuzyQlmQ2fKyaLazvQAjzI
 MU7R/043I+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZjiolQAKCRAEWL7uWMY5
 RvvuD/9758267zl/pRNasfK4sQv1OLPFlCd+Is3VN/u/f3/PFAlRm4wluXZO4kX6zyisM2Ax9Vv
 Ois9bc468aQRPvT909FZR+5L0WKxWPQQIAQnB5ApbrrC4Zp/8t7kAr8++zk8iPBcxm6y/oXsKTi
 IzYdb9bd4ydjuVtYOcMlimv+MWPitv6wauxoVctADgrRrxiPcyoW1h0kYCYFroGNXp80DKj06sN
 3YMgSH6bjJ5P8nmeLmysStiz5nxn7JAZaBlyRTfDw1kpUbXClQYHVbNhnhn+QYp14SZTfsxg8Az
 XKvtSdTjPXwJrsojetCbBLzJ+xmDXh6Rpaq+Bg5vcYxQI+kbVIyyEICGhyeT/p0PisZU6mJHTeD
 OOwbn4lH7Bq66ipVTSZoZr16nX5VB+YIgih1sdqkMRXeNA6tUNzibj5Wd7wtu53tTdBzCtKBoWP
 FJmMkdkzu3IbCNgRgSwNrLcunkgfvp7nBQWBaYxWrMn27dAwYKiYt4AA2T9apbUMW2NXsik9d6X
 4P7wK+Zr7lGecnwVj8x2t5CzOE/VMDUuKcKMWYmWgkfaRw5I8yRl4LKJGHjmeaW75M16EZJiBAM
 pFEJaCe69GnTv54ZLLNaVro7LRw4HwStgP05aSwUHxc45inkY6XPqhhEaDEykR2br+jAdIXNYcg pM+8c4j7W+iIRIA==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240506-linked-list-v2-0-7b910840c91f@google.com>
Subject: [PATCH v2 0/9] Add Rust linked list for reference counted values
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, 
	Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patchset contains a Rust implementation of a doubly-linked list for
use with reference counted values. Linked lists are famously hard to
implement in Rust [1] given the cyclic nature of the pointers, and
indeed, this implementation uses unsafe to get around that.

Linked lists aren't great for cache locality reasons, but it can be hard
to avoid them for cases where you need data structures that don't
allocate. Most linked lists in Binder are for collections where order
matters (usually stacks or queues). There are also a few lists that are
just collections, but linked lists are only used for this purpose in
cases where the linked list is cold and performance isn't that
important. The linked list is chosen over Vec in this case so that I
don't have to worry about reducing the capacity of the vector. (Our
red/black trees are a much better place to look for improving cache
locality of collections in Rust Binder, and the upcoming xarray bindings
would help with that.)

Please see the Rust Binder RFC [2] for usage examples.

The linked lists are used all over Rust Binder, but some pointers for
where to look for examples:

[PATCH RFC 04/20] rust_binder: add work lists
Implements the work lists that store heterogeneous items. Uses the
various macros a bunch.

[PATCH RFC 10/20] rust_binder: add death notifications
Uses the cursor. Also has objects with multiple prev/next pointer pairs.

[PATCH RFC 15/20] rust_binder: add process freezing
Uses the iterator with for loops.

Link: https://rust-unofficial.github.io/too-many-lists/ [1]
Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/ [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Rebase on top of the new allocation APIs.
- Implement Default for List.
- `on_create_list_arc_from_unique` now takes `Pin<&mut Self>`
- from_unique now calls from_pin_unique instead of the other way around
- Add #[inline] markers.
- Use build_assert in pair_from_unique.
- Simplify transmute_from_arc
- Make macros consistently use full paths.
- Many improvements to safety comments.
- Link to v1: https://lore.kernel.org/r/20240402-linked-list-v1-0-b1c59ba7ae3b@google.com

---
Alice Ryhl (9):
      rust: list: add ListArc
      rust: list: add tracking for ListArc
      rust: list: add struct with prev/next pointers
      rust: list: add macro for implementing ListItem
      rust: list: add List
      rust: list: add iterators
      rust: list: add cursor
      rust: list: support heterogeneous lists
      rust: list: add ListArcField

 rust/kernel/lib.rs                     |   1 +
 rust/kernel/list.rs                    | 684 +++++++++++++++++++++++++++++++++
 rust/kernel/list/arc.rs                | 467 ++++++++++++++++++++++
 rust/kernel/list/arc_field.rs          |  96 +++++
 rust/kernel/list/impl_list_item_mod.rs | 204 ++++++++++
 5 files changed, 1452 insertions(+)
---
base-commit: 56f64b370612d8967df2c2e0cead805444d4e71a
change-id: 20240221-linked-list-25169a90a4de

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

