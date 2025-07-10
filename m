Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AF223DF1
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151039; cv=none; b=Vp4mHYsVatENlwGqwThHkYb9IMyO+x2borxVhHd2qMnRY9NidfnzGHJlKQTr0Eq7WgNcPVzCd9ig8/YefKP1fd4GDuZtA6pASeBlqOJtvW7YpBdRRpCp5bLXaVseR7MyjAD6ZzN0SGwBxK94O2nH8tFVeY8Sn/1ASEPuUk1Zrd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151039; c=relaxed/simple;
	bh=Og1yz/M22j7KCr3KXGbUronD/j14psa6uLKq5GMhcJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOovwm5Uru0+gD2BOQ7gU7rOcJ4uiInCsndW1k3YauOyrtWohFkPQJOLVksNyB5t4c/pYRHJm3UNzYCQnAuspO4JUu4STbQAhKq56cjNXUH2PAY7NrnLweTASK8E3FNGx+Y5MlH5hxTW8qObCC708lojyPkAkGuaAeXSuG+Bwjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ejm2NaVL; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ejm2NaVL"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7170344c100so8845187b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752151036; x=1752755836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zOLNdXLvXxVtoIWMnBKLvF0WB3PMzZJIOz9EzcurUU=;
        b=Ejm2NaVLgDdnxdouisdQE0m2YRq+zgARnhK1waTDEaz4xgedlNNy+iWyMCXNwaLf6h
         G26YmjwtDoAD06khdXW55WOjauhO0fUi3g2CGSjzM2wTnbZRVIs7I+pzxbLMLzfKtNi3
         e4tlpB/YOe96m2og7iQsiqKvy5BvkTPtmhL/O0ICHviLiqi0eeHR2KWuAwafPdx6464p
         SD8YTawF9WEvcUcj3c3JMdhWVS+0aB0ZoIt3gHm/VM6nu5pCtpBCsQa27YeticerB8Vk
         ZRS6qlv0aKvQlahs8kpwnq+dD8HTjeePqLBghZzzNaaG8QBgrGEEASqDXQboz5+38KFe
         93Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151036; x=1752755836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zOLNdXLvXxVtoIWMnBKLvF0WB3PMzZJIOz9EzcurUU=;
        b=aq0eXc9ri4JLdtrqzjIzItRFfj1FI+GtJcdES8pfH/WzQLVGd644cITRy6tkVpiid0
         vBTZDZ7sGR48RKHArplVYDMYeQ5al9G2Q+FEXpDRopT1pJ2kWm9UpNGRhI1pwmcpOBfw
         WC/QNByeMOlIb+wWcXB0wZD77cyQXwxqB6ZLhCkAzMtUNUPZgoMQAzXWhaoB5go8Glu9
         IGs2H1mRTcFJTLCUT4xog0eDW6eolDLqflw85hWMVgdguZO7XyKNRN2Vcs0qG7X658bl
         dG7yryNyWtPT0R0Cx6k2rOhSil1gGRu65RSHmNMd0uGvnQFZolCSTtnbDM1pCd2J4vN8
         7o1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVPq1qho3vCu/JozEh9xbbN0I8WbLkciZz4x6/cDMIW4v/SfftpFJGkgu57Qo5wlYWKFNxCwWnpxDiWsmy6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YybAuY47Xbdj2rfcZI93PUMShwLIcd/1xvI4ktfiHFBp32HnqRC
	obWCBNrxHAIwjbA045qoZwsxI3zJKVV8Nxo89Kl3T89KZ18WX049ZdEc
X-Gm-Gg: ASbGncv9PPjzvm+V1shrUrxYjClwI0/qs2Y0ngV63J6JxwKcNi8zc8aFj8+T/bLvB6c
	LoMlTunvmwb7woFUvR0/Ayg5TKlNpnpFNy8hBke1tm9O+UXdfDQGFilm1kLYSGO54UN3PT0lKl4
	jMqRc7zIqHwdvzb+ErZSU40pTMK/Rt3JpgqVeYSh0H1GprOV9SfdeS9mwFrlXshIVWkfSBdPpgL
	UYekrZszbd/Cl0RxH6nzTQ9uiDZcBHJwuni8jX/UxFOOW1tOk4N4gHkGe/sh04S/StFM3QlcE6A
	VubTaEyDv/gLfHBxkj/Mb9SrReCtxTyUkJm2N+rlFyM/CBEvjx1kRsZY2E8=
X-Google-Smtp-Source: AGHT+IEkfwUwEo1rXgAOmOAIP0WMmfXBZd/p4CD1HnjSrtfTHkVjWTr7N1Wvvg6xFwbtKzuI2FfbrQ==
X-Received: by 2002:a05:690c:3809:b0:70e:7882:ea91 with SMTP id 00721157ae682-717c47f4ae8mr39800547b3.35.1752151036373;
        Thu, 10 Jul 2025 05:37:16 -0700 (PDT)
Received: from fedora ([2405:201:5501:4085:eece:e0ff:6b68:de2e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c5d710d1sm2625107b3.33.2025.07.10.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 05:37:15 -0700 (PDT)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: viresh.kumar@linaro.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: yury.norov@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	Benno Lossin <benno.lossin@proton.me>
Subject: [PATCH] rust: cpumask: Replace `MaybeUninit` with `Opaque::uninit`
Date: Thu, 10 Jul 2025 18:08:36 +0530
Message-ID: <20250710123836.146825-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe `MaybeUninit::uninit().assume_init()`
initialization with `Opaque::uninit()`, which is an
abstraction for handling opaque FFI types.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1178
Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 rust/kernel/cpumask.rs | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index 4bce230a73b68..5f84b8797c2a7 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -14,9 +14,6 @@
 #[cfg(CONFIG_CPUMASK_OFFSTACK)]
 use core::ptr::{self, NonNull};
 
-#[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
-use core::mem::MaybeUninit;
-
 use core::ops::{Deref, DerefMut};
 
 /// A CPU Mask.
@@ -266,10 +263,7 @@ pub unsafe fn new(_flags: Flags) -> Result<Self, AllocError> {
                 NonNull::new(ptr.cast()).ok_or(AllocError)?
             },
             #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
-            // SAFETY: Guaranteed by the safety requirements of the function.
-            //
-            // INVARIANT: The associated memory is freed when the `CpumaskVar` goes out of scope.
-            mask: unsafe { MaybeUninit::uninit().assume_init() },
+            mask: Cpumask(Opaque::uninit()),
         })
     }
 

base-commit: 2009a2d5696944d85c34d75e691a6f3884e787c0
-- 
2.50.0

