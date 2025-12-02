Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2122F9DB1
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704307; cv=none; b=rB1c8RdxsxFNohK3Sz0wVuXwkGyf+eiEscLoR1cN1PrLIWUno74roI/egNmfHfJPPh96E64Mf7Cme4ILUZ94p7URXsmBbxzykemAIfaJ/PtTp4XZxOFVB9kBexmCC593xskWEwplJNb/XGvkkB2T5Qxo+j1sEL/nOv8khliDPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704307; c=relaxed/simple;
	bh=1D+fp/+Bt4Zy4BdyQSq+tRaU4WSyhLl5EKgt+m5z4So=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g3GteirPhSDM2M70hMCs9zHi8k0oj/n16o5rKsfq24tZnDmCiQPuyknhInjsCkFTftNw/Z0yp2Iz7iD6BezZKqyd+wharjeJ0NBgojb4mamWoloMxp5GTsQrM4Bxm8MOO557yg8L2vTY+vZJ9H7GOqynjNWzgFV3wBrFVPzk1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h0rWXGiA; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h0rWXGiA"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b79b737f073so214644766b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704304; x=1765309104; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f/zp2llsrpkVOG/ol1VS8t2YJCLpWnWfTR6j9xW+ehQ=;
        b=h0rWXGiA/oJzNOLUywLLz6tytT0rq37y0JbECAwXB/ijc/mWCyLw4TLJL3t+kCjx8f
         3AbcTWMVlIb6k+NRie7rKjZoNwrUlQUT541JPrT75cBv4oiNX3WPkYatKZzJ3kI8X2Ly
         S4uEwfW2ogaFTE1iLeoADoAh2ctjab5cRahJZK3Vbp9inEUhX7Emh7xo556eE10HL8t6
         IgCVn4A3tCxG98QBWYkuC3bCGiiseFi7VaGefwR/LegIsvras59jMg/xs8mP5bdZYwQj
         WK/JvFnTxI+XqxHpfqUo+CzE4HpRX23TqrSeaIMNgngQDlB0pnjWWGFrQ5tYHuYGjT2C
         F2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704304; x=1765309104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/zp2llsrpkVOG/ol1VS8t2YJCLpWnWfTR6j9xW+ehQ=;
        b=wyJsn3AXChebFqS9WvzqiDoaP6+OCypz6fBMqOeDylF2C3PfyAfDIAHbdGE06Yk1Df
         cxGm3gvKRyiRPgumCQrQHVmZm2xEenTPmBYor8y9/Y60X3qO7gDVlnig8DTy4yzRB87a
         NOmWNAHpPWQYMkVL0TxAhuUB2dq4ruS5l7fjMAaX19yNdFkcp5PshKYj4xCjuM/LwspE
         PKHrLOESMe6hlOtWqk65NV3dDWorGAcn5YSm8EoV1W33jsHxymQDb/Gq67KXgdSh977t
         zhvLJJmVbzBPfOR85eIlkW6CytpqP8NSy1SkVNWlXI+nEi6T9wXArkj95Pj7jGCsoT7b
         hjEQ==
X-Gm-Message-State: AOJu0YzgEAh2kpqxw6fuU4EDG5FIX412gc7BcN3788KoeXCr8sYxh28n
	zFaZFL7VraBilWVjEr/YsqlaqodkCFZuFVYNvjGc07OeORi0tRQqkNMj6fmWtmq4D6NiaDtn26a
	v3RqntHiEiFw+P//R6uKFqyg2F/9WrlqZVMUY4gLIWwRji4PBGBBzQ5VPBwNUNQIQFChB5tfB1A
	FXbxym+yAGodQMLTkJbZZidGwBB1ltEWrkq0jqHp383icylF6MYu2Ftq0lwtya7N4=
X-Google-Smtp-Source: AGHT+IHYnlo3utOQQVbvr2Q+LN9JgO8EBW5b8wMAwGCi8jbMFHrkXMibx1ivdEeF6smcSduTER/AhJakZuFj6os=
X-Received: from ejcvi11.prod.google.com ([2002:a17:907:d40b:b0:b73:8e7c:deb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f0a:b0:b76:3478:7d52 with SMTP id a640c23a62f3a-b76716953d5mr5290932266b.38.1764704304091;
 Tue, 02 Dec 2025 11:38:24 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:52 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=1D+fp/+Bt4Zy4BdyQSq+tRaU4WSyhLl5EKgt+m5z4So=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AJhLMpuwg55UgGW8aCR8BJP7Hf+Mr+DvvN3
 lmHybmrRc+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACQAKCRAEWL7uWMY5
 RsrPD/4/oGOr0+46FpVA3ER/extqiA8k4QzbFDtHCmr2SaeiUSQyqVLofQ3zWL6GGszud9ZtK8t
 id/+Dkwj9yc+jQHP6osirMAqxwe/EgPwn7iwqhWUOMWRMY084fVF77+VhycllZsq01g8VwfwU//
 9QPV5CCSFlAhLsvBz+Xlhcr6Dvij+vFppShAXVlRAUVvDJIP65MIW+7JRfrM+AblRCEZKU1UM76
 TnVwK3pR4UXEOtD2s+2LNhDikrL7HQOEpPknTibobU+dPYapOld4ssTtOa8a//7j9MND2qVamVf
 xo5K1XjFSPHVDSlAvQ1BnNMVggNlN9PKItgQfZx8YrmCGmkm9zXb8jULWV307sucjZTSYLxD9W5
 01+c0dfqJP+SnGMirBa6Hw5/eXtKNU5eedeyqywICoTRO7/By2PJZ/D5rDhgfyAsuIk/pKxSzFP
 O4EsUNZC7GOT5bNSARTE49pP+nFiYOHyFfG6ZSNIy9YJug9cmUzuFHM49wCTuJ4JMtr2NYA7jBJ
 Tvpx7GqdpIKKB22M8FfYtsu6AoLYi27hL5qGO3grZgUW2/RYSVuZsN93vl1X2ZW63tmeGF9eiKb
 nX7vAkT/9q5UI+HeznvHU6DuSdusKGxdK+3YJUGJye8RDk7pEIlsNQb7ohd9TNUviYxbVF3xMqF SlKQa33Zcw3Vo2g==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-28-a2e13cbc17a6@google.com>
Subject: [PATCH 28/46] rust: platform: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Benno Lossin <lossin@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Rob Herring <robh@kernel.org>
---
 rust/helpers/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/platform.c b/rust/helpers/platform.c
index 1ce89c1a36f7913f6fb535f95e82c7a31782db0e..188b3240f32dc470dac8f5f25203ffa88c3544a7 100644
--- a/rust/helpers/platform.c
+++ b/rust/helpers/platform.c
@@ -2,7 +2,7 @@
 
 #include <linux/platform_device.h>
 
-bool rust_helper_dev_is_platform(const struct device *dev)
+__rust_helper bool rust_helper_dev_is_platform(const struct device *dev)
 {
 	return dev_is_platform(dev);
 }

-- 
2.52.0.158.g65b55ccf14-goog

