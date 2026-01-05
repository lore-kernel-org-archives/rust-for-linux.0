Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D866633C508
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616992; cv=none; b=hEU9BCeoFNhx21X0EwWlxxbttlMi5vjVulyIT4G6i/z1wqVait41djUsgkuAOp++L7PlPWDLR7YA0l4vj/WMUtPxn81RAT/7AmOykZyzWMchzUzeo0qCmUBpADNYqKfsc8MbvIIz1Ugh2ZbH4aJ5zFv8cy1lYWwIZtgwfwkUEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616992; c=relaxed/simple;
	bh=eIFTMJvvIG8WnTx/bh2M+JnarWwYg5CBU8VbbqLKFuw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LBDEtjh7HUHj9Pq1FbUeySocaZwIYmVzuaws7SaOkEkKSMN2UX2fUQB0zul66R1a2gexn0YAJppVqfCnuMDzgJmMLYXclhWxB3dzvk2XuVwsDbsiitEY4xkr+r4PkVIYZKiTzGp1YnrE0QR93TLV9o3oSI9ygH5iCt3+XafM8+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VfNY4SqI; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VfNY4SqI"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64b98593517so15028427a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616989; x=1768221789; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ1w17uWB1ETJtgqP9MglCAj+wjV3dPqqThIMVoGXnk=;
        b=VfNY4SqIudjD8r5SHcdfQOJlEWrz65z/QqXgOhguAbqv9ki/0Wcd4Qc3doXc+zGS47
         zpnSVjtrc8MSHDzmhkk6CbtFnqroGYcebxKpQM6oN0VpM5124rnpiaRtygQf6/jsRZri
         RHcuv/IuvFuHsmb2PDhFiI6GZPNvhcSJD2mjJpm9fkRkFaxxksVw+l9pgP++2YMRgbzM
         2Zwh7tsogtK6BWjM4tnWR0cEastWVBGHYN7MSRUod44f2gU7mt4UoFojznZHrYW7fiiy
         n7lNYMmWyngg3PmjYUztKOxe5uEWMr4PV9perBo4VUb0o4MnaKV9LEHehecVi5J3SiMf
         w3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616989; x=1768221789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZ1w17uWB1ETJtgqP9MglCAj+wjV3dPqqThIMVoGXnk=;
        b=coYiVXoWGvqWmXuaRScnL8jWnzwTcYwYfMkZD1IAP2R9Ryt/Ii/4b3zR348+b3Uyk4
         baupYUhRLwbJJLHMjxnsEErF86W4ecCUp+WLbo3843lpAJmLviLZt5Rx4a97nSzf1+UU
         FRg5J1w45Hb9TjB8F71+b5evQCusFHY1lGbTbHlU5o03xrsL75JJOTMLP6vMYJZwc5qI
         FDKgi3tcd993rwheQhD520qERZYickPxKJBXNtXxcaZIpcDO2D8CZulJlW8Gq68drwR5
         HyAEIJre2vIDNbDw6aBzQlbKj5AyKUbyop+5Jj8DXBLCMoFLMsiK1WoG1X8X9C1VzoPC
         75CA==
X-Gm-Message-State: AOJu0YzVfBZDVoervRO/OUtTc31w6iKvk26rhXWAudyYK7nBgrF81wS+
	IDnnEgydSvGQkI7Bth0ry6iG1ymV6P5GqnnmKNxEUxCcA7TT84g4TutIW0z6jYUvkWg/DJntNgm
	kD78M5SrLjqMcCxXoM97s6U7tI1IpZqD9Ku0XeXljwHhkff8QEW2Gui9g+iXgIxpZD2T2s78EvW
	MmYqlXic7cOujBbrVv2qReJt+vKOZ7y0hoUG7P46B/4zil+kni1tbWvATKk82GwxM=
X-Google-Smtp-Source: AGHT+IEfs7Tj1awy8z2piQbyZvKQSdOb3vhusJoHwVFvSNLuo27yZEsGUMNqh4ty+o1Y1P3euU/d7I+UrdqSx6w=
X-Received: from ejcrg14.prod.google.com ([2002:a17:907:6b8e:b0:b79:f6f7:595d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6eac:b0:b73:6b24:14a0 with SMTP id a640c23a62f3a-b8036f10e30mr5119035066b.18.1767616989208;
 Mon, 05 Jan 2026 04:43:09 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:35 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2084; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=eIFTMJvvIG8WnTx/bh2M+JnarWwYg5CBU8VbbqLKFuw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G9V1HIWnFSpQ0uxJw7pLlxRqHWjqHEfsI2P
 GM2lc+y/tqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvQAKCRAEWL7uWMY5
 Rv/wD/9dlO73AM8tUctSY75Ii5NfrQqeu2TgC61ONBspIlSFpXHlQ8Q+fesBtpDtlHTf9wa8lnC
 k81INDC1kRFs+SEutxbUq/l5EG9+q/Q2IVL7gTk4lNdIl7FLw3O9NdeAoB/sJbZicS0KkkFkpVk
 CnTJuJ/+xVuXQSqSk3IJeoCOP9sdyzPr5RjWJKYdsBXkB1h8/fTeQBhH2bc07fHyUr6gj7F3Usr
 ANy5bC8k7vmQ4tpj6YHQy0RljOydMVwT1l2riWXXOdoD2/AOC7ZJiARjneTxAJs2+jK9lyEs2/G
 CbVVUbQBYc7yeLxRmMWQ5Sb3WjCDgmr5wTeGUpwPJUfLVBaZTXo6yOMmp5gtaiYAWRQabMx5SnR
 Fm9zca8yl3biGM3bpQsc8+Nv6J0jtVIq0TObCwHjqcgsJEvvLU7CzhBBvIqX9hopzg/D67r7cM4
 +b3Dn4vAdMhEDehMjqZ4YR9Q3R6uOMeMt5ixDBW10ozYAAb6D9c3r355ogLeWChflTXlDemVssY
 jNBlb5eXlyEB99uJ06KMBybjTRralEW5+9056vJ1lxep4kLA54JzkKjEUJ4+4x50PmLSt9VukJD
 MOgEGNmWQxL6e6obJfeWx+JThgdDjJ/DDEZ8xU94XE4ooXMougH1iXDFHvMpQhrE8bNLAIyENwo fX8xpOl8o9BAjNQ==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-22-51da5f454a67@google.com>
Subject: [PATCH v2 22/27] rust: time: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Fiona Behrens <me@kloenk.dev>
Cc: Gary Guo <gary@garyguo.net>
---
 rust/helpers/time.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 67a36ccc3ec48379bc5983e58b1567947c5dcace..32f4959704939c0691bca03bad48b95becf21d10 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -4,37 +4,37 @@
 #include <linux/ktime.h>
 #include <linux/timekeeping.h>
 
-void rust_helper_fsleep(unsigned long usecs)
+__rust_helper void rust_helper_fsleep(unsigned long usecs)
 {
 	fsleep(usecs);
 }
 
-ktime_t rust_helper_ktime_get_real(void)
+__rust_helper ktime_t rust_helper_ktime_get_real(void)
 {
 	return ktime_get_real();
 }
 
-ktime_t rust_helper_ktime_get_boottime(void)
+__rust_helper ktime_t rust_helper_ktime_get_boottime(void)
 {
 	return ktime_get_boottime();
 }
 
-ktime_t rust_helper_ktime_get_clocktai(void)
+__rust_helper ktime_t rust_helper_ktime_get_clocktai(void)
 {
 	return ktime_get_clocktai();
 }
 
-s64 rust_helper_ktime_to_us(const ktime_t kt)
+__rust_helper s64 rust_helper_ktime_to_us(const ktime_t kt)
 {
 	return ktime_to_us(kt);
 }
 
-s64 rust_helper_ktime_to_ms(const ktime_t kt)
+__rust_helper s64 rust_helper_ktime_to_ms(const ktime_t kt)
 {
 	return ktime_to_ms(kt);
 }
 
-void rust_helper_udelay(unsigned long usec)
+__rust_helper void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }

-- 
2.52.0.351.gbe84eed79e-goog

