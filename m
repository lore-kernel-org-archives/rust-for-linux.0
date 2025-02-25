Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1867266570
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 09:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476844; cv=none; b=Gecwly3FwqrQAuYNmN8KxGmXT2L25RRtzJ5wKHBHXfE7NOOvQwJUzh+Zab+XNhTWEDFtPQg0UiygmeBQGdiFwCJuvFWCyYSRfAeHG6EjtXwxA/YasK5h0AqT6Of5/vp6SAmKDQEjzzNDzbDybEOqKqVRVHNY3A24afq6PBDipO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476844; c=relaxed/simple;
	bh=wP27JPweH/6fjM+NMVybUHMlDRdaIL6FUjjR0i8msYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lP/MO/s4rsKOGE02ts7HjNBjIfaLVgmXcoOZgQB1WW5M3cxR8V1i/emsrqdqNty3WsiXSuaqhm9c/XKCEKOi9MZaLRUS2kFzgagC5Nx7vOPCzzgYrOLMhapxZPMnzWna3hw30ONY/P/+YmEviz+KtsCfZlmCK/2nXObBmDl71cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YxUfeHQY; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YxUfeHQY"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so10879873a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740476842; x=1741081642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+f+044xs9oe+QU9W9buNo+/acydIG20YX/T/a/LsZc=;
        b=YxUfeHQYZS9+9UqfDZE2+WbJIw5q8IME+o6qeHuufATz0PgJfa1wJpUDROVhaQ/dYX
         eh5vDiDhTjRrFI1SgHspgXJqgwnHV/bKVOhwswxqr934rvGACUGB01TXtSJMQjhw/Cxi
         PCCNrG69yfACsZXF6EQ8lrk0E5cuB7K1Tx/zm2DQjTlXA09I/xiOT1gkKMG8eoukSbCD
         BW9LTJpVO7ZqSF5QSvwyPxwHkJCpJVEVVBkuDa7rSfvPgKwoHAdowy9EBOpPtJh8RHA/
         ffiM3D/zfqBWYnwIoztbktQC+mAyjCt1XgpNSwZExK7vu7z1j044WKZA6CNNP+rIrn0o
         agZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740476842; x=1741081642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+f+044xs9oe+QU9W9buNo+/acydIG20YX/T/a/LsZc=;
        b=diXyPT8tlEDEUmEwlT0crWVKaBVO7bCQIfla20x7ZELh3zVTT7kvEGZ9GuBi3hVQVU
         VBoJ39cL0lZ/gZPEWe1BnoQFImaoEcCcibzmnMutP/+8xTBCmpVs6farSqCpQtZgfCUP
         YRbzuCTQCV4T/f3qeJNlEj2cZ/1zvlkNJxCEkD4GnHUT5Mn4juoqYUFhf4fzMljiCsYL
         qX2aVVmtIwSFiCJp0A9WTj13RatWiK9+Tn8xgYVDkeRP3aZxHXJLJnXde77YO47KNDD8
         dTKVn5if9d0Qpt1dbZgDGFOhrFvxygG/dRJp3lkUWb6ij/umf7lGUF5EavwPUdXfqje+
         PNeA==
X-Forwarded-Encrypted: i=1; AJvYcCWMUaRx0at0ZMD0d4+3JNHWS0KGHcEqQxQ/xxc2VBYn1zhlcVDr0pmfLKGXqimt7FIxLLgUaK8XmW9mrG+6NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLiRaQeIaVTmoqmdrjErVEOobm8FbQ5emUREada7z2hJgVx6DP
	PJUhvmAymdhkO4zwSyl29+Kx5BF2wsBgMh6RKsY/EixfEu1rKGl+UqMqoApBlXU=
X-Gm-Gg: ASbGncuP5Rx8f/7PEghO2L+HgsqNHzQ4mJUx4/zsa3kw6nvF3bHGipgcKvHhfjxsMTM
	VmmsI1uZloyNlW2nf15/QSvDU1VeFJkMb//FCRLIDgcukLAlrVtU758Yz6N5Ajikh/F9zEjxdNn
	sODZq9y41sOkbNAdmUT44e/Zw2HSVP/Tq2FxWcVEACKQiV+DpAj0ZAcgCbcpWcXTKyP4TN4roPw
	h4k/g+KzcX3EK5gUE75Q5c/gKZ+GPb9HSCPerKcHg/GgrANvqxCKJcwYp746Tvw3U8P33PL3nu9
	uGY/zNomc4M78a76jcIIXobj2qU=
X-Google-Smtp-Source: AGHT+IEpV3O0DpZJB5fu1atlN0Tq9K+PHFsKxd1ALff89Dfbc3fdDd/hO40dZKnKimmZmJUjhEkl7Q==
X-Received: by 2002:a17:90b:2644:b0:2ee:dcf6:1c8f with SMTP id 98e67ed59e1d1-2fce78c78a0mr31431819a91.16.1740476841935;
        Tue, 25 Feb 2025 01:47:21 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb05f913sm8077113a91.25.2025.02.25.01.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:47:21 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/2] Rust: Add cpumask abstractions
Date: Tue, 25 Feb 2025 15:17:13 +0530
Message-Id: <cover.1740475625.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds initial cpumask Rust abstractions and adds a new maintenance
entry for the same.

This was earlier sent as part of a larger series [1] and it was suggested to
send these separately.

Depends on: [2].

--
Viresh


[1] https://lore.kernel.org/all/cover.1738832118.git.viresh.kumar@linaro.org/
[2] https://lore.kernel.org/all/20250224233938.3158-1-yury.norov@gmail.com/

Viresh Kumar (2):
  rust: Add initial cpumask abstractions
  MAINTAINERS: Add entry for Rust bitmap API

 MAINTAINERS            |   6 ++
 rust/kernel/cpumask.rs | 168 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 3 files changed, 175 insertions(+)
 create mode 100644 rust/kernel/cpumask.rs

-- 
2.31.1.272.g89b43f80a514

