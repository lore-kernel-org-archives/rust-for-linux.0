Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543F361DC9
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338173; cv=none; b=Gbyld3oxc3D7r/5/BQFl1gbLN8mBdkIPaoMGX8eNwG64qk89snZ970xlqOlh5xP1CP9BMWbLXG+zNMGtVc43OaAVHloBhyfVx4rr0j+Q7N6igYdXxaJRZqDD9m5/LrMq/gxNQT2D2osZaICQC7y1P/6KK/jOB3FJbR9NiZNjqvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338173; c=relaxed/simple;
	bh=Uxj6c/az0LdP8dZc8T2qUy7YzybZMS/bT4hkQ1PgX0M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rulo3yyed82f8E6pC2r3MonTM3t3iqDvL/bGY0ipOa0RDkvHysfB2jvXy8qs/6bFRl1i6WARsd+2VoKSF2U5+0Gxekup1H4VXMUu/BGBRI3Dj3g5V0h5f0HmKP9VHi7PZ+OZO0L91Z1nvPsInGhgqn/DJaun6tR7PRNQM4Wlx6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o8bmpgT4; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o8bmpgT4"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4830e7c6131so43246575e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 06:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771338171; x=1771942971; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9toli3up5J45j2dd4uhudMM/Hy4EA7BHUmvoc7k8+8Y=;
        b=o8bmpgT4GlJTrrP+ml3OISE/lilgUgN2XmY1wBJu0IZRZyKu6syc/sOskz22C52ZRI
         Ebt5f6SrtZ3+x0HjEcC3pr7oypmGuOA9SyFlxH/QBX/zlZh0WhiLwbdU8UJNsK7InOp1
         A/xr0NBYpjET2YPsPTTVqHfhIfY8teihu92ym3xtugFN3TNbpGWDLQud0SgdXP9l3W7I
         BtC8oBdswjabFAR7rzFd1COMdkjJw1Wat5nHffIlW1IbWdARI2oeIv01NSIDRmiNARMm
         Ct6efWvPwPa3WTSqp/Zj40WjfF2hgyoagqI7Ek8ND5MHMrE5h/ykByqKPeDtgqYMx9AQ
         sqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338171; x=1771942971;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9toli3up5J45j2dd4uhudMM/Hy4EA7BHUmvoc7k8+8Y=;
        b=QjQ+TvEJtMkGftwDI6peBN7HYE7l3ZL0zuuzskUwZMED4gbi50CfEQXT2TVZFg46VQ
         ricfXHtm/rZJYsvymBu5xi9RNnbiz9nCN45+xVrKUf1JMu1gRrRPK732qNoiGMEAU0D+
         rDpyWIhoiuSgWpCBY3HRxxdRZPz/1tsplikuz6Vfkf5YXwaG6hqUXWIGwHgJVqgbdEtQ
         /BwHRXEVDUM1R9HyCUGp9Tul8S4/qbMHOi3e6TPZDrEU4kUr2+hVoqP5QQx5sTbRbDUg
         K94LtvDk4rs96069K38bCErMVfwZKbTkidWabYXxFdh9wVI5YzFxSw+L/vhygzT9tTPe
         ppag==
X-Forwarded-Encrypted: i=1; AJvYcCWFAypkOExmurc/k8rhBw4BJaYZht16Yr1uwjjG2bC+sqYwj+TlI+7dA/b0mhZxxGLmmKeKWA1M6hyGS6DjDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTSDZAcYcTnLuUDMvMUAKgDKAORt25nVsooj2SLi6s/vx056v
	opt30Cg9U6hFJEfNCbSIn1CDX0JbDRuw9WPFPsuo6ThJlkRz85ulIFdWhouXDaGzD/1LtE+y4fj
	Shube6Xbp2bP91s4gHA==
X-Received: from wmhp19.prod.google.com ([2002:a05:600c:4193:b0:47e:e414:b8fa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c25:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-48379c14606mr166623145e9.32.1771338170924;
 Tue, 17 Feb 2026 06:22:50 -0800 (PST)
Date: Tue, 17 Feb 2026 14:22:37 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK15lGkC/x3MTQqAIBBA4avIrBtICfu5SrSwacohslCIILx70
 vJbvPdC4iicYFAvRL4lyRkKdKWAvAsboyzFYGpja6NbnCUsHPE+HJJn2nG2K7nGcN9ZgpJdkVd 5/uU45fwBLWfJ0WIAAAA=
X-Change-Id: 20260217-binder-vma-check-b6fca42e986c
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=785; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Uxj6c/az0LdP8dZc8T2qUy7YzybZMS/bT4hkQ1PgX0M=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGmUebChDZjcwqWd8ZRbjOtAua4kbQQ1RMjHoMr3X+QKWSs7w
 IkCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJplHmwAAoJEARYvu5YxjlGryIP/320
 NWn4fxONCqcMTOqDq7viBcZ3G6cxX5lNXZSB9kDxtKeq7LDW4cLWm9VX6fr1A56iPtfHeln2qUw
 pGXpgDCEASmiabi+l3mJ6/IK1BXXtjwvoOrtmestBi8xAHM/iHsbuLYMedwUJNoMt+PgfXy5mFU
 /epRzgdGg771b5ltgKB2pablfJ+KX4qP7bYGrVfBzBq6hC2ngTCndBsvlE8pDKnSimggXz80Vzk
 Ukm2TczsIRVTYjAOdOhlcSJgdH4WKBwZgp59FVHfQqcEqFS41t8+ESMTuCM60Ct4vgfLXebEzRc
 Zi9iZK/pDfTxfTaPHvR4ubu1GhP+RQ0bsJ+lA0zm5DSoWHJqY8rM+j140oTdjG3wIJN6aSdNJNo
 Qrf8h8aVTIA/WoP6UH/J1e8Hwgcm5lUCLvikrcxPNMOnm1C33GWY7YulmlHNkB91OOPT9l2RilC
 +lm+PPMBXh6baCKzAePnHDwoz6vVdAwrNW/koNi0ar3PmB+FMWcL/tWtiM7svIlCZHp4ttGGmfa
 PXMGPYPXwKIR9UXSg57HSKuSK/QTHGqaPQjRzPCH0L+3Hi6aXnWkFAINwen5CdEdoLAKI1G1f5U
 fg1F23FGI67l3+WChvssHlymiiakrGek7YMGUvW3VokUGzsn2gfQjMU76NnEYD0A2LfWM4HfgD1 6+PNs
X-Mailer: b4 0.14.2
Message-ID: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com>
Subject: [PATCH 0/2] Fix VMA confusion in Rust Binder
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	Alice Ryhl <aliceryhl@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This series contains two bugfixes for Rust Binder. I'd like to follow
them up with better solutions by changing the VMA api, but as an
immediate fix this should work.

See the first commit for an explanation of the actual bug.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust_binder: check ownership before using vma
      rust_binder: avoid reading the written value in offsets array

 drivers/android/binder/page_range.rs | 78 +++++++++++++++++++++++++++---------
 drivers/android/binder/thread.rs     | 17 +++-----
 2 files changed, 64 insertions(+), 31 deletions(-)
---
base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
change-id: 20260217-binder-vma-check-b6fca42e986c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

