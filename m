Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69F2E54A2
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704278; cv=none; b=qW41lYEoYaXank6v1wJ/olTOhEwbCT8yCYGjUZw4daXD71CLIaNltvwQYUuGZyAqWrUZvzHazp9h8G6HabGI9OwpxHqKkKGm8jA3UBUWJIGlpyJO71CiNbmTvOspcM0r2yjbjtqLfH14kW2GCnN/qWeizY/7QUZWL6omZpQOUg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704278; c=relaxed/simple;
	bh=uD9j+reHmCHmSrEyVog/aqUXZL+9jxZv7Nupt2ADvSY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T+1oXajnMy9KG9vg6qbNURAIFikliWSf/eRK67gkMyKF6I86NNIrg/3lMFwqubTUD08vAYg2V8pXkiPqR0LRE2bMtwaMsXGwt1I4gRrbVcn220qR9aleUrKiAXN8Jc605pSRNGT9Lzyil5odBbDAVVfB+tB58TQpyC6m7MZDobo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jT8nfLK6; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jT8nfLK6"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b73586b1195so733905266b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704275; x=1765309075; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tk0jlp0yP27cbQytEOCTLZJMfOudYPczuG81EZ19s80=;
        b=jT8nfLK6ew0zS+MRwmjqmTM21tPFBHJscRpUMsEddpUqfJ4hVWNt1yw54Np8g2Eujr
         tgCa0wcPu3YR6V9p9I953HC0u/XDahxWOPQfV1Vd3BV9sIHgGVEUCKawrLQv8yX9L1+B
         I9VoYqqIES1DavhIgsWkIuBRBG0vrF3h/+fPtgjPimsVzA5PfaTsD89SaNNY6csDf+yI
         NhFbv9N0pKqyqNfKTRPhij+MS9utVTl0bKBIOLQl4tBsgzjdHwks//jejeX0JCotGYzU
         sCobGbCfWeRbCi4UdHS7W8dZqZgUReMkgRwfZNy/1jf/1nPYGhU5dqbHNhh6TswA93Gr
         i/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704275; x=1765309075;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tk0jlp0yP27cbQytEOCTLZJMfOudYPczuG81EZ19s80=;
        b=HOqTO/SvlkVwUY8ViIgza/22ymP/LCWk2m2S7JR62UIpPZ9eHckb3JELUSgVkxQ0kp
         wlMs0dPC5GOGMoit2un1vf6cVxOb5HV8GAdtHtnTzXH9MWh/DjlESyf5GiaNvfOz96mm
         bPJce1yCalQSnUvmtspb3TAwXp4miqtVEs/JYYLUAe5c6avhItZZ/Qis2Ipnln6QC4+w
         UZXe3oJ6tDt9T2edYEs+q1niWM925z90+ayXCJIbpEaHRYBR5zfTpPgtsgMxxaZc9i7Q
         dywhcIKZ3DPK7KDaLlLolrAApFle3dpTn9XIGcyGd1TpdxU/+dkPW3ndK+TeffoSFA1C
         vMnw==
X-Gm-Message-State: AOJu0YzgFSRHJDGigcVSDiXazNBnc/f5i0XBBA9+CfhMmORhvQ9iF6jG
	AkZz10qT3h2k+N9o3b6jAO/gRpiMELna66FnyQ9AS4hJlgN2qfZkGef9enR/WRsgJPICYaT6evz
	DzTcNS7egI5+VXijRjlsUz7vqny93sMJgCErrIGx6gxqtKaaUfjeVlUgW77CJdk436nUIkZydfp
	zWms/7/7c6X0SUV0OQ0pveNNsF41bvaG882EQntX6ua+nEYlp3ks67ZJ37gGYnQ4s=
X-Google-Smtp-Source: AGHT+IE/YNamjRwj5ca5T3qJEz1eVSOTSd4qUP6wtwrB4BgmOn0VYvJoStei03Op8ufUluirwMAkNvwcn0A4HHk=
X-Received: from edbfi19.prod.google.com ([2002:a05:6402:5513:b0:645:417c:5ef3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:968d:b0:b76:c0af:779f with SMTP id a640c23a62f3a-b79d0f77ed5mr37709466b.43.1764704275118;
 Tue, 02 Dec 2025 11:37:55 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:29 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=uD9j+reHmCHmSrEyVog/aqUXZL+9jxZv7Nupt2ADvSY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AHryXbGVBbdOODmUPCCouvq3NVaJBUH/szo
 /GySq+VAEOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABwAKCRAEWL7uWMY5
 Rl6jD/4+Ic2b8oc4ZURno4q6Jm5HX16l65EZMB6RJi4Zo7kTQxr+KE51eQOrg+q896R6Q3fEzc7
 p3DXjlrd2hBKkvwrlDNNyhKX7REmVMo1ta9YQhoElzPxMS+mB2Ds8/H5v5rbwUEgasAKW4osbJy
 JoFWb8Uh4dKuywhIZISDdg3mS3wE5CPhOHI5akMOSZoPSF6U02BRzw76ADC0fL6zeYVb2uH4U+x
 bFHrvosbis6G7QbZwBJf/QVVw8cRsUft+y5HZmNhUZmk5983j2NZvlaDUwZQFQr3PMHiET3BMwk
 Xsl3At7+ErIu6fxukH9yBPNIWWTzcsR2N3vhoBo5mArZdWlVwSLmXFwcRKA8B+PSdDdo2OSiyYy
 HwyZ+zyQrrSfQjfsjKx4CTfIRsJrGnW2KpcfAWbvp0Sp++aKSbRyL5UTuNvtQqkl7Ig51paP9Fw
 ilA5dhjDbyxcFKhGqR9s+nULo/9bcEPKNx4HwelSGr/60as2Mhq1jRNg2wRHtAL4ojztGfCZkVq
 EfspkKYdqB3phWmy4aPhLD1nebM9UGIwpz/iv9/uNjYZuswuA0t7ZZaRxwssmbLXuAbjYYWtyh9
 79aY2l+dPrjzzRZpbvg+IcldN+CBuEhhUjLb8O+DgDrsQclQrqvceDuilyaU+q06Msna4tHoh+k MEepqq6dy5zCR3Q==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-5-a2e13cbc17a6@google.com>
Subject: [PATCH 05/46] rust: bitops: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Yury Norov <yury.norov@gmail.com>
---
 rust/helpers/bitops.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
index 5d0861d29d3f0d705a014ae4601685828405f33b..85be08b50a7c39e0627e4a2bbeaec110bf591ee5 100644
--- a/rust/helpers/bitops.c
+++ b/rust/helpers/bitops.c
@@ -2,22 +2,25 @@
 
 #include <linux/bitops.h>
 
-void rust_helper___set_bit(unsigned long nr, unsigned long *addr)
+__rust_helper void rust_helper___set_bit(unsigned long nr, unsigned long *addr)
 {
 	__set_bit(nr, addr);
 }
 
-void rust_helper___clear_bit(unsigned long nr, unsigned long *addr)
+__rust_helper void rust_helper___clear_bit(unsigned long nr,
+					   unsigned long *addr)
 {
 	__clear_bit(nr, addr);
 }
 
-void rust_helper_set_bit(unsigned long nr, volatile unsigned long *addr)
+__rust_helper void rust_helper_set_bit(unsigned long nr,
+				       volatile unsigned long *addr)
 {
 	set_bit(nr, addr);
 }
 
-void rust_helper_clear_bit(unsigned long nr, volatile unsigned long *addr)
+__rust_helper void rust_helper_clear_bit(unsigned long nr,
+					 volatile unsigned long *addr)
 {
 	clear_bit(nr, addr);
 }

-- 
2.52.0.158.g65b55ccf14-goog

