Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC936D506
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979517; cv=none; b=TLZWyeslS3n0rlyqBivhtclMGGa7o7NkD0VRLC+VLemirSGex3ToKSQv3JHj6oD87qrV5QxI+oBGwTp7GKztgkOLQ4Xp/rn9icv2T+Pai9fL+3WMHHI2cT0nQaNpnbxHulxqt3uFbEutb6fVttxrylcklBBtgDcnBZRu87nYI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979517; c=relaxed/simple;
	bh=fN3URxktr7sMlmGNYMdvtIIUTGkxShAPyf2ZGYbhTyM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kIHbHrwvJFHUqZptn5C6VCfCIyuHOoAhIJUP/q4FocBPeIDvRXZwyB6ewyDXLjMmJpjmaiiARlRH6+1eNQJgVG6jRTns6ukbE4hMepitOR9/oYJyo1MGd/SKHiIQrRw67SwsNZ1W66Ycn33AYes4diZMiBxih8Xa8avol95e5m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4qRFtNzQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4qRFtNzQ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso76017105e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 05:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765979513; x=1766584313; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7nIKCaeLv8zPGRJ23xmdlRZWBvdRXrT8HvbRJijbgE=;
        b=4qRFtNzQkZsluPbv5XIL/5plJb6ey1GNxJa1iS2spr1o56tRtITQTn4Whd2YiLUEMD
         vl6F8iWiSzFUhVN1rd+xq0oLlypSlqttjBtDF31AaULfpJYfW7rL+cA9Q1q4iu+k+9gF
         Lof26rufuGYQeu/vaPqPaBNK1rBCUozVlXavSwgSP2CQbzk5IhmuUpGC9n4KRM/Jrrhn
         BLQoM2itYf6uBG4bHy4WnxDvFk4hQoWEYHffrdxzKMpKoTmFgvFuZv32NtBzvxb95qiE
         w1Jai6kfwezM4Y/4tsVnF19TSu+cIoLkZjEyVrqf9pGimm95nd3+OA4Yz3q3wB3MYJHn
         f5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979513; x=1766584313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7nIKCaeLv8zPGRJ23xmdlRZWBvdRXrT8HvbRJijbgE=;
        b=fBu0MIbhH/HpEIEM92fBU5dS15lqLPgeY/f2gnRfoPiDSjFDvKoBFbi5uFnX6EEsuc
         M3ix2MuFFrlEGkMkDHi7t2PvP7b24ef115z+6RTF5+kH+A/GgrBpOiLkztmEs69YNA8t
         7pdaTTqMw5iYlBJd9kbjaShLSmfhdODWp/YnUKIDle08rOFnPQL7MdNor/ZHNl/BEnEm
         E3J+9Ot1Ba2CrNALm4dd5u+8m9p0y9k2fqPrNsM2Fv2e3O6+TWwtpHTtIuFgAFxecoOm
         MUPARRrOBjz2ozBhKuLMpUV0llSSfb8nz1FVrCMGnfWFkJntnDa67rKIEpw3Cl7W90ZU
         59tg==
X-Gm-Message-State: AOJu0YwboXFaOgi3l3v/Aj3dZsq0TRdNfcIiuAXkq4Y/jHGxUBk2ExrA
	AtwGd1i+PIo+NnA+IPEh4kPksLKvRbw44ZAEBWkFOLf4LbNjGhx+hvmsX+yVODJ6tAwyaR2SrAs
	FlsbpmIauKAhxJ1mJag==
X-Google-Smtp-Source: AGHT+IHrUtoviwwVHAj5Ot8yM3UwknGILpAoz4AmpZewpzaIh8/Du/hxu70tdxu9gL9g0Ry+OBSdhG2dH7mNOYU=
X-Received: from wrd27.prod.google.com ([2002:a05:6000:4a1b:b0:430:f5d7:f015])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e7:0:b0:430:fdc8:8bbf with SMTP id ffacd0b85a97d-430fdc88fa4mr9086454f8f.59.1765979512955;
 Wed, 17 Dec 2025 05:51:52 -0800 (PST)
Date: Wed, 17 Dec 2025 13:51:31 +0000
In-Reply-To: <20251217135131.153557-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251217135131.153557-1-aliceryhl@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210; i=aliceryhl@google.com;
 h=from:subject; bh=fN3URxktr7sMlmGNYMdvtIIUTGkxShAPyf2ZGYbhTyM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpQrU9BA54sfjZq4zeQBn3jsRwcxvybyULbEzwh
 Wg6kLnmXIaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUK1PQAKCRAEWL7uWMY5
 Rt0/D/9P0f+A+b2APxMq/wDne+m/JjXXGRj5zb2iuiOf5mkAhnD6W3g/pwJa+rlboQ89AnT21l/
 lmGn6JzMJmAcX21g13wQYJmWl6OmR8qCcvhXv2TV/hQhg9KdaIfJ2XlGgK3tUJafd9QzpabRLRG
 GfwGS3E5M4H/zw8LK33cLA9Pn+obH6b8PxODSy/qoYywPEYv7dJ0HhsJEFNgwezqKyEh4wNt8cl
 M02vF/hLjTHI0NPoPzuCUp7BcJ09oQVKnyB1g7hsek+/AWsMcn11nY06g5dZtRla0EeyGMBugCD
 lHagu/ZdTyeDUa8dF5isyOfbAnxYf7r0mBszMaj4/1n+FMZzdL7EAeOBOr6S65GeJpQcAE3V4gt
 tI4zKhYzBqlER2tHx5bN8pU45KuzU477wRDbnTnfPVa+r556QxZ5GTFvy0qKLoPB964c7mk1H9p
 rVa5EMc06DYl3AqcgtXtfQmWRcU+s/gfgV5mLh0TgrAhEi8hOG1pA6KJoSQNrlS3HmFM+MTyeTK
 lqldwUNCg931PodP5ryDalnx5GCwtcPROeWCozWDy+W0KrSC0f9EVLDi9ajv0fXQqT7AZ/v6qcJ
 3G91/fRJ1Mgi9sQyFu/CVKsN5DjPWl1HozJmPRkDaSzCVE7Qe0wIVzxqBWew59DOZHSCNosHFkA dMaYK4xwWeID4FA==
X-Mailer: git-send-email 2.52.0.305.g3fc767764a-goog
Message-ID: <20251217135131.153557-4-aliceryhl@google.com>
Subject: [PATCH v2 3/3] rust: cpumask: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/cpumask.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index eb10598a0242..5deced5b975e 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -2,67 +2,80 @@
 
 #include <linux/cpumask.h>
 
+__rust_helper
 void rust_helper_cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
 {
 	cpumask_set_cpu(cpu, dstp);
 }
 
+__rust_helper
 void rust_helper___cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
 {
 	__cpumask_set_cpu(cpu, dstp);
 }
 
+__rust_helper
 void rust_helper_cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 {
 	cpumask_clear_cpu(cpu, dstp);
 }
 
+__rust_helper
 void rust_helper___cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 {
 	__cpumask_clear_cpu(cpu, dstp);
 }
 
+__rust_helper
 bool rust_helper_cpumask_test_cpu(int cpu, struct cpumask *srcp)
 {
 	return cpumask_test_cpu(cpu, srcp);
 }
 
+__rust_helper
 void rust_helper_cpumask_setall(struct cpumask *dstp)
 {
 	cpumask_setall(dstp);
 }
 
+__rust_helper
 bool rust_helper_cpumask_empty(struct cpumask *srcp)
 {
 	return cpumask_empty(srcp);
 }
 
+__rust_helper
 bool rust_helper_cpumask_full(struct cpumask *srcp)
 {
 	return cpumask_full(srcp);
 }
 
+__rust_helper
 unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
 {
 	return cpumask_weight(srcp);
 }
 
+__rust_helper
 void rust_helper_cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
 {
 	cpumask_copy(dstp, srcp);
 }
 
+__rust_helper
 bool rust_helper_alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
 {
 	return alloc_cpumask_var(mask, flags);
 }
 
+__rust_helper
 bool rust_helper_zalloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
 {
 	return zalloc_cpumask_var(mask, flags);
 }
 
 #ifndef CONFIG_CPUMASK_OFFSTACK
+__rust_helper
 void rust_helper_free_cpumask_var(cpumask_var_t mask)
 {
 	free_cpumask_var(mask);
-- 
2.52.0.305.g3fc767764a-goog

