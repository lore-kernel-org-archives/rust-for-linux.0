Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444F2E7659
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704281; cv=none; b=NdlnWNFMyovcxTfOxfRs0Rm6mbYSt1OMtYf1yUyUgxXRjxZewJp/YzpMfyD5B5O6NyGqrBEb/bTucJR7S5ZaG8l/DBLwDtHj0uj90T2ScnAbbT77EM0Eb5sTo29aHDSDT6RtXmxHjabie1fFf/O1aYug5vJmoRp6K8X8qijRiYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704281; c=relaxed/simple;
	bh=QIaiKhlP/U1VSiljVP+FyBFwImIt2hOSsDPWIdXSW+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VoEcM3VmDf7lyOdWaQfamn6EhcM35mvbRxcKhjUmFlXwuZOY+3XDip7iS4GDVMVrTFnnFhPlOidYb4n1B9YGBt5n7p1+UNn5LqaY4JAFQ/mSoTKzmhreuthtb6f99BoeG/WAa2WTlqVApsH43nyy4OEG+OPAJa4/mZShUj1JoIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DYtjrE+e; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DYtjrE+e"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b2b9c7ab6so3383678f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704278; x=1765309078; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OO7Ni+amOIeDY/ewsaJuBgCaFp0/uU/jCpOiLQk/U20=;
        b=DYtjrE+eSbkmx04lnCLCB2t4rLnJtO75flbPuuXdP4PG4PREaRJ9MqcCQDYta5Zyll
         TXGIINN2NjdHOjeOsVf9lKgJWIl4pqnosRQh3oGTbzTf3AOxx5d/oAy7Pqqbmc8cUdpP
         7wTVRkUrslYCqLeGLCCStUzBsbvfOMX/r/zrLJoTcQB6EyDF03i5/gSXGiLA9SiGblIi
         1riaaHE6pEDew+heZgmYTZ2FZjavuslQrB+UA58jngaI+4rg8ak4AAR2QGSnd6BZ8Nkh
         kEVDUU+zTAw1MP3kX2r0iZIfxLswnJke4aLFwiuPnDkTe5f6e3G1Oz8YvI65KfoOIXwM
         K+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704278; x=1765309078;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OO7Ni+amOIeDY/ewsaJuBgCaFp0/uU/jCpOiLQk/U20=;
        b=ae8xfrzrb5wi0raHhGhsQ4Xyk/oLowAkMAHDDoe816UdQULShAAgaF4SNN1Mun8CKs
         kkruDn5y8GPHCL294xg0MKbnnOlBMm1/m0QJSD6cHrR3ypVOx3OFMDegAa9oyECp2T88
         uzqn2uOMS/Iv59zq2peYEYcWeNc3raPkofnZk36dTYd6f2lIRlYNi6YV1DoZL+mxGgLN
         FGwdzQmW9G/D39V9cGWJ8kwvR7t+Vflb1Yzd1ZMau3KZeZ6hodPt2ThGt0Sbzv2czriV
         xe6I0sgDy4DoTcXIIdeG/NoFjomPCpjGqoSjeDtr01ozS8ecV+WKx+OvZFNb43/Tmf+e
         GxHg==
X-Gm-Message-State: AOJu0YziT2PfgfZO3tzYkydnO45Yrs0Qq7fTOCirHTgVPOj7vJBEi/F+
	avzL2pD+HVCorBVFiuI4oaQ2CaZvHLUZzRNFoUeTdNI4NckhP5nOfSG10sEFsvk8bN52NzuRTgN
	j9NRvDpFdwjuKEi8OrOedMH6FcaU0UdqqyNnMvgAlVEqrQzqx/2af/ziVEpC7yfPbJ1oTBdZY0+
	mjuFoA9X7NVB0xPHwJ5aX2NG7SgxLlTcdx7awoKzg86rqz0Q4sf4borjwuOsn7Buw=
X-Google-Smtp-Source: AGHT+IG4AExFY39o7FmcNPY9DdkGP7htI9FbE8ElUZQcvp25lm+A4P8cOENTD614OgDhPCEDEFYhLnHYN5dg2GE=
X-Received: from wrvn6.prod.google.com ([2002:a5d:51c6:0:b0:42b:b28a:674c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:444b:b0:477:af74:ed64 with SMTP id 5b1f17b1804b1-4792a4ba88fmr7875175e9.27.1764704277720;
 Tue, 02 Dec 2025 11:37:57 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:31 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=813; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QIaiKhlP/U1VSiljVP+FyBFwImIt2hOSsDPWIdXSW+w=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AHIhun8Eqq342okt76IAHOciLNy/uszcPw4
 86/9rLo05SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABwAKCRAEWL7uWMY5
 RjDjD/9lXTapcapabeMijSaKeOCnvRPuylqbGvwRqKTegnPT0JrUXgBk67vtr0mNH/p+GvKXvfb
 2Op0dffzMn1OM0/+trSYuwzLstsscKgu00qlUZnom/Z90L0FWJT/6UpS5SV6ZXnqiJayY2J5XG1
 MnLDLkTt6/uHVczLHrPQxZ++T67WfkeNxOZASzfysU/H1CM8Qo+er5Ozm8LLo9ye2OrEGMTH44p
 OE4kz3psW1YHMoXWU0yMHkhjicPatwo3Wi9xp4rdDjwnjnAguGOg44r8aJpt10YPjtvz9jdfLip
 8SvawSgAutr7Y0R9I1Sr+NPYuRQpYAKcfkYekecYFDBD3Ken0FLvh7noDVtO51WDtCkQGKg6K7e
 rvGxJ9qkaQVP77aywGOwLRhCwCLK37pFOY5zObs84uOS9k1KUSlMytmS+k8e9kU7Ue523skwt1R
 8KbtVLMEfEKKqgNm3PpLpm3MQk99C9c9Rs1PgmLjCEecR6s7LqfaNCrmoA0fvMJvVVZUuMod3A8
 hxBPaNpSkinHxE1/W/96M6SpdUuBi4VO/QHpuimg27IB/makfVeGIvqGkR5OGwdlRt2wpprCA9S
 lSoD2wuD7Ng3STsXUeFkbNwa+QugiStYMGBIMEpCkYn6Ps1kPZxSMhbTzw+68tDyDQcuQn7tbKY p8dJXti4tfirkXw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-7-a2e13cbc17a6@google.com>
Subject: [PATCH 07/46] rust: bug: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
---
 rust/helpers/bug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
index a62c96f507d1c16cacc462199e390857b8afec28..b51e607725785f540dc46156630ca848dd0de491 100644
--- a/rust/helpers/bug.c
+++ b/rust/helpers/bug.c
@@ -2,12 +2,12 @@
 
 #include <linux/bug.h>
 
-__noreturn void rust_helper_BUG(void)
+__rust_helper __noreturn void rust_helper_BUG(void)
 {
 	BUG();
 }
 
-bool rust_helper_WARN_ON(bool cond)
+__rust_helper bool rust_helper_WARN_ON(bool cond)
 {
 	return WARN_ON(cond);
 }

-- 
2.52.0.158.g65b55ccf14-goog

