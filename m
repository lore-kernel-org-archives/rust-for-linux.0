Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404D917D355
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742277452; cv=none; b=EbWA4Rgj41LGEj+f56KAydtKHaS6ibfi4rRSiJOJNsJdoa9EeaThmxCTnn/qNJjD9o/1BrqH6or7AtV+SuVmbUeWpVPZGtK5uI6F1zPOvXeaWPYTXwyA4APUkbRfXjbllbK49kbmyHGhlVhzfGVzfXNMTnLN3NrAH/lq7L4wLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742277452; c=relaxed/simple;
	bh=+sCbQh8R9TiUu2oyJra9dESUle0tKB3+uLGKQZ/N9mQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FtvBvI7DBW2qCgWcwIICr9ynaTPnuKfVCOvq1Sh9QgjSc8PDqoXczwL2/KEaBPLAwus6oNxno55cMjGN+KpLQ22DTMo6J60UOc7EkRYTdkGgKh5w2z4SLhSgdpWQ+QV76M7IOpqNBz0d0dC+HI1E0M6YzR3OpTG2N/s2zenj5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDocyHhF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDocyHhF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso3875920a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 22:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742277450; x=1742882250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aeBl6UcsWDr5MR5JO0HAraFd7qqgoYlegSDWTc4mF74=;
        b=TDocyHhF9xHl6UQit6JetGMGlFOuk8gVHsZstEslB0WnSDxEbgWiM5wngvSBIMppC1
         cGxeS9CCPfbD9JbO2KquRW9QK0QQbtnaZqRsYMG/ixw1ZVfJn3/5GLmoQ9a9hV31VIEe
         n0qQCaT+C95lVmYzos6HDsCBSiH9DmCoLSp91Aig0mD3niiP1DRnCz46J1RZkMzeDlRu
         /Pi0ZyyOHs2OuJVp8DxILB/C4FgvxjOhlgFu45UnyEn2zN1fGAXRgX2KlG9Ot/0cxta2
         YlsacoGBweSQsvFTLQBrV4s9Zd40U+1l5ajd1ugCNwxMLUUxC5MUew4hShmfcXaMgRMd
         Mqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742277450; x=1742882250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeBl6UcsWDr5MR5JO0HAraFd7qqgoYlegSDWTc4mF74=;
        b=Buwr7FF5ZIWmcgSnsClWEotviLp6LE4dT2gSWnuWBDr9zP4Pae/Fky6Dl3CJjAjQpb
         KGTtDjlRN6/6xbB9C1rMpZT82R8K8m1wej+ROSzf8ETSjtcFqPaDpAeSlsdb7zhfFBy/
         z33STew8ZT2iCOCBBBBj4Kx59yCOyHpOXD6l6d/MQ+3DAWhAIK1cRLVhmLXMXST+12zu
         GVA7WHh1IyrEa4HTTj/LqcrsYnnXzOE3VGsMi23UIvRVmoDUZuTRI9DNQRfkun/pNQiW
         vh5Y6/eqV0VauEls4kbCDTw7x+pisfRi9xlLq9XDnTAihFYzYKmHc6P8c39pR7kHzXYQ
         lI4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYgpRzHKEpKqPTsbA9s0VGRcMZPl5F6L1skx73maOgq1c6CIZcZsXOeKOhG5LPbAeUdOqq/ZQ3w30qeB7VAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy8iMhkDltqRNFhJcIk02IQhQeTW+80FMVZszV7cPyCxp7oP4p
	403nGFh3vwnSax2amKGZo0PseGaET6AmXzWYxRegO77XL4y9GsSgP5aNbot5aKs=
X-Gm-Gg: ASbGncv3EAwu36HAbVp9gNZhhjp9U7rJDL5VGIIO1nLsiu3rkUYuN6FfAEqBES23HZs
	pxD4dP36ElUQLLRt/YF85NYUuWLj2V2hgEkxIZacbeaZbCh3Znlg5X1vWR/hvy/WR5QEVxR2LLg
	0UOKE9YQpUKNJTb0/K1QsircYFEEmCZOlO1ADGZ8IZ6rJcz+EHWdWsyX8YMtQvbQY8vZVdfDuY1
	pIM0UHjlxHUc56s91lST3DimUH11fCeXHRIQomhIDv7AHm0zRSOJELFQNOmy/QUdYRLsu2+zhda
	XwwGuFKnzBvhi2dsLG2pXMXCpLxBnF7y7jPW7Jue+xnRL4vMytYOUMlT
X-Google-Smtp-Source: AGHT+IGZoqhHvlj2fz0gcgs7G9e+hylpXfVfEtrS7DVAG1eIEQ0QX829SvXWTu+13YtzB692qBmerw==
X-Received: by 2002:a05:6a21:1fc1:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-1fa50bd891emr2828484637.17.1742277450486;
        Mon, 17 Mar 2025 22:57:30 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152951bsm8981519b3a.15.2025.03.17.22.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:57:29 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH V4 0/2] rust: Add basic clock abstractions
Date: Tue, 18 Mar 2025 11:27:13 +0530
Message-Id: <cover.1742276963.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This adds initial abstractions for the clk APIs. These provide the minimal
functionality needed for common use cases, making them straightforward to
introduce in the first iteration.

These will be used by Rust based cpufreq / OPP layers to begin with.

For now I have added them under the maintainership umbrella of the common clk
framework, please let me know if I should do it differently.

If possible, I would like to get these merged via the PM tree along with
cpufreq/OPP abstractions, but its okay otherwise too.

Miguel: I have dropped the changes related to a Guard implementation for clk
APIs as the discussion wasn't conclusive enough. Maybe we can tackle that later
if required.

--
Viresh

V3->V4:
- Enable clk abstractions only for cfg(CONFIG_COMMON_CLK) (Stephen Boyd).
- New struct implementation of Hertz.
- Added examples for all the structures.
- Make methods inline.
- Improved comments, Invariants, INVARIANT, SAFETY sections / comments, use
  intra-doc links.
- Other minor improvements.

V2->V3:
- Add type Hertz (Daniel Almeida).
- Improved comments in helpers.rs (Daniel Almeida).
- s/Clk::new/Clk::get/ (Daniel Almeida).
- Implement OptionalClk as well (Rob Herring).
- Fix Safety comments (Danilo Krummrich).
- Add tags from Daniel Almeida.

V1->V2:
- Post this as an independent series.
- Include more APIs, apart from clk_get() and clk_put().

Viresh Kumar (2):
  rust: Add clk helpers
  rust: Add initial clk abstractions

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/clk.c              |  66 +++++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/clk.rs              | 304 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 376 insertions(+)
 create mode 100644 rust/helpers/clk.c
 create mode 100644 rust/kernel/clk.rs

-- 
2.31.1.272.g89b43f80a514

