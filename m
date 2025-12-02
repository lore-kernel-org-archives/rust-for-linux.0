Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8D52E9EBE
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704284; cv=none; b=sAzLA0fxWszWSDuAT9U78GvMk+ERbs0Q8OxAla8oYbg1ihrViATxd8vFBJSHSSayJSKAmwYQ4nWpdYTJUQ+uTm22HRB82zhJVDCwWZGlgwqIn0WyevMRopJOfQvyNxnNuC0EcrCH6HFPAnceCn7TiuEfva3PD9R0JDxJmPY7dJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704284; c=relaxed/simple;
	bh=ppCQQedRG6QEgOzUV4GKFRMR61T3LT/5XGqZFwRIOus=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O6teon02QddQkKMLhW2SDocJ1Q25iEfmGceVZcIzXh6WVkp+WT0cNShITYFwXJR0pjGQdvZKKRfZul/2qGD80RL1Um4HMoZw3wxo4/CI0lbax1utvpelc7suwvmKq1cA9VBsaPht9CKzFXbXSS0iLIqena18t/tvSOyUC451ZMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e3Qh8P9k; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e3Qh8P9k"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so40372085e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704281; x=1765309081; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sZsxYjovmGTq6J02Q6nQn6ZtPLgWnttqGqXOR/V++38=;
        b=e3Qh8P9kmacxyOZnwfCDCqDRlTbovJZ7H+S035k04jK5tz17PIM7ODoWFM1D4vqKap
         Tom2NKTkVKoH1v1vQyB6E1OryO2v0rutj4u5UWN+OpjAbZ7NPsX2LukEojgXOkfbvkSW
         R1KuJF28206Sj2FgfJ5D4XY13CXy32bz+IeiCMOd6bhzoYxXTJ0heix04ETNgOTM8xxP
         fuusKD0GDTbfcBAjv1A/2RbOScxHPa1ztTQvpDlnmaQzbXg/8GF7VU6ptKPoN0SIxwWI
         KJ/lrnEsUFibKZR9N3sfXvWmKk7V+Xq3aUN/YIknvhVfgcbRBzHMsFenJ8z3DV0WoATe
         9nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704281; x=1765309081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZsxYjovmGTq6J02Q6nQn6ZtPLgWnttqGqXOR/V++38=;
        b=g5+Rq452Q+nn3Mk0uqJZzWXufop+Zv2yfCUvIfhrcewu3uFRBwRsxUSoQCFy3XONeJ
         SlvGoe4e4QxByqM1mcz9fzy2HUflyMa3J7xbROPmhyylwTqabzkTQlwvlnu/0Cpsqo1A
         c5uA2P+8lbpBzzSyO0SmwBy5xmSfJz7um+mebkM7Sh2fI6xf0VFpU5FONerw7sEMCZrj
         2heXL4NRp0yKWZZa4qwoBFTkvn7HF15IiooCguXj/7/mqc2iV8mprwVlrBTtr+8ImXkS
         XOhtWykBzsoSZhe/ExsVvN7sxQeKZ0lscEP6ogzsx1GmsSRg3GCqeqii3Jv6u0mto/qd
         h0GQ==
X-Gm-Message-State: AOJu0YypHbswRhvpaH9vX5ScdjFeFE5TJ7hSPb2MPcNuu78EdBi5NWng
	1taExDQMQ/U0akxrJEjdL1uQyzqZOjtn080TH7ZSAa0IzrXWOiVY+jnoe0vw4M5wYa4Po7yKE2i
	QGbq6cK7KV6rfHdE2oDOisIJ4/YrVW0WnMa8yX4VKEFQTkMzwdwrovtkE/DjdvASxU4RWJc74tK
	8smz5FtIeN9R3/CXbm2chtkYWO/CJ3iN/IL+lhhLLSQ4eQTR+bWjEb+G06BJ4Jb4w=
X-Google-Smtp-Source: AGHT+IHigM7q34hUOIjZvwNaofXgFk2G4pUL8rhEitJknCx7q4UWaV4n0iD3Mefr5Ss4h1ImhAzm/D8lE4ou48k=
X-Received: from wmcu23.prod.google.com ([2002:a7b:c057:0:b0:477:7949:c534])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f0f:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-477c0165bb8mr427764625e9.3.1764704281475;
 Tue, 02 Dec 2025 11:38:01 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:34 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ppCQQedRG6QEgOzUV4GKFRMR61T3LT/5XGqZFwRIOus=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AH/yjqHtJJa7oAzmOSNV5ZKJdxkuhmGZyso
 2rgFYdol2+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABwAKCRAEWL7uWMY5
 RhIID/9V5sp0XjdSgf7sByl5KdviDaV65xnasWTtqTzgU4srWifepMp7SDbI4mmlmE6/GJ2MRDk
 beMf6m58sYkYq5cSQN+64sGTZovPxa+CtoRLcmHZjtOwdopvAo9f8q8zWQN5Ze8IGj+p+4G/rla
 NHKvdFJqevBZJHbSlUvHiwGaTTGXNkuYDfo9BkhPz2Sr6hNeUtxdabFTSMeRaBfbpCI88beQfYN
 Q79s/ahgrNit1DeXjU6Mrmkt32bi76oIke2/9GfwVqpKQimqZlop8t6GDRDitK3GArZFkMyumrP
 QZKnTvd+2j/bCLh5QOU+7iyLNsynOgr6R/68WuXllO42/H/VRNZ8uHfI0PuFTlwo/zvzhyq3Tzf
 zxM9ZISoEIHVtPJOxTLYpaC4X7ez0Yg2w7VGjma1RLMcsiEKHoRiz9VSClDG25B4nkOQGkBP9HT
 Up15dbdxZ5BGK3iTpZZ84iQhR52BfOMbjVGibs6/stzUqvTWaJ1XUfY/aa7RUXqOBKjEf3evUnI
 /o+BYbK3SVWGRQxxdnEug3I24z9n04GhZtro289yzSpRVJ56CPZInMM53dPW9jpfGaGBQhB5HR2
 F4KMJcSR4FTDvTWVNtmYLYL8m/xX/cwL+tDGxqRPe4Uox+Q7m7Kaj7NfzRVhM2zXzSyddqb5rgh O3fDZ75Gxk/fqaw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-10-a2e13cbc17a6@google.com>
Subject: [PATCH 10/46] rust: cpu: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 rust/helpers/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/cpu.c b/rust/helpers/cpu.c
index 824e0adb19d4c988a6d5974f3ed94e6708dd534f..5759349b2c88b483f445ea03ed92d174e16b5959 100644
--- a/rust/helpers/cpu.c
+++ b/rust/helpers/cpu.c
@@ -2,7 +2,7 @@
 
 #include <linux/smp.h>
 
-unsigned int rust_helper_raw_smp_processor_id(void)
+__rust_helper unsigned int rust_helper_raw_smp_processor_id(void)
 {
 	return raw_smp_processor_id();
 }

-- 
2.52.0.158.g65b55ccf14-goog

