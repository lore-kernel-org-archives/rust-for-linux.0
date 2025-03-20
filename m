Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217D1E32C3
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436539; cv=none; b=ffNpVulZW95lo1SZCYq+YUz/ob1JbNhTK0RJuxo6Yb2QDO5NHJZEJ4Eeg2pi0MMu9SIVW18PsWZvPpvUOR91Ct/8oIDI+AbggBi8tSNlUwZjAzku4P8NfJ4hk37M7wu9s0x0JDkczu82kx0HxfKKASSP0JQIiqCmYWs/f/GoU1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436539; c=relaxed/simple;
	bh=w+3mxkeJWPRgWkPVeh+q6udIrxC+GmIGcgfPuZvQ/hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5l4jYl8kXqasPrcG+yb6VpAX7+Qw7aV+84HmL19q7De8vD2ks3oiGYk15PcJOiKgQUGrszknp3faAJmcldvDWnONwwbrHkV9N3b8yrmQ6UttTrAVVI+/Qq+RW49UtJxspWNCPkEzMmtbgr7Pfl1dbQaB5aqVIETftGBfmfA1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=Sh/k5bkL; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="Sh/k5bkL"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ff07872097so2437377b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436537; x=1743041337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj78UMgSb6SZsH/TEr/IJNi7K+Iee3Ee8oiL2FOp1sE=;
        b=Sh/k5bkL+lqe3TpKVLgF5UeotqbmvlrXqNPMNxver0rBqSBpgYYlxY1/MVTnlcswiX
         iXWZ/MGB4GaOxwTP4Go7wWzPpAbTmKl8b130p5sUt5SSD3pTCiYRoJ1S/3obSTLF3bis
         5XRjsYvaMp61Q2Nv42sc+YUGiG8gmatm8jobU+nKlKccd/KxfDpMm/5KLcIHUqVYinU4
         6/rbMg1GQSH9SYzfG19y4qGkAX+cqv9qeMgychePNJTOrgJumvuHT68xmkPKGMIpcX/G
         XIVaothuqDWrDNR+TIQvFa67ZEPP47cf5Kl9aWmSzNtEYw/k/HTI7ASrVPgki0xHD9cp
         fjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436537; x=1743041337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj78UMgSb6SZsH/TEr/IJNi7K+Iee3Ee8oiL2FOp1sE=;
        b=POXIQ4m6VfVBJnDzZh9OdO7KMoWzk/8u7xFdjFh+hzetnUjaMvMyOeXe8G3zCRVOct
         XXsvET6ZSMz+WG6cdTUpK27u2LyPOPsGmFbmRgGaBJP7LrioDVMFzSsL7h6b/zay/ml9
         FiUYeic3QplwfxyjupH8puOQCvQW3yb8LWNYXN7jSrS/U6xAe4BTePyXW5MKj3VTE1CH
         mj0x2yucxc9xi+VKtk85EAmNnwqE0YOMEAVLZjb5RjkhUs7OKOhX7dUlNJ+Hl5xBmBbv
         Kr9YhuYdf0WFM+n8EW5/xCO385pyji/hcc4N0ZBYIb3dpThhteThCcGKyLHgGYNuJAyT
         o6tA==
X-Forwarded-Encrypted: i=1; AJvYcCVXvElVF/MmokdePDm+hAM8gNkkmWLTjd2zace/itIZSEX6J/95f/iIN7KAFZFAumUYkV1JvYEDoLaGaPjJow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6j0dAPPUITlDL5AN58ehGDbiM+rWKHaZMtVeQ17snMziHWnM
	LOaUDK5uhtLVnZ7UFVPjcJjxKMx2C5d1JFADpz35nHQqRNO2/uaBQsyd73Vprtg=
X-Gm-Gg: ASbGnctSdivif+Sfzarf13wZE4TfYrmF71xupO6zgx22ySxEzeIZHDmrZlVb5ISS+Pl
	dL97/Le35wk9QIRTVPqdk9aBqm8Rm3b6/9pzZYuLA29FjZGg1/j4HmiJF5E0DirPh4fJ7/p9vzC
	VOMhdNNP6qr4xy45J4g0inVTvRQRiOZupZBrsBCVnnlo8vYtjOC3xLZOwN/ek5MsVyK3D6n5ltw
	dww25TOEiIujanz5PiJetwp0m1xt44Bzv83q/7UYmewRHVLb3+ZsQIleQ9mkMPuRhv2rB6K91N3
	ZCWq5VtaknDxutwBjV8MEAvYcgEx9aIL9m86M8zUQcvFj3kZ4IpRZf1bp6AW87SyrKjPIQiOGeo
	EQiGWxl4yGR03hp7T+RQN1Ank7VvUaA==
X-Google-Smtp-Source: AGHT+IEkG7Np3EYPQLzZcOpztGKxz58/1QQ7YJesvBpbwMvnGp6f2VV8gB17oSsnBOO4JzGhyGZfAw==
X-Received: by 2002:a05:690c:7246:b0:6fd:459f:dfa7 with SMTP id 00721157ae682-7009c15a3a9mr71229657b3.36.1742436537066;
        Wed, 19 Mar 2025 19:08:57 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:56 -0700 (PDT)
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/17] rust: workqueue: replace `raw_get` with pointer cast
Date: Wed, 19 Mar 2025 22:07:29 -0400
Message-ID: <20250320020740.1631171-11-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that `Work` is initialized via `pin-init`, the `work` field
is always used. This allows us to replace the use of unsafe
`Opaque::raw_get` with direct pointer casting.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/all/20250316061429.817126-1-contact@antoniohickey.com/T/#mc7a4757e8c132f84228b728c7d123d73841501d6
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/workqueue.rs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 4e27df324d26..5cc259c1e502 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -399,12 +399,8 @@ pub fn new(name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self
     /// need not be initialized.)
     #[inline]
     pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
-        // SAFETY: The caller promises that the pointer is aligned and not dangling.
-        //
-        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use
-        // `&raw const (*ptr).work` so that the compiler does not complain that the
-        // `work` field is unused.
-        unsafe { Opaque::raw_get(&raw const (*ptr).work) }
+        // CAST: `Work` is transparent to `bindings::work_struct`.
+        ptr.cast_mut().cast()
     }
 }
 

