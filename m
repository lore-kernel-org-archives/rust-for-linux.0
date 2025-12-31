Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533693168F2
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183761; cv=none; b=rZke0+bdFd19Kop1aF50A9z9z8fu0/PH5c/DnaBVJHl+TIFJBKAZ5F++i5+D1nglPgrICUHfAkvyCJ/1bOy6l2FmFyKtpcYCiqiadfYIbkIfSwCDjL+sVzhaid8rwFrbyo1oMYIqqjxKS51BUhpE3wNUwbazLGeaU3vvBZrzPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183761; c=relaxed/simple;
	bh=DgkCDNZwcq8gq47PvBSES/tVZ/480I2oLP6adymLeb4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lnpouVho9jfme8+KyZZvCNYnTXEUnSnjPT/KqUXSVExqZgZsgzm3ZU1vz2R6IheLonODUkX3LbwEdWdwnQyJRqfwrO8i0xCiyehcwUxps7ArjwqgiOW4+otU1IGcX4zOEMcAihJxpD9OLtziiGV5sWUS9BCPilv+vyZ5IBkuYe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H8Xch63Q; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H8Xch63Q"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43065ad16a8so5598256f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 04:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767183757; x=1767788557; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UQVrUosci++sweVUg2oDGu1yrtQHcLYzZp5maq37Uks=;
        b=H8Xch63QUmjz00EuKOfAHU2PBlIXcud1d+ScTTcNSaDmBEu9Ei2a7wnzQdjTYm8y7C
         u3hY9xf+p0jsnDW9kCM/ewzNG6T9pCB8oeMObV+0UwPQNv+3qZLMsDsvs/eCvD8vjJlB
         Nfi7O2pnBN8ViFIeenSkficV9vOdlutn+sGxVBk2nixx7U6zsH2TpY9BLBiqxL3C5YO1
         eK/oUAmeuqVZoQCrcWI0x5Z88ONGXrHnE6yVvZuWKpsrHBqiHrdJ3EF76WyyfCsBEJzF
         OxMh8wWJsRQVqaNvGSfHrLTuMCz1OT0tHwz7IYsQ6gWCXnbhy5IVFwmX8QBfXwI3T0Wj
         VetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183757; x=1767788557;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQVrUosci++sweVUg2oDGu1yrtQHcLYzZp5maq37Uks=;
        b=nqB8SzGAE2WKMAIYTgp2ETsyABdHo7d23qfE+yiDBKt7Pd60mpCvcoVzf+LT1JnsZ6
         gYJi7uysU6qd/X+zZjaaAUxikVEl8nX0FMGiIyfNsdzrB8fsvNWo/YC3DowPVgeui5ES
         RTxDohQCoH7ngiROYlxPOqab0tD3miS5+w4h/C072qbh8d7YdT7w6aFWzujBiPMHb4hu
         eKVwj0bn3MrrX036LaXf9urdykXREL5UnVzx+kKQanZ4nCJBjxpbYtwa3trWEZvTEx5T
         e7vcVGofDcgMG4iL/6swbpKiYK1mmTmsDNAPdnE58ERn4zVB12C22Gfl97HCZvs30i2E
         1Nxg==
X-Forwarded-Encrypted: i=1; AJvYcCUK8NRgG2cRqoHRS6/O6Z30WNUwDSeyU2BhEQT4Bu1TTGkVAEl3V0MLuV6ltBLgFeVurgBoBPZzq+8iLH4R4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuzFOBbFYiB5VCOpsIEJ3oKgsacioIsdK302XDeQ1xvfz40YHV
	69ckw4PJuDbxIjwmFl7tS6sp1o3WLmd1d8EELqQEbJrrq9d/hOXXQMFF8A0Q19tJisVdgkzLbvs
	KVhXayXI7dlJNervKiA==
X-Google-Smtp-Source: AGHT+IFGevL4RjPve8xtRgOLaqwe1KRUGekHJd+lI5/ywPU8CYGMrfT3q1rcsX5yZhQNUWvXrJwartEV+7L+OGI=
X-Received: from wro20.prod.google.com ([2002:a05:6000:41d4:b0:430:c782:27f3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:609:b0:431:342:ad41 with SMTP id ffacd0b85a97d-4324e6fa1a7mr47643775f8f.61.1767183756634;
 Wed, 31 Dec 2025 04:22:36 -0800 (PST)
Date: Wed, 31 Dec 2025 12:22:24 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIAVVWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI2MD3aLy/LzkVF3DVIsUo9RUg6TkNEsloOKCotS0zAqwQdGxtbUAFXT clFgAAAA=
X-Change-Id: 20251230-rwonce-1e8d2ee0bcf9
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=DgkCDNZwcq8gq47PvBSES/tVZ/480I2oLP6adymLeb4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpVRWGF5bAiUtejlxi6BOwMVDKnGMRxV0brpJMZ
 4N76blF6DqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVUVhgAKCRAEWL7uWMY5
 Rq6PEACahBDOuqhWNRdS7KKKt5/h9IB0Ae0tEIYhZCaGdynMz9p5ZroHJGY3427iEbwD1Xf1sd3
 krvr6Thhw3P3Xe/n9H8Zv/X9u1c5luZ3Xf4eCUMRH4chFWH9JwzEvBz7jXADexXhLdQpug7K2mb
 wcyPQj1ud8v+7Di8+fu4PtJLHimoywoMf6ZFhCGnAxPySJWvVweGV7hUrW8LxDszplrE2HZ8tD9
 RPAbn1uqanDGL40aeAib7oCMvMY0u3Qwpf7JB+7YpeulCoPXBOoLck6sczMbHd7yzidbpiP+RnS
 37uYnZopCUQmCd47pDgFlfMgZD27v6IYXqZ8zIryrOl3Sod72AtB9UoCLEW11pV2LQ1AlYpBJL3
 rU7Ya3QisvjzdEQ6OOLsnzwTh0b25pX6GjpAOkQxz6xI3oeH9Epbm5H/pviAgf3R1wjJrOvIOxj
 0GmRhz2x4wq8lHjcbjoljHHRYDgHFXMm0qSjahun8/DqZkoYlfBxzuxT46T2n5gdefNJ8ejq+Dv
 Sm69I+Q/czN4RKBQIQDvayvG7VhtPNqrAKgOupQ9wDPuDSMURnwra3sFVkMWxmkk6wr8VB86lin
 9RO+10zQWOISHeiZ3OkAmQ5U361UXsQx2g45A72GjESpW/kXTosPejSa7Qj5uclYBBvCaLrP0Uj f+YHVZGzb5+fZ7Q==
X-Mailer: b4 0.14.2
Message-ID: <20251231-rwonce-v1-0-702a10b85278@google.com>
Subject: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There are currently a few places in the kernel where we use volatile
reads when we really should be using `READ_ONCE`. To make it possible to
replace these with proper `READ_ONCE` calls, introduce a Rust version of
`READ_ONCE`.

A new config option CONFIG_ARCH_USE_CUSTOM_READ_ONCE is introduced so
that Rust is able to use conditional compilation to implement READ_ONCE
in terms of either a volatile read, or by calling into a C helper
function, depending on the architecture.

This series is intended to be merged through ATOMIC INFRASTRUCTURE.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (5):
      arch: add CONFIG_ARCH_USE_CUSTOM_READ_ONCE for arm64/alpha
      rust: sync: add READ_ONCE and WRITE_ONCE
      rust: sync: support using bool with READ_ONCE
      rust: hrtimer: use READ_ONCE instead of read_volatile
      rust: fs: use READ_ONCE instead of read_volatile

 MAINTAINERS                     |   2 +
 arch/Kconfig                    |  11 +++
 arch/alpha/Kconfig              |   1 +
 arch/alpha/include/asm/rwonce.h |   4 +-
 arch/arm64/Kconfig              |   1 +
 arch/arm64/include/asm/rwonce.h |   4 +-
 rust/helpers/helpers.c          |   1 +
 rust/helpers/rwonce.c           |  34 +++++++
 rust/kernel/fs/file.rs          |   8 +-
 rust/kernel/sync.rs             |   2 +
 rust/kernel/sync/rwonce.rs      | 207 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time/hrtimer.rs     |   8 +-
 12 files changed, 268 insertions(+), 15 deletions(-)
---
base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
change-id: 20251230-rwonce-1e8d2ee0bcf9

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

