Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC32D0292
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229093; cv=none; b=PMjDIhJ1zaVj5DRkXZU+xezqoucQYjNfjfCdc/e49vesWk7YktuUznb5ovfX3R0+jgQwiGIVfH4EzrZ+0bWySk386LQrFJl8hraUQ8MlPLELFj6iFX/lLpiPZEHbL2eJmXMjx6U3JtiMoBnZbneEXCDyLEio6NpqOJHjrUT8j4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229093; c=relaxed/simple;
	bh=42042r6Jz/YO0Ng+l9bYnZTbNqC1XjZ20MO6Bf27v3o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ixNH9r85k3WQA4xbz1m3biXKN2lXkq1GJPa9Oh457Kyw3AwkqbRLV9CpWP5D3GkNiswDV1qmK2z7RqzuPPFgccJCypzsoc/9tjNlDsIXQqpPuDN4U3yhYcFdKWs4TA1BZWrJppujhUw1WEizZAJwKZxGJtyCZYK6716O2cLM7JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fk/Polfd; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fk/Polfd"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-462c4593a33so12813f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 08:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782229090; x=1782833890; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=giFVZOQ1qMnLjcC3DVqCTpLRDnLFDQakmvu8AOakLGw=;
        b=Fk/PolfdUyAcr/1rT4tXBUYuMDC++j9rvm1o+ids7RAuRFkTdt/H4pYfEkm8biStu0
         YsMWn7uXmLWBf9pP4+NaPBNpkSjFhQTUcBNbYBe37OOQgbdn57txgUyDIn6F18AG1uHK
         JVULYihH+vEHRUr/c+0AXssVNdQY2N1YDCn0c5CQrbPf7DVx/xjayBUvJdz3IwZmJM+I
         B07caY6+JZVfjXkBwOF0n8B+v119fCbB6gp0HSNu3fNooNuyanRyi5ioX8uICtQVNO+6
         yBfZkMA34V6RiMgufamotdeKZa3qqv3/hpG7aLA6zIN4afl/GCzCIlShKwF87SrELKiM
         opGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229090; x=1782833890;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giFVZOQ1qMnLjcC3DVqCTpLRDnLFDQakmvu8AOakLGw=;
        b=WTcffa1gFKADWs/l1uZ3g+IvVJNG+fsvYCrm7TLYzbhpZUrnxIb9W3lhn/vhpxc2xk
         ZTPiMd6B1QgQl5ugRchQgIk6EvHoHWBAY4OowBcr9U7GlHmac7vaA5MFM9Zco83JQNbl
         oKX8IuPZz//sQ2HAHUBWrL7tTnAbkr/u9IqM987mm0DtrESGe4I2eUN0Cxa4kVtxfv2t
         ag2xGE1i5GVEfAhYvDOz0JRU95LkLmL7NRASUjzggJfYHUgSvE68TEFOZ/wevwkWvbgV
         W82VJcg2yAfs6s18TcMHnA0HC2OBh54Q+ENsvF4i2OKc7xM7lRJnBKiOH6I0BIDo7haG
         rS1A==
X-Forwarded-Encrypted: i=1; AHgh+RoG6vnuHcB6zS91X4bl0divD6t84pNA5THjiHKEuPL+A3pJ58rFkWsRLzPD9JKa2lUNY/E+nIQruyWRrdyEqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJCPgcHD+eaEi64DjIcvLk6J06MIlY6gFxrH94e9cIu22d19zB
	DpLqDehYVVDAp+tG2JuYkWTirHYsIUpns2zRsLrmpjhtQGPj63KEqhpvXWp3GO1wf+fjqh/MIWO
	gu6vr338ktlvXqsOKzw==
X-Received: from wrup11.prod.google.com ([2002:a5d:638b:0:b0:462:5359:f2e5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:5c7:b0:461:a1c4:9fa9 with SMTP id ffacd0b85a97d-46ad5df367dmr5619137f8f.0.1782229089886;
 Tue, 23 Jun 2026 08:38:09 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:38:03 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFuoOmoC/x3MQQqAIBBA0avIrBNMSLKrRAvLsQbKYpQIwrsnL
 d/i/xcSMmGCQbzAeFOiM1a0jYBlc3FFSb4atNJGmdbKiyW7jDsdlNFLg1oF19vZdzPU6GIM9Pz DcSrlA/SuxjFgAAAA
X-Change-Id: 20260619-pr-ratelimited-6e20fa89bd5b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=42042r6Jz/YO0Ng+l9bYnZTbNqC1XjZ20MO6Bf27v3o=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqOqhgqY/57bLAVHfMEoI9M/h6Y5+8wvAzKdTBU
 QfM/E+rIBKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCajqoYAAKCRAEWL7uWMY5
 RsYrD/0ddOLzWyrWjsTskd1LDDup8VbsQ2Xm4NyHfraoTCR0akzFukgB0q6pMexhB9oGMWNvhr7
 woWb4tJf7RWBddhh8Nx0H/bOuF92rJhPbfXbyoh2D5yIfH8dnRrgfkILfVpFdJW4oPPWcKlspcI
 6JZRFYbcf2woWiU0VakUS/7ZJW82K+u003Hn/9J5cf08mOAOkRiVMX70MVIjd9ktQmaOuwQ2sGZ
 DXSLuTDtqByZUbPwarXr2vkb/m8IqwY0HOF0FM//CDGw7BJhN0A1wSX36OBpveBkI+k5Cjq3Jfd
 gGRQ4qjrTsxge7e2NasOeepFK4naQXift2UAKLScSVJ+waS7DvJ0VPggjprk23kZqKcWl0DCpM0
 xXStI3Y4j+eP9unV3u2ho7CDt+88ued1C3mrjiyquzWljI6mT3J8AzCGdqt8R6fe6FOgEuP8CNv
 cP1LZ3OIXhgw8aH7b3/KCWFPIvv9Ixts4yeNb4sgR3H5IwvBtL8qPypVntXetcu3FxW6CIKTjUS
 aR81nkrXbrkhYtCtjPp/gRqyO0SkBktlUPukt5bj1t4p/gu12T4ZhpY9fKwLni/HeNUcp12OHQm
 cCEvgphVdUE35EdsNZVF3cfu1TQNyFkyiIQgg7nRylBhgjP694DHTss6hhhcd/rvgAItiIzLsRg bn/wWGLlIRnax0Q==
X-Mailer: b4 0.14.3
Message-ID: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
Subject: [PATCH 0/5] Rate limited printing for Rust
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
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To avoid DoS on the kernel log, the Rust Binder driver is being switched
to rate limited printing. But before we can do that, we must first
implement rate limited printing for Rust. Thus, do that.

However, it turns out that before we can implement rate limited
printing, we must first implement the ability declare a raw_spinlock_t
in a global variable. Thus, do that too.

The core Rust part of the series applies on top of 7.1-rc6, but the
Binder patches require some other Binder changes. I'll be resending a
more useful and easier to apply series after the merge window.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (5):
      rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
      rust: sync: add const constructor for raw_spinlock_t
      rust: add pr_*_ratelimit! macros for printing
      rust_binder: consolidate transaction failure prints
      rust_binder: use pr_*_ratelimited! for printing

 drivers/android/binder/allocation.rs  |   4 +-
 drivers/android/binder/context.rs     |   6 +-
 drivers/android/binder/error.rs       |   4 -
 drivers/android/binder/freeze.rs      |  22 ++--
 drivers/android/binder/node.rs        |   8 +-
 drivers/android/binder/page_range.rs  |  12 +-
 drivers/android/binder/process.rs     |  36 +++---
 drivers/android/binder/thread.rs      | 133 ++++++++++++----------
 drivers/android/binder/transaction.rs |  25 +----
 include/linux/spinlock_types_raw.h    |   4 +
 rust/bindings/lib.rs                  |  24 ++++
 rust/helpers/helpers.c                |   1 +
 rust/helpers/ratelimit.c              |  14 +++
 rust/kernel/error.rs                  |   2 +-
 rust/kernel/lib.rs                    |   1 +
 rust/kernel/prelude.rs                |   8 ++
 rust/kernel/ratelimit.rs              | 202 ++++++++++++++++++++++++++++++++++
 rust/kernel/sync.rs                   | 135 +----------------------
 rust/kernel/sync/lock/spinlock.rs     |  29 +++++
 rust/kernel/sync/lockdep.rs           | 161 +++++++++++++++++++++++++++
 20 files changed, 574 insertions(+), 257 deletions(-)
---
base-commit: 242689558c681ab2df283c54ed7b9dee8db0904d
change-id: 20260619-pr-ratelimited-6e20fa89bd5b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

