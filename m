Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192733D6C6
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616997; cv=none; b=b4ybSQbMwzJP8Tg+DVmX2faWwL5mYBJMVpXrGdof1HQBttMzIw1/Rgs43lxJfw5M6NP3zZ85SWNei8E5YRUZZWKuN3e9T3LUNrAmO5tl5kkWZ75QRAchaFg5uduL4hrjBcyRLbUKEVcoaM/sOpBRkkqq/MnJJx9T0qW+jX+BxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616997; c=relaxed/simple;
	bh=v1+EGq7D4jBRtSbDav0cm8Io+YgiouC55ft1trA0hnI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qx+9lo44brgZJ/5nR2yBB4BW0Sn4psKM4LUm1d2wkx3/oyXPl4MYlFn34HLXzP7JlQBj0Ytq1MXcNSYiilmYnhF4Cre94yrchh9BLxcGUCRB3anJIGdCTWEcBuMAuqnpMxjMQSctKMzLR+DsXx6AAzK3klmbp1wXjXRV4AqnWdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y4pRt/QB; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y4pRt/QB"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-430fb8d41acso7320412f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616993; x=1768221793; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UoOGxHp5c3LEQKMG4m1RO/3O4mh51Ss+p/K+zAd3xOM=;
        b=y4pRt/QB74VdIxI0oN/UYSnHu7n4TpMQgqhH7UVv8kDVKcGSUOmiQmAjzoyWw8QVV+
         C1SevA1oUPmoGAPo97omWkMIjvznJulOpNGAVOuK1cSLghwl/zgzu71GcCumemGWlAZM
         m58RP1+rSVoeKCpiGbIb+VcNdsIgfDkxnieCO5bx9UFjwgEd3iuOTlduMfL2iJH7bjBb
         mJrXeNebYQc+zSJ8IHMNM6ILmR3Y04iIM26wEJdiEcqfe0Mtk/B52kJjzm5CeH+Q8hp0
         JpVddftgMKzoyQT8yEit2aTkKFf32vFDHFK9MHZpb8E64crEUeknMWkWPFoFSdeMkeTT
         V3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616993; x=1768221793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UoOGxHp5c3LEQKMG4m1RO/3O4mh51Ss+p/K+zAd3xOM=;
        b=iJ5B+BjEPhbB2AvDC934AaEXlg159iQNtPS6XHM/WOlYxXk5XU0BTkMKsVOroKiL6h
         uEDbEq08ASeY0QnT517aa+VEQJ3hLxJ852DBP/nrBSD1h5ypd/0aN5GkmkFSroER1QjG
         YRZNsb6pe9AG5q+DurzNxHVsudceXVsofqlbwjP17SOWi3/SygHDgBY/D/w2urjPVrqD
         AhTgMfk4jqOAfPB2togvXQsEWdXWicwBv7qAfBm8fHEnH5ECC71kfFkomXLPrGxDzw7K
         W+/9N5AHc7w0dqkxiXxLB05fW1doaM562tBL2hjxu4tfHr1w+dGNXvtZ6d5o5pXCLTGj
         Jcyw==
X-Gm-Message-State: AOJu0YwMHgBVHHrDnZgZAwRbkEf26lWfEybpDgOIaSQI028mK5aHRn3V
	ezFZodtpCiOX54kNUQezIHdG4A+pvQuUGQ45c09pcmdW5Sirhl7LQFEj1dw2f2ScWgAAUt4pKrH
	Zbztfz1zmRrnLoZfwQpDGpWlV2rKM+2QYpfOCQwt0ULe5YELy2rAoKgazNF15rLCeV7GZblbYnJ
	8vuV2rwG2utB8bqb30xxYw7eX5VT8Mgx+0jB5nCznQ6i+HFXtnH2eqVDQnTnDFgZY=
X-Google-Smtp-Source: AGHT+IHUqYez+/iMUKUQaXmY3dj1NztkTOdgU5SWcotZqbcXuu/PfaeGxO1uUbkNHg77sp/JLWLDlwlxygWUrsI=
X-Received: from wrd20.prod.google.com ([2002:a05:6000:4a14:b0:42f:b8b5:4f90])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:290b:b0:430:8583:d189 with SMTP id ffacd0b85a97d-4324e4fb659mr67711072f8f.39.1767616993102;
 Mon, 05 Jan 2026 04:43:13 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:38 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=v1+EGq7D4jBRtSbDav0cm8Io+YgiouC55ft1trA0hnI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G9RJLag7sgQFYM2+zmNQHG2YhqOjZ+yP3Bv
 jkRNBCma/qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvQAKCRAEWL7uWMY5
 Rk6nD/47ClWL4ZDSbjrwT0ZKbTJcQ1y6ejbZVI0gtlj47H90obYr/O/wMcPcTu6gEP3OfyN4YDw
 ME5G3NXw6oCI3Ouznq8QGl33J3vWxJzxjaRcYxAK3Gcj8pdE2cAsK9s9BbVp/eFBBEppZWfgX6t
 Fi/gqACeb5zEtsNrUTgbE8s8LIVeOaypdJju0iE5697oMG6cztsxss/o8frB1XkLVj7kKKAJQTv
 Q3TBGkObc9jsJduGZGfwi86XHl+HsTVfleJhF5hOZNrvKEwAQhe08CJ2DTAbUDmzwN5NSKciSYV
 RjHtikHVjvGLSkWryJ3Oqo/vmzAxjvG7g/uCPzmQw9MHRHLW2N0Jq+td2BEgiUGyskBJG0wPCLA
 hqi3zvDn/3q2NMHZb16hD8tuNOt8SvA4v8+UeZLa+l4CXUizxGPSRJHNVl85Wa0U+3dOG7e9OU4
 G0fOOIgPpsKolI2QL+3TVn34vaOwbbgXv3kyFOAlNpmavY4iAcwylwezWNOvqTwnlPJde4tacae
 EWcBGI/HhuCjwS5od25UJnTzLPcb1bY0eP24xdd4tgT7QOW6+ltxE3IPb+ITPaRNc5IczRW+7yq
 Hrhf0JLBkG3btJH2rBMQkMHVBVLmQqQHDhxLQE8WG203VgciA4gnksTvEtW8AmOinclmKXldjS7 RPUjYiUBWz8oXBw==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-25-51da5f454a67@google.com>
Subject: [PATCH v2 25/27] rust: wait: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
---
 rust/helpers/wait.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/wait.c b/rust/helpers/wait.c
index ae48e33d9da3b0a780722b79b89d8d766efae17b..2dde1e4517809d20d09cb9a355f8005fcb160d4a 100644
--- a/rust/helpers/wait.c
+++ b/rust/helpers/wait.c
@@ -2,7 +2,7 @@
 
 #include <linux/wait.h>
 
-void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
+__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
 {
 	init_wait(wq_entry);
 }

-- 
2.52.0.351.gbe84eed79e-goog

