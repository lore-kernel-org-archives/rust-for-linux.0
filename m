Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BB22C21D9
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245975; cv=none; b=GaMvkslkwnEzZTTEuyUOAQcm2w7bOqKELOcV5avvi12tqdf7XIDznwkBJkKdWgE4p5WYc4JHULcwr69j1ovIVR92mp38E+d4Fx3JNbYkEiKr2IU39+sX5qCu7NawGRcg0MDRNtyj9IY2gKefdnDE6sr/EaGlhgo/J1dEyCor5m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245975; c=relaxed/simple;
	bh=IE/wFKrBh0t+EGfYLJfkCLHJUyNnOYhBFTtA6ZYlxXU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QIUCB6ginAV60hFttJXORA/qoRU2q+/K98R5+IX05+aryR1SayKxd5GTolp/EjeOnRHxR3QhQFIMR7Rg+Pg/8Fiw/RW4uxA/0MgxJPztfYsXRwN+wOrn4SONfDZd6lc3QvI6jbTiUTg8Y07Q1nSEJdR61kSwyyoT3J3cPXEDrIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jE/JCgHi; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jE/JCgHi"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488d2cd2674so54933245e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776245971; x=1776850771; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wylQeg5hHwxb0C8yLQih5rfZGnRs2oIeCOYLEHEm7MY=;
        b=jE/JCgHioCxZv26PlWWU3s0o8CPpOOyoT8e3Akpf89qE6G2a4Q191EmqMc6qMnZWbz
         d5ygitAF4wdgWuk7D6eH+Rszqxi3Ga9YG+59oEk36de1mET8UunxIKZab6DbeQipgp4T
         wKbkyRPj36FUn0Bz+oiJIG4+Ey+oOhwMaHq6gRXV+YmpZ56CP/QkFlqkrguXTFXky83Y
         ih3tHcR/GP+qes6SrmXLINj9PrTI2AQt5R+Xgh27Pm6qz9hqczrq99rqCZ2tXsgjc3dy
         uL3ff7ZZOnhoECjjZpmy5+XQ44ZAi8m+CV+M09Nkojxu2tRBd6qjGpCQHE7zMhqgNugT
         c/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245971; x=1776850771;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wylQeg5hHwxb0C8yLQih5rfZGnRs2oIeCOYLEHEm7MY=;
        b=dMOrPt+tbE0lI/Gc8eUn6yT9Vr5ohphqO3xTCq/bTIAMquXfyG3LS/aFLLtHK70KXq
         kaduXz2Cap2qyR0MvHPpqd8+toJ5IN8I+peLgQ2Vdtk4HHe1aKwDC9ifNvp8Ynh8jIvB
         6ClS9PFatz9KAqI/eWHuhlO6AMnweLP7BgdtDbIHciTlSKhk2NmNaXiovTVAMQWya6Fb
         uVufeqpeOf3XPOGQjC+miHh4vqJN9tKcMwjJmI0IlPr2lARvoof2ClrVyle4mbnQr8jV
         TEP7Cp+CP5kN2m8eCHOJTXF8bbJxtxJWdPri/nJMC2m7EwXBQcM8sxx1hk4VMcHXBhS2
         48KQ==
X-Forwarded-Encrypted: i=1; AFNElJ876m0WLnQNqgffSxEDr6Z8U4wplYEsjsGaWWjb1z9PDCiN9+UPLFGUUBsLrotrd1h6IYunD1uCqxnnwOO/dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7IFNLr4ff2SmeVcQcXyfYvZy+zgIfJosSrKQIt8QQeDFNHrFm
	woiVqMnX2TUcp5dEep4KYdSdqqLF4LK2yHoYydFdiF44/0QVlOsOYkqJyxcEZhvOvZV4p8KVlCm
	0susIdM8c7lspkva3zA==
X-Received: from wmi10.prod.google.com ([2002:a05:600c:20a:b0:480:6ceb:eb1b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:609a:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488d68a10d7mr293106775e9.31.1776245971456;
 Wed, 15 Apr 2026 02:39:31 -0700 (PDT)
Date: Wed, 15 Apr 2026 09:37:50 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG5c32kC/3WNyw7CIBQFf6VhLQYufcWV/2FcFLhtiRUUKtE0/
 XdpXTTGuJyTzJyJBPQGAzlkE/EYTTDOJhC7jKi+sR1SoxMTYFAywUoqjdXoqcVxMPZCVQ2cMwm
 trHKSpJvH1jzX4On8YY/3R+qO29ibMDr/Wk8jX9a//cgpo7pRKAupatHCsXOuG3Cv3JUsrQibn 7P6x4fkK6YFVJoXuSi+/Hme34ss4isCAQAA
X-Change-Id: 20260306-binder-netlink-c82110b2fb74
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=IE/wFKrBh0t+EGfYLJfkCLHJUyNnOYhBFTtA6ZYlxXU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp31zHSWyxY/7Yu5JlXYhq6gV3s2bmSeei2UZPp
 y7vinKoe82JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCad9cxwAKCRAEWL7uWMY5
 RsGnD/9RDu36LVp0jfJ+/mkIL8DHa3ilX1GGGzubgXByF4dOdVplrkytaRaHMObCnboxQwnW6/a
 skIz1h8ikL0TBcNXAv6+/aeXbQNLgaNfyN8a47THd1daADxsCoMML6P/QCc96NVWGHIF+6YWQ/F
 YWMyTjsPhyOJ0RsWgJY542iopqNZRo26MdkcTjDLVNtF9Fllln8HVh0mEBcJrWJo9Oi2eo950No
 WyxfqToSzOe8rdwQBszC2DnTjUdWNC9KUcPQNAkXuXN7s7o4Je3bNugR+KSKxv01gW08JpGko6S
 kBM4qXqLei6+EdqrRARVgsMR+npatqd1mRl5kR3F/NmE7JGvyL0XjjrttjH/gLmGORQLw0LbIIP
 rYkegJcjwlJ+9PYBlQDFDh0OxEZimbcgMB7EE7yFxeoQtsPv/vzEa2XcmlnAhtaevBmHPtpgSff
 5mBO5QvhzqxJ6TpT+MoFnvHFuA2Y35RxsEFP5oRRhOMKSvplnlfwwZzsC5NddgEsMZFUokSONKK
 z3OWUfk8TU1v3ruRAHz7uAlvSONuuR27TZ4JE3mg7BJRLr7FBfwD4fQoAXjr5B5UwNSQ1DeCD44
 sgvRZVoM1hRcP4SEO2KBzY0RZR0OZCHvsKEuD2gHm1rCFmrI2mbGW+4CKF+NmD80aY4bkDqW0g/ kS9GQxhhWQwwcvA==
X-Mailer: b4 0.14.3
Message-ID: <20260415-binder-netlink-v3-0-84be9ba63ee2@google.com>
Subject: [PATCH v3 0/4] Rust netlink support + use in Rust Binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	netdev@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The C Binder driver exposes messages over netlink when transactions
fail, so that a userpace daemon can respond to processes with many
failing transactions.

This patch series adds netlink support from Rust, then implements an
equivalent API in Rust Binder.

As Binder only uses broadcast messages, I did not add support for other
kinds of messages.

Based on char-misc-next.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Fix spurious 'return' statements in Rust helpers (Patch 1).
- Sashiko review:
  - Fix ynl_gen to handle empty multicast groups and correct multicast indexing (Patch 2).
  - Fix transaction failed reply logic to report via Netlink inside reply_inner() (Patch 4).
- Link to v2: https://lore.kernel.org/r/20260408-binder-netlink-v2-0-c0d327d15435@google.com

Changes in v2:
- Make inclusion of to_pid conditional too.
- Add note about file name in second patch.
- Make it clear that the sk_buff wrapper is netlink-specific.
- Better handle bitfield in patch 1.
- Link to v1: https://lore.kernel.org/r/20260306-binder-netlink-v1-0-daceb5bc83f2@google.com

---
Alice Ryhl (3):
      rust: netlink: add raw netlink abstraction
      ynl_gen: generate Rust files from yaml files
      rust_binder: add generated netlink.rs file

Carlos Llamas (1):
      rust_binder: report netlink transactions

 drivers/android/Kconfig                    |   2 +-
 drivers/android/binder/netlink.rs          | 113 ++++++++++
 drivers/android/binder/rust_binder_main.rs |   8 +-
 drivers/android/binder/thread.rs           |  10 +
 drivers/android/binder/transaction.rs      |  40 ++++
 rust/bindings/bindings_helper.h            |   3 +
 rust/helpers/genetlink.c                   |  46 ++++
 rust/helpers/helpers.c                     |   1 +
 rust/kernel/lib.rs                         |   1 +
 rust/kernel/netlink.rs                     | 329 +++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h                    |   1 +
 tools/net/ynl/pyynl/ynl_gen_c.py           | 139 +++++++++++-
 tools/net/ynl/ynl-regen.sh                 |   2 +-
 13 files changed, 690 insertions(+), 5 deletions(-)
---
base-commit: 0990a71f678aa0f045f2c126b39b6b581844d3b0
change-id: 20260306-binder-netlink-c82110b2fb74

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

