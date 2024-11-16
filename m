Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04D17BB0F
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 19:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731786760; cv=none; b=Xto7f8/5aDWa63kC7xIbqC5cFnMrBreFNBspWEJJXRV1tVP+Fxox4vJWimKaaKr0bkhszt+S6O9nylMvZN3yde/Zv3kwugxl+V1vfji34ePgRosjXQm2w3xny7NBHY/l0TRZtxGXGvnNgFXkckIIL/txYk3CYJPSrQYHpBBDVmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731786760; c=relaxed/simple;
	bh=tHmUvjC0aUS50+biYPNpIJwVrsA12puSjE/KHlUYpR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nnsvh7X5WjyZg8lC5pfzJCf7lrEsodNGozt0HCMJ/1ceCCmFKlByI4VZjIKEpmP/ByV+y1OJWPoEt+NcfP7701KWs2a4OvmCX8Q0lM0IEWARW2WyKkRLOidxE+we1uNLq8h6D/zxJBHs3tEf/XrmWxPsuE+iV1gcBmTwWrXwCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=xHhmtzVL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="xHhmtzVL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4314f38d274so11410285e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 11:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1731786756; x=1732391556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kPLunjS6K1500GPj94GMW6fuYXDmSo/OmsEFPQM9Os=;
        b=xHhmtzVLaRzF/PMgJAXPNGEsJHtY0Z8DsSaDGeFtXaeOSxmiKIlGAWrhqnXFh0LO14
         IwlafwjBGHyKabzaLZKgOJiugqfqn91J9l5XopiN92fZsrvDCex4oKEwQKLyxpf5LMXB
         626x9CNxZfBdYHy6T0vuXL0IfErVDj0owtHH5R0ygG/O8dbwuzvwfQGc9sTvkdJ0SZIl
         2dzQRBuzk07SYW1jn5UbX6NdjY2ORX+5Y3+hX6w1TGp9cdjdlpjZJDnwft5XbQUM8msJ
         e4UanSCtuOT4+HiWJpOqauNJ4nyEIr4U6tmvK0V46h+QSC6hMFXEiazMOR+3lDEbVh+W
         gXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731786756; x=1732391556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kPLunjS6K1500GPj94GMW6fuYXDmSo/OmsEFPQM9Os=;
        b=ZZvmnbLP8yZVj2jnK2JHNYC4KsZ/6Q38vmUd3sGoBnQOCnBCsRjHkJFcjR72KS0ilU
         yuPzyfpaqhzBHlvjoIgwftAzX4nzVom4k2puqYgKkZuI73UWL9wxE+Rkailza00PNK8d
         XTlvIpyMc8QrzrZweKLq+LZ10imw3+0ZNOfUVpL/yyT4grFWvT1TakjKBO7xY6Q9XSgg
         g3RIQWfqHwAk4fNMw+GbqqfwC6IP8MkJHniCydcXF/m+kTtgb3GeqFCtvy7RYr/ihlrY
         I8FhH2oF5GPjnMpg2/WcC3bYZScSkdEMX3XDkJHZ8W4gHPZNJ4UgS/7Re81NsiBxfXt6
         +brA==
X-Forwarded-Encrypted: i=1; AJvYcCV3xlh8nRSeySGP+Vb4g4F0NyRD4sKenxAoh1huo65qGdHCvZ/mqFc3BhqbmlBJDXNmOSSCvwFIHyDSB9XmSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5mIDhq4bt7rIdr7QSQvEpDci+is/+J9D+EaOIYWzi++RiGxk
	a5uhgO+dgCyYJ8jo+MTef0XPEPk7J9WBQVgUmq8vwDgHDGk3g4sW5tWm9bJrclW1FmhY9TVHwAn
	zOqQ=
X-Google-Smtp-Source: AGHT+IG1+bKsmNbdX2TogengPN0AZmV3C1JYjSIo+xQskWkIJTgqqNmp4wOpGAOaI0hv5jRXLup9ig==
X-Received: by 2002:a05:600c:1da5:b0:431:5c7b:e939 with SMTP id 5b1f17b1804b1-432df74fdedmr72221935e9.18.1731786755862;
        Sat, 16 Nov 2024 11:52:35 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27fcb4sm102846905e9.23.2024.11.16.11.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 11:52:35 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH 0/2] Replace unwraps in doctests with graceful handling
Date: Sat, 16 Nov 2024 20:46:16 +0100
Message-ID: <20241116195221.373332-1-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are multiple occurrences where we use unwraps (or other panickable behavior)
within documentation tests. In the following patches, I try to replace at least some
of the occurrences with graceful handling. I haven't touched the rest (yet),
since I am unsure whether we will all agree on this. If we agree on the handling
I can submit them in v2 or as a follow patches.

Daniel Sedlak (2):
  rust: kernel: init: replace unwraps with the question mark operators
  rust: kernel: rbtree: replace unwraps with functional programming
    paradigms

 rust/kernel/init.rs   |  6 ++--
 rust/kernel/rbtree.rs | 78 ++++++++++++++++++++++---------------------
 2 files changed, 44 insertions(+), 40 deletions(-)

-- 
2.47.0

