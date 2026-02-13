Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1D359F8A
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770982195; cv=none; b=HQaI5/IQvWPPa4Y+wj/QPWaF8ueoGjh8bbFMl1x9LU+1ZBJSdM0+kJarF9T0lFHXqZtD/Lspgxuz0xTQS4YaY53NbOmicLAvJEvpjZwFMBM+vsputYw7lzPlJ/WKQ3Mco6NYZJAnywMEfUm7uQeNH5M+I+ofFMghv0Ovp84VbL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770982195; c=relaxed/simple;
	bh=yRdxxEeSNXy6izj8NgpmzDD0cYAPaGgW0s6zZ0jEfss=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Wre5x8oTCcDuVwXhyBC+83A4ObCihS0nTDnn3wsw3peLNTo7xBduAIY/oJRhSTyViwxiMq3fb2/uOHI3UbAFm3pyccni2gB0FF31IVXlaPdTaJXNDCEN2BrTz1t48zWBIuHG1HOm9Aocl5if9TH51kTxmF32p+eeOmONEz1bdyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3AH7y51N; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3AH7y51N"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-483129eb5ccso7863275e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 03:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770982191; x=1771586991; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VrRaENV2+RrJhtN63mBpOYEQNOfw7by1//NaX0dMW28=;
        b=3AH7y51NpgcfeQB2x4ZH5z0t0lhZNs0TRy9+a1JFFEH5QZribSWICM0pYNc9j2kl+I
         QE0bhL48Mg22B2FDzt58v2iAobJ/aYiTcrMORIvEwaYogd5G9ijXHIid99ZGTImFgKf0
         cUNcwLCg50A6ABT235r2UZY6yRG57kuupGEuKxO9IZEUMnvqap9Nn75BPavOl1JPONc0
         r8zwyzybYBf1GBm8lwhA0hWs8rpPSxNs5FxlDc4Ni4iX5Aj6S84r4Rzi0HI7971SK3gs
         JtR5teT/XEslPdI0GWdsNwSCacnHP6XcA7mt/vzisEGoZXvcfvJo1kP1lai8vH6dac3t
         SYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770982191; x=1771586991;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrRaENV2+RrJhtN63mBpOYEQNOfw7by1//NaX0dMW28=;
        b=EXXWC0yJp9FPcoN9wF7tG+BVCL4hR8s43eDbHbbwfxIO+FudAT5q9NAhlWF/fUYx3i
         Ht04DNuMaMFEh82O/68nbtiy7m4BpngRrbj4thNcrKU7LQ3YzlYZEAkEZIpX21fpGTG6
         ivjGQ7kiWz29svEEQAlLbsOdLHk8Vrw7N50w6fiSS3g95st9u5IJDirzLL4LZHTVrEZL
         LoJ+U7dHSFFCBdODt39gBVB1auX4eQ1cN/yTeTAUQEOL39tAGenpHkJu3Ia912wLCAo7
         BnivaQMBHZy6saDY+r+QNrzzxil/WGyuOguIBU9HcdKSdCyEsKIuybTD6N0moZnBOaRL
         ajUg==
X-Forwarded-Encrypted: i=1; AJvYcCVSB9eXYX4Le2rPgVn2qEXtb6qCH2zz/7oflScJIlDV3+wTMR59yNB9bP0LTB4hXjRS7iuoS2VHvcbq3RR9+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHRPTztgtS/9hHE6UmdpPytW02ohsIU4wptAABQajyLz1KnLc
	akG4KF/TfJk/wl61YZYGbWi5bFl90hAVMtN2Y6vr5/3zkcqgYleuIll1S65QoyJMdt4wnCNX9oi
	5+Xo0pl7J8NUJeCtezQ==
X-Received: from wmbfj12.prod.google.com ([2002:a05:600c:c8c:b0:480:69c2:3949])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:630a:b0:483:887:59b0 with SMTP id 5b1f17b1804b1-48373a7b37amr22798665e9.35.1770982190612;
 Fri, 13 Feb 2026 03:29:50 -0800 (PST)
Date: Fri, 13 Feb 2026 11:29:40 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACQLj2kC/3XMQQ7CIBCF4as0sxYDtHGCK+/RdEHLSEmwEFCia
 bi72L3L/yXv2yFTcpTh2u2QqLjswtZCnjpYVr1ZYs60BsnlhQuB7BVt0oZYDN6zHomkRo3KGGi XmOju3gc3Tq1Xl58hfQ69iN/6ByqCcSZQDT3OOJtB3WwI1tN5CQ+Yaq1fDG9sQKkAAAA=
X-Change-Id: 20260117-upgrade-poll-37ee2a7a79dd
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=yRdxxEeSNXy6izj8NgpmzDD0cYAPaGgW0s6zZ0jEfss=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpjwsoVNOaZN4jkXsUSkQmEHNsddyukOox7ICPP
 4GOmuXwfqiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaY8LKAAKCRAEWL7uWMY5
 RlyKD/9pqdT6OQJIwAkiDcdMeckSRujXSgAHs4RPe1qaUpjFqaWptJUo+y5jTcxD1jALPf0ReyZ
 Z9SMLcrhS4eClV10rWZUYr7dLm56YibuqBznRjB57W7XfM31m6gbzCgIp0ihHi3ozyaahA0RpWf
 1LVIjP5sRVgdwtVwH0oCCSCpvRRsKapM+IZ+rIY7Y4d0awtysi0WE8YI2kXK3TM3i4bcm3FoYSz
 KFrhLu+C3/uzie4ykyvhhpqWi3X5f5wgywlLvp7gqkIkvmOIOyrPAbDhD63PudXDuc/YcV5Wo0n
 fQr7Hbf1Yv8YE+NGOXkIGNbaxI+OAbB6ERWznjjxn/G3ohUfXHMc/2BYtrkVk6+6YNHFNv96ThQ
 UmalU9oLC5IgiKGK6JObg433LzPajGpvhXKsBYIC1H7rFrZWrBMYaeAWS3709DkenGZZVgQP+fI
 P/HDMxo/3h4AVlc7x7Qz+tHGwJzwwTTbsvhiCZar0rXviUXD8VfNr5rTt0ILXuKK18A0AWmU7lo
 utgclV8EvVQx/2GIZBhDm7NoZVnODPErPXtSnR1ak/gdHp2xcF7n6rZdbYKHiBbU5F6B1oqBzBX
 znm5583qeZJq9s9i+t9SR/ssW8NiIcPzngqOGvR8DdtQOB4DO4LEWiihhSmSlCD+sHBFtqbx5iT 4J3UJcIEl3ZcWLA==
X-Mailer: b4 0.14.2
Message-ID: <20260213-upgrade-poll-v2-0-984a0fb184fb@google.com>
Subject: [PATCH v2 0/2] Avoid synchronize_rcu() for every thread drop in Rust Binder
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, linux-fsdevel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Right now Rust Binder calls synchronize_rcu() more often than is
necessary. Most processes do not use epoll at all, so they don't require
rcu here. Back in Kangrejos I came up with a way to avoid this. Idea is
to move the value that needs rcu to a separate allocation that's easy to
kfree_rcu(). We pay the allocation only when the proc uses epoll using
an "upgrade" strategy - most processes don't.

One solution that may be better is to just kfree_rcu() the Binder Thread
struct directly when it's refcount drops to zero (Drop of everything
else can still run without a grace period). But I'm not sure how I would
achieve that - after all Thread is also used with kernel::list.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Change how Rust Binder handles the lock class key.
- Rebase.
- Link to v1: https://lore.kernel.org/r/20260117-upgrade-poll-v1-0-179437b7bd49@google.com

---
Alice Ryhl (2):
      rust: poll: make PollCondVar upgradable
      rust_binder: use UpgradePollCondVar

 drivers/android/binder/process.rs |   2 +-
 drivers/android/binder/thread.rs  |  25 +++---
 rust/kernel/sync/poll.rs          | 160 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 176 insertions(+), 11 deletions(-)
---
base-commit: de718b2ca866e10e2a26c259ab0493a5af411879
change-id: 20260117-upgrade-poll-37ee2a7a79dd

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

