Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEB7361672
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841322; cv=none; b=Ud3H+O6c31kVuoQ9eZLP27TV2xPmYxZtf1WNHlMOSXvhbJQgELKp5Y242S9D+22McClkE6uuuTsdLmYlhdEXXGzhLy314uwg2fDdUyr0t0XBcSIYT26pfgO5fEJlsX4bCnY5rUD8nnfp9OYRBm9ny4MPvh8Y4eZWw4s9Kdf7FKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841322; c=relaxed/simple;
	bh=+Vwn2RMiQCLbhdbFzxMNsyo+6P3BWAiCt7b4ppvm0lc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QNkfBZ0Su1HTidD8K+lT1pF5T4RH5zhA0m2HPtQ115KiowKKLjsFyWJx4TXetdyiusIM0MvXOg56p2x1B/tJ2mr4VeZ1S6O0hYc4MnhhfS32WwwL6cR0B8LV6jsKYfZgZhFjPJCHHD2QfGDTgU7S7usSD+McuvBvAlm1CU8TZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pi+8rdk7; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pi+8rdk7"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8f848ebcbbso332241166b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 02:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771841319; x=1772446119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdnKcgHkjFRmgggTpTfgYETTa8fsvbvkTrjIctXuE0E=;
        b=pi+8rdk7qhbkmTrlMOBUPZ4jNC+DQ0xjprhXSbsJ3gCUHo9KrP7Lr7kLV0x6grSMs6
         bU784O7TMnQAtQCyLHde1W9HWXBa7ONXfzoQ5YFxLMovRBaydbTe0heF7NklvzKeDRVb
         868hZ8iuwZgo7R2AuTN25BgBFcdm7lbCNm2yKfn1oGwiKeyU9ADqezMoLGAKYG/jXBT6
         bCaaP4vUbDhGHHODN3auskIP0Zm/sz0JTsQe4re8jp+UZG4j/33S48aqQTNR2rCJkAny
         wIm3DzEWj15C5naxm4Ts27n9ZHIwTaMn2LgYozV9C6Y7xGgP8OvC81SdE+NLzDrVK7pF
         1jLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841319; x=1772446119;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OdnKcgHkjFRmgggTpTfgYETTa8fsvbvkTrjIctXuE0E=;
        b=A18FwPwc60DswVrn8Vfev0gfX325EKT/3jfDWmyInm5OkphtS7ZxaRTdYKxHXaGq3E
         zv97RZlL0WWKhMmo/4dtN7Pk4Mo3uGkxPKyt91gTWG2NHYhdaeL2ZP/cJ+8hsmw2pJ6x
         REef7zdbRKEaDVN3aqCFQ+xj/TSzTE64XeXID0Z6ZVg+6VfgfcC71+c7jmV+cEeH1XoY
         y9Gw0M2nK0kIFcNII0chNKa5xYOHG2pPtgjiTSZVY0xG7+y82jSDRXKI7YcqgBuorcql
         Rdv+oF0q/GZHWdK/V8O0JthYkV5bnAeZir8dCBlMueNhY5Rf0IaVAM31+DUnC+SmdHI5
         vE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRDb9TYIuX/aOksM90mWojlfr1avjR0a+KfLYKsCmaYZKbQ3dvwnmKPoAvIigipNwbhvaHheAQ9gBsxHdnIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyfV3qS1pw51H+x1VJOMEbcGgUtzD+GqvDEQJxJx8CCfOuGAs2
	jheGkgCum6zk31rhwcUucp6WwhaiDwIkXXVBfbo8Nzz03C383LT6LAjSYzhTwkfkVgYifzCTdfi
	NM1O6to7ntsIojuNdlA==
X-Received: from edgi6-n1.prod.google.com ([2002:a05:6402:a586:10b0:659:32e4:b9bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e25:b0:b8f:ad6:db92 with SMTP id a640c23a62f3a-b908196acb2mr410233066b.3.1771841318227;
 Mon, 23 Feb 2026 02:08:38 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:27 +0000
In-Reply-To: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jAawhmP9tDMdeWRIiWq9BA5B+z9O+mAwAwRx1JUlWqQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcgbTxLXepdurAu3GuF7CkmSYRcJGHXg5wHK
 hhZLv4P056JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnIAAKCRAEWL7uWMY5
 Rmg5EACUr4q9yVqlI5z1xy9rbC8EGqAU70l/fbrINwUJqLf9Vt3GtkZDEI/b6AlgN8RQX4mTF5N
 HbhQXKgYr3ZoF6FEaPGouSxpJfyULOX2dOGt9yKD2+/TUDXWtEMqF3IUZi2EVrynHGVLOQ73+m+
 2f9n2iLzZXtFHFAqD6y2m4alR5jk3jY3z6OJxCUBgZsPNs0LI7md9QylC/vN1NfF5gvEv/QouDJ
 soiXmdHJCUYyBnyOsmDvPwMu/fbl+x92jpt87qPSH9hLWfJbGFojiA/aPlR2W3jIJCkbCVMntgY
 1Ae/ApT2P85bQovYJ1xpIrQ3H0f6ywsWkuPhtEderymKHmGPSukBCAx9tbtw9kt8rX+Osg8+grg
 fg8/woo0bSdW0aIwDRIeUpet1ZR6eMqgjOoJyYt3ECDnWWOZrj61nr1OPmCuQAIMqcYD8rT2XxM
 nJ73kRZ3WpHs5JtCSYUPj+qacn/BhfJdTlXQrHmhF3ZYoHv+bJv+XYe/Z6b5rSx9PXx+nQb5Bg9
 TrnpR3YQeos5D8NteZVWdTP/iLDuezjrC85tGipCA7HdZgQpAhFbDQn7ump6S53j+KhQ/g62O6M
 Vaaurm+dt3EGb3ZPkYJiKXj1PZ10PFUfFE7r/ZFauGbCVwih6pBzgXs3nTUUkcLAP8gj6dP9+Zi c6sJUxRyO1VAaWg==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-3-181bf2f35652@google.com>
Subject: [PATCH v5 3/3] pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for Th1520PwmDriverData. Thus remove the
implementations.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Acked-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/pwm/pwm_th1520.rs | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index b0e24ee724e4501b812e5f9c7904b483bfe5e2dc..6cd6fa3d298484cbd84b88cfdd3=
244217855fa05 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -99,21 +99,6 @@ struct Th1520PwmDriverData {
     clk: Clk,
 }
=20
-// This `unsafe` implementation is a temporary necessity because the under=
lying `kernel::clk::Clk`
-// type does not yet expose `Send` and `Sync` implementations. This block =
should be removed
-// as soon as the clock abstraction provides these guarantees directly.
-// TODO: Remove those unsafe impl's when Clk will support them itself.
-
-// SAFETY: The `devres` framework requires the driver's private data to be=
 `Send` and `Sync`.
-// We can guarantee this because the PWM core synchronizes all callbacks, =
preventing concurrent
-// access to the contained `iomem` and `clk` resources.
-unsafe impl Send for Th1520PwmDriverData {}
-
-// SAFETY: The same reasoning applies as for `Send`. The PWM core's synchr=
onization
-// guarantees that it is safe for multiple threads to have shared access (=
`&self`)
-// to the driver data during callbacks.
-unsafe impl Sync for Th1520PwmDriverData {}
-
 impl pwm::PwmOps for Th1520PwmDriverData {
     type WfHw =3D Th1520WfHw;
=20

--=20
2.53.0.345.g96ddfc5eaa-goog

