Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA9D2F290E
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704297; cv=none; b=RkAMOMUf6odohtIUnSiU2S8KCcQb1MFfzAcnL3APVgGu8MICD68nRmg45+D7rldHmV9Gh1x7yJIGDZa7z1QrAfYqwrmh+VAosuldSTLevfJlaBjG18bwK2o0Jwp+9X1SPL/CaPo5W8itdhwQwdDVl2N1tXxsAUayGbC3ZdeBUv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704297; c=relaxed/simple;
	bh=UwUB+7DfZNlJYGIKMi/hYPyoEWQExdY7WWA5Hjo2XX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CAUGBU7peuZDeOS02n5Ke7RkNVz/KKjzS9y3qXtJHrejAt/OEZJ2kx5AiK9pPc2JpLuWTzshw1X7pn9q9JcC5NBcJGTawfz6dHJ/CDqg7Jc9AFSVii9MCtvlZ+6RnfWtZ6LroU+YGkhPpKKzU/jof6PqKwbXgaz1PXl/amIEuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LcnMGTTh; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LcnMGTTh"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6430efef759so5913991a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704294; x=1765309094; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XmFVnEAbB39QdUOxdohjuexvaXk9uFsAyR0IkFoTqTE=;
        b=LcnMGTThY5tSJiFYjpytR78emK5GGATyq9X0M1AlsEO3UMDAs5oBLcm9DnifXCZtRj
         9xuYlFyy8zp31Mma9O26VIVDG8bE3UL/0K1uhZ9yL+tajATfR+l1LIcZ3Mcs3pnvv4r2
         dK4CdigozVlvjE9zpqPb2n6djRFMdAgd57K5fSGgG8VIIbK7h7RUiGDj9isOoCseZxWN
         C3BPaOXEwqrw3rjN6PHNwpT+rx+pzvcArNES2n0+GCFi37U0PAVARjpEqvY5tzEX0xxV
         33MftVxHYnB303dQYagVdu7fkjk86WroX605K3/iKSTBdBzEQ690WgkitU9r8DT75hLJ
         z3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704294; x=1765309094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmFVnEAbB39QdUOxdohjuexvaXk9uFsAyR0IkFoTqTE=;
        b=IJqULad9y3JznETCTYdnjYIB3Kbr5TA+a+ZsDk/E96GMK/RVbLmXrYoJsTEMnedlpp
         6aSuZs5Ltr3mISdxdnKo2xtMfh+BhkZK38p31YVZPEH3Gxm+Y06ob9La1doZDHyUfcXf
         ZUKhmUOwscal7K43iyWfTKMgM7RRMJYBOu3EMgOXboqCZK/UVUwlgI3K93hEHbsZ9+jM
         STyWw1OhNXPElBeo45gMvpz8GtrdbOU8le3NabPP1b0FlUBT9S4yZS94sLdX8gX0mJg3
         Nl6Ukb2i4WOwUwRQwbeHmqnhv9md6iGzjeGdWQu+LvYGvpc/JPQyOZOUki5Kr8IBHxWv
         vnWg==
X-Gm-Message-State: AOJu0Yy1ppHvHoQuj64TMR9ikeeTRENVuQlIqzT3IY1/OdJdA7TqBUXw
	Aq5GKW6w9vPRo6yg9/vCujUP5EzxxpKWao+SMVDl4TPL7YXRdAzj+X3ltygq5nekGvvxDlgBhs0
	buW0KqbDGiJ6S5N1hOZN1ymOXB6mrrzwql8i3T5yqhoHvEgzlDqWGrojPZSTyCr4cVjH88wbTDi
	aiwVA6lZRjOdOYnOC65TGXIiZ1LkLjHPKeROJGgNiJ6Mv2rgAIsGiQANQDT8/GwxU=
X-Google-Smtp-Source: AGHT+IEY3965ftvY1Kcp5jw/A/+wwznTG6Mq9CzU3+B7WLBp/A4HpExQ73wqnxrRBCZ2wKYzu4Vc6Kg2SYlWARU=
X-Received: from ejcvb7.prod.google.com ([2002:a17:907:d047:b0:b72:b016:4e0a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7f19:b0:b72:d9f1:75e5 with SMTP id a640c23a62f3a-b767158240bmr4951829366b.20.1764704293597;
 Tue, 02 Dec 2025 11:38:13 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:44 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=UwUB+7DfZNlJYGIKMi/hYPyoEWQExdY7WWA5Hjo2XX4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AIwP4pw/t2dPUJ8GNgygq60osW44xZeVklU
 3rzIS3ef6eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACAAKCRAEWL7uWMY5
 RpD6EACAhso5o87kswUP+Sxh9LPZW1Fkz16jZtZ6DdJ0krK2tlewsHYfxbulkau6FxXzg46eCCI
 YCrXGMKows2TYxx0O8qEuBcbR8QzInMAI6FQ2Y/SxbUfGa7sA85BteuoX02e9VjosFRa2MOWB7c
 fSGEZoDlNIqUjFL3H/aJWfsgHxfGajg569rSFbcGd1/e6VInwjGvV2qqpi5YzyCK/RJgfU/4Jtp
 cKGRhA4rSL+G53kfYfg/VwFplzOjbKYST4pR5T9p9ockQKTFKfOJfmYnWCMjA2mDV/ED3CGY8j1
 1nkZrdbD79RmGjq6XOKPi8+Qz3N8oduSN2m7fLRy7J7tsrzCaIV987gISCalZ2gPVlPrCTzcMJ8
 S2BIMHUP4jSq7ydVAZfEPxki1ptgaUB7kTP5Unrc9L7ZDWle7H6tM6UY3KSe8ZIj/uqAoX2QKSF
 hTwYmGYE/WaidBtguBVCPm31GJcjTd7ICSGFO9fqRJqUG5C817kqSL/J/ACk8on3XRfLUqc/dCG
 UZFgF/o15tZcJNXCjyxd3Iyhuo517y4wlDw0ekx3ZcATEupO6DmkHo9zRBAn72qRywDElYu+A7v
 yEEoWwy5SMmZaYmFohTFN9z3vvQ5O4lXduT9cKebT90ImC0GVT+85PbOQq70WMYxwivIjOo9gR/ 2xajSaL5rLvm7rA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-20-a2e13cbc17a6@google.com>
Subject: [PATCH 20/46] rust: irq: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/irq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/irq.c b/rust/helpers/irq.c
index 1faca428e2c047a656dec3171855c1508d67e60b..a61fad33386621e8830319b92ee24b92fe7576f2 100644
--- a/rust/helpers/irq.c
+++ b/rust/helpers/irq.c
@@ -2,8 +2,10 @@
 
 #include <linux/interrupt.h>
 
-int rust_helper_request_irq(unsigned int irq, irq_handler_t handler,
-			    unsigned long flags, const char *name, void *dev)
+__rust_helper int rust_helper_request_irq(unsigned int irq,
+					  irq_handler_t handler,
+					  unsigned long flags, const char *name,
+					  void *dev)
 {
 	return request_irq(irq, handler, flags, name, dev);
 }

-- 
2.52.0.158.g65b55ccf14-goog

