Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE616ABEC
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Apr 2024 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712315392; cv=none; b=hFQWQpQ0QjcGQBFmAoc0/XVzZOYAdmvTFZjPsWGsT83WuVAtH2NGfwrovF1IQJCYcoP+icTLd9lTZzPJPQLHDY1Tq2w67ETI+xtqHIBlXAMcKGKvsyl9LgzW+/ZAvDpTgrH6FlmEsEMoUBpxG3Iq13J80U30GG+506R4LC5Rx54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712315392; c=relaxed/simple;
	bh=TugG3AB0lsWMh7jn+aDBl+S6sWBQPDYKMwxIi40RiBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oZxWkdt6o7HGFQiPsKeaLsU/fT13I+T3Y/LWHAF7cG09UCaxAvyHLZJgDbo1AwSNBnY5IixhzvFCIM68qxsYj6x0wvq3q1IqsckK8UNnHsgbQ8Sty6IC5uj10rAU2cTfMm+ddCq4JIIa56K1L3pL3+pzFli8GStmjmBiavvW/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEdF2skc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEdF2skc"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ece8991654so1671558b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Apr 2024 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712315389; x=1712920189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilEskIN8tKWZMsYnEfjH123xoWAuOl7U7IF0t8VdrT4=;
        b=EEdF2skcPry7IYyyN+2FRDV95aQPsAGTsAI1mOISkCM2bNN70Nu4LJ9jr1SBwg4125
         yL9+sgeKbWkJ8MSMZjNwmGDijUjb6KIDOsqKs+YsOq+ii64W0epFyeKz1Z4TGmJFXS/T
         OOSEw140MbN7ROWcaEZUbdx99/vZjy3G9M6QBXm4eyn2voshxJXzBk9VNJ3JGWL8cUBK
         axfez5OTm8lxebt5G47QESsOUhIA21un2fH1HSJ33Q931JLUgtEpQ/pa/uy1CNQo95qo
         L6z5rO8NXqMozrTp7UOnLVfS3gmveGb3lzjpmC6hPldKYGViaD2cCFy2U75o2NXBKwst
         y29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712315389; x=1712920189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilEskIN8tKWZMsYnEfjH123xoWAuOl7U7IF0t8VdrT4=;
        b=N/KyMDsHlLKgVWgNEF3C6/gGK82POO2rlLF+6VF8ghmGUdCodYPCrpHH0C1SgXTmMr
         mP6L0RgyFpugzVrSWpDP/Mgnp+Q7MchJAnFpJKc/J1/cL8E9TVNaVymlOpWVDjv5MO57
         45jVT9m7AGr1MtXfn8f2Zoj802z+TcEqQHZ2JGx1ODOs84oorMfZN6q3igt/eI2BGfw2
         PeT609FGoyIEY+nVEJ5UV8mVP5iRc5qH67W5CBuubsVKLn3f4vmX4uhObswTMzJtgOcx
         eEkDxe5uNHn/ik1j6Z6duin+1s4I45BInDiWx1OMlSG80vUPlIPlbD8OlhZnIt8Fxti8
         x4hA==
X-Forwarded-Encrypted: i=1; AJvYcCXfFepp+jeqvovPXGAoaM6TXiGcwOuIFCGaPh9u5aRtr4KfnGhT6C11IkhgW/d3L8JEWJY7rA4GnqzWl6ED5/H8PyjJr71XehubMxFiBwA=
X-Gm-Message-State: AOJu0YwcAx+9fVdZv3RWqvF6YMFLXMMrKr9ERIeOHb92/Q33y9IcHlU6
	D+zMvEz/c45WcYRE2Yz3vdeJgEoy6n6iMfDoaTbTpPhR8/R9wD68Wkn6K3CoYew=
X-Google-Smtp-Source: AGHT+IG/YfkF++gD2mlqOUJepSZK7I0ECiDMCZHHrVA+yfv0tmEvQP7liNI3ygazqjrq7uFr3Aj94Q==
X-Received: by 2002:a05:6a00:1803:b0:6eb:3c2d:76e0 with SMTP id y3-20020a056a00180300b006eb3c2d76e0mr1328344pfa.11.1712315389286;
        Fri, 05 Apr 2024 04:09:49 -0700 (PDT)
Received: from localhost ([122.172.85.136])
        by smtp.gmail.com with ESMTPSA id b187-20020a62cfc4000000b006e6b7124b33sm1262793pfg.209.2024.04.05.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 04:09:48 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] Rust bindings for cpufreq and OPP core + sample driver
Date: Fri,  5 Apr 2024 16:39:37 +0530
Message-Id: <cover.1712314032.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This RFC adds initial rust bindings for two subsystems, cpufreq and operating
performance points (OPP). The bindings are provided for most of the interface
these subsystems expose.

This series also provides a sample cpufreq driver rcpufreq-dt, which is a
duplicate of the merged cpufreq-dt driver (A generic platform agnostic device
tree based cpufreq driver) used on most of the ARM platforms.

This is tested with the help of QEMU for now and frequency transitions and
configurations work as expected. No performance measurement is done as of now
with this.

These patches (along with a lot of other dependencies) are pushed here for
anyone to give them a try:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt


I understand that there is a long road ahead before these patches can get merged
as a lot of other stuff needs to get in first, i.e. Rust bindings for:
- generic device / driver
- platform device / driver
- clk, regulator, OF, cpumask, etc

Because of the missing bindings for above APIs, lot of calls are made directly
into the bindgen generated bindings for now, to make this work. Hopefully we can
have a lot less unsafe code once we get all those things merged.

Based over v6.9-rc1.

Thanks.

Viresh Kumar (3):
  rust: Add bindings for OPP framework
  rust: Add bindings for cpufreq framework
  cpufreq: Add Rust based cpufreq-dt driver

 drivers/cpufreq/Kconfig         |   12 +
 drivers/cpufreq/Makefile        |    1 +
 drivers/cpufreq/rcpufreq_dt.rs  |  264 ++++++++
 rust/bindings/bindings_helper.h |    2 +
 rust/helpers.c                  |   15 +
 rust/kernel/cpufreq.rs          | 1090 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |    4 +
 rust/kernel/opp.rs              |  895 +++++++++++++++++++++++++
 8 files changed, 2283 insertions(+)
 create mode 100644 drivers/cpufreq/rcpufreq_dt.rs
 create mode 100644 rust/kernel/cpufreq.rs
 create mode 100644 rust/kernel/opp.rs

-- 
2.31.1.272.g89b43f80a514

