Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC472749DC
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767340332; cv=none; b=gEt3+eZdlo0DyC5LAqK9RaA2PhIaa53tY9rWlSBUaeaRGqXcPkhGsZ2Jm8K4gDIcGeEFjulvdlqvZTehPWJrRlaFGqwWbUAe9d73LlmWBZnVsSw+kiLHHuf8KB0DyBMTyRzWRpVYwh1+kaxlZETgPyYDzlgV9LeTGLErg1Z0zvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767340332; c=relaxed/simple;
	bh=PYqFtCJKewiwotOHkWKODCOViU3vbaITARfsgFWgfPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOORBI8HSHFEeCralNLtqTDvHuT2qrP5QSviTMKP7oAVmW1a+uT5vZ4kTjdCTAwphCw0wXfU/4boiS1lsdFFr/o+7JS6GUZ0p6BeueCLOBTv63I+9VPa77PnJvWGUy1EcT2i28idNstY+z2SrcKkQqIq+UgJHt/AeJxQy2TOKdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETdCK1Mo; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETdCK1Mo"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3825ae23d95so41326031fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 23:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767340327; x=1767945127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GrDXAONfhMHnF8PgdBj6M4DUOiVSl4risTQaplS4W0=;
        b=ETdCK1MoFyeVcTxBTTKYbnMmfcHInxvKFDIbLfRDFMseCeSX9qF3BSoR4dSMgqWCM7
         gcAJ3L/7fvHK4syoJBl8ZlhNhvhNOvZlTTpgAGQRA5sTgTqJ3eTAVAksHt9s68ZtINBC
         onhefNY64mJAbfNFbFkA42XL1+GkYTRYqcplte+PeLMGSauoVRu4HFAWWt+UcyQZAfq5
         auibF6ne0A6AGwBS1bwdgD2xoZgDPEdoZtHlq68mKvNVJrXiiTpfPoGJq+gS8SmAMXQc
         JzAkLChcxF5gm5s1hShnGA/gOywLNrBeC2squIAPc7hgj2wB93tBycJNnVv9ApyL6Cbj
         mvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767340327; x=1767945127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1GrDXAONfhMHnF8PgdBj6M4DUOiVSl4risTQaplS4W0=;
        b=DOf4+qFMojOVZkYXo0r9sRWiZwiemxvisMd/MAp97ZdJVJ+gCf3C7ljPdGMDmZIqYJ
         BVgqAjtzffgyAVYllboi4n0EikN2FLPK7u5B6VrQNQg4/bVQ/jKqs8ilZbzb2aLYbzz9
         /lN/xH263llyH4LwE9ZlEOJkl9E3ZsIfrN3pl1VkB4VNG/u+V1A8dfbZfOMb4fC4ROs9
         /5UQHRuWo4dYEutynanC3DOffxfZ0KAFIiLGXPnIyvK9lD178YkV4INQ0h9419VX/rD5
         QpTBAtVJezrHvDOe8BoJgw2s4N2zkx8dz4Hqo4sgn58pz0dE8gltTGf0QRAYVQMouapm
         Qjig==
X-Forwarded-Encrypted: i=1; AJvYcCUEjYq32aIXWN1Tkw+qEkeW3+Hm79wHG08qz+SbzHGg2e0XIHUoWbPG1g3N8lNbXjGcpoZhkM6eSgtee3vvrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6s4bWuk6aKNUIBixAXVNMcCdgx6YUtxls2Exg8xqt4ONmDxCI
	eiq4nPap9Up0UPogjWEubYiLhgBNiN+tNuBzOtIeG6qzupIuZZF1VgIt
X-Gm-Gg: AY/fxX7Xc9L7VWPrfGD0dS21mUJBk3e/fxH6sxRh/pwQNBTJoeoi3GYjJxmOqbXXo7Y
	FV32dFKPCvSboH00g1lJ0ihlJCulhqiZIhrmoL5TJSRhaDO+gJ+IboF/lXS2OjbQSUgzX7q1UTO
	jmR9jyUlSjVodVZs3klVZtAYniGHjpCZIIhqCS5wpKK9hNHSMlErl1jE1v6YQj2sTM2ZLo2MnGN
	ueGx/btvYOPYIkdQtbOlFI2JMhMUW/AxifSYJV3WKS9rO4lU9Mk/bdlX6/zz2/VMdFz8uY4jFQi
	/qHIXl5HTXC8Cs8qYGPvo+9Z13TSU8sAz+4YIKxF5teVk356Xl3wjeVTPFRQoWkEpMONqPJoeXE
	owMgwr73xNZBZgTpbqXb/U5wDJYaMJ9HUJL2O19fnmBAm7hh7o6tK9wcn+1hSVicIgzY9WCqOrq
	fM53DgKYFg7xy6pHeqwMLb9Q9is2sXet7r21arn8+czm0vVBZO7OHhkC8=
X-Google-Smtp-Source: AGHT+IHZBBGt5sKspmgCfNLehnDSWf+0n62iK2Sq8KrVSTfY8+ZnEykfoNZ0znpWjPtd8Ie+jPvN8A==
X-Received: by 2002:a05:651c:c8a:b0:378:e097:e16e with SMTP id 38308e7fff4ca-3812167c644mr123565041fa.36.1767340326940;
        Thu, 01 Jan 2026 23:52:06 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com ([83.245.248.13])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de35bsm107688061fa.7.2026.01.01.23.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 23:52:05 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 02 Jan 2026 09:51:41 +0200
Subject: [PATCH v2 1/2] rust: pwm: Fix potential memory leak on init error
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pwm-rust-v2-1-2702ce57d571@gmail.com>
References: <20260102-pwm-rust-v2-0-2702ce57d571@gmail.com>
In-Reply-To: <20260102-pwm-rust-v2-0-2702ce57d571@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767340323; l=1349;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=PYqFtCJKewiwotOHkWKODCOViU3vbaITARfsgFWgfPk=;
 b=89gkDf+zZZ6JvqrUEtN9svv3pRzZGZqV8d1YP6ws29DFXx5WFdB/t4HAng0JNcH5B2TDaXUmu
 ki/e0mshDXDCcXPSOYqwQprgpqFr4BYKGEpCkPdJqDen4a9Rbhzk70W
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

When initializing a PWM chip using pwmchip_alloc(), the allocated device
owns an initial reference that must be released on all error paths.

If __pinned_init() were to fail, the allocated pwm_chip would currently
leak because the error path returns without calling pwmchip_put().

Fixes: 7b3dce814a15 ("rust: pwm: Add Kconfig and basic data structures")
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/pwm.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 2dd72a39acb5..4f683158fc08 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -607,7 +607,11 @@ pub fn new<'a>(
         let drvdata_ptr = unsafe { bindings::pwmchip_get_drvdata(c_chip_ptr) };
 
         // SAFETY: We construct the `T` object in-place in the allocated private memory.
-        unsafe { data.__pinned_init(drvdata_ptr.cast())? };
+        unsafe { data.__pinned_init(drvdata_ptr.cast()) }.inspect_err(|_| {
+            // SAFETY: It is safe to call `pwmchip_put()` with a valid pointer obtained
+            // from `pwmchip_alloc()`. We will not use pointer after this.
+            unsafe { bindings::pwmchip_put(c_chip_ptr) }
+        })?;
 
         // SAFETY: `c_chip_ptr` points to a valid chip.
         unsafe {

-- 
2.43.0

