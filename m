Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8295240DB3D
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231184; cv=none; b=DVUkZYHm14dBr2ernka9USxqb4m9Bgpoldp2HdxUV7hDJpHUZt6P+F7RPgFmVH6EcZBdFlMm7MTJvdioESfrEqlZZFVp3GPexFAN6aF3Tbg8ymPM/dMqegU+njrEydnRecVfuM/ONwOmt76HUx8xnPvaC6F/4fYWR+Do0srALOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231184; c=relaxed/simple;
	bh=LlIlzK5NNphROYKWlaVKma55nq6KUqv7UrPj9D9qWrc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dKbK0F8WHPHPeGsiSlR+2DC6PBcBpPQHQ76UIkW+cxyaMP7dbmJd31ETo+zQaAHmQJAs6xBTpqO5VIh/W4pJD/y0Tfa5V50yyv0wViUbghAnxv83lIbGfALGb4zLsws4DczyNgxck20nhNkr1maHPpe4ZqPBcwJXyX6NUcB9O8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MpWQOmQt; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MpWQOmQt"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso300408766b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785231181; x=1785835981; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QV12yf4MQsmWzikrH2XSolww9qlOMkguHw2tdy0o2aI=;
        b=MpWQOmQtxdRqYOfAnXNwPV9F2kDCcixCnlfEEULHj9RMF4Sl2UOJc+Wg9Tk5KvqZR1
         TG2uvmPRSLkocx6RTlHslGjVVrZ/zQtpS4ls2wkDvyxuhTjFHkb3xeEeSD7mLyqSFmnQ
         Rxw4AP5A2EceIyXsePx21CbwX0SYf43FTWTig4eghP9ZV0FrgTJdnbryRLP6aL/1C3A5
         1d36cyCq59c72iGSP5CyAZ2LrdVckgn0fKgQ/ljpp5TkAzhp42uRCUcrE9ePdjovNKOP
         WwIA1o8tLDACyl/nDSJJOO9flQ4zLWml6qnvTvw9BaYvaxBMMcfzcTyRm0O2PoK6Z3jt
         DGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231181; x=1785835981;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV12yf4MQsmWzikrH2XSolww9qlOMkguHw2tdy0o2aI=;
        b=FCnarWvRM468OyifgLC5u3JsnDo+HkP43gRTo8+HqFgqS/fG8iE10MfIfzVkeS3gPC
         ZKL0o0sydz/wxinS4zsXDGQCJ/haObZAUmy3S0WIfffMNQO+QpNuAp19Dn9dyZ+iBq9G
         hKUho7uizczSeGBW5QHhhUcudB25dYLuJv8s2Ewk+TpeyeyqVxA5OVKSvI452FsHPabx
         Dg/JxrollIM0NBCz43sjWsHdMmRhFE4qSD/LrAoHBDiy9RXIMNH1F0wTNlxn/LoTOymd
         zgqB+PmSOvGWlf01tKMb3KvrbvRFwZ1xuWtaRU3+nl0mOn9wdeqfZbZLBcKT89m57C8N
         AH+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr9K5yIxsl+HooRCNOuBPvMP6EW50AU7PgwQr+Sh+gL8skuT14fMQq23I35GIZ4QHwusaMypyTCpYObxcUaFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLk19MpKVm42X1uFZ+1Mu3+XBRdKSoCwcApyHTOOKyXedEaW27
	NXSWNpjlTjJZPayf5M8bA6nWysNF7qk0AN+kgW8E5kk6MBi2TGLZDhJXD7+NWRh9jQNnQAtS7rK
	S38M06N/jYZarpbe6lg==
X-Received: from ejdbv20.prod.google.com ([2002:a17:907:fd14:b0:c12:6311:cd1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c80e:b0:c1c:25a2:45b with SMTP id a640c23a62f3a-c1f727c57efmr67235066b.63.1785231180314;
 Tue, 28 Jul 2026 02:33:00 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:32:50 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEJ3aGoC/2XM3QqDIBjG8VsZHs+hr1ZrR7uPsQPT1xIqQyM2o
 nufxWAfHT4P/P4ziRgcRnI5zCTg5KLzfRryeCC6UX2N1Jm0CTDIWc5LOgQa1Iit69yIhuYIzKp
 zWZmsIgkNAa17bMHbPe3GxdGH59af+Pq+UyD+UxOnjGpdAthMSqPZtfa+bvGkfUfW1gQfX/B85 yF5wTUUSmZSGNh58eUBdl4knxVWKVFYYyvz45dleQGlnBOFLQEAAA==
X-Change-Id: 20260619-pr-ratelimited-6e20fa89bd5b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3176; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=LlIlzK5NNphROYKWlaVKma55nq6KUqv7UrPj9D9qWrc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqaHdGOb4PTPr0MyKOi9ygTNNHMX8NBt7VPwYZh
 Lg7SVbBS6aJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamh3RgAKCRAEWL7uWMY5
 RnK8EACuKAyBfSL7ibuZF7WHNrAO8i/lJN80NJIm7T5y7pgLGC6wuZO7R5eT882BzdzavRYnwST
 x34GNvazbO5WRoVz8lQz4k66IOqVjfmI64PLURpzHbVJKGGf/ncAMl9a+1ciuY2lVdDhcWKtNUU
 BLzErw4OvO6fc1wCMRGTbEC/EIjVfmTKAjptyjbHED3JviIjM6sTd1NP+tM1GgqpsphVD4uXtkU
 pkEjMp9TaaqEdxgc3Z1yzyR9BUkjdBipJhIY1UosiL7Raj66AeNtHCWrnPBuvy1GjX12u/bMLOu
 VORL2BkW7lIODkqtOTLQWnWxk6VuX9MIm+iuVmxT2yTZA8qoQQs/p/6OLImA6P58rBdLINSv4r8
 z/y/dCDEcCz0u0vGmHRLVWg31qZRnS1KYE6CZQAlZctgdvJF/AjU3m9dZvfpR/ZVFzhDlzPCDbz
 jNFxITzicicp4KMoOnxSUaD8nGaj98RXpUgpnLyFhTS5yaTEixvnfLeAD7ehc/jZYpwxs4U8h92
 1D0NOKkiwy44rnWiLjl9avaC2FnJWfn8Mhjz7l6mx8PvGz/b/x4bWQ+J8PqecJxjNa/mGbnxusM
 1XWX9nL0GSz+/JwgjtDXbO3h4ZDisx+lBKmESJaYczwCrAATk/eShLx3a5dpkOjzbijsbfWKJsU gLhgxsbez1sG8Eg==
X-Mailer: b4 0.14.3
Message-ID: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
Subject: [PATCH v4 0/5] Rate limited printing for Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="utf-8"

To avoid DoS on the kernel log, the Rust Binder driver is being switched
to rate limited printing. But before we can do that, we must first
implement rate limited printing for Rust. Thus, do that.

However, it turns out that before we can implement rate limited
printing, we must first implement the ability declare a raw_spinlock_t
in a global variable. Thus, do that too.

Based on top of char-misc-next plus this patch:
https://lore.kernel.org/all/20260728061236.198267-1-aliceryhl@google.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Rebase series.
- Mark Ratelimit::new_static() with #[inline]
- Link to v3: https://lore.kernel.org/r/20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com

Changes in v3:
- Rebase on char-misc-testing.
- Add rust/kernel/sync/lockdep.rs to MAINTAINERS file.
- Link to v2: https://lore.kernel.org/r/20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com

Changes in v2:
- Rebase on top of binder_debug! patch series.
  - As a consequence, the logic for printing the size of transaction
    failures is changed to print the size of each piece of the
    transaction, rather than the total buffer size.
- Add doc aliases for raw_spin_lock_unlocked.
- Make raw_spin_lock_unlocked and raw_lockdep_map private.
- Add Ratelimit::new_static.
- Add some missing links to docs.
- Link to v1: https://lore.kernel.org/r/20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com

---
Alice Ryhl (5):
      rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
      rust: sync: add const constructor for raw_spinlock_t
      rust: add pr_*_ratelimit! macros for printing
      rust_binder: consolidate transaction failure prints
      rust_binder: use pr_*_ratelimited! for printing

 MAINTAINERS                           |   1 +
 drivers/android/binder/allocation.rs  |   4 +-
 drivers/android/binder/context.rs     |   6 +-
 drivers/android/binder/debug.rs       |   4 +-
 drivers/android/binder/error.rs       |   4 -
 drivers/android/binder/freeze.rs      |   2 +-
 drivers/android/binder/node.rs        |   4 +-
 drivers/android/binder/page_range.rs  |  12 +-
 drivers/android/binder/process.rs     |  22 ++--
 drivers/android/binder/thread.rs      | 119 +++++++++----------
 drivers/android/binder/transaction.rs |  24 +---
 include/linux/spinlock_types_raw.h    |   4 +
 rust/bindings/lib.rs                  |  24 ++++
 rust/helpers/helpers.c                |   1 +
 rust/helpers/ratelimit.c              |  14 +++
 rust/kernel/error.rs                  |   2 +-
 rust/kernel/lib.rs                    |   1 +
 rust/kernel/prelude.rs                |   8 ++
 rust/kernel/ratelimit.rs              | 216 ++++++++++++++++++++++++++++++++++
 rust/kernel/sync.rs                   | 135 +--------------------
 rust/kernel/sync/lock/spinlock.rs     |  30 +++++
 rust/kernel/sync/lockdep.rs           | 161 +++++++++++++++++++++++++
 22 files changed, 553 insertions(+), 245 deletions(-)
---
base-commit: c6ad4d0943523437ae5b42dc24865fc2643d1260
change-id: 20260619-pr-ratelimited-6e20fa89bd5b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

