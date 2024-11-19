Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B01CF5D6
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044985; cv=none; b=kpsL1WsHRbSvrR6zqySYDMbtIzQkReNpLzHtZBkuGEPzoNd9WmSchJz0fBikVMDL5v77S1htoGnDOSH4EbWAi+4tZZnMsgGaEJDrrL1yF78KZObPj/FzPnQFs+UZq9XAHfFr/DFzYkg7diIPkMWmZo/k0uvh6R5qz61EbI74VY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044985; c=relaxed/simple;
	bh=SRiP3n15qooOFZWg5xLnUkjZLAeC3efqKWwpTwF6rLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PF73TWAvdeOPTLKPxv1/DNDf0vpm27CcQae9c71Oqi8S2Z95HG9XH2jAuafd3GIzHTDDTKqRzX56GvdXVlHiqKV4Zdm6KIUVTPXELnfpVsaCSBlLoOoDd/aYumIlFiah7OGjpQuVTDOlyzL/CRUn2a2f5/NqgIDZDjiiQiKfHg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=XCCLQD9l; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="XCCLQD9l"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so49471575e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 11:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732044982; x=1732649782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXnCDWRQwhX+72UPQl79xPSO4w/gNRm5H1gNcEYnhfE=;
        b=XCCLQD9lCiRjZDxJJw6AUv+Qwwd1K7km4QeXhrn5GvtDm8C+XIqqSfxZGOBYM1PnYG
         xiVxFMMcN9tKGG3o6rmWueNSlOR2lPhneVrWcu3tOxGMZya3ShS/jGZsVzJYial0nraa
         smD++EDBeeSy5CYjcnp3XHu7IjAycl4v0RcOqXaI+kpU1en7RaIOSeyTBNeGBGK1qTB+
         VQqiRbD4S/QhsqiX4IfCNY8RI2v3SAKUYdaZEFdBlP1pD45jJfeqf9yKwUgzU0Y+RyiH
         TN1mwBnB3wbhSsD6z54jKqUhhXx28l9h6t6FxgxzSwXsib27LchtKewDHfHtMzUfwl9i
         PhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732044982; x=1732649782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXnCDWRQwhX+72UPQl79xPSO4w/gNRm5H1gNcEYnhfE=;
        b=bsUVc2NxtxENFigAUy0Q1asg6Dbe+KtuoH9iGvjXAwW50h33guHGl0OGlAKfLmGE7l
         0VgyGw198T/9XsEcOD7xSWVdMzyvllqruwHWoJZ0EzMDFEfandA+wuTTElZNyt3hMLZ7
         uzPJ2/WOSapLMDXnppXeZIU0D3CbCZVvMyOmUhlxSfOHUPCGHRRx+7+Auk6lv0oWViFx
         gCrY1UPjPUqGpNlRpVR8nNjUaPdgnkOJw1Xf2FiVx/kCxrlQfZXkkvG9hQg84S7UeETP
         mL2lbDpEMvQgcFPura6Pcay7NhHvOeGgjyGupE7z31sqeaCjtMPcIM/es3ShT09ALFaP
         G0pw==
X-Forwarded-Encrypted: i=1; AJvYcCVXMtEZR3c62u1rYkZrwaMfiaGL9KNr1G2tgABRgAe+LtwXJ/w33/8hGwEC1IurcpNtRxxttjCSuopC+c09pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuf8qBahsB6Uq3XZ/SQpumIHW64izJhZrZrHZsOCxnW+ThfBW2
	Hg1AiT9qlW9ZVNQcNpnKmllxRyH8PH6fxtGtn0dwyYHPXLTThh9PiBo3S0KVfRs=
X-Google-Smtp-Source: AGHT+IH4LKH7I87CjXFl2fqScoucNE8ZP7Acoc4+GAn71xiThCfbWCCkpp3E5KMeK1pAwMbsQ/DD3w==
X-Received: by 2002:a05:600c:34c3:b0:431:51a9:e956 with SMTP id 5b1f17b1804b1-433489866d2mr1240285e9.1.1732044982371;
        Tue, 19 Nov 2024 11:36:22 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80869sm203127355e9.22.2024.11.19.11.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 11:36:22 -0800 (PST)
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
Subject: [PATCH v2 1/4] rust: kernel: init: replace unwraps with the question mark operators
Date: Tue, 19 Nov 2024 20:26:38 +0100
Message-ID: <20241119192715.38282-2-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119192715.38282-1-daniel@sedlak.dev>
References: <20241119192715.38282-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use `?` operator in the doctest. Since it is in the examples,
using unwraps can convey a wrong impression that unwrapping is
safe behavior, thus this patch removes this unwrapping.

Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYjXkqQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/init.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 347049df556b..81d69d22090c 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -1076,8 +1076,9 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
 /// ```rust
 /// use kernel::{alloc::KBox, error::Error, init::init_array_from_fn};
 /// let array: KBox<[usize; 1_000]> =
-///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL).unwrap();
+///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL)?;
 /// assert_eq!(array.len(), 1_000);
+/// # Ok::<(), Error>(())
 /// ```
 pub fn init_array_from_fn<I, const N: usize, T, E>(
     mut make_init: impl FnMut(usize) -> I,
@@ -1120,8 +1121,9 @@ pub fn init_array_from_fn<I, const N: usize, T, E>(
 /// ```rust
 /// use kernel::{sync::{Arc, Mutex}, init::pin_init_array_from_fn, new_mutex};
 /// let array: Arc<[Mutex<usize>; 1_000]> =
-///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_KERNEL).unwrap();
+///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_KERNEL)?;
 /// assert_eq!(array.len(), 1_000);
+/// # Ok::<(), Error>(())
 /// ```
 pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
     mut make_init: impl FnMut(usize) -> I,
-- 
2.47.0

