Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516645C0B
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 05:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767246238; cv=none; b=qfHoMxfuJwN4MmjhLx8LevTRFwbOdmf4JLaNIzTjXDDF1NjIbJ0ZLICVZCII6kMjJ6iGqT2j7iat6h/xeoC3y6/qFwSjeqpL7Rb1SSTidYUbN5hL2ZTFxR0HQq3DKkaKy2TB9kB6NqZk+8o9phIPrWoNMy8vGjvdXoe690eyM5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767246238; c=relaxed/simple;
	bh=INs61yhCH1AlbbGVY6+6ZOmQtPdrw+F4faDkpd6qt58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V3rt3OdUOMc10euCHtlQ5FnAQtEFkd9I5nTyYtR6qBjddqBCMXp64CMnFEa+5/ZoLZuHDcyT/zVdIurWv15cTisdJ2AiXwFtstv8MFTs5Wyx1gcGyCtDFQbTFu5aJhTcgnVOVFLQMQIo/E3HNhbWwr2ukI2prD0k8/H+3KjGpII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evP0LDZ9; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evP0LDZ9"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45391956bfcso8973935b6e.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767246235; x=1767851035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KytvHvTJcGq4zNtgFIHF3Jj8J5A5OCE5SX9E10BLYkc=;
        b=evP0LDZ9pmgCWdbp4Esl2lWVq/WkSoQwpg8spUYEPRbF006X+xiXi0uAV4KoohvLGC
         F1+yFhtj68XahWSGDtz5tfcojFgIWDkGysRqfmd6hlchuZKWVEUZLuyPrfIXsFIUY1lx
         DwWL4YFaPIyD8DvmX6kWHUEpZ8DaZtpBXtqZTeyk+a1Q7BBauQWHUTN0Z+ewJzS+hQdN
         db7RYt/L1IVus3zQh2hvVDB3Knwf5R71+CGqc8Il90D6DQz6ZBhmpbtxq7wroatnovLA
         +/syISSNx1R6w505zqYs1/RuQG3c9iPFh6Jf+N8fkARrf/4t1ItUk4jylXO3FhZolQzQ
         Lmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767246235; x=1767851035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KytvHvTJcGq4zNtgFIHF3Jj8J5A5OCE5SX9E10BLYkc=;
        b=Hf75hJY62G3S92qM/2/xfpUCnYPvxmTDQliPZLkjDY8p3eeaZr7dk6eFU1lbCGj9rp
         nFl6/NPBz/bVoNn2/g/apSmPraJIwZ4QUwdfseukrE7RTRBKqUtHncgrWonJ2W7pCYi6
         J292Gxb97b/p8Sl1ONAGtErWsauTScVhzC//vB/vZ8Aks1XYZYZDEIBNk1OM2daINLII
         FJvz7OAGBWSe7xoFa6UQ0vU+Vl2c3NV5IPJH7p6c6IBsZRMh0ybc2C85dyXjAkG0BoWa
         H3V6R/uRH1K+oW9bYcbgz5IJtGw4zM3AjZhzCsv+T17wfQGptun7Ad7J/SHBgMXbED1F
         veXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfATSWQFv1x6QKsLdsrvQuP0vt95zj4JI05NKyV/sfgRz2vYTkr5Z7429nXr5/KVfBqD053uldk/ZYQg3iwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi8ffCVFlCqslvZGFgTh9yucUPmLTRfkk+00Uml7QOzVfCTO/k
	gS9fYWNWgsjklxDe9roYzjHNBqTSQdTumjDvEyf7RVi8w6aEHfzweG9JlmLcqA==
X-Gm-Gg: AY/fxX7ctZaGNGIyE3eUInTe9TFt0kIDsS1iFsxENioKOn8kBn25oFL7l9yniBroGZ0
	+ZhZs6YcRZiPlleQUpO99AyqwEiGzAVeASLyGGhd5YZdWljrlwohO/VIZHSBlGA/x5jwpvfnmjF
	lqFOc3v6KhgFZ7bdWVbUF8ts7ZM90yGsnsQ+5XhGMSEMfCAnhbSzLY3BbmDKHOd3l+yJHpS/KgY
	Sq7sYWbvl75bGxiMUmBWn9bSWuiPQEtWo+XpUyGmO457onbMWeohVVq0m5Q0evAlqC6A+XD6yPa
	tm9knMJaLIEoMztXZeO8gw5c+jBCb12PUNCCYJ/w4nblpSzO/vodS/WKqkmQFTq4wZ5i4MGWT0x
	2k7S5aq8a7wQkd8RYw+G4arney7THnA3glDPR+VZu9ilhvIGu92+I+Yc3WalO8IKKQpCoqfEbGc
	aRvddCaLKphxkolBW806aP80AAvjtJuejOQzM3TnVOqjZrcstYNfogmspxWZ+OOg==
X-Google-Smtp-Source: AGHT+IF5gwcyd1zngqLBrxFDVoP06XhHyOWsQWXS58QUEVAylTsmGpgLpg2Hcfx44nuhnrb+ZZ5WCQ==
X-Received: by 2002:a17:903:4b47:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a2f28335ffmr411627425ad.50.1767239429491;
        Wed, 31 Dec 2025 19:50:29 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm341874445ad.34.2025.12.31.19.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:50:29 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 0/2] Add atomic bool support
Date: Thu,  1 Jan 2026 12:49:20 +0900
Message-ID: <20260101034922.2020334-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This adds `bool` support to the Rust LKMM atomics.

Rust specifies that `bool` has size 1 and alignment 1 [1], so it can
be represented using an `i8` backing type.

[1] https://doc.rust-lang.org/reference/types/boolean.html

v2:
- remove AtomicImpl
- remove Safety comment about the bit patterns
- remove from_ptr() comment in cover letter
v1: https://lore.kernel.org/rust-for-linux/20251230045028.1773445-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (2):
  rust: sync: atomic: Add atomic bool support via i8 representation
  rust: sync: atomic: Add atomic bool tests

 rust/kernel/sync/atomic/internal.rs  |  1 +
 rust/kernel/sync/atomic/predefine.rs | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)


base-commit: dafb6d4cabd044ccd7e49cea29363e8526edc071
-- 
2.43.0

