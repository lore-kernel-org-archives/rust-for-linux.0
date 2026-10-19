Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452898;
	b=YYoRfrdazpWHoWNvRCx1J4HevDi1eFggRLfPAephRkUfaFl8XCQ0OVS1aBtrEmHU311o
	 LnMKyDDjwkUNKov5zeTQK1gRQiXGz4gPBH9NSDAsfolgUxf7KWh27s42Io4xVLR0wQHgL
	 rWL8B+ddPHdEGD1rjJG4+bXDU6S6+w/RFfGgmJIjsgO5j4oR37SGp4F8a3T5xDIsy85Aa
	 VEpR+M75sxkCsPhatNw/C4L7VPFd23aci6UuhXv5xpfeFPWZu8XStPdzIvyKOCe5+fyn4
	 yWra6U9Ej7oguXYwngsHGEF72bc5je+yZhAxcg3g+Ao8Z1FpPuW/ZFKMg6AZ4O8f3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
	b=PlfE51EsN5bs7k2f78n/QFdlBXUmTIsO69drIO8jg+E+43ZYALQw2wDYFHygYFknovUS
	 ldnkgXuSZ0HzCRPdyEADpRX6Co4qnGDEA3O8swupx/bcsbHBL+bGY26ygSMbgqOaKi4TS
	 tpWzfmRJEUjp7penvLmUGAf4FnJAkMLu0WN0kPzA0+PY5N2P4+BlFjh/ViO/344eBPUjN
	 z4EpxnHn6Q/HyEzA5FrwvVFDdg/ezzK1R1t/9s/e3ZkiW+KXW4zO8/tHcjbzip+UXfWGu
	 SsYVjY25b+PHGKEEvmzPzNmzWhhCOBpiBBk4Xlv6+DMOVYFeNNHEDHpADTvJYiT5DsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FHFRpOka;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4DA606A328
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 23:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB4DA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FHFRpOka
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso4327306c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452892; x=1793057692; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
        b=FHFRpOkaIICGRNcFLtRzeNK5rhYzA6+DvfeSZOTUBL2Boxb4Z2M/YZFBgtoxP3+v6c
         aSLh0ic4LtDI4r7zSVkDMH0KZOxrnLd+PZKk1Z20Lsa94z+STTaFR5H6PJBPR+W9hHzi
         0P3wi1hXX/3qjlqvaoaNTv3TUfeM1NjcIrIT9rMr8u48R2EPto1DajKVJrkF80bt7VJl
         e2pejN+r4YG3KsXeIkLIzn5F3Wu8igfOhZAxCvarxfu4fKzc0C4oMMPS0pguBY2bG39a
         vwYM5ijphT3TbE6NFfXgs2zKs5R7qm4j0H0RK4QwFj8YH3b5ZPC66zjg7SSXttpGarLQ
         0NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452892; x=1793057692;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
        b=zMttWOpLdFSVKwhxcDSOwXgmnnpVFttyqiUJQZRiHOP5O43Ahx36qk37sz3m6UHDMn
         dhoRK6UMll/6ENlcQZpxpnvr2if465vKY7BlPAzH56F1Uw4AhmsftWpNodHq51i7/3f4
         s1rGGNW19ECJIJRBZSPQpI56x4TUle11p+J6qaRx3Nap0C+bQU9A3mXincBlLADI9JmW
         r/Bv4dTaPPg2My9xJVDOyiqmlwp+CJyPf9eMOtJj7lQFwycpZRGYxznkFavU/onqWMn/
         daCJE64M4IIooSa5xXVnceghBl5QtktoNMOQSSIE4JDtHvIuJLt20UbdtYpdrhCR3z0j
         HmTA==
X-Gm-Message-State: AFq9FYKtM0BfhBRZSOrCuNx5E7T6m8NGt96oJHp4a7wd9V6sowWT5rtj
	ZRvEv6hWDM2EzZA00i8zuPeO8SVZEtjz96bOizTh6kvEOZobceQWWBMEqMx5/NvYsuvEc+AdI/1
	EeI/KhFoTBHgJqD+7l9M/aLxcNul+5g==
X-Received: from dloo9.prod.google.com ([2002:a05:7023:a49:b0:165:ba5:ba2b])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4189:b0:181:5cac:8f27 with SMTP id a92af1059eb24-1876658f64amr14367338c88.35.1792452891323;
 Mon, 19 Oct 2026 16:34:51 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:38 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=p5U1adkcwaI6ibDBmAfxywKhSDWSVuWmXkCqpHz9YZ8=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXVoqtTc4Xnx1kdd/zrVinptqVnxlVkydJTO1Y59rBa
 P6JyedNRykLgxgXg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIpFOMDA9UV7cLd7ZeCZg4
 947UWbsd1R1/hHqTVfas7DnLZiSucIbhr+RTjbzXCSlWskZPvlzj7Wf/Hsu18+jczVN37z3y7r9 lGwcA
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
Subject: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
generates as c_uint. C calls them through hrtimer->function, which
returns enum hrtimer_restart. kCFI encodes enum types by name even with
integer normalization, so the type ids never match and every call fails
the CFI check.

Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
for lru_status, and adapt HrTimerRestart to the newtype.

Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/bindgen_parameters     | 2 ++
 rust/kernel/time/hrtimer.rs | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 5059cc74cb3c..6003d5127676 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -27,6 +27,8 @@
 --opaque-type spinlock
 
 # enums that appear in indirect function calls should specify a cfi type
+--newtype-enum hrtimer_restart
+--with-attribute-custom-enum=hrtimer_restart='#[cfi_encoding="15hrtimer_restart"]'
 --newtype-enum irqreturn
 --with-attribute-custom-enum=irqreturn='#[cfi_encoding="9irqreturn"]'
 --newtype-enum lru_status
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 2d7f1131a813..07344ed5fbd5 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -834,14 +834,14 @@ unsafe fn start(this: *const Self, expires: <Self::TimerMode as HrTimerMode>::Ex
 #[repr(u32)]
 pub enum HrTimerRestart {
     /// Timer should not be restarted.
-    NoRestart = bindings::hrtimer_restart_HRTIMER_NORESTART,
+    NoRestart = bindings::hrtimer_restart::HRTIMER_NORESTART.0,
     /// Timer should be restarted.
-    Restart = bindings::hrtimer_restart_HRTIMER_RESTART,
+    Restart = bindings::hrtimer_restart::HRTIMER_RESTART.0,
 }
 
 impl HrTimerRestart {
     fn into_c(self) -> bindings::hrtimer_restart {
-        self as bindings::hrtimer_restart
+        bindings::hrtimer_restart(self as c_uint)
     }
 }
 

-- 
2.56.0.212.g129ede20d9-goog

