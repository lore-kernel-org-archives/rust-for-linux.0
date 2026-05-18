Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B529D261B91
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 22:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779145034; cv=none; b=KHKiDebno8CDGbVxzSakeThsLq8lhVIDrw7dq2EyvvnGZAPxhh6lTA+2J3oLSch/nUxo4KT2D8OR94iCffWTP5RL+GatF3gh68tEEI4L98Paiwmuy1OMS5/KqryUI9SN5X1PF7cH4R8NM/U/9lAO3lQDlimpME61UPTW2Gv1x8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779145034; c=relaxed/simple;
	bh=haEWJOXGVq37G8VG6CkXrfpCR7SEy+BT6hVQGQbCgzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4RVnsiCIvErC7i0lKsiZlB2wEW02/7c8UOAQPp7TwUNWPuJRonWnccWNWIEMInYwweOUDVCiNJmOAjdCWX/57pl8W9YFNTWljpY9SnqLiGO5LYgmXXvZStEyeD+6NVSXign9Y/4VEy+ziL8tiphzlahDFM2jIrQK3B1MCE01Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZyIvqOi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZyIvqOi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so18059345ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779145033; x=1779749833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zde3cEb9PD8oiwH5DHzGQLL2Q21RWPZd3SWoEwz1EpY=;
        b=sZyIvqOi+MZWScbgJyNhMgQVjI6Ig0+JYbW/w7l5vvqBaP1w2a/Srw27Vg0tbBuVfj
         sqby5zNGZnvsTXYuJZSxwEwj/psbu/eHmvu77C8dwaXlUdrI7MbhsWznSNq+Z3gRxABr
         YEkBTKtwd/8XMxWbvWvyH98Hk+Lk5mrLzUR9JZQZqMynlTDbeW5160LQYgn8q1c0SRYS
         Dy8/zkaFxzzsxh7cRYkA3ARH1pzjZaYk5T88Fv481Mh6usIRlQblLZH1mscncok1fNYx
         1v/odoE9Jl40gWCRpY69h/GpZYDfOUuBlLvC2k1s0dH9GgasA56Jc9ZTadrGTz+A7Aaf
         2sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779145033; x=1779749833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zde3cEb9PD8oiwH5DHzGQLL2Q21RWPZd3SWoEwz1EpY=;
        b=rNzCPKSKADXMqpr4OC0VRHQKnue6Hsgv3ONGIB5prqL8r6q0YQe+Q69JPyNHognPjY
         Y1HIKGXcrH1tyNz69O80Cstdblx0ysxJyEG4/XBq4ZplkWQ8tLERxhTd6YmXIN2mSBi/
         cKFzGfdlc0WLYIygtaWO5e6fsVayO/suE4xzMakrYhTNpiz4tLbByqqjcZKpI9bJndsw
         a0UdT+wjTJD1Xy9cAGSMdxoU9L65W94+fuvi3F2RY2E/lKJt7LgfPx6/TuDpLSKj/vVR
         o5eDaWdnDHtJeLGLgXd7I9T4pe0eVNQete6/P3cmjObxrlZYpcfmdXjIVaiMtWOWe0f7
         L+fQ==
X-Forwarded-Encrypted: i=1; AFNElJ/f2VqVsQPyn4Dsnj3yh6khtEyQ89bza02KgVjeETfRfQcF4TQGfezbvVtLRDQVoLD/fNl/Vz8PWshVk3OJdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFHRhrHXYttnALYi9tFuOqkDrBg3BPBJbet8ZA1lrnt3IuTvA
	CD++7BUt0+dDD50PkdKzU2iJBvUyC/66RO3/nbJJ71plvzki1cGquPSG
X-Gm-Gg: Acq92OELuBLOxENFtCuzetf1nRrLnw5k0KksApVa0o9NmoIUaQtqarncIhWTteaXLGB
	i7willWlMbWobLqirmAVyJvahXGJkG0QEHVVKZsSuuuAhzd8XpSTqwEh/WevLMN2rForwdLLyFv
	+AcrflHkEpQjl1UQrxAhgIsuVIi+/MxkE+5UiJuOCervLWouz30X+Mzo6nWPj1yiQYmPtgntm/R
	rhMHBkQWav3q8cIyXYmYb2VnO+nERxD7uthLps+bsyjpl+09I9pZW4uQZ/oPX//+ZOkcu3NjFEh
	ms0NJYrMrwtXDMUtkLVomNg0FP4jU0CclBSCba2almYnIQFH5K8bUXLFzer85Gzmgx7kTqqr4od
	RGO09/kqzEGMygkAquf3IjAZZUYugYDb0dFXGlrV52w0D1tQD8Iu6phK1nYJpGB10A5+f1Z14HX
	s8GT8IKV3Pn663vw8QkUMvUf7r8doOpV9TEY6kVI1GU42ol7Lz00A=
X-Received: by 2002:a17:903:1ae7:b0:2b2:49a7:a5bc with SMTP id d9443c01a7336-2bd7e9e5458mr173143675ad.39.1779145033052;
        Mon, 18 May 2026 15:57:13 -0700 (PDT)
Received: from fedora.localdomain ([49.36.193.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm164364185ad.65.2026.05.18.15.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:57:12 -0700 (PDT)
Received: by fedora.localdomain (Postfix, from userid 1000)
	id AEA8765249E; Tue, 19 May 2026 04:31:25 +0530 (IST)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: tglx@kernel.org,
	peterz@infradead.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 1/2] rust: prelude: re-export `unsafe_precondition_assert!`
Date: Tue, 19 May 2026 04:31:24 +0530
Message-ID: <20260518230125.476165-2-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518230125.476165-1-ritvikfoss@gmail.com>
References: <20260518230125.476165-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-export `unsafe_precondition_assert!` so the users can
import the macro directly via `kernel::prelude::*`
instead of `kernel::safety::unsafe_precondition_assert`.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72=5PUubJDYD57yhEC117tzNo9h6d=7f8OiengaExmGnyQ@mail.gmail.com/
Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 rust/kernel/prelude.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 44edf72a4a24..dabacb5be332 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -101,6 +101,7 @@
     try_init,
     try_pin_init,
     uaccess::UserPtr,
+    unsafe_precondition_assert,
     ThisModule, //
 };
 
-- 
2.54.0

