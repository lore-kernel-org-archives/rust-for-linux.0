Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C94E433E
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776623; cv=none; b=Z5NzIBiDmorA0YPX61wuoURCQm3/qtNkaxa8zM7HNi1tTxUnaQAlmGDjrusXDvzaPNOv1sOuWAU2U31hnr9k9J+A/jbs4UgIgq2/e4xpr/6ZNfM2N75Bfshbqb//sddtiFZZpgdhfXXdljWSkrdGZfUDg0oBJpyGd8c5+WS/Ukc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776623; c=relaxed/simple;
	bh=DXOACzo7M49gY/R5elApuIMD0DaZxuj0Q1iWEkxrzxU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZJqJh5GGYFcaRk9VYHC3YLWJ/l6VSNhxqDhNj3PzsyL9fa6HizOlIpLiveQ2p8rdm0MmpkIXmgg/bJ8p8rniCQsM+R0lZQapSYSzdzoeOiy7mWVeAbGrCzz/+zuNTjqzJ64MERXCjsASQlBS9r7FHJky8X6PNSJv1PNOJkTWK4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mm3shMmY; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mm3shMmY"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a22bf0so6879053a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790776607; x=1791381407; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TS+WyEniHte+KHuVcwcKJJMgVtzSQ/i0ON53OEU7JMs=;
        b=Mm3shMmYRSctCRwaBkouwFsSlOOJqkAqXrN2YQEz4ILppkRrsnALtjulgs2abg5ose
         i9Ma/YLgNXLvDzF6YXBr2E6aFO7/RB0qpVIWI9CTth3QnLFtOklPW6SfBEx79eB1pWHy
         642PvuysLuELBU9pP17DGG5fv2J3IkDVDYVb30bqQVk0SjNUzgDyogQYTchKqEdBL75j
         Sr2/O2OmNkIqmsEwsdzzjT9g6SdjSxZfl7+s5FxHYQ2DumKlU1eL2PFOHecPR1IA8MJW
         oNwGAhsyITqvnfQivQxWBTfF/dogQFlPtJJbUMSbuaGi6TkkzqyYJTzxLf3ibTVxgHLi
         LGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776607; x=1791381407;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TS+WyEniHte+KHuVcwcKJJMgVtzSQ/i0ON53OEU7JMs=;
        b=POAT3EH9Aw5q4hlKmFnXyXxOhHEkmgct8fBX8AKUJh3vpJWexO/YJ2sLRqH2BNmxCG
         qoqq6fotT9KTUnVGYQug+Z30+UyhFabzshXiiH48pkfNffthv4n7Du78Aui0R1JYe4Pq
         lJLRG/KtIZFjUfYFycIhqTAVW5nm8nFJWipiufX/mMmZWQ93qVxlgYsfskGWaf1ETiv+
         0yfksqrZNKvChRu9AER8ZIHdU2wv4O+t5WQD29HmVgGJ/qLat1ZSE/4jko+7NFv5u4WQ
         HWNkYVtfgZq9u3RIH/M7CYHIyXOi1qDGSWIY8It5Q23Z6z6yrJYKT1tj204Q+w00kAqc
         DW4A==
X-Forwarded-Encrypted: i=1; AKwUvBxeaetp5v/KNtqc56kSecbQVvLfFrwSjpzKUluBbAGXnFjtvF3cKCarx2t5K/UnFtQJHKKwdilPRtWtMLFoMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0Vd2WGXjrWNRVcv7CfstvuFUSghESJQHtITLg/7JSLYjv2Xgb
	9AjZTp817p0ztmACvJ9rdSIoFMobCDoCiAQeoHvLDMQ+bMXDPTtfxLpY+niL7/6dtpaXQa1Ams8
	9p8rCzWCY8bTpK138aw==
X-Received: from edbca7.prod.google.com ([2002:aa7:cd67:0:b0:6ac:a9ea:876d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5384:b0:6aa:a015:716e with SMTP id 4fb4d7f45d1cf-6ae199621f3mr1003697a12.41.1790776606328;
 Wed, 30 Sep 2026 06:56:46 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:56:35 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABMVvWoC/4WNQQ7CIBBFr9LM2jEUiIIr72G6aOmUTlLBQNNoG
 u4u9gIu38//7++QKTFluDU7JNo4cwwV5KkBN/fBE/JYGaSQF2GVwIHDSAnX1Ifcu7XWcYkerbb
 GTvo6tFpCHb8STfw+xI+u8sx5jelz/GztL/2r3FoUqEaj5DQooYy5+xj9QmcXn9CVUr7mqeYCv QAAAA==
X-Change-Id: 20260930-binder-transaction-log-94989f47b142
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=DXOACzo7M49gY/R5elApuIMD0DaZxuj0Q1iWEkxrzxU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvRUYPA3iffTZkPntStOTAqXlfqfz9e2b+C4+w
 uyMnCsByQGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar0VGAAKCRAEWL7uWMY5
 RpdbD/9TW2ElHLfG7ziaULTUpBchLmMJ4EbxyOdP6J0q67qWqQ8IQ64V7yLSDG3lBe8CF8wVwDE
 p2lm+a7pVTd6qPNvBuWZK0FxYYNmDxn9HvYc3GzlLz6ZHyVc6ZgZwwoLU8l+TljHrvmtGBzgh4p
 CgGceaAymLWYPO3KlKZWI1OgVFaH/7Z+EK0TnzLZaDJFGamVidVt9NqmeaRr4Ghu9bio/m8FBbv
 X07CslLrwdSSYKOytsWApsd1rnFNEKaGX6KOGtxccPCMyzU2qUfkywKsj28NoS0tBBEuDwbcUPY
 SDpRfdv1QcJAca6yaGWUFNck0t9SfU4PZOUYhMGJo2VDxdZ7UhkOwFn5o/1gjdiwVfohdazgwEU
 9AGHfh5X/PlRSSSJSzszaKCWV33Zob7S15PTZCZSrJ/JDHd7HSI5HmWat9H6ska20GRa5tWCWjP
 jLK8rMOXFJyAJuB14xEeVOU4pPN26khu9efI6pBUEAWP+LaMlsBpzqmsHobrAasOZiHocPYuTmh
 Div+kmr531zlEtGv2f8tBEg8vvWatrqDygyMUxgRgNejkJWosXsUAn9W5De05QtEU9qhJerQERG
 ejCTuxtkslRP5+iG0BM6NRuh8CcGYmJyCLOGqrXZjjy8HWHbWUT/6jA9Tg7r8E/Cxqtne8mFNns Hd6iCA4HGiEa5Lw==
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v2-0-8a15e9b8cae3@google.com>
Subject: [PATCH v2 0/3] rust_binder: error line numbers and failed_transaction_log
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When diagnosing Binder issues, it's useful to know what the most recent
failed transactions are, so include a transaction log with this content
matching the C Binder transaction log.

While we're at it, improve the line number information emitted by Rust
Binder using #[track_caller].

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Retry on 0 in next_debug_id() so 0 is never returned on wrap-around.
- Handle debug_id wrap-around in TransactionLog::add using wrapping_sub.
- Link to v1: https://lore.kernel.org/r/20260930-binder-transaction-log-v1-0-3d832fb30388@google.com

---
Alice Ryhl (3):
      rust_binder: never return 0 from next_debug_id
      rust_binder: track caller location in BinderError
      rust_binder: add transaction_log and failed_transaction_log

 drivers/android/binder/context.rs             |   8 +-
 drivers/android/binder/error.rs               |  39 +++++
 drivers/android/binder/process.rs             |   5 +-
 drivers/android/binder/rust_binder_internal.h |   1 +
 drivers/android/binder/rust_binder_main.rs    |  31 +++-
 drivers/android/binder/rust_binderfs.c        |  19 +++
 drivers/android/binder/thread.rs              |  12 +-
 drivers/android/binder/transaction.rs         | 197 +++++++++++++++++++++++++-
 8 files changed, 302 insertions(+), 10 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-binder-transaction-log-94989f47b142

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

