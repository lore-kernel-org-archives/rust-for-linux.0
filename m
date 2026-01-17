Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E442222D2
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768663529; cv=none; b=Frb2phLpZ8p9vUMwA2eavvMkzigg5ZTozNmPa8ruQ3diH/hsPxwJAN0quLi6oTcshmU+hU1sAOm7sjZCeJD/E3xd08jPFC+bY1C4TWP2mCRM6Y0NHa3TgWJNPe3DDiwKle5vDGkrtwonvakBBIeL2XjRw0yVEa+WTbEQGa/La08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768663529; c=relaxed/simple;
	bh=V/ntcfjpTZNTmLuiQxefkG+jT/AdH+2FKMRm67dN6Z8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cl/R+rx9AWT/3G8vdtjhw9S81w+03Kon7G84dICeAkeNLEbt2GSR/gPj+E0T3WzjibcutxeK52SbtxvVI3ualDhR5y9pElvetoS8X90PZq3sPnrHLoYsnLx1hgPk9mgg+mnqT8cufZeLMHdF/aSIVFiAnaw2i9IstFZO4UdRWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RYka4dJw; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RYka4dJw"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4325cc15176so2264357f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 07:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768663526; x=1769268326; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=neRNq6CX2lEJQRNWsZ7iYaz8BqNTw/IAW07ZI92roTc=;
        b=RYka4dJwCqHnxXIgqfOxsXh3N7NSv1kzL4CE0TTmSVLNmOFV1yvWOITcAGKgGn+qqr
         UfyFWCwQ7f9UZFdyysnfE6OLFKYYnYliPZPMyjvbcX/32fN/Tm7JEEJNSkkGkYpzFWxt
         nPRifB48p9FZwSvIAefr04EAlk8pjqSoAkfWaRQKeoTPHDp/CC+gUs0K/0njwna4Yxps
         jS9Jko0qotu8Pg7IwqOdYBMCNtqsI+HItK7bXJcg0gxrKC0QD5u0IBOFvWlMFX6Ft7Tg
         2OPafdXRCaEE43BVKgmDqvrSv3zP0RXGOkMbMumFDUT7bMbIEZBPmITHw+dpeV0Ynjbj
         0tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768663526; x=1769268326;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=neRNq6CX2lEJQRNWsZ7iYaz8BqNTw/IAW07ZI92roTc=;
        b=UuGZhXwBLNzTLsh2xcM5PyhZ2sjINLIs15InIziKXIwgQ9vBeayNl73PBY9SSQk4ZJ
         dF413/oGpKImfLb1ox3iLXgNjjb114KE20A21zLrSjWrtFyQOdJLVNTdI7gDtVWSUoQM
         SADKSW9tPNqi/X9xAMDOwCVwEF1Vazflo68R27/ULhgvLRm2BMlxu3ZJxuae/IQjoSVg
         PR8jPSnccluELImeSmFUo8bsXBcGDfdUHK2dzXhuE7L3H2clvm8lOvLE3tZGn989I19B
         O7l+/REwfDbx0344LazUmOfXdQIPUT4AJS6G6eiDs3mggsnUXSHt+dICJs12avGpTaFk
         iEOA==
X-Forwarded-Encrypted: i=1; AJvYcCWolDeFO2X4828t7GNSe1js4onZuOVJj0H8sQlN/L5ue7cvDdJteW0/Zhnu8hHxGLPipUmKxkdnZd8kMB6nJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXqUJS09SdgZvR2x3+j6WnZnWYgWLzdG9EF+sGdyld6hJZDGb
	yqYasScWb0JAotDIrqz4GGQJfS0/sCROcMus/dMruCigMtWSPo/oTaacD/aFSuqTfSbtxaxodkP
	AonF+sGcyZr8QMpPzIg==
X-Received: from wmbjp26.prod.google.com ([2002:a05:600c:559a:b0:47e:d98a:b5c5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19d3:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-480215e207cmr64020035e9.14.1768663526233;
 Sat, 17 Jan 2026 07:25:26 -0800 (PST)
Date: Sat, 17 Jan 2026 15:25:18 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN6pa2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nz3dKC9KLElFTdgvycHF1j89RUo0TzRHPLlBQloJaCotS0zAqwcdF KQW7OSrG1tQA+OgxrYwAAAA==
X-Change-Id: 20260117-upgrade-poll-37ee2a7a79dd
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=V/ntcfjpTZNTmLuiQxefkG+jT/AdH+2FKMRm67dN6Z8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpa6ngqE5RfdAD6OpKd6pz8feDbDHWWBt9qnTcj
 6A7Z22S7meJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWup4AAKCRAEWL7uWMY5
 RvJsD/wPtQSMd0Tn2/SWXe5BHMCvR1Ke+pJPdDXG1Ep2z5QXGhM7GL3YcokiV8JSw4YEfXTKj4x
 W8kuBcmabkjEUEk4bkla96ieFvSdyeHpeukigxxntLxeAke0+pK1e2IWPWpjEDZCUE6Ny+3jpbt
 rPwzjznZquobjRfDqp7zEWxs6LP3bNneeIDtnNt9kimAK1TpmcPZStZdxx/5uiTYzDhajoVjOXv
 DP7A7jRRscYUow89mXZYz22QC1ac/NraPQmlj5AhZdnMZAzIg4lGJWpUnzJ6Z1NdAyUMmHtmsGt
 HDtuOmknvX+Smx9XRP1fRw8tJ8umugVrAicEed7MFXfZUUay3iO1rrBqhAy47vWxVyAG7BrQ9Yu
 rmbswTiIldvC/PWt8qgJCPZAtkpjFZ7ZDhuAB6vWHV2w2HVK4ixhBlJ5PKSfo1iHVKFLpghOaii
 4EAtTODc3rRcXOrE2fiqf7udHBPO71RTRvhL7J7eI7FwM5X9zpQrxS0KogL0th9S2JY91ZP8nmf
 8pFh8OajwD+V+HdpDZHrqBvp7XvKYHisJ/TqNu9E5tsiTtHkaNzc5k/QDwX2LAzEP4yLMKNiesc
 s/1cUXH0tzUapx2nBauW2WnQ45+TToS8ayUTPxTTa6f2o+FDiboLO5ODzObQBqKVc3kO6MRX+wr O7tc/3TGmAhFsQA==
X-Mailer: b4 0.14.2
Message-ID: <20260117-upgrade-poll-v1-0-179437b7bd49@google.com>
Subject: [PATCH RFC 0/2] Avoid synchronize_rcu() for every thread drop in Rust Binder
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

Based on top of:
https://lore.kernel.org/all/20260117122243.24404-5-boqun.feng@gmail.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: poll: make PollCondVar upgradable
      rust_binder: use UpgradePollCondVar

 drivers/android/binder/process.rs |   2 +-
 drivers/android/binder/thread.rs  |  18 +++--
 rust/kernel/sync/poll.rs          | 163 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 173 insertions(+), 10 deletions(-)
---
base-commit: e0a15d3fd5100c25d1e06837bdb3070a7a716e32
change-id: 20260117-upgrade-poll-37ee2a7a79dd

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

