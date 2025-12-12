Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF82E296BA4
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765581558; cv=none; b=d3jLAdpckPHYDpCtKycF+16Cq65R8nYT80kfjux1mtIcZlBld4DUZN4BUqc9FnEs1GOKBQf4SxolAj7Lk0Z/2RF3vAiQCFnCMXWrtsjpxZMDymbhon0u5tMapQo1OAMyt+Xl5ZpIT2oIz8cADkl/XZoUCAWXU8LxuRB785ef09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765581558; c=relaxed/simple;
	bh=bFcYv1MbFW8gjmrAeZij/Mqi2+pZBoN2LXpfFJU7kNI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cUfWxGpo6nblDAAds/ma+F6APP1b/rFcMzQ/GbiBLnh8K7OyNtgufHrTDMzsjwxwZFKOhWwqaKNVXSIlW1SN2mC1mQVFwM1FT3OpXgoagqjTfxawStwQ9nsZ2eCMWeUOun2aCcAIfmUJsU9botpJdPL926BzggAnJHGz+R9d/pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mMJ1gsgT; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mMJ1gsgT"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-bf06c3426b7so2888983a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 15:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765581556; x=1766186356; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u1Qlgk9rErciQk+Dk7ECf16dPpPa18WrMka5vaIihMo=;
        b=mMJ1gsgTs//Fl5YB/wuHcEazgosKyDE3Wh/2aB8Z+YTK8Ud5m937Bho7W52zAOBOjk
         XzVThJi+dJct4regcq6YwpcIkzCHFyKcgRqETfu69e7XTnDh59mJz97E9W1sNsWNdEpj
         KiH3TouJrkWr8TIVMThvKDru1esgmA0Gj+sDDEVtkVnRCEc2TCiLRbdWoflP1UQTXaTV
         fKN9luExSUz51tgec1molbm9h7gch2+JVgTsUm9pu+eMgEq+a3x5Ko1jF7LLitrJd+eg
         9CvfT3/ILqa/kGbJ2Y+DnwCvFYheoIbhl7izF0cUJurvuoW+0RUaF4a4RV6v3dfkrkf6
         L2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765581556; x=1766186356;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1Qlgk9rErciQk+Dk7ECf16dPpPa18WrMka5vaIihMo=;
        b=fbYRtHesaSXvL/ZI60AtFODPtxr6YWWeGFSqo6zi5fLAjcHkpYEG9lbdCihnPCvxcv
         0wBdf3Hx5ouxwxdoUsxje7IpIDW6UIaJKuyiU1JcFBPjOo1s0Assw4+AsXLM4ef1qLL8
         X3I8UHp6kSxU1MHR8G3lzXuuJvMExC9oiL503QWoya+kyDgydAzqG5MWnHr0SDmOtNso
         uJnEdSdXdBf6tqVYQix/cg8uoBcvcV3d3sfYuAP+f2QK742G4Pv9TMdvFuPT+yzUvAlJ
         fjQGgF94aLmqAjl/yed/fDCX0If7k7rWrxY/e7o7+8iXCv4HUqya03tOPxWQ6BBPud4Y
         gMwg==
X-Forwarded-Encrypted: i=1; AJvYcCVK5lx7YYEKt/tj92RKKtUO02ZHcoJFZTWXWg8WUGaDwixjQVboz+S5zZwSlxAhfED+B126PmAEJx28f0vw2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGGpI+Eewocg1PMtDYTBa/aRyjlCoUDurW94he/MvTpmgU3O2c
	J8qVUXg8YidTGaQmZ2Wf5El2xWaIIDs+bq/oZRCUd04kdozNRFTISrn3L9DIWCN0S927L0HZYc2
	0y6lvpL2YMA==
X-Google-Smtp-Source: AGHT+IH8uu+/NOa9Jd5kULOOvslb8N9Zz/ST4zeZUGGv8PLm5OdXl+SziDpvRJWy5p18Py8EWPRASZsPBOZO
X-Received: from dymh34.prod.google.com ([2002:a05:7300:1c22:b0:2ac:3961:63b4])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:f25:b0:2a4:3593:9698
 with SMTP id 5a478bee46e88-2ac322f9743mr2133494eec.21.1765581555952; Fri, 12
 Dec 2025 15:19:15 -0800 (PST)
Date: Fri, 12 Dec 2025 23:19:07 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOqiPGkC/x3MQQqAIBBG4avIrBMcIaKuEi0s/2o2JhpRhHdPW
 n6L917KSIJMg3op4ZIsR6jgRtGyu7BBi68ma2zLxvbaea8RznTER69tB7aYwWyoFjFhlfu/jVM pHwt7jahdAAAA
X-Change-Id: 20251029-add-entropy-f57e12ebe110
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765581554; l=1499;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=bFcYv1MbFW8gjmrAeZij/Mqi2+pZBoN2LXpfFJU7kNI=; b=/lmZJ0suSiGgDY/gpUKLgJ46EG6+99qEEH5ywORhQht18WiFJC+l1uIj3ljvLpVw8A9Qgml5X
 ac1xLK362v7C8vQ0WsjtBc1ndftHmILIsoZSTaRLTudryKlLjJNNFpM
X-Mailer: b4 0.14.2
Message-ID: <20251212-add-entropy-v1-1-e70ad1bc9c65@google.com>
Subject: [PATCH] rust: Add support for feeding entropy to randomness pool
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds just enough support to allow device drivers to feed entropy to the
central pool.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/rand.rs | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..f93886ef4eec9c4356799f4b55916bc12c10c621 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -128,6 +128,7 @@
 pub mod print;
 pub mod processor;
 pub mod ptr;
+pub mod rand;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
 pub mod rbtree;
diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b3fb30f40a8950ac7b47d48129eb89024a1cbd26
--- /dev/null
+++ b/rust/kernel/rand.rs
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Randomness.
+//!
+//! C header: [`include/linux/random.h`](../../../../include/linux/random.h)
+
+use crate::bindings;
+use crate::ffi::c_void;
+
+/// Adds the given buffer to the entropy pool.
+pub fn add_device_randomness(buf: &[u8]) {
+    // SAFETY: We just need the pointer to be valid for the length, which a slice provides.
+    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>(), buf.len()) };
+}

---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251029-add-entropy-f57e12ebe110

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

