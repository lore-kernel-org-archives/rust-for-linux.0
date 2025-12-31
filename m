Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93F3246EC
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183765; cv=none; b=SZLM2aioFjNe8bP2npasFdl3P4a85yraGNOqHW1dOV1TkqKUPHOB8knaR1bURoPdUxbyIGTPtlJ2bosRp7DraFWN+II8muzgNN1rl3BLLgIBYq1pCZGAkhIKjAFbeVt7dbqQ319JAPLynGXXF+zxHlq/TjDXeMMESjBKf5JUUrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183765; c=relaxed/simple;
	bh=dWGhxjFk0H0ccZ8Z0LvyX4T5xP2vhqe9w9Pjy9Iy9EA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UDtLnrnfOKSm6WuMBP9aywqi4Fu/O1F0tDpfX0vKIc6+qtlrfXLO2pc0pZDGxhUSIwjFNRPYupEif2avW8rHI19FlvtYujc6u9n6S1mlemFLBHyF3uCc9pCehgZfpzay7kWaiAp0eafxHi6xUmtLB5g3yjeyKtPzGcRsc3Xl2P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nQCx8LIw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nQCx8LIw"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d3c9b8c56so59407525e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767183762; x=1767788562; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IML1ayTIBjLRiL1IISCGMNFG24NcobrFATGIP2DkaPQ=;
        b=nQCx8LIw+IgysOK/5LWZzN/DCseniEUCOx83/YJLJoYGeRXt2B9W0ViIzG/PLVxErJ
         aPTCWHKdShoMzrvJLx7VlCbIKxZLE5/lAGpmOemIut2kSAYo5coyRJj2Z1fF/5d3jNKJ
         b1n7Uu64DCLHSIuSspS9y/ror7OQA/AKG/D2Cwa6CtBd0/elfRROWUYvDZXYfu2LKxuq
         U3hIl0Ftp6SOzCwb1M4m45VgGeeHVnNZV6iSLdXIt+/Bl3Tlrb9Nv62ydTN4tpcGaPpi
         VhMZeJLZ5CbMQoIK0g0PgDmWA86RLK3OLOtd4YRc0326TR9OGav+5mpSKb8Hxh0nico3
         rLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183762; x=1767788562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IML1ayTIBjLRiL1IISCGMNFG24NcobrFATGIP2DkaPQ=;
        b=LzS7doDMHIEEnSO5CMALrcyFQBX2bOkh7jHdKRjWMtuw5BOnLQtuyQKqr+B/ozwNbu
         V0M5xUsg/MLhihDgDsy8wNtq6mD/HjqeTu5RG8cDqTGHEH4Ag4pzh3FJYPzJXE5GiwPd
         eZfSPkVISgS0UUiyGbvR9ROB6XfhRF52lYKiXMPSGCRY2O20W/b1HpoZegH/2xs+jaV7
         /sLcu425BaadoUCFjejroi5hFQklUXFdVruofaDdIodoosZ29YetW+vS/fK2yvNcQ7FV
         StpfJ41+J5yoQ3Zo65OiSTKwYNuUtgER204pktNNSaJz13DUxAAU264gS6GkUWLDzlTb
         WXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGFbdl9RaRktNSrFyfF9S2UZP/SruTHQZMnBfG2/Xn2Lom/zq5hp2QZTfz3vzG93jQ76bCuJZhabfdpDfnjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvmDBGLD7NIRXlFRkWFzAir2bTiyvZYR2sVy8O8fPN4y/oSZyn
	pPS3HPmrVVRE74S/2F+iKanDbMIqyTxGpi0HVW+0YjmVix2gOhr9ft98DPfOsbMSIwO4F19fZ8t
	EbGSx9FnpEoRci2n0xA==
X-Google-Smtp-Source: AGHT+IEJ0sOB06BtEpr8ZstmrMz9PeNhPmO2C6GqJfhTbjec6TNWZvpmubPfbs7AHp85adb5H0AyCveolppYmsI=
X-Received: from wmco11.prod.google.com ([2002:a05:600c:a30b:b0:47d:47dc:d5d4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:115:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47d1997e733mr293114935e9.30.1767183761820;
 Wed, 31 Dec 2025 04:22:41 -0800 (PST)
Date: Wed, 31 Dec 2025 12:22:28 +0000
In-Reply-To: <20251231-rwonce-v1-0-702a10b85278@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=dWGhxjFk0H0ccZ8Z0LvyX4T5xP2vhqe9w9Pjy9Iy9EA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpVRWLGkM6ekaGvNs/GppoXyA8q6kxlkpqLewuW
 7WNKhbTKjqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVUViwAKCRAEWL7uWMY5
 RtLUEACKkaSaNK/TcJXYBxaQi+3v3CPDHRjWTgRzkBlZ2cipngBrd+Bwm5aNQr6HLLA2wljr5zB
 sd8yJUc9TZdLiWbispUZaLCxJC+XAMVad9CXiS98PYq5H0Hv98uxbgcFI4T3nuHqM/xrG4OBMqR
 d9jwZii4XhRij0gUrPqQYAqX3+sb174Ah2h6tS1WLllr/7oegCZFedCpoObQ7JF9OwSXtT5VevH
 R2ZDKva3GoKaG0vo428LZXH/UDDFPKUn6o0Y1whhaRXdzIG5we6N/H53PjF2Q+OC2kHDHtqgKea
 xjKnfDl8tJ5TAjd69k/mBPk3xHvVo/vIbXfL35oFTix2yk1n8kcuv1Zx0+Qbv6gF1FSr5sn9Yot
 z3DlseF+Q4w5zWKbGVngm4+kn9Lo6gew72+hoQ8C2n7b9mGKUkCIqmNHamdglZznxgfrHGI8imv
 Lkz8hP73DNqX6vhQblP3+Fxt/SN84uREUef+vAAyVKFAIp7SprtvVzputk+BQAw+YVR+0f8QLLn
 eErdIcXGjyGhtXHOc3Gp79iwy56k9avNJ3qKMHDpuuC1LPYW4FH+9lKwRwkh6qmqJXW5Wd6RnE0
 rUhuFmIzHmZwLTF8u3QbBC9TYTfct5eLCQac3dju/Lnq2VWuei0fDBQanQibHCkKnD/nVST47AS Hq8sRXqSOcbvtBQ==
X-Mailer: b4 0.14.2
Message-ID: <20251231-rwonce-v1-4-702a10b85278@google.com>
Subject: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Using `READ_ONCE` is the correct way to read the `node.expires` field.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/time/hrtimer.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
         // - Timers cannot have negative ktime_t values as their expiration time.
         // - There's no actual locking here, a racy read is fine and expected
         unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
+            Instant::from_ktime(kernel::sync::READ_ONCE(
+                &raw const (*c_timer_ptr).node.expires,
+            ))
         }
     }
 }

-- 
2.52.0.351.gbe84eed79e-goog

