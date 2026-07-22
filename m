Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81010481FC8
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715144; cv=none; b=AeXVhB1iVyntHaoqL7rWttcEXsooIUL44LP/v0/mhlnvbYeXuv+P7NbI3/sMUjPejIcv10hQq7ztL5/s1aiSrXmKDDucCYbYltMo0EsTWJealZ8eJf3bCQiIZ57wy/z6PDhivHaHeztkvTsJbWo/R4HOWuxGrNqqZEFclt2TDHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715144; c=relaxed/simple;
	bh=d9fNlnI/XuGj5CvhW4AhgCBBPUeapCVoabxapDL1isc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KVYMjs/ShIKdAeR4pjyjejBW0BBqXuPBvZpS2RhgrUWVAhLoWk6Y+JwVzGnUc/MiGxNKVQhfpOINZm9HK3gkiK3wfI4pR7Y7vqfYyeBbke3C8UtDhGtqU2CXY4uT6uzU4fefzGP9Fb+3JGnHHzoEUKF7hSg6LhYcQ5VNH1DtdZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YhT00/r9; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YhT00/r9"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4955e865174so21256345e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784715139; x=1785319939; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wwehrSux52AcQuBFCAkCg0qXJfyPFqe58UjKR7Whus=;
        b=YhT00/r9M+285j6yi70GUwMay0LgXZAlmL9iVCE3L84YL2p3YPPeaeBX/ii/nLX1Ka
         CCaE8W5b/7asFbe4wzFRWUWkVUYWF3kV5L4L0eB1cV2GnO5B1cr8f1DZoCXRReUd/8ou
         b4gE8A7M0Jv2S5nXZq0HSDtxqBi7cRxWckZH4mVilVrXv+HYcswvQiNZ8pFxvwdFF1fT
         hhGyVlg+08QMFqC5bV+SkWeDUj57swyS+rusbHE/L2CnZDTfw56+VACynbMTE++uIEFJ
         Oet4xvBQWru2dws8YQamheeenysDzBh9L5LyPU2wCOvk/9z8x7EwkLony7YeQfQ58Mk5
         mTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715139; x=1785319939;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wwehrSux52AcQuBFCAkCg0qXJfyPFqe58UjKR7Whus=;
        b=Trg/W7cnk1adLIukl6BBpksYnPQ+6DBx1VkiPCAYGxk8Q0shqNs9EgBzBX6HgSoX8E
         D6qhg93xVVLKHjG0j9lm1WncNku+HDnWvbi4/GCwOTIeZYUXL/CZDG6bcpd/9YEuxiEp
         xvcJsJ9dtPioG7KF7GNSVb/nFUiySggcnMG6UZufXzdBijYv0XDKizHHwuLNIgGYJeJd
         GedSKdr5OZBJuZgL1c0TNRZGBiRzgPMvEdoFZ8ozEnLEsK8aWD5zr6TqywONmIlGYRX/
         0r/Qrys+TEWiYWOKmnRBPIg7tImFv1pYTi93yVa2mBmu8c5veDOrTwT13/UCDRGAMt+M
         sWsg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7hggf9x0ua0ObQP3Lrdzex9ImXDLaqgz974odS+tDhBB62OS941tuAJfOh4a0o9xsFAn7rs9NzVBnh+UqlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywCLg7hHY5orVqQd2POLI+FWa/Du9zwKrGpg4C6TG0bnbZfIiQ
	edE/qVVFZYca+VGIxY7/ulYcD03KNQnw/wTh9MlnRIk1paXwe7oqvund0EnZC0BJ15PWiZBbY+X
	u8O60PMDB1FbMFTNfxA==
X-Received: from wmba22.prod.google.com ([2002:a05:600c:6dd6:b0:492:4e77:8950])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1509:b0:494:6baa:ccef with SMTP id 5b1f17b1804b1-4954a3dcaa5mr161964845e9.11.1784715138429;
 Wed, 22 Jul 2026 03:12:18 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:12:08 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHiXYGoC/2XM0QrCIBiG4VsJjzP017nWUfcRHTj9twnbHDqkG
 Lv33AiiOvw+eJ+FRAwOI7kcFhIwuej8mIc4Hojp9NgidTZvAgwUU7yiU6BBz9i7wc1oqUJgjT5
 XtS1qkqMpYOMeO3i75925OPvw3P3Et/dNgfilEqeMGlMBNIWU1rBr633b48n4gWxWgk9fcvXXQ +4FN1BqWUhh4atf1/UFvk6Mae0AAAA=
X-Change-Id: 20260619-pr-ratelimited-6e20fa89bd5b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=d9fNlnI/XuGj5CvhW4AhgCBBPUeapCVoabxapDL1isc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqYJd80ZwVmYPuHVfo20kczkk4vs8S0T59xHAOL
 a5Iq/VKwp2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamCXfAAKCRAEWL7uWMY5
 Rt+MEACxqyAKj9qEAOLUoocuxmBPYDgRpFnJifm0jOyskrFXYCtPuTRYTP8NzTCCr/7kvCLjFjW
 Qcf2uocpkm9dhLK0Nk2CQmLuoM6JcAchntnXGTAo7zTZqDD6jsDENmpIR9x0NSyf6sOsagCqh/K
 GlYrxRiW4v/Y4Fj2Q3cXmavu+wGCacFjKH0THWbOhSY75le9dL4cRQncGBiGITW6q5xLcevEQ66
 Bs+gNGmy1gSWWJ8d5G3QiK9vEIzcwKF0jBG/8h4zmj2WLev7pSIGRFIeXMWg/hBlOwr/ncEQSjh
 vZ2UcpG8VwFVIMBpeHiwE+8PIe2AV3Gkxcxke9jOVC1pOks1YNoGwMWcUZN0fyi02vFplOKurzw
 R4lYohO+a2KSWWQx+LNe2tpxmHIt8QMaESweWynX4tGYFMJJKx/elEUnoOs8nNq5CLJuuD4EIWL
 UAfz4/VotpF9sUOzGHelFxI9QOfLyVtlSSaAm9F29DCCxpVZl1V+JvcDv5H5mhwjYNycAMl4rZU
 5qGTaV6VI7tGIGz2JYebXEgAlH7Af8kKYzAQ4rYKtlYSzL6yL9EfnHsw26lNcO+aT3c13Va+1Yd
 xdmV9utevn4J9JYDwUxPFTtADH9xVIkIJdCyX98wTMxWKC9TxCSxcaB/uuNKStjrH4zC58B1FE9 DYEvG7ZC7LwUE5w==
X-Mailer: b4 0.14.3
Message-ID: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
Subject: [PATCH v3 0/5] Rate limited printing for Rust
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

Based on top of char-misc-testing.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
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
 drivers/android/binder/thread.rs      | 103 ++++++++--------
 drivers/android/binder/transaction.rs |  24 +---
 include/linux/spinlock_types_raw.h    |   4 +
 rust/bindings/lib.rs                  |  24 ++++
 rust/helpers/helpers.c                |   1 +
 rust/helpers/ratelimit.c              |  14 +++
 rust/kernel/error.rs                  |   2 +-
 rust/kernel/lib.rs                    |   1 +
 rust/kernel/prelude.rs                |   8 ++
 rust/kernel/ratelimit.rs              | 215 ++++++++++++++++++++++++++++++++++
 rust/kernel/sync.rs                   | 135 +--------------------
 rust/kernel/sync/lock/spinlock.rs     |  30 +++++
 rust/kernel/sync/lockdep.rs           | 161 +++++++++++++++++++++++++
 22 files changed, 544 insertions(+), 237 deletions(-)
---
base-commit: 2cedf2272f1bb42471e646868ac572cc5752bd91
change-id: 20260619-pr-ratelimited-6e20fa89bd5b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

