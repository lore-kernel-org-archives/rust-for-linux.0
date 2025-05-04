Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257E1E0083
	for <rust-for-linux@vger.kernel.org>; Sun,  4 May 2025 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377777; cv=none; b=WuKi72w3wONlxAUU5a5WiEO0+cXQPvV7C+0hA808M7yLy0EDDrJNLTGbnnkzr7w7EB3mhyVQ9dgjs5hSpBBVWl9DwHKgDBQqI+iSddivDPcTireKDqlN39US3+/WaFUjzVcckbmFCn5d0VKViDVRSxiLxFObphPRNmeGkVD8Mx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377777; c=relaxed/simple;
	bh=pyoBkH9S1HyzYsVNqF5+ry7CYeKD/wPfIjf7vRPUeIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dz0nlhfmVSlcA8QX++Y9zDaGhTWdlTWwaZKzBd4kT/M3PgVLCsjCIgXXR6l2eZ4KGPdF35C7YdZzpZs2v7AfUljJUuAN+5ll/HhoBQYBHlpZCHXdQkp/j1o/HLj0natsjDxjzPhg0uflu5PBEajTuWiasE1g5V9/D8YXM5s+7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=AsIzJ1l9; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="AsIzJ1l9"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7080dd5fe92so29569737b3.3
        for <rust-for-linux@vger.kernel.org>; Sun, 04 May 2025 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1746377774; x=1746982574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LkD+LhT+Sam720EEV5yVzWl68bPecMSgO8rhy/bK4w=;
        b=AsIzJ1l9U0oHNOaemy+Zpl5b+jFB3p6alO0xzsAA2QYNiQRH5e1b7RoynOW0OhxiHL
         KguEhOGIAET+fnsEztSRM3G5gGHh60XOhqwlzgdqzyfGBxSxBkRH4HRU/uYPWSBKaPkc
         xR9On1IkjodHya3UrbBNJ9tSJPAOncgXqKeD38sQ3eAZuNFxdJ5cYx7N+Q9ir6lLUYif
         X01uuntjjR85lqFwZGDhV3NQvCUDKJzxokZ1w1QvbXvyD+46VuRUk1VmTXvJeuOcaZyB
         qgLNAl8WN/8r7/q0n3VWHyaOVkuJRzCwbMA2vQ+4ac+lARlSCkb4p1nGHcD+lUcXyXob
         vPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746377774; x=1746982574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LkD+LhT+Sam720EEV5yVzWl68bPecMSgO8rhy/bK4w=;
        b=lg3WSsLNyXdtxlRLCDi7FVMrLNRhu+j/qJH+sq1XvOyH5g1SU9qcfly1edEj51B4/V
         OogWk1+U/SNhvPzpGepAxOardT7XF0hm4y0sR/kdG/5epuxFYtsQq2G/xfyJ+rDlfkUz
         cQNyJps/BTV2SBTaImIEPgydIUTSAZdNh9all5ciCiikRzBGiasCJFtSucSN/CHfCkTx
         yh4n8knEEGKgogSKuF/3tjPT9Tam5qvSyX0bXMyMtCFOEWwCZ8ej9bLJc4TOTxFvrW1r
         EnrhMWmcxhUJTWXTabhHuLuPJc4LJb9u3yxYI5s3YJwgZLs1Bmez0gXJmZI6rw1LasHl
         NSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC+Mro24z6Q9wXOTrCuli3W8tbpyNr5AXAjl2ZN3HKhHWdYuNk3ItEKAr666S5CDzPd04FihFAWxXtA54BnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXPQQcpguFpnssJA3j4q2d016YM/ZgkzBxPqMo1v5C+JnwAWtQ
	U76wfewYrHR6EmCc3feB6esMBwZj6/vinNIpvIsanvE9dxWnNQrBVac7dhvklYA=
X-Gm-Gg: ASbGnctvFw428T/+hznXTAhv7xqpNwu0XAICHaq1FlBBuiiL8ZiNrUrKTearGM40zra
	WmXjRI10ESb0oSuNXfi6FbJ+T+aeboPdmCiEaN8V1PT3/9yFXBby9SWmAa4LyKsDz3vJfQCbOpf
	cURCXh2mDV0IHm97GSIELvXjCc3pqvf7NHaEN2609aJBtF8KAygnkQ/7QCUdEGnDhc2mX6qhhWI
	UjXTR2WLK9+Dxvw7uplN0TAxRTk/H2XoKkddIIr2mZo5DM0x2lXT8S9o1Lb6RwqySjz0yspL/fo
	pW3jiEnYwZ+a0ovsZFR7vkp/+9eM8LFLu33JQCiT9g43oOQ1wwvxhBxyMSVspFg1P1cp3wkdZlq
	lorI8cvMYYGLTfwleilPAfYBbZT/aP38736Eu
X-Google-Smtp-Source: AGHT+IEcoClfG6tYYxtLdfiKcN2PZmkDUJjbeeqZ8jFMiDIRwAYO6oUf13XeUHin9j5nB48ttuvS2w==
X-Received: by 2002:a05:690c:610c:b0:6fd:3d37:99ce with SMTP id 00721157ae682-708eaeee18amr58101017b3.17.1746377774439;
        Sun, 04 May 2025 09:56:14 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c467dfffsm17567817b3.72.2025.05.04.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:56:14 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/1] rust: kernel: create `overflow_assert!`
Date: Sun,  4 May 2025 12:56:10 -0400
Message-ID: <20250504165612.86459-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set introduces a macro for overflow assertions, the use of
this macro will avoid local `#ifdef`s by encapsulating the conditional
behavior to the macro. In addition this macro allows us to document
the intent of the assertion more clearly.

I also intend to add patches that add use of the assertion and 
transform any existing asserts that could make use of it. I just
wanted to get the ball rolling on the review of the macro itself
before getting started with these patches.

Changes in v2:
- Fixed example doc comment so it doesn't panic.
- Link to v1: https://lore.kernel.org/rust-for-linux/20250504164349.84149-1-contact@antoniohickey.com/

Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Antonio Hickey (1):
  rust: kernel: create `overflow_assert!`

 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 42 ++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 rust/kernel/overflow_assert.rs

-- 
2.49.0

