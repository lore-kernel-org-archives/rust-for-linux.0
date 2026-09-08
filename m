Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A08A5964E4
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890104; cv=none; b=Q4TcIj3tnK5RhOjCotYrHX4oKX97WkL5H9Hoc1ICdo6zEodF8VfXbpTMsWYyZTKYZ2D2wfCZZU/WugnKpEOryRE7jiwOJsWiMJh/AIf+MFbj5MPM965aqgPjTg0aoccPU+/0eFzDDL61ZDZ2lT3QrcpW43E4R6NXiccdLFzq5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890104; c=relaxed/simple;
	bh=WEgSelgW6dSVZwR7873ma3ZTENwuh5Q4mLYDRSu3THI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFh3tYJ8qM0GFW2pp1B5tOCLDtG+7P5iT5XfufigFkJl6AU+2jYn0MBZG7eWEZZKoDIgSw3i7Gu9PfvrmB1QYOG2Y569VVLcSBL1rlSF2uM+p2HDXLQtvrxLkLN16ALnWg+p3MQiic5pbXnDTuEmb2OWV0Yw2HPsteNEQUOE05M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfkzoo/A; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfkzoo/A"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b523efb0bfso3571072e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788890100; x=1789494900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3mHm6ZqbhRQ6tXzMkeFKmTWTzRDfTiWOZtRcgd3yZs=;
        b=kfkzoo/AZElw9KpAw2f9P6Y/dQ0SkyixkcnueVCD4dBsxCOpellhgEURzPhpf5qe3v
         i/7xGqvEfUDFM3sO+/47sbTQEUmJqG/0a7b79YhJCcuQrinVyzJF2X3V9bOsyBP1urm+
         hspF0yf2iCcLPSFunwWmWSFeiY1/eG/jBwI/jw8HuZAlI4DkD7zXR0EqtqAgyp1l/L6Y
         jiDPRElwgyqS1BNMvA5tv0Qu1f+VT73+mYkKlghq/Q7Xf8fOTf3RFxs0zsI1DIa8giVI
         q4ZzQ37CnzuIiR1/E5yMYiFIipFofaMJCpCaPzdoQaYWDSuKrkaB3M17KGQ0kUpOvruj
         WUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890100; x=1789494900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3mHm6ZqbhRQ6tXzMkeFKmTWTzRDfTiWOZtRcgd3yZs=;
        b=nX+FM1ik5d9nxcg022L+ZKv4nzf4+lNeMoQr6prubPMbyhnFJi5hDKYkvmdIfm3C/X
         buE2vLiDh322yqJdXncjEwDaHlDUeV0n5tLNMJj38J64hCIkThthurkQCsypuXkdsA1S
         KTjdfM3G7Aj5o/Pb5UQuGRb65mYI/45g/Hl+AX36QCJzdo1j7oukXrmADIshqEdpQxJK
         +1A0XeEHaO/nCagcpIwJfS6HnmD+bxYTCWbWSM7Buhi43mTjvz8O+BsAydcfuNnvXupX
         9hwi9ebO+MVfDYL9KD173px40by3W9b2fJb+m/uug07o2F5OpguyIuYS6c7fgTEkDzlT
         Behw==
X-Forwarded-Encrypted: i=1; AKwUvBxc83ICxvf4OMEtmAYN1efcldwYgE6Uw+aqt299oQG6yA41gLYIFTg524SdBv/BuZPkZbrG5JeG9HO09CtLZg==@vger.kernel.org
X-Gm-Message-State: AFuF++liipqdxB8/39Pyw6mMdu+ckclSBFO+j40mLONnxS+w1bNTs8Yp
	GqFNBxYg1JTrs73ppexSNIBsaWTdKNCjexYi4jBGv2z85vNYkMlnLk0d
X-Gm-Gg: AYBFou3CVYeYtmBk+w8aDWRhKv4W8noziBv3kw+r44h9by5NkY3koT5U7KLzqgDdhbV
	ja4KPruEENXy7sWB0YN5Cxolt1Dg35xqL4VI4mgKVZydxbrDXuY6dVGtizMW8QyC5V64p0PJ9zl
	JrSi1XZqOCfEU59NpTuZmA/Js1fn7wspI+N0iRZYmR4gWCAMT494//1h1MJVe9EFM5uckZSsPJy
	7Ruj9nojcQQxKlRIW8W+6aUttgjEOnczdn5lYdGjuQ2EBia2by6tNvdaldrfTyhMTkHkaPUOkxb
	K8is4jzhShwWo/BCCDDHYj0ufNGWPvP/Rew7c8n52TGdU6WoTzi+d50FZbuYHhbBZlYoT9PmAww
	1rYQc3yfQLCtZirkRU9ZFcUf8zOAb9NqyVWOqDUJUxPHS8FVjFXgYaD6eHYVcOqnBzr4wMC5bm9
	Nebklfz01jkrnY9QNRwv/cVdqmekt1bsmvwfNglRI/NH0CHyDvKnXbazbt79pilUhBVPSeraE/Z
	5BN4RAj34DE
X-Received: by 2002:a05:6512:8393:b0:5b6:1836:8082 with SMTP id 2adb3069b0e04-5b6183683cbmr7614121e87.28.1788890099983;
        Tue, 08 Sep 2026 10:54:59 -0700 (PDT)
Received: from soda.int.kasm.eu (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fcdf9sm3172156e87.46.2026.09.08.10.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:54:59 -0700 (PDT)
From: Klara Modin <klarasmodin@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mukul Joshi <mukul.joshi@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Gary Guo <gary@garyguo.net>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Klara Modin <klarasmodin@gmail.com>
Subject: [PATCH] rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
Date: Tue,  8 Sep 2026 19:54:27 +0200
Message-ID: <20260908175427.47207-1-klarasmodin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the commit b67d2d039f64 ("drm/gem: Add callback for when handle
count goes to 0") added the handle_free callback, it did not update the
rust abstraction, which will cause a build failure when that is enabled.
Rather than just adding another None initializer, use
..pin_init::zeroed() to make all unlisted callbacks None, and remove the
existing None-initializations.

Fixes: b67d2d039f64 ("drm/gem: Add callback for when handle count goes to 0")
Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Klara Modin <klarasmodin@gmail.com>
---
 rust/kernel/drm/gem/mod.rs | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 80d8f524f9d5..af8274134a71 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
         free: Some(Self::free_callback),
         open: Some(open_callback::<T>),
         close: Some(close_callback::<T>),
-        print_info: None,
-        export: None,
-        pin: None,
-        unpin: None,
-        get_sg_table: None,
-        vmap: None,
-        vunmap: None,
-        mmap: None,
-        status: None,
         vm_ops: core::ptr::null_mut(),
-        evict: None,
-        rss: None,
+        ..pin_init::zeroed()
     };
 
     /// Returns the `Device` that owns this GEM object.
-- 
2.55.0

