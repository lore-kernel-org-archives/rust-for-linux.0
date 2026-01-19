Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21202236F0
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805968; cv=none; b=PB35ZeY1J/rE1F8JCKDCJglVilPIvHrFT8DzEucdzT949H1CmyHV1BMajRUxX2KdXnMoLv/e+yxFOSUTh8pdX8gmrspvTzafzWnfyEY5e2AA+SYs5wTDNiXTN8/Kt+wX9gHFg/7DYxgoNN5R3CAv0bxzIPUUhvIQVHGKl52hWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805968; c=relaxed/simple;
	bh=v1mqfD6LFiSFTstFUCBRgNAvbRO7drwYQZk03L7haKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXZtP0AsatEzWHNrTor1uhETV1QDen+n9VwN+Ty1ie6XT+k4eZcNJ+lyt1Rr0cRbqyFbJf8N2fqdgOcISAmB4i/mCEFr7my3ec0XZUC7TcsDLOTByPJOQcQR/mCHtERqDzMlumTIroEwKzsVA43fLy/5UbxcpJNgEwR17PHJPHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bde0f62464cso1362345a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805966; x=1769410766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvDUsZAuyKWqrCkLJ85rxwIAFoO3AfJBjNhKexmATXQ=;
        b=jCXxH30Fn4jTTFQsdDRUiBgZaj5VnLCI8xHPVfmrEs+Szm28LM85y/xp+Ezsjv+Lkj
         SRvnpMfxvt0SFovJ0mcDvvs9sEwy9JwXJQX+Hw64ev+jN4hMPrqxoC71mUvSkFAgydtw
         7cin+kIw3adMka6QL0wue4Sd1Yj/HV0r9FDI3yZRTw8IXFEG8oY7pNpUdIhf4/UMFDLZ
         s6TVinPCtx5/+yxnp9qtSe5A5uZkdD3RgrAMg15Lp5lYQVxAtxWnNwHvFmWN2JPmemWW
         Yb8C1dy1/IUILUarwbLn5eWAqwtt7dJYz+WGTqLMggeg72QaxzpBczlDsjJYqRgeYTGX
         hhng==
X-Gm-Message-State: AOJu0Yx50gO5fZVoVYNU6Tkmd4kgDfXywsAV9YwAvxwFSN3SBnI3WEOD
	RKn9FCXxOU1RXE+tIGErlTIirXNbZng9EVhbT/KyEzHyrIJTYCGYvGEyRRManpwl
X-Gm-Gg: AY/fxX6esCe+3Dp+/lamSwSKwdKhhxFg4XjP8+AnIQFVeecQIVz7dE8Rh3ZwdyZZMDr
	rij36Ye4JZfat39Vwyb7Bq5/BsjkDCGdFzIkKDB0jcc3RYwQ6azjQAtSAcW1SmNzCtJq+3Eh4E2
	k/jiODOlHK49J9nrxaY4jZYyxB9N43cm/qF+Y00HaLxA2ROlzpZ/XDICX5hoZI+RM8BrYI9YjIa
	Pi4nHOSHLh/zqx9f5mZmPmjfGzdQmt9lSDazYk231SFpMEFGWMzgLX4ybT5zjX5e3BpjHkf006u
	fQ324LSrvInVCUcgC6i3zi9+7Tn+/JqQOq01U7TuBBLUI29Cahvovv5OxJTYFytudhuJmpgtBfZ
	/0Kiq/U1nWdYblc78RUUZnzAryWwdNg1RoKtvF6p9ZozxMv1P6US0hCzBbRnUT8Ugj4ec8+LTkS
	U41M0V78qDWReXLx51gQgfWoFeOEpAC98Y89uStDLvdKV9
X-Received: by 2002:a05:6a21:3288:b0:35f:5fc4:d89f with SMTP id adf61e73a8af0-38e00d1541cmr8928412637.39.1768805965779;
        Sun, 18 Jan 2026 22:59:25 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d82fsm8161979a12.19.2026.01.18.22.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:59:25 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v1 2/7] rust: block: mq: use pin_init::zeroed() for queue_limits
Date: Mon, 19 Jan 2026 14:58:54 +0800
Message-ID: <20260119065859.1914178-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119065859.1914178-1-sunke@kylinos.cn>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
queue_limits initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/block/mq/gen_disk.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 1ce815c8cdab0..4620a86a88dd8 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -107,8 +107,8 @@ pub fn build<T: Operations>(
             drop(unsafe { T::QueueData::from_foreign(data) });
         });
 
-        // SAFETY: `bindings::queue_limits` contain only fields that are valid when zeroed.
-        let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
+        // `bindings::queue_limits` contain only fields that are valid when zeroed.
+        let mut lim: bindings::queue_limits = pin_init::zeroed();
 
         lim.logical_block_size = self.logical_block_size;
         lim.physical_block_size = self.physical_block_size;
-- 
2.43.0

