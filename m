Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3EF36BCDA
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637149; cv=none; b=fWm658IdD128LSKUny8s0wjUbKBkfVzyoI9pzB7MrTlz2SJDPaqLoSbiVWpcnU4klRAXGffXD+X9AXw8CtwwnlAgT+wxQubk2I+wBQk6PCjwZqWHEwJnTNdogjKcU0gJmmMBPP15HfF0JSpj8Xs0/UVLGgKySQQMUgCXU6b/cao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637149; c=relaxed/simple;
	bh=jZzCH5kTMzk4+zh/HS6e7lFcHIt4B1RwjUnl/g3Zoio=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZwB5Qjp3IRx9MoHbQv0RAcxOf7UC39yW4jhcll+VfDOyQhssqEWkl9z9qhApoYrkRjD+69+K0UHZqQwvYCe/I6u3VGdSeYGkjaCrx32hiuxCj570Ce8UZPUT0pAgPYPhhLva85vs3RgicqSAbMhJuSQo9rIJ0BdIrhtbWjUr/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ikLPIIzr; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ikLPIIzr"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8704795d25so490237966b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775637145; x=1776241945; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jh0XBz9sbsK54mPuiYsUDgChOjit4qvJcbtf+cqXL9I=;
        b=ikLPIIzrNczPalSw8wYgcG+4eZ6gXoPabhBLYY7YofSMr+9aDwCzBkUX31WcMUmA5h
         EpcISP/2qo70RjUHUzZzI/QAZrpNMSln5/e4eE8ZuyxZg6LiwxJXPnuXJVVAbuiK/Jpa
         S1GLBFrC4IGX/SLsWcukUECSbFs2mfNV6qERacXY9d+NVZkmJi/oEPUqdWErp+GjzN9L
         arvTDT1Zdg6Ie4lPdx6mBjnb8whVGsgfuapC843MSOX6aNs0fAmfKjvKbBxCYmzhW6sx
         NAwBhU6yPuIg+XaTs2KK4QGAgiF+KTMm2TQwp9xvFBDPQ5brXEaVtwlAxd41sPjy4zlP
         phqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637145; x=1776241945;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jh0XBz9sbsK54mPuiYsUDgChOjit4qvJcbtf+cqXL9I=;
        b=ZAZSqQycsWI3XDJa2kvs34p33Fw+cHdW/gfLeClg6vXh9YmAwT5NnZ1vU4x59Umsr7
         rYv1J5hKfr5mSJKDj4l+oTacRlmm0+rl1yUwRGQWWMWU0ZZy9uYgMSZcJtJ8KrBj3kLF
         cCVtm7i0eR+HLvXJFwrSkwka4X9KhHZV/Z0+XA5Ai3PEvVmXjtL7qAEJ2Ryl00zUc3uI
         eai+Rmes8F9QKUSzvbiRLRY4yFc94bfsq+oUK1QgVb8LjwCJFd6KJ1SqK+wgSY1Rrr6p
         OLeDsbjiSgu7DhOwysFxUk3TXlMNlPIOTnO0HspcwZhExl3L5rH7WrT4kDuzxYaNfAof
         9CqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXenEgEJCQehXXpNPvwrGwOlcAPe8A/TpaptXHKS56nHLUQvGYQewW97bn5dpWZNPBFQdnlZmbJrAfLnw4N+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrf2eTvXy5lViFM34epDOsUq7w1v5Y7gpb89fmKvzAe1HnEa50
	GCV7X0thym6vXYpPSHNtsHIGRBbbYj68LM3wipEK51B9T9lxiFC/OSarbhOMdaPVnMj7kQbNJLu
	GAMEh7ZE/j54QedakdQ==
X-Received: from ejcdr22.prod.google.com ([2002:a17:907:7216:b0:b97:76e1:bcfd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:eec1:b0:b98:b08:7442 with SMTP id a640c23a62f3a-b9c672ae89bmr941367866b.7.1775637145029;
 Wed, 08 Apr 2026 01:32:25 -0700 (PDT)
Date: Wed, 08 Apr 2026 08:32:15 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI8S1mkC/32NywrCMBBFf0WydqRJaAqu/A9xMbaTNj4ayaRRK
 f1307pREJcH7j1nFEzBEYvtahSBkmPn+wx6vRJ1h31L4JrMQhXKFFqVcEbGHsLAEfgOEVuGukR
 rrS7IaBT5eAtk3WOR7g9v5uF4ojrOpnnROY4+PJdqkvPubyBJKKBqNFamxEoh7lrv2wttan8Vc yGpD4eWPx0KJFiTDaRJorJfjmmaXmxpxbALAQAA
X-Change-Id: 20260325-kasan-rust-sw-tags-c5afff30e63a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jZzCH5kTMzk4+zh/HS6e7lFcHIt4B1RwjUnl/g3Zoio=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp1hKS7L8tB8P44ROw+4ftT76ANhPBdoEGEfJW9
 nhtFNckROCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadYSkgAKCRAEWL7uWMY5
 RlmcD/4yd/muXdvb6JNcqsu2JOLWgv0sTqKlTYxscDKq9SkAc5wHOs1xLyDNDifsAqndwd/zlzA
 ECoWbciWxE//7HcnqBjlEO+Ypj7DbKgbDcCiJRsYTX1nS2uZejCKNF14Jj/aFpeUhvHOLZUQkQN
 GQVF/0+gxGtcPUfFpUfiKg+qWjhuIt1rsyejrdg2PkqYkyX4RpABAQ2gBu7Bez+lAELUKUS3xC0
 uvIdc2q0JL5V6f4ypSawxwM+UxhJjAgiBkOKYkuzsUSrI38ZK+Bf7IeePM7XcHkTN6o9FLf/ySm
 8v3KiC4SvFy4B+KUOvOQZCn5ZFLEEPJD0uPqJS5b62rNjT94Jv/CkS693P7rYLpEgYzbnl/Dn7e
 wc5IVBJ1kYZIiCtPmVjToWalHgySUIVvmzIWgTJuEP9X1YFBQtaEy48A8wJvk9mtu/5Pf/Z5+4F
 VoJLF1HbbIccNABzk0GEXeOPRICn+4yx+IMf33z9d/nz7ipMitKNIK5P/N53frxbwzjJsLJ1fi9
 4wvC0b5qejZlZP9ezpaOiC+39OiJxfi11XNRmyKktxj+a8729PWNnZPJwAwx0ldc1PYduiuROUe
 5H1yVeQuja5u6O5RORp0IpHy54EWc1zwjGOI4PGpWYnmZN7HIoG6mzAw0g7snVB/DBTDKYQQOnA yKvW1zhRRy/j4jA==
X-Mailer: b4 0.14.3
Message-ID: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
Subject: [PATCH v3 0/2] rust: add support for Software Tag-Based KASAN
From: Alice Ryhl <aliceryhl@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of the last patch for details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Disallow mixing kasan with gcc.
- Link to v2: https://lore.kernel.org/r/20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com

Changes in v2:
- Drop the first patch for -Zsanitizer-recover, and mention why in
  commit message for remaining patch.
- Pick up tags.
- Link to v1: https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com

---
Alice Ryhl (2):
      rust: kasan: KASAN+RUST requires clang
      rust: kasan: add support for Software Tag-Based KASAN

 init/Kconfig           | 3 ++-
 scripts/Makefile.kasan | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260325-kasan-rust-sw-tags-c5afff30e63a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

