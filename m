Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBC6349AE4
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 17:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487185; cv=none; b=gJMfQ+EDWv5KXyjIyHzGdyoyGHkXgW4fyEcGx/ib1NWRnZdeutxSVHtT/IVhxvUfsxsikadTW5PWhL0nTLLbZKzgqZHDY+K+765Dhp/kI2ecIKB4XG9EXkQv1ON7IHxrsIXUlflSNldm50pMrFIJDH3j4TZQ2eYl6/6eqqVDKQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487185; c=relaxed/simple;
	bh=IjRHuTpiT+8nga3Dj0KUMGTFzzK26PsKL0LSeANYtnA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cXdpqYRExQpgUU5noqRELGhJyKY0g0oH62FmAWexboqy1EKcJzmk8MTYd7Ygn4OgCGsYqFzoP6m3vPV9iKFNtwNgl4noipsIeB2S5UCni6BMEZL+g0bONQWUKHosrJf2afA/gQ/qbr5ERx7SFc2W/6U5vF60j8qqMIItlesw5x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kOqM9kir; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kOqM9kir"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47788165c97so8433425e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763487182; x=1764091982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsr9EDrvrfrbSm42ypQifJGK4ENijv4mJY/VbEl1cDE=;
        b=kOqM9kirJKrc2FJcUr0v/TB/DhFC/0cDQDUgpGco4mGRAaX2gLyOQDUN+m4DOFWexv
         NTnqlAkB/ctlMi09nD618A4hk6lKUFVaHcO8e5xU9l2NrCBWXOchSALHNjQNlV2C+fee
         7QrBXn6j12P2esntGQdh9I0DBXdnuGd+vldWucM4q3wgdjp2HbJ1sj7kYtXygKlH9DqU
         p8P9LzkzT1P89l29ixyx5KSMESavq996W3C8jRvPvxZtBRdKDYqvONgkJ3TTbZSmTEhB
         bGOIsMKrDiIqfwK8wGL+Ou+8j31caHM/1dPxIaYECOhIJMMfuLNy9P2TwHUK2MCfDCp8
         Qg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487182; x=1764091982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsr9EDrvrfrbSm42ypQifJGK4ENijv4mJY/VbEl1cDE=;
        b=kvqUl30OtPECCToSj99LuPJ3WDBPePvSaUcls/yyv/IRpxPBFHgetHch7zANFCQkOR
         bXRFm0Rpfzg3x3WiwjLi6FuapgKeeZzWdZP+e+21j5YLQcig14yYNE+sl3c6NUhornNq
         lR7WOSrQyD/wT0ps8e3AE0uZ7EenNUQrt5q7NaRMN1Ue1JpYrP1DRSTe4pnydf5IcYgg
         ahEKtGSzVa4H3Gcf1EP7S650DQrhdY73B8D8a7DugzuaN+zw2PSm6nVEh5dQ4E4F2jqx
         qHFI3qi+wO836nDaLL+cQUTVtDGZNy6uSbD6Co8KPaQfXh68z/L25g+0OiH741XaXeVB
         69Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUwwqIU7ZFiImhxVPRmMZzvL/xtBKnCOyQgNpZkI20TSTQufdJSl8oTPm2k9k1iXn+6lmyddQp3e4s3+NDFKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRx0eMnOSevcjgAOEp0E2icUjg6orMs9HTTBt4Zvs1w1KEqy/
	h/TntIpl0v3x6L5To7KSN1bGPQM7ua+SYvxCDv3rTdFKNZt8lsiitRCqYghEfSAXfzERqp0t2hY
	EIl+RWpbcvNAzaAVy7w==
X-Google-Smtp-Source: AGHT+IEWFp0N/FvjE6HaLxq+0cg60TExxafyHzvgZAsxKQ0Kol5/N0lY228CBeVZ9oeUXHQG3sSj1Zsvoou+DSQ=
X-Received: from wmqo14.prod.google.com ([2002:a05:600c:4fce:b0:477:5546:738])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45d4:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-4778fe7f6d4mr166862475e9.18.1763487181759;
 Tue, 18 Nov 2025 09:33:01 -0800 (PST)
Date: Tue, 18 Nov 2025 17:32:50 +0000
In-Reply-To: <20251118091818.152ba4fc0c8a6f3092a36fbc@linux-foundation.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251118091818.152ba4fc0c8a6f3092a36fbc@linux-foundation.org>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=aliceryhl@google.com;
 h=from:subject; bh=IjRHuTpiT+8nga3Dj0KUMGTFzzK26PsKL0LSeANYtnA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpHK22fgFLazZswN/Av6zPD00NJiNyspFGVq5VV
 kMJ/I4o7paJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRyttgAKCRAEWL7uWMY5
 RhgZD/9YbGVt3yHk6ny6TZz3K5pzzmJaz2lRAqBFOwz33/mzuLEPl3NEjrXAjcY1HQqdASFwcc3
 XedyRmYTTTL10s32/a17oKf6ZI0UxAoHA0jt82JFESi9NYItVvk8d8S1gWQf89fqCP2AtsdB5bZ
 QjuNU1UnVmOlUtgqrwNVKhQ9LVPrZcE2H2YFnuSspU3Oux7zv6EtznBG3aRFyYy6yTrxhYACk3s
 pMlSIRyFT9Tgl98AS/c9dAklZutW2foHPIf7K1coRPz/n2df0GDMsStOn5Cp4/1Hi2FceiBkKZ9
 lU8EFQGgeJwtvofv1srh1U7yiZ8m4geJ2kXlCjKbxzF78FXTsgZzRGv0iSqtKR1sgKS4qKHZhWK
 VI+JGsQhTA7KKNWq3n+i+rw//R5vqBo1GobyKo5Y2uLW+BCrc5ooNsUh5aKIk9wdCMbKfXph69B
 U0n46rOELMEbrzezqS2I/qJHGx/IA8GYQknEAR4QKyOdx6DrvDc8AHbKeao+7ImP3qMswtIkMeT
 x7GkBQXhEoiIPy1kBqYQoLX4x+4Hj0cw1/aRRSCwYYsZIgZNbi1zKqpWo/Z1Mz7A6ux6PqFxfX1
 YOl5swF48pr/TyY6kNzl2i+mVm4KmzqiSbuyksTJCpI69oET9euaCFpBnhxxRjbXwdHC3hDIrKx MqQ3zaVexpm16WQ==
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118173250.2821388-1-aliceryhl@google.com>
Subject: [PATCH] uaccess: gate _copy_[to|from]_user on !INLINE_COPY_FROM_USER
From: Alice Ryhl <aliceryhl@google.com>
To: akpm@linux-foundation.org
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arnd@arndb.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, jhubbard@nvidia.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"

These methods only exist when INLINE_COPY_FROM_USER is disabled, so
update the header file to reflect that.

This fixes the following error on builds that enable both RUST and
INLINE_COPY_FROM_USER.

ERROR: modpost: "_copy_from_user" [samples/rust/rust_misc_device.ko] undefined!
ERROR: modpost: "_copy_to_user" [samples/rust/rust_misc_device.ko] undefined!

This error is triggered because when a method is available both as a
rust_helper_* and normal method, Rust will call the normal method.

Fixes: d99dc586ca7c ("uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 01cbd7dd0ba3..205e1e65f481 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -181,8 +181,10 @@ _inline_copy_from_user(void *to, const void __user *from, unsigned long n)
 	memset(to + (n - res), 0, res);
 	return res;
 }
+#ifndef INLINE_COPY_FROM_USER
 extern __must_check unsigned long
 _copy_from_user(void *, const void __user *, unsigned long);
+#endif
 
 static inline __must_check unsigned long
 _inline_copy_to_user(void __user *to, const void *from, unsigned long n)
@@ -196,8 +198,10 @@ _inline_copy_to_user(void __user *to, const void *from, unsigned long n)
 	}
 	return n;
 }
+#ifndef INLINE_COPY_FROM_USER
 extern __must_check unsigned long
 _copy_to_user(void __user *, const void *, unsigned long);
+#endif
 
 static __always_inline unsigned long __must_check
 copy_from_user(void *to, const void __user *from, unsigned long n)

base-commit: 3e4b89e970365db7fe2c4171be06c0e88e3bcbe6
-- 
2.52.0.rc1.455.g30608eb744-goog

