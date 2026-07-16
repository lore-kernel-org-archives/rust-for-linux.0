Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A1941F34D
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205288; cv=none; b=oFktV9ovJKvnH8vvT6y7OtbSLbNoAT8jBHsVrzYpdtCYdXyrRoRPaL4OekhH/bw4jCQniJnZbOZWpcy8gNt5ifnsi3izTWIE6Bu9eF3pFAwr6mZd+y7p0+0AfddXE+BWYNlaYjrHCDl71RMFKCum/ffZjvfnWrMOB7+BcLGkehI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205288; c=relaxed/simple;
	bh=ZUMiw/yFN+fwc4Jfh0gdpXccsapneUJPfSXFFCVs87A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HoTKuLXcDKkczIWzlSfF3M1Aup4nGaS6tDdeRbDMnTuzBfwOjkVuJJ2ve9oAqlt9yK0B5/SeNOr+JA1xAr7SoHq3WMW4ntmTrC5QnGaO9bcRj5r7NOy3tSVLBPYVn9ra4MHQD9I4+dAWRImNkPeWF0hEBiB53Uwaed4UuSWFt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I57GqgSj; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I57GqgSj"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-475de65009dso2598472f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784205284; x=1784810084; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoWTjEI0MuIHoZJtI/e8KZaw3hmpEIi12sTrNgIyKBA=;
        b=I57GqgSjtbnygQAOmReRjDANvkbM6DJrj3724khIJglhNlFvH+qyTCNLH2jWvYS2fZ
         jGjW+ZZt0XfkDoUnShAroZAzdEIs3RB/6FikUa/syjyadFvZkfowldngg726XZkW28oN
         KvdZPIzkXiQNP0P2sNAyCtW9jv408bYHSdShdRrSIsjuaHfmRqzmDX6R7vRMGOza6QVU
         Hd2OyyxoNv110kS2aKe+xd1eTONr5pvUd2glNmu2Vu085izgnEFaJztMLSb8tmAWWLy7
         n1sO7AnZr1HV8s9RLIb/QXzNZsoi0i9Lq5efJzaUMHnccAYv+lrs2CEtKKflucMMQKpl
         ls4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205284; x=1784810084;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoWTjEI0MuIHoZJtI/e8KZaw3hmpEIi12sTrNgIyKBA=;
        b=JenNXyO1CxLhuYihkXf5WHER5SnDT/7nkGUc9YjltrxKBOIwPGXLoip2jnBOtUVRur
         n+w9+1EBcQc2DAKMOwzbRKq7wwHATyZTqoZPjy0wW1wdUNgGrjW7UnTXAULsuXsevTAg
         ZR7wrkjy98AcEcmxVG+mxeHhKklvqZ5go9eMpQBcP+ifaiJlWfT4ky3Kk/UrBSsVYZKQ
         2u2J1AJ3qZrxWyNCsVi0SF0RqYOnymaQG1GaTsF1r6VytdmZC3FJwvmbSA7gYRwhfcv3
         zb/7o1kIidNUsd+tg/YnF2QqiyYy294Wb3wul8lXViEuiJVaRP5im+k+ImRy8EqpA8cI
         ng2A==
X-Forwarded-Encrypted: i=1; AHgh+Rr/CNexKli0CkbNbCsnTs3AlaHJlXAzIwG10jO7Xz+y15vkW7/0Cd4XfvRwFkJjOT+3GJ6TDXZZrRBlrYMucQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd98xdWZWDzYmeIbBXVrA0zdIoSjTuFCLRUr/K5eRx2VnTkGEY
	nx2N2aDDHfpxxD0KiRoleIrxANWj2adgc3G5fdB8ukOp4TrSCMC3ztD1po66Pd9+kJSSNzW05RR
	auao1yLot9sMCP7BzsQ==
X-Received: from wron8.prod.google.com ([2002:adf:f088:0:b0:46e:c29:9e57])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:59c9:0:b0:460:6a13:9131 with SMTP id ffacd0b85a97d-47f2dce92bamr26917041f8f.19.1784205283651;
 Thu, 16 Jul 2026 05:34:43 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:34:24 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANHPWGoC/13MQQqDMBCF4avIrJuSTFWarrxHcaHJJA6okUSkR
 bx7U+mqy//B+3ZIFJkSPIodIm2cOMw58FKAGbrZk2CbG1BiLWulxRJF7FYaeeKVrKgJpevuurd
 VD/m0RHL8OsFnm3vgtIb4Pv1Nfdcfhbd/alNCCmM0oqvK0hrZ+BD8SFcTJmiP4/gAdK5zx60AA AA=
X-Change-Id: 20260619-pr-ratelimited-6e20fa89bd5b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2838; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ZUMiw/yFN+fwc4Jfh0gdpXccsapneUJPfSXFFCVs87A=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqWM/drPWGJs7wa71osrO/7xcpHwP+PgdUR/bcG
 UZgNMm1+ryJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaljP3QAKCRAEWL7uWMY5
 Rim+D/48xPZbMUZKkLx6l6wn8iWQJzDgBLWG5nzZdrslFrgkanGZXA00UBpQ4yGviHcs5KqOMjt
 f0RJcSGxaZ6MQdX9El5+FU4zY5zQC9eXj8Dv2ARSpbrYkEPEiW+4DSvqPoa9fKQt1ieb5DxxYRW
 vf+XJXoXSuhxE36zsZNm44uu2Jr1hiOZFMUTm/bvvcWMK7FdnuclxO5iPvif/j9Djdm2VRoWBmN
 GfvXUGpW1O3dclM1XLBecyfcQ2DslS7Wt8y9HHq0iQBlAC08nSHFiFX2VWHK2NbUnBGP2InpPhJ
 VCIdZvHBZ0IQ1osYSFdsfOL55vpJb6yVWpvWtaU2xQiFkPvHHbNuCfrW4mwZ6wJM1Y7cDO6H1EL
 gEshJiUZpMejCgefWKe2zxhG1xmrgonYsM9cWsFG6l6ILEcGQfyl5sa/47IMtnRjhnq8FpIH2NC
 9q18eXIRp/Jwouwfh4uPRB/mwtpb4yJU3ZT9S7p4AmHR5NeckjvjIxi0OTlf9GgRVWM3XCwCDkC
 jX2KggTutqKx9l2oyz4IvYmedRQApsgK1bNE4AoWDDtNlLXag6JWjG5lVgiR8Uyq4AuJ8XN6XiM
 dyHWVDYXUNrgjRVUTVLc3dtpvXxrkJGvLC0Gp4QTAbjKuxCoje7XPRFgoA43fDl3KKZP9VowPGW xPx2Lo0ze4jcDbA==
X-Mailer: b4 0.14.3
Message-ID: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
Subject: [PATCH v2 0/5] Rate limited printing for Rust
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

Based on top of:
https://lore.kernel.org/rust-for-linux/20260716-rust_binder_debug_mask-v4-0-3d7436c2d2f2@google.com/
https://lore.kernel.org/rust-for-linux/20260707-binder-netlink-v7-0-42b40e4b1ac8@google.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
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
 21 files changed, 543 insertions(+), 237 deletions(-)
---
base-commit: 542dc312f569ba52c71eb744db176ee44546f893
change-id: 20260619-pr-ratelimited-6e20fa89bd5b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

