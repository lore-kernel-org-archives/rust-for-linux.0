Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7312E8DE3
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704283; cv=none; b=tkFNe/qQZqVaTGDlHT/Y3yJSmVdncU+CxwgFnA3DSCbOnbo2bMtePbFZQFO8IUEYaulZTZyM3GnJlBW5M13tisfX9Yhecwhx/M55grlZEuQ+BJPsNBbAieSQklkVOSlY9wRsOBZdu6JZb+VaHvC4VC9yOFSSujWC6q2V9fklYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704283; c=relaxed/simple;
	bh=AFNQuzpNE7meShdo2Q9iA3Lm6wmDYhxY7EbHhOsawIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IACDEw7BtSRZJZtR4hzFfDLiPgKatE5ioPptyNILgTt4eo9sJDbTfnO5JaZF56KZldbC8wXbb6XLslC6lARQ2/81BxqPoNryNVaJboOJxY3Zj7KxjGpq8bH8qctffASQ69T72Q40ucaw2yalUpVNrPzwQIPpEybulRtjSlw4iJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=28iB83Tu; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="28iB83Tu"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779ecc3cc8so29023525e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704280; x=1765309080; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0DBu2JzvBXQ/bHiSzyFFlsRf8BaL6jhwoTdjUDRcGqk=;
        b=28iB83TuQPCsRi/KC2EBNeLtGhqcwaCOGBe9zYeVx1JhQka5PkpPI2P6yqdvfVqXrm
         gDt4Xjc+O9EykQL605kHi859kN6GHbBwHHbFgxu2xKxHq4UweTcES7c8s4MjcmoTbN54
         AUVur6XAqT3VybmY3cjNNdvEQGkjbCp45wM0RPZujSoaq67FoWu8rQzMBjtssTT0F2jc
         C5IarUyz/yUgfiMJ8TwmtlW/wTcFj0jk9xyS8Sc+OWmOWuHOuUGOShkPxq+F2KaJgSSV
         An6Q2v1UhFq1PdsS/bZWMmD5BWuFKhFoGBpfzvwKP7dryf5nFRKPjCk9B5dzdptBgadP
         YYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704280; x=1765309080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DBu2JzvBXQ/bHiSzyFFlsRf8BaL6jhwoTdjUDRcGqk=;
        b=QjikmO3FUSIPj2jGYXPdnA5443/UVoTlEdYlyEodW7bFPNrH6VttqKUlEMN7300MZk
         COiqP2umXRph0YXSpCzTzLUIq1Ig0yAd8kaeqxU/y8C8RsRScydRi1BDefuNq654XHFa
         6KNKP0iy76uIq4q8BIwB3WsLVBklm6tz42j0PbI9dotuLEJn9sKe3+L/CR2Utn48kyzG
         BR8yhmB+/c+DRKr4SAP7CuMfmqa6sBKu7YuQp/YakSC8D1gk2HZGsTyBIYOwuKctl466
         L2EGJ5VdaAjOgggJ/f+XIk8UlzVcwUtAj+Xf2b+ykrLFyhv3mfpRY/i+H+TJvt3Fz6GU
         xXNA==
X-Gm-Message-State: AOJu0YxhQ0H+JWDu0cQAsVJGBp5QzKhPWOYTMpmIA3pTtO1m02cyiku+
	axiHT9GG+x65re7VoD07BELLqTmCZzm0AQOqsblXkq3zsYqKySwY51FqN9et86LMIdU/yBW58hW
	ZZIN6YaC4bXL/GRgTHLOSeMS/iWi7O9mw/FjjIbKJf6SJmfhB8eeHFEMgCw4WOOw1acUnuJgY3Y
	Rd0BMqVDRUg6JRcxf/a1vK/yM8OYAaRjnt1eUYrvqQpCVBqJOFeqpoqzIjFEoC/EM=
X-Google-Smtp-Source: AGHT+IFlSuappKIMEGW3tWPLVMe1wSD5OTvizXcuLPL83+o8h29LsIYl+nBEKbK3qjqYDccA7vtIQ0pUJDig+ec=
X-Received: from wmby25-n2.prod.google.com ([2002:a05:600c:c059:20b0:46e:1e57:dbd6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c6:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-47904b25e46mr288221625e9.29.1764704279970;
 Tue, 02 Dec 2025 11:37:59 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:33 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=AFNQuzpNE7meShdo2Q9iA3Lm6wmDYhxY7EbHhOsawIQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AHhKKv3flgplBNSfmeXYKgfwHbpxUz3g+gF
 /s5NkLTZrKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABwAKCRAEWL7uWMY5
 Rv1rD/4reZIpqkIL0w3I6jAJ/8/QT4/D3R+xO/eSkoAp/D0GHfeZ42XCULOzQOR10oxgKX+zZZu
 iOczSCY02uVLJMGbsTHRtbpa/IFlRHToIuEMCEaYbcOd56m+4ah8rwb3twJxN/LsK8LcacL+Uh+
 oeaPNDPREXCZjIK7JQdmy+zJMQIa3hgnNJbcr31EpUcXvWu4KEuNgxxQvHNH1dtw0J8+36nrq5V
 UsKdaMN14Zdv8Wx2ORnaQcUZFeH6M/X/lLK1bjDLLRoo2QbNkZ0SCs0pN5JtHVVA7og4lzliOBD
 /yKh5nTxOnH7PMwDdL//tXsn8xzGzWWPSKoxdJdUSptryssWKlxCFCL439yfo/O/fWYAkPY+see
 vF36sC+B+/w9dv/NgAyebrSVcp4ddiz6n3zOoqcjhyuyw1y0cOSQzbVeb1zADinFRU8Pw4F0JwG
 Yb/lEVwYTAfF9B85OpiM5+3CBRZ8bArFKibtV4YTFtbry4tQEwuyUOk8ckZHi6lJfpNUZckeS92
 I0U/aNgUjSraA7eNTwQIWJVZ+igC4DyZ7w3drSGgglc7w1+CyomNHVdhwersI0O4Qye/axjQkst
 wiE7niM6X6Gv83kUq5aWxdQigRzQNP+2lVksvd3u/IzTJ3AZfNpd8+gEgm3K0otyNUfswjvbm22 r+3pgm7OXH3/OGg==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-9-a2e13cbc17a6@google.com>
Subject: [PATCH 09/46] rust: completion: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
---
 rust/helpers/completion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
index b2443262a2aed30db0084efa00b140d4d5929bf0..0126767cc3bebd56db706048b8bc07c6788de5e2 100644
--- a/rust/helpers/completion.c
+++ b/rust/helpers/completion.c
@@ -2,7 +2,7 @@
 
 #include <linux/completion.h>
 
-void rust_helper_init_completion(struct completion *x)
+__rust_helper void rust_helper_init_completion(struct completion *x)
 {
 	init_completion(x);
 }

-- 
2.52.0.158.g65b55ccf14-goog

