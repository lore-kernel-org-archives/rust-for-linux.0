Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D52BDC0B
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764794029; cv=none; b=fm6/0DtwL77I8c7jT/XqAW2BMendYLAHOctxubTnRlRBnkUoYE1zCzTXFMjviaZlqkzVxav/6OcDKMBzO9UTE0zMTgDYLCYfCJZl6AW1H6ijxOgobT+JYaqv/AGE8xnp864/KaX12gNoBKvMyRoVTpb2ZdbqCHPg7X9xn4qUXwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764794029; c=relaxed/simple;
	bh=J+muBk4mTDgB1RI1ZZT4tfVZdbWbgRIBau1QJ8gHEE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=saqA4vR6c6mzwkTgHq4RXTxPzKDDjwnaZtyyfca63Cg+HTmAQQ6BYtDxRPa70LZtRyiUJplKQD0syIsdbJsxa4Ts0s5jVJMKRs63uATDJpksyq2D0w3dR5G6+Sbz4ji+0ZRTJwXtmQP9ZdUixsbvyQRjk2vbHrq4kphBexyH/w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCENrB6h; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCENrB6h"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2980d9b7df5so2461035ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 12:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764794026; x=1765398826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbcoowEBKtv4dFsBzZpZawiDy6BLzWshOi2J6vbhmoY=;
        b=KCENrB6h5OTSw4cdbrPnGEfMsm1gWreXfbvWgj2cPYAxR+2weg9pxYqxowTDz+eiAw
         63vZ3xa+JzxjtQC6+3ZFFRoKVuBKq1DLI0gULstCUF8hGSMFAbFEYe+quX4zRjikGiry
         pmbYU2w7+E9PzGV9/WEfY8f5iMC0u1ZV89PcoSUZb8sRRrSDWQOYZnuvIjWwzgVwKPgb
         /gvas8R4/emYJAH53UBkdTcfXOeTe1Ho8AWEr3q7xZLSLge9QZNL7GphrBfUdRvYI+6x
         MAaNaaPxFauLSz5TA8Y7Qkr/DJwi3hCibDh0dR/BRm2ur8zopjZLCS21HHXuRarCTdIL
         nk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764794026; x=1765398826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbcoowEBKtv4dFsBzZpZawiDy6BLzWshOi2J6vbhmoY=;
        b=OGLnba+2Yx22KQdGs5GrY7TWqquN5PdhtzVRewhTMwMQPZDqyYukLFu97/1IXqaBs8
         o7VSA4aoejpdm8zaUNURs7AiwtGGHxFQXEMhGsi6g1hSjKRW+7m3ApURM+ziDG8pSyke
         CPdIXx+IwE+I8evJ0UvEyI6Pgu0tVUkP+Ik3XjEtMBqfO8S2O+l7JF/s03UfELO76Jm0
         UM+/xseWk3DyxnuxHv0obLPeFKNGmIZ0pbgNCHhyCguIWnIHbqLDFzdXvZfTMC78fMl4
         CxJ9KXQOGk5Du20QpQ4OMrXJCgdVMSqT/BLuMilpMb/Iof1mY+D017z7SC+medMqiLbz
         B5uw==
X-Forwarded-Encrypted: i=1; AJvYcCV2oV6JoGi3R0SdcdGVAifW+hGtsQdpKK/Cgvmh3UlAOYD/orGOrIB76gi2PaaoDcnOZb8iCQCrLn420DwhJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVwI4GXqsCwKEY2b9Oh6EntnM1nX4tynmfe34Novpsyh0dbU5p
	mwPjBo/suFyMASv6x+62fRn3Oe+8KM+IzxMop9X/T8Pjr/N0PJ2rHlFu
X-Gm-Gg: ASbGncsJhDvBKw4CAiSNQOfdGh2pwJb0rw6kpi0l46D8gdH/G5hLQw0vBg3ie0uWLbl
	7+pw6XeMpFCFcHwI04LWRvFqRTSzWx/dfQJGr1NiPTiKa39g7ZaPx61UNt5L1MXwiqnQstFZYlk
	OrKqeNhmWxg4OqbJxGQnWEi+z3GZtDs/OIP2OjMOq+wiVWcnGIP3sHHOo8di4zeAljY+6+s85Fy
	80HIFtO6RBVmagBj/vtKZVzNQcLyiUU4DozHnSBHHdAIZN3y+Go0tRm+CT6V6s2hVY4Yx4C0EqL
	k0aE3LLPowBzM5mxjb0BJgKUNrCVg7AwlcLlmQS/AYA+iwUuq8KakPOHnioRqbXhm8Zol80sajR
	cW/72OPXnOSbVLNYZLI0cJl+Ho8AjLJXS8u86rJGbf88lHG6c5U5oK0YJifrAZL8688sY9fM3s9
	uorcaVteO++aLzKg7TeA5GDkENMBw6hH4=
X-Google-Smtp-Source: AGHT+IGo6ueLf9xzDjn3LAVkm/0AniLnI9rrcAGxICx5w71zIEegF5JfoZlBRnQoR43NUz3WU9Qb0Q==
X-Received: by 2002:a17:903:2446:b0:295:73f:90d0 with SMTP id d9443c01a7336-29d683d359bmr39224885ad.50.1764794026121;
        Wed, 03 Dec 2025 12:33:46 -0800 (PST)
Received: from soham-laptop.. ([2409:40c2:116e:6f1c:ab6e:2f5d:e763:cc6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce477e94sm192002545ad.43.2025.12.03.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 12:33:45 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: sync: ordering: Fix dead link to LKMM explanation
Date: Thu,  4 Dec 2025 02:02:22 +0530
Message-Id: <20251203203222.70415-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the reference to the LKMM 'explanation' document, using the `srctree/`
prefix triggers an htmldocs warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508301445.KuPDLTET-lkp@intel.com/
Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
No functional changes.

 rust/kernel/sync/atomic/ordering.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
index 3f103aa8db99..d71c4f582f75 100644
--- a/rust/kernel/sync/atomic/ordering.rs
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -20,7 +20,7 @@
 //!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
 //!
 //! [`LKMM`]: srctree/tools/memory-model/
-//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
+//! [`explanation`]: tools/memory-model/Documentation/explanation.txt
 
 /// The annotation type for relaxed memory ordering, for the description of relaxed memory
 /// ordering, see [module-level documentation].
-- 
2.34.1

