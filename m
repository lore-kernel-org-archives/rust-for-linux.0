Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C817A4B0483
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 14:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383424; cv=none; b=Sh/lUYCaDmvzlfucBNrfOo+e++XbWsXr5DmuuuiYjJudT24YHOQfTR8BPCrZQvOvfbzRNZsFsixzxc354pXvkbmhorhvIHismE+QbcWriS/cqwQUE9gInE1u4pEbExeVIvZ2DMK7kCYZzILTEdKmrTe8A+/kIOR+hGvmtfpUTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383424; c=relaxed/simple;
	bh=2GW7lldWhu0o0he7s3vz5wywYZFDldTwRn9kTeL150Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PwADi4oPFFd9nzsZhVS56wMUOdYk1V9SedwDhIu5Xwujx0J0B/BZmhO5TVZx4rHatsNJ5hJNK8TsFYzqxKxywXJYBK4BJpovSLXyWp4qlOrGtwy5GgbMAUyMQnkJQPnT7nbEqWgNdVXJhIjErVECi4ibWH3pHmXeNUP5+0H4C0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mkvZBwVK; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mkvZBwVK"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6afbe6b47b7so4021511a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383418; x=1791988218; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSxecA0ht/tEHJ7gQkTSCf+pFCWZp2M8J0BYQ3TGUi0=;
        b=mkvZBwVKspVf21RVePcAbAtUXuAEPv7jF2iRs9zzt+c4fuLJkVRlT5bwwJAcmDkQeb
         DKm+MnOmRsB2bTIXCgto2AakArlVsKN28ay3oCaaOUsX0dsWXlSXlGvBNkmZz7XMxAvV
         DTH1h17o6B/vgUza7N1A/B+XEKWI/eX9M/QXfw8xewVV7TBYuas3/JOG+EGfHDWf0jBm
         li3ays7RPP+9Ezr99gUYLEf81SjMWuxGLxHk/LXXzRUPBl5Qr5a5bLgPEkmbhzoDhh87
         n6bReAORbW2+okkFiM94EaMWqvZPwH15g/RsYTHBABS84ySmxj0qkMwwCIXo8XRqD2q7
         DqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383418; x=1791988218;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSxecA0ht/tEHJ7gQkTSCf+pFCWZp2M8J0BYQ3TGUi0=;
        b=BurZ+8do+snMfjaEYVWbjvPB08SZI7osj5PVANqU/TYVproNhzBHTuQY8ZcJ/0jB14
         IkUJWxkhIKCpH9Zq0/EDvPYn7IXmaIwC2PNSZuBo6CoC8NDCi71e0TLQIHdbJKpIxN0E
         DnG7a1yowrorrz5f+VndPp1UXj/BuPpCwCDbrz/HqZ1x/7C8oZwWwSlfiFT56dp+zlVd
         G7hxqfXj+nnTZSvAZl1qRO4snff5SJL8+8BXdbpm8NT2KmDgTGrNmNyVl6PJ0Dl7I9aO
         YqkWgIaYuU8LVjCwkefjCrAkq+Paz+1JK32s94RyF1qkOdL0Mmibm8XNs/qS857S/a7a
         VmgA==
X-Forwarded-Encrypted: i=1; AKwUvByfSgkuRMBwRQQ6VxdCTWUDPIBAWkGIGRfoB2jrXPymVAbB1rUcm2dnUzJYZvCQrRTs7KUJ76yNZsrEGeB1Og==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwtLpXmTLK5OSMLJDh8j7DRyqBQemaB2z8s2PSiN6tNRlxH9+Q
	nQcYYgAqBoRwi4cFY8ZXKDCTbcP6sKEjB7HoRhudnp2QpOnJgG6NTgTl1eivOd2j52+BW03eBeG
	Di2zTdqKjrA2HQZwLhg==
X-Received: from ede22-n1.prod.google.com ([2002:a05:6402:20d6:10b0:6ac:c269:1a32])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a2d3:10b0:6ac:8ef4:177d with SMTP id 4fb4d7f45d1cf-6aff3951d9dmr1762527a12.20.1791383417389;
 Wed, 07 Oct 2026 07:30:17 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:30:00 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGhXxmoC/2XPTWrDMBCG4asErasijf6srnqPkoWsGTmCJAqyM
 Q3Bd68SCkmr5TfwvDA3NlPNNLOP3Y1VWvOcy7kN+7Zj8RDOE/GMbTMQYIWVnl8qr2GhYz7lhZB
 bApHC4Ec0I2voUinl70fwa9/2Ic9LqddHf5X3628K1P/UKrngMXqAZLTGKD6nUqYjvcdyYvfWC
 k/vpO08NK9kBBe00Qqh8+rFA3ReNW9cCkG5hGnEzutXP3ReN6+VSQNa8laYzpunH0T/v2k+OIf aWCTv9B+/bdsPFfIEya0BAAA=
X-Change-Id: 20260619-pr-ratelimited-6e20fa89bd5b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3684; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=2GW7lldWhu0o0he7s3vz5wywYZFDldTwRn9kTeL150Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxldxCJX57gJ/JDODOBAhU2rqiIcFjXhYOWxLs
 XHclZ3+uPmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZXcQAKCRAEWL7uWMY5
 RuzeD/4ne8s5Wxw/idAJ5vbeI8rwJnISntVJc5a61A1MJ7mEKvkMbPWt3L7EWR6ww4sENaZbq0S
 sNoFePAbSGkfm4n+V/Duj2bPAyXg7nZXIhim3GGpuw6IgGZvwjk7cl6sFz99i+25DD88ZaULYWS
 UOS0/411eDrSmJ6TxI5A5/qIspHRsHLTmWv60nQCrDaImjiiHWYXrklK//h/UwohdPmt/NwRyOJ
 Iqz5N8/Hk0lO1iHVwjvgWgoFwQAqr4KndcwwxNY8EO3UdDpbS9tB4HZvt+gjacVE14+uQr7IfAd
 IF1hm/sEM1z8BOuwHNk9K0qdOErQHHCW9ifxTQxcYYIoGvovTTzrDt7kdPCwHaBCV9rRu0djSHn
 PKPAdVztnfgOygaedEm3rBmPPs6+QInLQzDofbTN7YK/MAt4iSll3n7TPKxvYzT6weJltRmVaYx
 T0fkHWPr8ohH20Aiwca2EU2e9/n7IsFOCt2+bq/APSEGIo1BMXt/1P7M8Svbu7KRGZKIgbbThbo
 Cz4SR5+OO0l4NHC5cE4NXjItvd2SCr86ub9bO5upbnBSkqTcwT3BYmyFmv8B/3ljS7u1a6QhIsA
 iNQ0q1l3UtRASlzzpC9nHJefaGnXl9iCubGIAbjMQ3Hj886hjZiDj6BKQQL5zgXOeUOxnz55LDO vjbIjJ7ksuouJPA==
X-Mailer: b4 0.14.3
Message-ID: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
Subject: [PATCH v6 0/4] Rate limited printing for Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v6:
- Rebase on rust-next.
- Split out "rust_binder: consolidate transaction failure prints" to a
  separate patch series.
- Add CONFIG_UML_X86 to __ARCH_SPIN_LOCK_UNLOCKED cfg list.
- Add missing // INVARIANT: comment in Ratelimit::new_static().
- Pass caller location to Ratelimit::ratelimit().
- Also update report_netlink() and range_alloc/tree.rs to use pr_warn_ratelimited!.
- Link to v5: https://lore.kernel.org/r/20260803-pr-ratelimited-v5-0-a77d456de974@google.com

Changes in v5:
- Rebase on char-misc-next.
- Pick up Acked-by tags.
- Link to v4: https://lore.kernel.org/r/20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com

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
Alice Ryhl (4):
      rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
      rust: sync: add const constructor for raw_spinlock_t
      rust: add pr_*_ratelimit! macros for printing
      rust_binder: use pr_*_ratelimited! for printing

 MAINTAINERS                                |   1 +
 drivers/android/binder/allocation.rs       |   4 +-
 drivers/android/binder/context.rs          |   6 +-
 drivers/android/binder/debug.rs            |   4 +-
 drivers/android/binder/freeze.rs           |   2 +-
 drivers/android/binder/node.rs             |   4 +-
 drivers/android/binder/page_range.rs       |  12 +-
 drivers/android/binder/process.rs          |  22 +--
 drivers/android/binder/range_alloc/tree.rs |  26 ++--
 drivers/android/binder/thread.rs           |  48 ++++---
 drivers/android/binder/transaction.rs      |   6 +-
 include/linux/spinlock_types_raw.h         |   4 +
 rust/bindings/lib.rs                       |  25 ++++
 rust/helpers/helpers.c                     |   1 +
 rust/helpers/ratelimit.c                   |  14 ++
 rust/kernel/lib.rs                         |   1 +
 rust/kernel/prelude.rs                     |   8 ++
 rust/kernel/ratelimit.rs                   | 216 +++++++++++++++++++++++++++++
 rust/kernel/sync.rs                        | 135 +-----------------
 rust/kernel/sync/lock/spinlock.rs          |  28 ++++
 rust/kernel/sync/lockdep.rs                | 161 +++++++++++++++++++++
 21 files changed, 532 insertions(+), 196 deletions(-)
---
base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
change-id: 20260619-pr-ratelimited-6e20fa89bd5b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

