Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86723F6610
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987796; cv=none; b=kRknQMueet3YxeI3RBx6qYPUbpSBOvjPrT1jmyusyTgRvgfBK0Ei7ip4E6xZ2LWBZPArtjJZwHwYDbNh8MpED9gHsy/ovy5k4Xc2WO1maig/0PUC77ewZpIyBr83WSK6zEMNLpvSS4JTodtuh8MEMuxaCeQco9jJSDrKOKggYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987796; c=relaxed/simple;
	bh=qmFMX+YKgFbsNTYBK8WQzT05aCnSTScT0mEy3LvunMY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=k0EIJe8XEt7Lj2tYHAMkAC3XzICOhiWLn/lTVEAvHSGEzsFE7yeNUIAUBsfUJB8Naw4AdtwDvEnmlFiBaEA03Bn1hZZCsbE7v6DHSkDiy6Mu6gh8vbEwueSfclp3Kccl2UPrgEHBfJPclt7Q1xb+6rWOBTbGKlaIQwFNggfxgKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZKyiqQb; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZKyiqQb"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48a7994e8ddso52078605e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777987791; x=1778592591; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wwcyT+EW8u9QfzYxBkySmaOJuohl1RTtLe0zE2pkhOs=;
        b=UZKyiqQbzPyrUr/vG5LotQnQY7slDEOruItON/V36HuE0O2/Yfl8reKRCsX1v9mlKH
         DJOPxzVqgL7D8EOc4JkH2yxBrtBXgg/ghrvBYhlBaU/zzIpsUz2TmS81628VlmKJLG89
         toqT45UsDOwxMtlXSYwB3ZhSYbspabfO1ew1BId97tVBU++eiBvOEATzRyi+VWm1FYQA
         uAM7hhDKmZJsrNZVOHZrnnF46Sq5MV1BHpJjJaGSMdMktsBDA7ZsVXlkAF4lYKP1aJFM
         0bDYsVvTVDEL85tQbHlVrAUMvo9HEFLCq6fvAgutEbKPNGKmLKXsYkJmWfvfOj3ehAlM
         fISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987791; x=1778592591;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwcyT+EW8u9QfzYxBkySmaOJuohl1RTtLe0zE2pkhOs=;
        b=In9av6M32XzPcRmhTk490Dv8uLoHcBILKpkUR+gwQxyAYrFuT7B38t+Jbk/zCI69DJ
         /fkvFM8I8MJxIJrhyKcjuBhE5gCODp/BIRtkZ1ZwVQ+gwknYshC2JVtlInAusoAYrh9D
         hE17kUKl6VZ2Vv9FrzhRsBifs5ENf2PAxvpAeO/GDkckTp4LipgN/QwtvUFGM1g+72Y7
         /ELvmxcG6gzWtzVHuxFT8msihhWMi5VT374L0k9n5q8cqcOFOAETW6jGZ3Ii6RRARTvm
         v+9wNi72c3JAbzj/+Y7C6aV7YKbyQhJoa+DzGoEqf0O0nrhb4mldiUG49AlNfPkgdGNA
         S0cA==
X-Forwarded-Encrypted: i=1; AFNElJ9ysk4+IVgPPdcPhilRgaOqwjhD9JqjIRag3E38rdIvLI5cas2Lj6bjik+Vci2QIxR6Ht1BNbqFV4WhQbd4sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzji2FnO7sZSdADRSIMp5qus31KpjeUbQKy7UGYsQfCmqSRZKTe
	axjRCz6F28CmNkJkrZ82iI3kKV9cSNSlTqMtKMDt8b/YKjHOYEZPGuEQU+5OjfXleFs2VVvyfSI
	5drhUMYZGNwLBSZwGIg==
X-Received: from wmph37.prod.google.com ([2002:a05:600c:49a5:b0:47f:941a:613d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6097:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a9852f571mr227000005e9.5.1777987790931;
 Tue, 05 May 2026 06:29:50 -0700 (PDT)
Date: Tue, 05 May 2026 13:29:35 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMDw+WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3fSC0rJc3ZSiXN3UitRkXUuzRDNDU8MkgxRTYyWgpoKi1LTMCrC B0bG1tQCySGA7YAAAAA==
X-Change-Id: 20260416-gpuvm-drm-exec-96a6151b0d53
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qmFMX+YKgFbsNTYBK8WQzT05aCnSTScT0mEy3LvunMY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp+fDEBD7mdPrMI0t4BmUT90gb46RcCxfaW+jBl
 IAGWVJpp3GJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCafnwxAAKCRAEWL7uWMY5
 RmAaD/sFtC36JNPba5y+NVwW0TVb9EIv2OuG+GaK1WkuPe51bcYuRgLZoHPBOsDT9TDclPdlZNJ
 1lGA8nO/0y4qh9tx5dlqfbBmNhqmoP91Qit5Wm5jhD8pZyGNxHSxcj7CKAghFrJNfaW7e9HFaTv
 0Yn1BlxsBJkrbZO1Ly256BGVBM5d8ZCwYo5GDLLC9xa1GYmb5UHMVsFSm+To7iL5zmS+x1KOorN
 oz69T575w7sRd65FGT0aOysikLputKHTv0jdeqhkXGM0RZuKQ79vpAfeLR3JVPZSV93iHQ9+0zx
 XxpicqyNmQ0b4Jqlk0l/9857AmY6o13SQebSQD5JAcjVp6YCOE6q2zf7xEFOUpgRQskYWW8GwC9
 HIMsyUZin/vwX/Mmz7cOVeVmDnCgfdIj0Zr/q0kLSz5jCYc0d7H7cCHb+1D8sJeCf0mbSFyvFiO
 e/veLgxPFXApfVZE7YniZwYLg9gVY38+w+C8U3cuQ5rRmfnDGvwRyQUed2Os96jr0VdvUYzEWhm
 A3Uqvb6vbYoO0igw47heCZUiL+hE/usphsfeMnS9CA89tGbUXECa/pGb8jjnFUJF4iKdJN//TO0
 gYAQ0J5XwXGiTTDi+NOFXe2WI/ANZ8zkOWqErI+vPfl9/7Nev0dgSZ0ml5jbPF/YgzGWxIaPodn E+w8I99vs+Eo52w==
X-Mailer: b4 0.14.3
Message-ID: <20260505-gpuvm-drm-exec-v1-0-958306ded36e@google.com>
Subject: [PATCH 0/2] Rust support for drm_gpuvm_exec
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Philipp Stanner <pstanner@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Now that the core GPUVM support for Rust has been merged, I'm sending
this follow-up series that adds a super simple way of locking the dma
reservations and registering fences.

This logic was included in v1 of the original Rust GPUVM series, but was
dropped in v2 for inclusion in a follow-up. This series is that
follow-up.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (1):
      drm/gpuvm: rust: add drm_gpuvm_exec support

Philipp Stanner (1):
      rust: dma_buf: add stub dma_fence abstraction

 rust/bindings/bindings_helper.h  |  2 ++
 rust/helpers/drm_gpuvm.c         |  6 ++++
 rust/kernel/dma_buf/dma_fence.rs | 32 ++++++++++++++++++
 rust/kernel/dma_buf/mod.rs       | 24 ++++++++++++++
 rust/kernel/drm/gpuvm/mod.rs     | 71 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |  1 +
 6 files changed, 136 insertions(+)
---
base-commit: 37f748ed0c19e007e7c5677f5d605d6b93841792
change-id: 20260416-gpuvm-drm-exec-96a6151b0d53

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

