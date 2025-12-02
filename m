Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883372E0417
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704287; cv=none; b=ELMNCSk642p9rEKdi8hJT/jzQLoIJb8B6CiAhKuggDgnKPlDeJvSi7XvswqZ9HDOde81ZKK+KV5MODcEt6bjDasYNTbaCzF68emZilgzCDlpDlxPHuDvQedp5iO5jPqeChyXB6xn729RYWNg+Qg51LPueB9c437lqx9lQNIy3ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704287; c=relaxed/simple;
	bh=a7VTth2aYrQ9mZFTdRe9Go6iNqEHXqz/QI+sMZttxME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MpB0LqqEPLL3yLFVA3RLjh2QrtHQnjM3c/5wmqb53IZ4TMmNu1acpryYe1NYIPPnJXIRS/wwgfPT12Gn6r2peMiMATgYNIYvwXnm0+LufGZaC+qGdsyZKHs8Ska5dc+0x402VLZwiTgYxmbcKAPg8i/9USMuGcuXG+QXZRPcGpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXYL2Fry; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXYL2Fry"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b478551a6so3142196f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704284; x=1765309084; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d0tgl8MmjvwwJY4eQJEMeAOTmofxDLerW3paWOGY4Q4=;
        b=dXYL2FryDaN+fjWVUsJfoffGyLpMigDTrtAqNsuO4e6Z5fJ6E9Sr6fBrFPtRMWL2C2
         cfgFHmNLUF4cPSDdjuMDZBPDyE8Y+hMpuKOwcktz7YvY2d5Z/osoIMvhsNg7utibyb/J
         auRhNi/s25Buf8h0mGk1cbDyb+37aEJQqanOGEKSqU+GHzYqX4cr7C2mJ0bL9mlpELYK
         9u7eBwoK+MenH2QAK3z8YHAq6guojgvJJJZPEYEp/KwW3mG7BF9STiLlKe6pAlvntMWV
         a72ZATl4czSEoODLM8Vgwf6U5B1UUokS1aj9MPBgf606dJAamXlt7aVL2FQxQtV6pwzD
         9LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704284; x=1765309084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0tgl8MmjvwwJY4eQJEMeAOTmofxDLerW3paWOGY4Q4=;
        b=l8Ji4TBr0+IragW42kH/BcyEWHp3NBaaHUKnXTwUYOyMgsN/csGLGRz/5btJyDrP7y
         z5cQx1kBNJ0R13kZgsHpgaXmMZa7IBelcHJayT3CQ8rCijpd7HRj9hhtMC0ZwnlrHHJU
         IBAcvJ2g3/3FYboPUx76Pb3PEDMH9QR961PSkS2Vl+rH5QhqxX7HME2ZAGLYmhii19VL
         MhJSFXPPwE0vcdBcs720DsAoPzq4mTbMM5fRyIwwXxjTOeNuaiyPfAWjhIzG7JHYLBIQ
         uYA5/Ht/O2uPZPB4gau70wLM0fFW5cnhUJMGWRd/Hj7WzAeojr8zSGvVrW9ICI0RmzD3
         aTdA==
X-Gm-Message-State: AOJu0YwafHLJPaMAPDWOb2piMdPWpyzsILbk2tuhjPZc5nVd0Y8cEGWE
	2GBgbpGDdyyQUXePEgjqEqf4AJ5jw8VgV7pq0zDrnKWjdyJ7GZb75nkzVA3aKTm6VD2WcI2tuop
	sHejj00Lt4klz0KF66Dkv/I+gbQet4uEB5eLVk731qfNzs+5H/7xqmGr9N6zwXomgnhGK6FRJqg
	ikYwL1XMDe6I8zumNUanWjXb1WaVBqlDQlbX19zvIY9TnQ6ekgfzJQ11HqFiZ6tvg=
X-Google-Smtp-Source: AGHT+IFe5pFXs4arACddezu4I93+33c8S/KIxVS4tlwUSeR6ZN3FbywdSGa+UCpUfGSyjcndFvBbjjkOqlk5HCQ=
X-Received: from wrof8.prod.google.com ([2002:adf:f588:0:b0:429:b8a2:8f17])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2509:b0:42b:53ad:bbfa with SMTP id ffacd0b85a97d-42cc1d61ae6mr46860917f8f.53.1764704283637;
 Tue, 02 Dec 2025 11:38:03 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:36 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3167; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=a7VTth2aYrQ9mZFTdRe9Go6iNqEHXqz/QI+sMZttxME=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AHuzv7TNV1xjJWwAX3bwv986hQgAi1LtuNQ
 yZHjx9gsxSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABwAKCRAEWL7uWMY5
 RqZ0EAComROQ1eT8cwFFiZXPqTVrK1PONKDkWc6diDzcCW3EfuRN+Cz+n6QT3Ze/z6XyGrug9Aa
 S2FH/GFHsHwNQBkkM6inRhL+SnMEkML6CSC+0g+nf11HLlT+TWIn0QMadqSvdM7mEljgGzwLCEW
 0Uv2/CGZWByHTVM4fwBC1L59HEQzuVPA5TptN05OnSBdRNBNVL3IUrkMcH9AZCxYvZ1CvtEvNGq
 7gFouqnXh2RmeT2p9+ARpmrkR0Gwrz64Hiw/WytxhkDpWIjdq3j9//jXniUMsxM93j73a53/UB+
 8+EwvvbFgit2yfwytSYfcSP+N+KkHvQidjEVAva3f6sgUAr/1/ocEiEnAxIeJfTlgXz8WexZhdA
 bsj6mB8/MJxH2QY7ezi4EVbJa2lEi5QELdmTlNkJ7Y+/Ax8gNLtQcJXyufxUfDvlQIJxOg/k3AQ
 sA4mlnmCA59OKQOzxvC7Ex0xbkJHQgznu9wCSZRs4fg2iBnBMwOW6RSrEbXSn5cxyZXppWRCRnw
 tMmQIk046W4F37sF6pjWuZmY7ipK5CawoFuGx4/IG6wtEi39/5227JYw+9/j0gO+UdYeJeGSIEO
 IqdJEbcEnfjn+nYoGip7rBLpjI43QcdqHh6JKxqAZhKHtdZq0DlaoMet31EZbWPuxivoswb4ZI2 DMa/d+VgXHO6Qdw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-12-a2e13cbc17a6@google.com>
Subject: [PATCH 12/46] rust: cpumask: add __rust_helper to helpers
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
 rust/helpers/cpumask.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index eb10598a0242f31598d0c401e194dce194ac85bf..74b561f7bf6f112c22e6a3ddb266ac003b06f531 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -2,68 +2,74 @@
 
 #include <linux/cpumask.h>
 
-void rust_helper_cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
+__rust_helper void rust_helper_cpumask_set_cpu(unsigned int cpu,
+					       struct cpumask *dstp)
 {
 	cpumask_set_cpu(cpu, dstp);
 }
 
-void rust_helper___cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
+__rust_helper void rust_helper___cpumask_set_cpu(unsigned int cpu,
+						 struct cpumask *dstp)
 {
 	__cpumask_set_cpu(cpu, dstp);
 }
 
-void rust_helper_cpumask_clear_cpu(int cpu, struct cpumask *dstp)
+__rust_helper void rust_helper_cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 {
 	cpumask_clear_cpu(cpu, dstp);
 }
 
-void rust_helper___cpumask_clear_cpu(int cpu, struct cpumask *dstp)
+__rust_helper void rust_helper___cpumask_clear_cpu(int cpu,
+						   struct cpumask *dstp)
 {
 	__cpumask_clear_cpu(cpu, dstp);
 }
 
-bool rust_helper_cpumask_test_cpu(int cpu, struct cpumask *srcp)
+__rust_helper bool rust_helper_cpumask_test_cpu(int cpu, struct cpumask *srcp)
 {
 	return cpumask_test_cpu(cpu, srcp);
 }
 
-void rust_helper_cpumask_setall(struct cpumask *dstp)
+__rust_helper void rust_helper_cpumask_setall(struct cpumask *dstp)
 {
 	cpumask_setall(dstp);
 }
 
-bool rust_helper_cpumask_empty(struct cpumask *srcp)
+__rust_helper bool rust_helper_cpumask_empty(struct cpumask *srcp)
 {
 	return cpumask_empty(srcp);
 }
 
-bool rust_helper_cpumask_full(struct cpumask *srcp)
+__rust_helper bool rust_helper_cpumask_full(struct cpumask *srcp)
 {
 	return cpumask_full(srcp);
 }
 
-unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
+__rust_helper unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
 {
 	return cpumask_weight(srcp);
 }
 
-void rust_helper_cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
+__rust_helper void rust_helper_cpumask_copy(struct cpumask *dstp,
+					    const struct cpumask *srcp)
 {
 	cpumask_copy(dstp, srcp);
 }
 
-bool rust_helper_alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
+__rust_helper bool rust_helper_alloc_cpumask_var(cpumask_var_t *mask,
+						 gfp_t flags)
 {
 	return alloc_cpumask_var(mask, flags);
 }
 
-bool rust_helper_zalloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
+__rust_helper bool rust_helper_zalloc_cpumask_var(cpumask_var_t *mask,
+						  gfp_t flags)
 {
 	return zalloc_cpumask_var(mask, flags);
 }
 
 #ifndef CONFIG_CPUMASK_OFFSTACK
-void rust_helper_free_cpumask_var(cpumask_var_t mask)
+__rust_helper void rust_helper_free_cpumask_var(cpumask_var_t mask)
 {
 	free_cpumask_var(mask);
 }

-- 
2.52.0.158.g65b55ccf14-goog

