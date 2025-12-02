Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B292E36F8
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704325; cv=none; b=g4jnAHqTTSCDnMtvlvOHmwYAJrTRZxK0oUOwCsVOBiLc+NszY6uRwrldAZ+4o1T6ugv5G5wbwNtQcr4S9vc9twgZ/j1OfiooJX1yk2nyyTD67jlndUdmxFdUyb7ZYpDBkvUsS3/+R82SaV+8+027jvPL9Aha6V8Zi8yqMD8sXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704325; c=relaxed/simple;
	bh=b20MU/D0uYth/K+R2p09y0xD9pG7LXGVYnU/nzsG5Ro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=efXT0lyu7HvFn0MedWQsyP+orz6HHCWMk2NB23JztHAmpj8NSSf7KttdXhIosAQAdlXpzLLGcI5awkcrRvR+tkKey9XjA12QsOeA/PtJsg2eql7Bz0x73dGAigyvNyvh5HWtx+wUG02B4bD0EFLlHYjuiz51Xugim4qlVGMZrnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HCt8gfEE; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HCt8gfEE"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b739a4cf54fso729520566b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704321; x=1765309121; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9NCtCRRCoHT0Tb2Skyi2ibvc0P36h0mQDw8/9oRMmc=;
        b=HCt8gfEEbAwnzTtkTYnTDcMY1su8NnekhBKEEpx09R1eibGpkJiwEphc4ewTb0rGAJ
         4qgVicrXT8K+ZYhQQ2GW9W0BKYcw02UDFmEqroTyMc+AzJ98hwMvZ81XtacqUh16Axm4
         BAkKRIZ5EO42hjt2wSFx+9x8wmjHvR6J/OYmTS/HYLJThK2yKnxEgTn4JSLagnh1KsTr
         pqMH1edqiWBrROu7w9Fb3BiYAikdufJOijKX/S5eb8fgyP+G5LAwSZ0cn1O4LtRrR0kq
         x2b/5daPcpSWjHuBkM2/IG60X/wztVroIL/KpZYN82f+HFEEzYGGKGN/v8seNDzT6xly
         Gx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704321; x=1765309121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9NCtCRRCoHT0Tb2Skyi2ibvc0P36h0mQDw8/9oRMmc=;
        b=RSMZjZz+K32UDrdlDo49LVeqkgFNlLl4uaaTf5ycQeXhSXaRHOf85E4gwRm9vRlL9i
         zurWYuWSUD3U5O1827mt1lLpUSfywnPMa3kIU5LfTLlCAnxenCed+nSodeiRYMgFIXco
         8DxOpyNhbz2hGTxV1tZ+SckljpbQXhO0JHSdT5T3af0kq0Ol8HLerJ3+Vh0YCNhXmlpJ
         Hz9jdg4Wiwd4AM4rJRAo/r7EGtm5yINSryVTGnQ809kkdNyzCcXp6seUw2cg/OW1ka8r
         3s2BBFAkeTYQ3tuwl2qyirTlO1m7TRSK8edms0317456Qz3wFor113RC82YVa6JFUAq0
         Vsmw==
X-Gm-Message-State: AOJu0YwPMucHZRKSpWslpcCcjXanyNh+9UABmKZB8wC0gX+TXInmAHDl
	DktpTE4l9e+x1vlXGAWsX0+QErVAiR+vt9srC3G8iIvQzwpIQaIznByevVxAuMdvNlEGMx6ToPv
	vvVEYxS6B1692cqS3aqncKZqIFnQ2YqCmhJvpnAXaW2V5hdNQaV2C6h542yGmaXrvEkbCvyEL1S
	A4ZU5vMTdFXwyiqTIr1eYqOyXfJ1yOOK1kMePziCOG3Lm/GJzxTbnkANubZujHAQk=
X-Google-Smtp-Source: AGHT+IFsRasJS8qn931/253KKhOOflSxIWSYontwI2/HjLoHyUZEtuD8JGptU8meLxSoNv2AacCPouUWr7QX+jw=
X-Received: from ejcvc12.prod.google.com ([2002:a17:907:d08c:b0:b73:6e68:83b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:785:b0:b76:3b3f:60e9 with SMTP id a640c23a62f3a-b79d11e6678mr34606666b.45.1764704321512;
 Tue, 02 Dec 2025 11:38:41 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:05 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=b20MU/D0uYth/K+R2p09y0xD9pG7LXGVYnU/nzsG5Ro=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0ALgkdgLbqN6LRscofluGzJKNmTI/W+l3c2G
 MMClFnlzWiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACwAKCRAEWL7uWMY5
 RmtAD/4s4kPCCbMwESEaBvAg7VDrDubcVtX95tAaNPvdmn5wjw+CX64PoMG+7R5/FDqSoZvEXZE
 ChbiEMKAnPAuMG4DXUPGSWvrGod9kxgsgG8j85unfiTd9rKKzaaUiR+OTfZhtCxNBu9KlSOiSVX
 8j/2m1LntQZ+wJORFkpuuvjPGdg2As5pon+iCXuL0pL6GZBgthzE/5X5RoDmFqrfcurml86K9R0
 AoZvwm+gnvAgt47oGRa5IjjAXMMuwvGnOHKddg7WC6YCTnhMuXqpDm+Ayt6Q/Yus/Rru0/vG6D9
 ZlxzW3yJ7FXl2ATAnzIxnNJXschn3+1Ih8PUZh7i/4VCSDa1SjoyhQB7KY9wXW04Mx9HCZa2k/0
 pmsezrgd/Si6E4NpwxOb8ONCJkzhyyarx9mshfCZ6jC1O3eabCf6ETvcT68mVcgIoh+w5KU79tv
 StAKB/+jgCzGnqmenyhLiEfCKndlcTV2Pd4fQa4QadmutoKMZVhKi3E1ThNHF38scCH9SXa3jfN
 gQBl6kmvbLiVOf49fvz6iAc/eKKyJnHGOf+2X2GVl6cEsJ+xOXY+tsUcjS8kF0Qv/a4ykFwn1Dd
 jLzkWfArdogr9MWvMF3sK0uN0aqNaTbejX2DQsXjwsJyvxNQfm6OOtY4twYm/JAr61q79XQB1Ul OU2NHk20cP9Tcxw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-41-a2e13cbc17a6@google.com>
Subject: [PATCH 41/46] rust: time: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Fiona Behrens <me@kloenk.dev>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

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
 rust/helpers/time.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index a318e9fa4408230881eed047154e30eb00e3cb6f..ce394641b17c371eb9b52dd1a753c04efd975d2d 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -4,32 +4,32 @@
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

-- 
2.52.0.158.g65b55ccf14-goog

