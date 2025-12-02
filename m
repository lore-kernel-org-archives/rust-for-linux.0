Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752D62E7657
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704286; cv=none; b=tcrFDxJKcLmRHM4uVUVnR3cIRGLNdkaOe+dzm8CoU8VnLK5/hN9GzhBxYM3YcE/MTLQT56aWVdrIz+weO/TGTmJCREOxYWRzml70RlYM2Mj1a0+x068MRgdtZg79WUl8/FrOrQSnpk7ojiXXNStuu9V8//p0QxJerZ8xUjoWHeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704286; c=relaxed/simple;
	bh=/uRkXMMnQbHggezbPMDlJAAX7sbhCQ8KF+LNPrndfLE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dw7siZEUHOfDTN7CrZGPm2mYQxhgvx92XDgNDXvWN9lDJifdmdfNProYGGMvG/JvVTzagQiVZcMA1WMGfEgAcdFctUKJRKL8ww3E0wzVwUfJoxXCsrweb2LJEvEozH6tYiNiKiSqq2neLYzbRTlwOWM2EQEkJLuKAD00ihpCmKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z1AM+O7X; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z1AM+O7X"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6407bd092b6so8878187a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704282; x=1765309082; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=54syvTsAoYC8sXnOsRu1oetBVSsGxpCbEliB3X2MzVM=;
        b=z1AM+O7XGonDp4xbrG89jUQyhdGSrdvFybl8/REMj03lsF0Al+bzGZGB8drj/+53z7
         kN7Jkbzur9hxIWzHQXRkU/IUMmBg7Zr/vujdPqvdOfjp1g50bZQM9fxK5gkoflB+gQar
         wnE20T+UgTUUFlqInraX8TNibfGw1nsjZwSQmfX7WpiiXSoi9t3LahFiPjafnvCT1sET
         7wXCPQFWjNptn5egy5yiIxr49WdmnBUpoDnMD0W5btkDnaGiytcK14suQiLY4sLGHMDU
         K2U7FAnZ5FjDejAGc2klMleAHe1h+L1Oav0o1iVFNMgMeQNojRAovAOE3oDS+5llpGTk
         OHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704282; x=1765309082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54syvTsAoYC8sXnOsRu1oetBVSsGxpCbEliB3X2MzVM=;
        b=cQtJsiz58AUD1aFwxO9Ewt4wFJyLo4saOejzin9aSWN9TkWTaPWwsQ/o887VYBiFMm
         oPctj7VQ83Ds5LqXgFXUZ2WImauHXifm6SnT794i/zaqTdv+x+Y808hLOoeJDo0O9jRJ
         xmD1vn8MtSLbNs1bpg5H0zCoaegVBiKW8/PIrrhpj709vm6T1iuYB6klGUtFcrtaYY0Y
         sd3icx5FUKxZ+VAbn1JxKOGWh98sgKlmXN3rx0OeaqZL4IvnR+VPNZnepDQ0s/elOAtg
         yJJ5vYHHcz+WOxS6+2hkHG5ST1DH/EM4hSKy90M9lyFMsQIU8H3thCcFdvPhErbgKCsz
         PrUw==
X-Gm-Message-State: AOJu0YyIx4WtLE6RzcidzMaVtnR6nORZUrXcr1I7BgWjbc7xDfXjFJBJ
	gpTSHoDPbMlvveo3rmhVGWi0VHsFXWDPLT3/5QPxPM/iYXCmqCqUCu4K1GOI+eyrSqk8BVJsniP
	9ZEuZ+nQYYaGFg9a0WZJDxnvTotm25Zo6m176u9hqfKXqGmzrPFoVb3hGfroj4homLvOEfF5vrw
	r6CKaKJJlHMp/HaGqdwzGEV1qYCyAQ/hjIaI5FRc39AbrV9KxMEUIFY/P5wRgdcVw=
X-Google-Smtp-Source: AGHT+IGJc3qMQV4Tiew7vJsG1JacIYJGPoxXANnYISLPrZ170ZFOcWUF9+xQRkP5vtmpknWxelIwF6l2qj4993k=
X-Received: from edaa24.prod.google.com ([2002:a05:6402:24d8:b0:641:8ee4:8ffa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2708:b0:646:6de:a09f with SMTP id 4fb4d7f45d1cf-64794f2b59dmr697109a12.2.1764704282535;
 Tue, 02 Dec 2025 11:38:02 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:35 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=873; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=/uRkXMMnQbHggezbPMDlJAAX7sbhCQ8KF+LNPrndfLE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AHjZMlnHHFMoh929di8EjUsCLjmEfSxg3tT
 2GhNI8gm7iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABwAKCRAEWL7uWMY5
 Rj86D/45UKCvMffghxd1TOM9Kpgv7sTNWQRLKPICF/FwK/EUK0t9tCRyN8DOXECqh81J1HPWBLH
 fwy0VurRe2Uf2/N1tu8YV/B/rjJQ9bau7gz+JB/z/OYuqDM7vP/ZItEK+2mgxSEKkcoy26qyrsy
 9ts+t9ddjYnA3Nav79AkmodsJd/yRujVVzJ+qkOtujY25VTEa0vzm2aP0MF8Z1nsl7L+NFqsBRP
 /tfq0/CyWnPCEg4cYuJiJWHOJVoGUUcfPKTHnl75HfLngLBs8e88t4eMY8MCYz/gviTTYs2oQmd
 k9sC0j2uRjzfaZd0rq3iw8czk3Lzr3v/Sf+8E3E4btY4JhXZ3EuiDWCXrpuYO/flyUyIVG4nO90
 E/9QD0knl9DBegIUsUD7fHwQa7/M6NW3scA4khH+92YbjVo2rZo6LoEt8Eq1yh168NECZY0wpe8
 biJs4zuB2mZ49ZAvd+wFjOJXGYleBMK8hrbJJ3R48HGkpPRO0L0T3iH0BYMhWKCt63VJsJsVRX0
 9J/0+4h2EFSmY0CR8Yb0fOYzFZimBaTkhAFPVhgml+xxnbRLdSy+JqDC4b9zRd2qANDfH70F55A
 TCTRH+E1HLAoGhmkej8TNgNGMus0YvztTSZuMepiXDfdau3polP4u7y2z8xuwo8vrET8oeGIeG2 ilPM0gn4CQU1RcA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-11-a2e13cbc17a6@google.com>
Subject: [PATCH 11/46] rust: cpufreq: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org
---
 rust/helpers/cpufreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/cpufreq.c b/rust/helpers/cpufreq.c
index 7c1343c4d65eaff6f62255b6c9a9a67f89af1541..0e16aeef2b5a696bf8974f37d9e5e3c24d999f40 100644
--- a/rust/helpers/cpufreq.c
+++ b/rust/helpers/cpufreq.c
@@ -3,7 +3,8 @@
 #include <linux/cpufreq.h>
 
 #ifdef CONFIG_CPU_FREQ
-void rust_helper_cpufreq_register_em_with_opp(struct cpufreq_policy *policy)
+__rust_helper void
+rust_helper_cpufreq_register_em_with_opp(struct cpufreq_policy *policy)
 {
 	cpufreq_register_em_with_opp(policy);
 }

-- 
2.52.0.158.g65b55ccf14-goog

