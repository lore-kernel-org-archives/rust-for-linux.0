Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59E1EDA07
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996024; cv=none; b=LgDz2CtnIxRmTJrzpSKINTRww8dgPjycN0lYXYT09VcvpyFQhwlK3FAmhBj94ESuPpu0cRySUH+9rXCgzct+ZBlbdBVyOhc4et3hMC9ENlxIv+07kirTxyibLuJyQPoO2zXt4pxvIYFbxJtZAiqInk8eeWenG2rhgT0TT5l4ElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996024; c=relaxed/simple;
	bh=W/MWmFyRzRaY/L8mQHhIyX4NsQyvm3lJ3qdXyxFuKQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TMIa4kkhj2r1HU3kCVyIg+0Wd5FfBik0rtF4VtGhj45a0QT3ispKmSm2qmC8MRqwSyibHSH1FDr9aFOABEn/nqTlgWrL87BGh+tZOcI63zrYDpWjDah+AV9+WPVsdhuUbhmnjR+CUY3aruaw/OU3V6NtE3trVPMFtJRxpoOUO7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZfmi2mf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZfmi2mf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223959039f4so23547495ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 02:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740996021; x=1741600821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ui+QueMnTsbsw0Ov5sY4KY3gRDEpJNDApjz73wwqkjA=;
        b=LZfmi2mfw8rquM1K61TDxyhk3do1+8SmeVxNSBf0CnylS2idN1uHBgltGIqEhe01P6
         t5X8aIcDqIpNk4XmlzjsjHC/mYTkissaMAAXuMot/H+vdZOUlixw2m4/iK17ut/pULHz
         p0Hraz/e+ASkIrR3lPa/WJZ+senZeQGCqu82EyO1CKMSDCTz9Lwz0NLmEyhnB67wUEUe
         43QW0NAaa0Nhz2McwFLhwoQAuheCiPCx0/NcVrE0c1LKZGAAg3jT7nA5hDCQdzvb56Wg
         VZMS7bGL9ufSlFeU/WroF31HQu9WlWWy1wN9jzF3W91Erk8yhJIVoWeCDfqbtFWh4s+h
         lGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996021; x=1741600821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ui+QueMnTsbsw0Ov5sY4KY3gRDEpJNDApjz73wwqkjA=;
        b=TYXObMNwVHdAB7+NekaEC+/mtXfVw/QSZG6oZZFeIwmqDf4uVs7RDXTW2jO/BGxHs+
         oCAiP2WenOV506tZv7z4DkAbo3xy7BXMrCgbsw0VogfHUCq8lMR2eED6XAbWzGPD0D85
         BvOcfy7ilellFlEINukmaK7/AvgSJtrzndqix/fHe3it9xeweDCXm63E5YUDDZ2JWXSn
         U+nN/d5d7vnxy8Wau0A2qgYbM8zThCQfgPI8cEMMEAWYmKnvk0UN7AP2dEAq8HZ8cUC3
         dZ3jjIaZFtFPD/pklRHyNpGqm+RVjRIOfnbrGgcXg387A01at2ybDMaPdh5ZCV+kLDFS
         WV5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpptelbirXPElHSCmhbuCSDm4ai5Ktg7xTQ3rgkVQdaYm/feaNoG77dX3971h9DvLCaGesarXSB0LZSl3Fiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQ+05ru2m3GPupTOoEsgWTC56ouMGvSalzQjJnKbeLim0U/iy
	gwr14sBmCxYgYr97pipZTGzMbHv+ngR9+L8qqFrWEt5asRThD42Coy8ThI0kEco=
X-Gm-Gg: ASbGncuexlsMgEgLfM/RDaXiFg/iz0DrnfEI8FKVw3i/i+GbnwjKY13B3JFXYJDL7Nj
	3gX+RgV+/hVqfpO8A4JErXdvFuCoeGSPJxGgGVHLhCNigfdcEUuH0xcZD2pDQjQ5pU/ErcwslDK
	Q8AgeVUo+4+zOI3BAaS5zGsH720a1ZUio6qpCAap4tQmu+S1k+YE9I++W2eroz3miTHBWY5TA/m
	e7ye+lSH2ZX1pCEBIvocrMCZrbHq98ARvqiQRwSxiBuhxqFvS6q/hxvtNlu277isFnDyzdurmz4
	UAAusP270UlHCldsd+LmPf90GnLhsr1a0RxjWhYvHrnVvQ==
X-Google-Smtp-Source: AGHT+IFJ/3EtNRcapiKvA/LhInnujARn41J0eZebYdMRMc5AqmzRtaclMoy8+PxW2aUq83BCOeNAyQ==
X-Received: by 2002:a05:6a00:14c9:b0:736:3979:369e with SMTP id d2e1a72fcca58-73639793857mr10236218b3a.9.1740996020598;
        Mon, 03 Mar 2025 02:00:20 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363288529dsm4567764b3a.41.2025.03.03.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:00:19 -0800 (PST)
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
Subject: [PATCH V3 0/2] rust: Add basic clock abstractions
Date: Mon,  3 Mar 2025 15:28:08 +0530
Message-Id: <cover.1740995194.git.viresh.kumar@linaro.org>
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

Danilo: I haven't done anything about MaybeNull<T> yet, as we can not access
fields of the C clk pointer from Rust code. Not sure if that is still required
or not.

--
Viresh

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
 rust/helpers/clk.c              |  66 ++++++++++++++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/clk.rs              | 134 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 6 files changed, 205 insertions(+)
 create mode 100644 rust/helpers/clk.c
 create mode 100644 rust/kernel/clk.rs

-- 
2.31.1.272.g89b43f80a514

