Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F84267B9B
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638476; cv=none; b=XuUXjdXzk8FO5fYM03DeLaxb4Vr+KoYU7SDBs2QxjDDUA2zLzYg9vpoEfJx0ITFapB2+VzS0Bfy7LGc0jXPa1tb8wl4FZa1Izib5uF2ZIrp6nGjSKFway9aDTQBSy1epT2b+YW3aShsVyRKdFOIXL6qjW0HOh5A68aUDTwnEyyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638476; c=relaxed/simple;
	bh=pRm5rikPg836Cpaht6T2Bti6G/gsdEEiL/oreW2ehWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L5mZ/H8w9i1Xy1Ejn+qVDcev1CbWKKA8rMzeY98Sn2QiXlIFdRrjyJfNtr1Jf5a3b7zihzUaVx50QEqfzxPiuRcg2jA9bvcd1bHRhGjqaA88aL2Z3TGYGYKod5yN2+MUw3vFD+bLGzDxGAk1/mL6CkwtFyMQCAKH/pN1t9/Swwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+YTjkwB; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+YTjkwB"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so2222381a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638474; x=1748243274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaMUD1BDVL417dtmG3+/1YWJeUCWl78+KVSs+NX3TJI=;
        b=l+YTjkwBHgTH8v1w34B5fJiYaOKFe53M9ewGKfa4UJjZ0k2lPCEBBnbIfYCSZt/FD0
         SNRIYAbSqo+1wpXam+T4jvGZoAY6LhMQFHXwziespZte5KjJRGOFbOiRgZ1P0AHxh1nf
         m5/NqgSIqQlqKxdMxDAfsmhY8RV/JJ1DAvo5JmtLmffHUU0MD6xY51VnsI4kYsinWjiL
         cOqrUv3QAkIKFPP0hGlGiYvyYwSIYbgjdRZC/we3aLkAw81Z8sqEmRuyqOxBRxFlejdk
         3PKeKykFAEjDNLKF+gi6/GtuG6X5Zgsdxzbh+gxXjI+YtfO5xxV/DglU/fbI+II04ShC
         1Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638474; x=1748243274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaMUD1BDVL417dtmG3+/1YWJeUCWl78+KVSs+NX3TJI=;
        b=UFGRanrW+YG+TT8dOVsjsPvJnm4l+hUqgUWkm7gLPwRsVt8nQOkivN3WepN8G0rvJ+
         2IZ/oIpMUd+eSueSiY4uatsytdLXp6kRQIlCOKviJpa16LdmnaYjDFOIls7X89MRdfdr
         y+YgWixNLhyB4bG9/vWT58QP5CpatR2weTraSrwmnbda1dgJj4OPNQ9wtJbTcnTNYUR5
         Ml7MUwbuGTiC2E0eY4tDQGVGwkiO5xybTdRruYGK9SqAzMpkQDsnHZPQ+FRFn/W+icnz
         KlKRdeTo69zKeR0KNiOak4Z/06T5NjJQSB6bq1kOFYoD7Lifw1S+i70qfv0r7IGWu3XJ
         WI5w==
X-Forwarded-Encrypted: i=1; AJvYcCWrZC1xKEI/dce18UuJsYx2UnZ9VbfwPyykqCdCDiwvGn9ByE/s8yZLoocvwSUWmSo+yTW4pdcVHX4cErXtfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwvXgSNiZ5F8pA3jqQbemoy7JbYLhTmJtSeuE3mkr0IrW5uEJ/
	njy3343WFPdXEiv+e6dNxKRqymyiN+eMT1KwabJl9jNFU0MyCTpzfzvGUn+kZaBenpc=
X-Gm-Gg: ASbGncv5t/0g11dO4l7o18dcoGFeESPzhgV6it33xeqJsDQgpoRUYDDFQK2yGJuhh5I
	ciLNsh+WF5Z3SriJh2yZcGM0j/PiE0DvHI6y+oJ4haNuQzOcbAOsLKqxrwpISpA3KgdK2WA/D5d
	pTfDQdrWUCe6MxsLc3jglwOsuFc3lZve2wn2DGn28JR5gv0WjZy3n4HhLd2UEymZnalfg8muaic
	ZIH1TfaFYm03oj+7+TXYXQZrvoU8bS/5/Ls+AlmDnKK+rSOOzPHban3R0r77XrrUv6L0mjaEaS4
	QiEUEsJjG7nHarKvjAEQgqgO7oAN1wn2UhxonD9bOGm/TXGQdHrv
X-Google-Smtp-Source: AGHT+IF6hrADdyFBpfdMCMprB3NMgzCMsos6RN5vYSz8df1JQKxMeM5q1LLUUUmaKL61jlqJM0kYYw==
X-Received: by 2002:a17:902:e808:b0:22e:3eb9:471b with SMTP id d9443c01a7336-231de36ba47mr143813725ad.23.1747638473898;
        Mon, 19 May 2025 00:07:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e988c3sm53200075ad.120.2025.05.19.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:07:53 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 03/15] MAINTAINERS: Add entry for Rust cpumask API
Date: Mon, 19 May 2025 12:37:08 +0530
Message-Id: <0bda169b2243ea571c7dc26a3362380a4b2c7840.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MAINTAINERS file to include the Rust abstractions for cpumask
API.

Yury has indicated that he does not wish to maintain the Rust code but
would like to be listed as a reviewer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..bd7c54af4fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6237,6 +6237,12 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	drivers/cpuidle/cpuidle-riscv-sbi.c
 
+CPUMASK API [RUST]
+M:	Viresh Kumar <viresh.kumar@linaro.org>
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/cpumask.rs
+
 CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
-- 
2.31.1.272.g89b43f80a514

