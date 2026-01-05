Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F6A33A014
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616980; cv=none; b=PV7EKIfQ/ZRyykv7Ow81rMFEnZH4gVNvODf+ggrO+Y/e7z8gFZPX3JZxElalD2eRwjn6Vs2sPj3ZjS346N8iwk5aEyTY7esDcoAYCwLu6N8E0Wr8S4Ps5vZ60YEmUPnKdE4PIHviyz6iF45Fxd/AoWMWE7fPv8l6muv1p9gGcOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616980; c=relaxed/simple;
	bh=BX4PuegKU7oLOCE5wiFJA5na7yprV+fKJdv3rgt7tFE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=reaLgYmTyRioKhk/vMSf7+HAYQlM+ENQ8ilyT+Cjhk+cy3jScukL7HgdaEp83ihNPoacaozlQpLhMi8b8LoydJ1yuZT/AmcF6gvhJVY9ferKzR36QjJDe5CpcddFo0OZCPtrYspFU0oS5gW81nNu9tIwV+rWs5Dx1e0354GdqVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jXFTePM4; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jXFTePM4"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64cfbb4c464so12106278a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616977; x=1768221777; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/gJDodFkXOSNkvELLtuxSLcrrcD288q4L1KbsVQUEqA=;
        b=jXFTePM4Zr7recY58WwB0bgDeEoEctp7XFC4DlB5IiM25f9PnOEJr9VbcmYxafeVtN
         bITl9GQEB2SnYiJsC08763YxZo4NeeqLU3hnH5Yho6v2n/Xf2Mc8g8Vqf9Hr75flk8Up
         i9s0FheIufunddbQrwj6QvA+Vgw/B7c+og7QsKZH3KjZjWfsY/o3W8SbIlRZIkyo77Ly
         Owwfp49+JXFzZ2zJqklWaBrtyIPjqI+rAkw0w/S8a8pmp32jha9A2gENlggKBG3SB0/k
         12qh6M+YGZTQKumvI89Btx9JuAmQtolsOf1GSMDTsF3HCwgSA2sKM2YFtgaaH7a1+6nZ
         e6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616977; x=1768221777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gJDodFkXOSNkvELLtuxSLcrrcD288q4L1KbsVQUEqA=;
        b=Tum9DGV2o57tzhNKfVpYiIywzUc6b4aAmTdzoAYjXf3Vw+EVD14NPB5Xr6iO9sX9D4
         sDHAtOHRmoSwzG5bH1n2LWfajQlww8QS4RkCC9BEa3RHNEP3RrQAceI93SOdSqok5ftR
         PEneTx4rhwftrlq9SaB1QJMw501e/zVvWCtJo8Q6Vsq89zhuU/jJNn1nlRyqM4AihGO0
         gE6GkFQrT2nbUYu1PqZGM9ANkdtL2zlLRd97OqX5DUwasoLPaltXEAzUzuyEf2n/uHo6
         b0asEb7beWanwhepXK8e4zOt1il37SYzowDnV+G/rydjTcRG+Sd/hq6AqVYndiHsmEF8
         PwAQ==
X-Gm-Message-State: AOJu0YzcSQS1mreqIW/1qnVSdp8ot/5QyTSxv5r1iBrVJ98rgAuOFs+u
	PUk86855sR2ZTT5MUyi58rnuTfSKkQ++VNUYYiWZFyn2C1J1WwBLXKTPJunksvhjuKZk1ZfihlD
	6Ew/gKWs34HPwQkqLYiiPap4PXJs6fNivtJ0FBQUx8Y4S4Lf0FgEIbp9iRaYggQ8wyvvTMhVCyA
	i32wHNM1wfwYGkqSdjhSwiQouSZhj8EMqbyPAruoyazYlxpECB9zwn/Zq4Q6LXX6c=
X-Google-Smtp-Source: AGHT+IH4+W1m7K9R6UQhNUgwUvJkQDSz0PygCwrolhpsUaAev3FcK4oxV0VVJvwHjfLaVQQ/0GriFGCKTgZ8LwQ=
X-Received: from edbcf5.prod.google.com ([2002:a05:6402:b85:b0:64b:a72d:4712])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3491:b0:649:9159:2432 with SMTP id 4fb4d7f45d1cf-64b8e94767emr49619947a12.3.1767616976717;
 Mon, 05 Jan 2026 04:42:56 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:26 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=900; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=BX4PuegKU7oLOCE5wiFJA5na7yprV+fKJdv3rgt7tFE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G8N/MMfWAQUaRb8EzZ55j27dutUYuOmUAb6
 GvYbt/CmqqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvAAKCRAEWL7uWMY5
 RlBZEACsG6FlA0XqF7HUX38QJ5IYTeXqRGHu++9MeEutwMAfufvXK8p8wNeFNxX7jBQGmJSAkFd
 PpvFm9Zv9NfLsVmdPjOdn6cZi2NXLjtYfMLi+L42tnB4LNGYiiqnoP4Y9QqO4xkB2j4pRd0i5am
 mQsseIbMp/6pijq3k+MjuGsDGW4BhL51B1VtUOElN1lS0UegX+ZI1vj+z8ElWDHzEk4ONRMfjKD
 BRUBWfq6mzeyzWQbOevXThJxTztRuiLErlSofbsJVL5PVbac4MKK5EtC1zXKfYKaNbQAdO+dnIL
 tidtModsJVIQKREVsd0p8bDkgN/OjfMDZFx4ty0lIrZ5mfoJ7DwqFLywaA8N5+ujzxKnV+II2bK
 nISwnxyjYkNpIZd4vRSNKd48dmgxAb7Vb7rkjhaRyAHHi2WeLhKoq0sPuRUimaiFHBnlej+JAMr
 2ZiRs3fSVgO1N2Nu1v9Otfl8PrOuJp8ATqUUwo5d+55EGbsm0u/++nTy5Ym9HExk+XnYvlTBE9/
 qV2xOWUw/Upc4dC/nNEz6nSVBSUvaMtgnzM5IavuRbou27A5LY7L62QaV4FaMFGdaMtU7gXtELO
 pB0e0kt0Kc4w0FfBrWBE6zJt9LU0NaUTTlDHcEKnbz6xzpED6TIVylBvhJRmEgzD/ejZaiHn5jI JhEMofYl0WUz+hA==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-13-51da5f454a67@google.com>
Subject: [PATCH v2 13/27] rust: processor: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/processor.c b/rust/helpers/processor.c
index d41355e14d6eb593beb018b5709118afe855c852..76fadbb647c5592db4526569fb1ed6b04ed17e87 100644
--- a/rust/helpers/processor.c
+++ b/rust/helpers/processor.c
@@ -2,7 +2,7 @@
 
 #include <linux/processor.h>
 
-void rust_helper_cpu_relax(void)
+__rust_helper void rust_helper_cpu_relax(void)
 {
 	cpu_relax();
 }

-- 
2.52.0.351.gbe84eed79e-goog

