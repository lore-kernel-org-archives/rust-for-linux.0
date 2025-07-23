Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A4285CB8
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753271391; cv=none; b=Ov2Eq0iHGLmVswUzABvc3tlA4/SPLppbOJnByVfbjpx48L3CfCIs8N+Vmz0OLb97lnZnPgk90iRs03PsdKpd7EdBQuNjKTBBPEO4JZDgvnFQ5XYQ1BKDmxA7NhlWjlB/3MfNAA8RP+DTXIKKEXK6KAz2mAgn7VNbsSEewdK2GZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753271391; c=relaxed/simple;
	bh=gMfyh3DhpP6QRqu6AP4hBRdSuZ0RPcKCCbNeQJQJEM8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cMPN7/rzCudeTVrC14YH6/1bJhIYQlpKkynwblGR1d8ivlJN9vT1V2SrWes+7dbe0dWzqU+c72vaCONydHAe6YkUhaQ8+Vb7CYSIfEXF4+uyuncGAPP3ekzazl9R6rXFPxcv4dCz6I8uLcYwKfwPe0zDxHVWPd6wWx0B9L9gyu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CM4tmZqv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CM4tmZqv"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso6239865e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 04:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753271388; x=1753876188; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5LnxGqDbB7wAQRYWoQ7AYJR5RVrN0gy8dA3I4XCJfwA=;
        b=CM4tmZqv9Nf168GfBNnxnC6gwcNfGZzLs38iLpf18ma6JDcU3bKBy+yn1orL4yiOLG
         9RswSnt+WGXGBMBv5pbGP/OLkDpJo+OQeadgVfgfpzuZ6N185OguRwlxt8+TbFHp9JRC
         p1DOPaKReE95dXQNekDf8VTtPKg//fL3vEjCbqzfk1pSLrWJNNjjyDhX2c4ri7sznae9
         QMBEkncarli7JVh3P8juTPF82Tg15srjHhimOy+QpkZapj/h6/0wUehb5aw1fVipBokM
         8/otfG03R3CFLpFCPXeudQxhJ68XE8ItyNs5iJAyIL93MTG1WZE+PurSgRd3CJudPP/n
         Slgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753271388; x=1753876188;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5LnxGqDbB7wAQRYWoQ7AYJR5RVrN0gy8dA3I4XCJfwA=;
        b=cXNR4fkJAJZxmMEibLFqWCoywiSGPcCVn8gKAhzN9t7IR2KhrSMseYnArAjV+gr0f1
         ivactaJcfmGXunOqa3JpTkUOuHpy5s7SZ+7Mbwj8n5k3i5ale+LB6EeNY1JCA7gkdUlk
         V7p9h0sIUv6aABnCEpXC74yLV+goC6a21qEZoQegWdgFMcyAK0ac3p5D9Sr69WueeyHe
         /Ed5hQcgGUwaeZYfLjmRlibfdX2OBr4ezIDfO3XyqdwyaxWg3lrtjde5u91IDjzIr88n
         ihOOimEQ3sqhml/e+5UNl8v4hNwAlwsyNvc+VFpydnFFot0zpUkjfdScbtNXIhW5wSG1
         sIGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkVSCXFVwXUQK0j2KXm2aDjjlKJ6raMBULDw5JRLuebYA5K6F9VL9klclAc8dKWQ5BcZn450QDXCecTiHIIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNYvHYMuRFvWGP0bbKGTRl3TmOX6ia5VzIIBh9MiExi/rXJIeb
	XtUG8UulZ6+0arLX+zioYYnObWr7aL6kUeidNldAY6dUZmno+CkddXFLCZMtwoeTP4EhX6aK/KP
	AJA+NkyVtFVLoYclEBQ==
X-Google-Smtp-Source: AGHT+IH6DeHODF37loN+UROEj9Yy2H3Dx+J25V4vEnAzCpirCyXv1FFlN2BnrVJvgLP06iOmBz3R9UPogVNgETQ=
X-Received: from wmpz20.prod.google.com ([2002:a05:600c:a14:b0:442:dc75:51ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc9:b0:456:1157:59ac with SMTP id 5b1f17b1804b1-45868b23d24mr23002295e9.7.1753271388125;
 Wed, 23 Jul 2025 04:49:48 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:49:32 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEzMgGgC/x2MQQqAMAzAviI9W5gbIvgV8VBn1eKYsqIo4t8d3
 pJD8oByElZoiwcSn6KyxSxVWYBfKM6MMmYHa2xtGuswbH5FH0gVV74zMcVjR3IDTbUbKusIcrw nnuT6x13/vh+IyvQHaAAAAA==
X-Change-Id: 20250723-lock-class-key-cleanup-a3baf53b123a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gMfyh3DhpP6QRqu6AP4hBRdSuZ0RPcKCCbNeQJQJEM8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBogMxRzeiBK5iPb/SCHumjhrn4wgDlorCxGJtBP
 bY1sk5ChaaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaIDMUQAKCRAEWL7uWMY5
 Ri0IEACN3TOlVEDUIhzYmfdHRK0ipwmWNr9jYatNpt5ZjQ8yt6cOJMAL0xmB7lyXP8lecS8kmPw
 cr02JoJlClQUZzVk0JVnMfyLd5aFh8IdeDC0Wm66aA6Mh9r+hM/y4gBOCKdedRQDbrZKseJJcKv
 aoqmRD/ltJydTeVBQNcG3gnBV/gnqJZmHETk2XZCC0HQbrgvF01auVBKzL6FKz8lIWWYXvTPcQ+
 LWykJCvwTFG/d+Lqut0ELq3CsNWnp21NmXlOO3Ljk2W/ikM/lMr/HQTVcNfQ5Xf7QZL4iMj5Gsu
 VRLl83xbrVT5rMM5qrv4RrBNMFpsc897VU1XHB2kJV0CRhJLuhXEa3FGMK/+R122HYwAwFIsGc1
 CBJegqitDaJKMA8H86iCURNjkF7WOZBbqJx6N7HDmC2duVtS9z81SyXGDqZ1PICltJwtRxwJ5yL
 WugfT1G9Ej9gmUTNB8eb9L6rmE6Tyj9xeV2m+cYtAuyLLG54UYqqehQ/HsXCB9veLuyhhRqRr1i
 BrIfvl3b3t9qna2h96g6ItbBiZfC2kdUKolf7jgpdqTz4LDxtla715LE4WdVqWaZ5rZ8YAxUwOo
 dg8jDbPUecBaeqzesCZ82cK2wGyKbojlAB1lDCq/XF6KO6rWjg6UFdE/yftE8DoJuli04wJ18Iq Gfipo1BEnUqDiug==
X-Mailer: b4 0.14.2
Message-ID: <20250723-lock-class-key-cleanup-v1-0-85fa506b8ca4@google.com>
Subject: [PATCH 0/2] Clean up Rust LockClassKey
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series applies the suggestion from Benno [1] and various other
improvements I found when looking over the LockClassKey implementation.

Based on rust-next.

[1]: https://lore.kernel.org/all/DBIJLR7XNI6U.21PMPODHE83DZ@kernel.org/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: sync: refactor static_lock_class!() macro
      rust: sync: clean up LockClassKey and its docs

 rust/kernel/sync.rs | 77 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 57 insertions(+), 20 deletions(-)
---
base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
change-id: 20250723-lock-class-key-cleanup-a3baf53b123a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

