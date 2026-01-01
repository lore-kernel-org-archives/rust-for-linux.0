Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39F915E97
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 03:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767239722; cv=none; b=esOwWPy9ZRt2ahKqYpI+Q2fKCR9N5B1pfhb24GOeKkJp65Nr6LQAijfFVLmN8uL6PdaA7NXbXvLnsxHUZmJdOICWRT7jqN6tfJiTrNt7867HLRDNmeq2EP5qLLdicHL+fPGD4ZDadU5m7DtE7M4xUsTXXJn7hg1bfPb/jXld1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767239722; c=relaxed/simple;
	bh=/vyg0ynh5LAMEF2mj8X9Csbd5f/G8rOZ2939OPD08pY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hdXhQrekTkXnm+ODGFKKdWMpdykPFkrOe/kwtxi76QcD1s7ypAzyPc2paArDFNWAoB+kOao5KmNNkLmKcNfcx7fJLNoIxbKSYWHTD2G1ftDHyAFRKz+AYza7PhjdrhGOpuwGfPTPkqRyT92KxG2iEqDZut7lh/Y5gjTwwUWaWTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPhZsICc; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPhZsICc"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4f8a6b37b2dso44064751cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 19:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767239720; x=1767844520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHJ9HSrCP71SSn2XcU2kZVrOG3UT/v21uGWNywYBtRo=;
        b=aPhZsICc82lvRxpn3mHF8lcAf2XUyWceV0Wl1xIxnoaL7G47TrAuA5rc2G/v3s5E2E
         XXcpplGGl5d3ipBg81UdhckcmImBqnecb6Ox0pXpeBvQvW8lwsw46gZqr1D8Tv+4YxnA
         crShS4/9wmi0Zs0r7bv009C9lbXgPw1KMdbDFYXw3yUfPpkJqjRXgWmGX1Q/Fvi2FF3e
         U030F0mReKUJ0IR0ySz4TwTshngjzQCdrkPnS+LQ2phw3WFKih7Cl9DA2Vr2jGYBAANg
         B4bJtnGzOZNB79wjCAGmL5ZTMpPjYnOgClkOVorhciXnCY703gdINR3K4Spo8Af+WVT9
         J2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239720; x=1767844520;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHJ9HSrCP71SSn2XcU2kZVrOG3UT/v21uGWNywYBtRo=;
        b=mlG2UN7mmupnz6wJz6iEILKy4MKcINSuRcoeHFJ7W0gOsEWZ5XFfmtV2sV66MLuuvO
         E8Ynk4n0U8tB2BQwdG/VkkTE4JrUwvWyqpE6gIo9VxR/ltWt2BTnwgkQhqDC3QZG1fS0
         iYRe9V3r/JQK3MeG1051NwuTw7gMSjCQjsylYlcQZoD86nAa/CBwEM9NGsTxNK2sBPkp
         GbnNo0KdJ0ngrnsKpHu3D9CZlUWp11n3ows+ftyHB3+7oG0J9/Scxtvb66G5Tlt2EMMP
         mlhnXBWWQxNJ0WI2HfQ4WfNfXE6McZk+lu+ALxH7cCwl9Ju03lozxFwsukwZiy/5jY1n
         76iA==
X-Forwarded-Encrypted: i=1; AJvYcCUZNNKcB9NbQMWOzuiHRl4qJ88b6GRtcufjR8KETXEW3Ph8emqZ77uVXk/YXNwvsWCR3qhBcDiFIBO0MlKomA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Q5yzg6Sxj005KkEzCqZQQxe94CFQpfis3rFdj2iEdPZDFj4f
	uOhtGnhW9ILAE3btOEVucBh/c8gVIu0Qohdxatsr25O942mRwLcOQ2QGUYzVrQ==
X-Gm-Gg: AY/fxX5ZeBUpt+CryjYz7BG04sZdps06A1Y3dbNoOBwcs5FXBdh+Z7xfxRqLHaHFR7x
	CQp3IK4mN7Y97B7z/ZSFFaLga1uXeJVVuAuNvt/FgyTe8EM5c19AVyl9MfuTTDjBVHoLl9lWTid
	UhMOUxW/HTTYE57Agw/KEKB0REtMQeaEanKuMgWzx7WeW4ng4eTdERYyGMDZdWp7KQtYeHXEq0n
	pFoew4LuEsXMOx7WdhBGBJkH5w87KkuxzZGdx39d9HAOkeknSwNrLZ5O5NZkA1JnW5ofK5uG0gz
	i1sZGfoSedOfQ4kMSGsPsK71/P+zIs5Z2YTjBT2ZeGawGN29kVMsheswWpAsAGhRyGgcL0PZWfb
	7pvtdWjcK1wtTJpS1FAybKSNdNrP5v1FYBBeEFWXSR0kwClIZ1ARoc+Ot6KDTTxo5+7E+8JfTRF
	zp3qbels8eVKMvMkSnKhxebi0YY+BMqg23mYt5vNJ9ZONUljpK1+zhfBQ50Q9RWjvmHqA=
X-Google-Smtp-Source: AGHT+IGM0rVADS2lnU5j12v/LNHM3kU8YwfTvvv4Iz7GzLiaw8hH+kvxJs1uiRf5TU0O+ftRhl7yow==
X-Received: by 2002:a17:903:b90:b0:29f:301a:f6da with SMTP id d9443c01a7336-2a2f2a34f54mr371027125ad.43.1767233502214;
        Wed, 31 Dec 2025 18:11:42 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776c1sm334899895ad.102.2025.12.31.18.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 18:11:41 -0800 (PST)
Date: Thu, 01 Jan 2026 11:11:23 +0900 (JST)
Message-Id: <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, lyude@redhat.com, a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, mark.rutland@arm.com, fujita.tomonori@gmail.com,
 frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of
 read_volatile
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251231-rwonce-v1-4-702a10b85278@google.com>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
	<20251231-rwonce-v1-4-702a10b85278@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 12:22:28 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> Using `READ_ONCE` is the correct way to read the `node.expires` field.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/time/hrtimer.rs | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>          // - Timers cannot have negative ktime_t values as their expiration time.
>          // - There's no actual locking here, a racy read is fine and expected
>          unsafe {
> -            Instant::from_ktime(
> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
> -            )
> +            Instant::from_ktime(kernel::sync::READ_ONCE(
> +                &raw const (*c_timer_ptr).node.expires,
> +            ))
>          }

Do we actually need READ_ONCE() here? I'm not sure but would it be
better to call the C-side API?

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 67a36ccc3ec4..73162dea2a29 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -2,6 +2,7 @@
 
 #include <linux/delay.h>
 #include <linux/ktime.h>
+#include <linux/hrtimer.h>
 #include <linux/timekeeping.h>
 
 void rust_helper_fsleep(unsigned long usecs)
@@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }
+
+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return timer->node.expires;
+}
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00..61e656a65216 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -237,14 +237,7 @@ pub fn expires(&self) -> HrTimerInstant<T>
 
         // SAFETY:
         // - Timers cannot have negative ktime_t values as their expiration time.
-        // - There's no actual locking here, a racy read is fine and expected
-        unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
-        }
+        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(c_timer_ptr)) }
     }
 }
 
