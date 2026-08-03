Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FD3A961E
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742205; cv=none; b=CjyRRNUMZotJC+ZYtgOEj2hD+Q1xuAcz6KDVmkNc5aW3W5d3SlesLbj2CSGgbA712yyeFzTiKxjSr2WMWVgYT73wszHI0kP3QyRxMY3veDhLbh4nE/F/QkH1elqomuELEOxfjpjyrsExPBNe74KUSJnMoN1X/gJr9vkOnNtnxlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742205; c=relaxed/simple;
	bh=NsJRCOJfVEpP2Fgxr1Xovcz5Vk0PYMwsAj/7DCzY+Vw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BBIwT2AOdBo89JJGKJy+krqIyaTr3Y34q0MGYybNnUf5VoPQ87gfxK9Qz6+wA+w/gXznQFJpCnlnqQ+uw1ZEPEkzXX5XTDoEb9Pfbk+KQuBgCoxwSEEYulCZHZPS7E/rI8y0vXGJLc051lRZcPKUhHIZ8HyufgxTzhys1pxhNA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ukigluxX; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ukigluxX"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4954b1c6310so16944315e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785742202; x=1786347002; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaacTyZNDQgpGbyqFdsHxs6SelvsgTUdUGBG0mbVQWg=;
        b=ukigluxXSCme/DqrUw/rSpmlHztjQc/PmEBC5QfI4YqdEoVKFquByouY/T5b45GbWR
         Iwvtd36f12BwVVfoJ/UZHTZ9x6kgMvMAuVyBJuP5jpk306vvRMBdJqwRTlX00P1pPDNL
         z2BA4Gx6lr0iJrpeWQg/1liX3FlstGjrAp/gBL3EQfKp4DdMOTwgeb/8VlXmYj5X06sf
         hTg3im6W8yZK7XpWT4UoGuHXzh61AqhqSi+6+W1pp9w83oyM77gI+4hOxcUJHLQELZyA
         TTURMfR1sLJbTswJtAL9Bep0uzTE30yDbrZvf8vJ4aiprKGzwG6uRxi3ESZNPD5oJbIV
         rCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742202; x=1786347002;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaacTyZNDQgpGbyqFdsHxs6SelvsgTUdUGBG0mbVQWg=;
        b=s8Z6QI9KjVqVu597ohNXoGq4AvEzz8pelrxBE8LoLs+Dv3YW8IiUHfkLixBsGaYGV9
         63LakB8OBlnDbaYH8oOyyV+MHoN6t2puZ0Me/PXTQARQfwjC9j8yRXEJFq1Ag0GYEP01
         pVfgaEaAWySHP0/YRvg6dTT+YqsprISoDW8Ss8rBeuIwKi/qsTZgoYKZeisVEx6lklj6
         J6X38MGMPYrjHgxu+YTkcgCUaAjEm/oe80+Oi+f7Br1R5XRjAJ+RC2qrjTxWTLVOHA0y
         DOlGdXRCH/yCDIQ3WUvZW/u4+lHp/UDE0vHnlNL8g3HvjqRg86HKQcaK/oIY8+rvdMc9
         tebg==
X-Forwarded-Encrypted: i=1; AHgh+RrgUA/yGpW3SBW7In9gd+CAqwbiw7qSD14iGOu0mBXiHln99WlArwLE3v+Js79tOqzkFEWGAYqNiwoRsNrVUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuVp8uW+BF8C5sX7YM/me1PIcqszykYTKqFf+1FENJAQNuXd/l
	UtFbW055dwPFaAbAic5VdpA2ZTBDLfuVfqy8nKWXf40ANZcoS92JgZjDNiJAoLojkxNcyHfEXGI
	kQLYQduw617K53OS48w==
X-Received: from wmbes8.prod.google.com ([2002:a05:600c:8108:b0:495:56f8:8afd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c113:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4980c674e51mr153490335e9.13.1785742201997;
 Mon, 03 Aug 2026 00:30:01 -0700 (PDT)
Date: Mon, 03 Aug 2026 07:29:51 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHBDcGoC/2XMSwrCMBSF4a1IxkaSm0dbR+5DHKTJTQ2oKWkpS
 uneTUXwkeE58P0zGTAFHMh+M5OEUxhCvOWhthtiz+bWIQ0ubwIMNNO8oX2iyYx4CdcwoqMagXl
 TN61TLcmoT+jD/RU8nvI+h2GM6fHqT3x93ykQ/6mJU0atbQC8ktJZduhi7C64s/FK1tYEH19xX
 XjIXnALlZFKCgeFF18eoPAie1V5Y0TlnW9d4eW3rwsvs5dC+dppbDRTP35ZliePs5CmbQEAAA= =
X-Change-Id: 20260619-pr-ratelimited-6e20fa89bd5b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=NsJRCOJfVEpP2Fgxr1Xovcz5Vk0PYMwsAj/7DCzY+Vw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqcENz+IyDHNF2quf5TP9M4994cebDzRt7warkv
 Um77SEM/dyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCanBDcwAKCRAEWL7uWMY5
 RqtCD/0VPdpJchVID176EHMIu88fztf2LTk+UUPrc/klS98m5AMfulI9cvhAJAbE8aYhXxkS7aq
 WH+6V744yBJv3NQP8kEJAvG8zJphIi3uMB8WEXNi7yO9+sdwwUQro1VVg46zmdWg0pM0gCDSaA+
 FQwtgxym0uyn69m1jvUQxTuk2axTEkoD/zQUSQu3Lgr39gGhDO4ZUt8z0HmhwBUjufYzNAKViBk
 M/3I6WkpcY9jAd+0D+hN9myfUncDepef7H1twwgQYKNb/Vl11WPegM2rypI+MIlZLduHWw4cZuj
 Lfjipq8cmZ6in4qt1DDdCrPzWEPhJpJ0PZZ9ywHKEvOCnFCqogjJ7HDHsG4Mey+/JBvZXwfTAVH
 gsh7df7yGDFucYqwk3by1Chg6WSCszMx+HAVknkBLEIWXs8xWBCC0CFSL6HqRpy5Ctbjow3855d
 oeeQ/P2+RRawc06ac2h7NnvRNuEDW7rSkT1ezi0Hicaj4P0tTyPe9pw4bWZUU/Zt4U0TbdTc7PG
 VO4F/lhJF2ZJbvd18hYgnHxsmdh6Ffg4e2YM8Ryy6OHpnL0rZqN0hWO40t33VTntEBGgZbv2Edx
 CmURo5S4hzr/1tlHU9colXwLxYEG0CZXUOSCdT1s7iSzImzQ1piaqbsGA+3K63S2lRI5FYYowvO 7hRCNj/U2ko2eSg==
X-Mailer: b4 0.14.3
Message-ID: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
Subject: [PATCH v5 0/5] Rate limited printing for Rust
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
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
base-commit: 220190f97da558e67cd01c62f1b84fe77b267a5a
change-id: 20260619-pr-ratelimited-6e20fa89bd5b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

