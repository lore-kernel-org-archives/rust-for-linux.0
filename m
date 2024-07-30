Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1291D198A2C
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335241; cv=none; b=ifUi3nTBEyKYpKGM78us8k6FlFmlpslwEMfFMY8ggdxNI72dIQG7EHXKCNP29tw5yFmax8xbB9t2V+2yEYe0NzYydLQG33livjOnI33gRsHzgcnC7A45bGVcwiq1GOiReo9ILVJS8rhnx0m558+x18CRJxq1d1BXWUplAtWTzKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335241; c=relaxed/simple;
	bh=u4tTMuWsCVNpmS86dua+fcUTWVSCzwMjLhtud5iXe/k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=neIfinY00+AcMBSh7wyfzV11jWi7RRyZEkXkqS9aev9IhOJVTTU7a7a1C5OcviqfGdVbX55TDcNpA/dvMDu1v+1Ri1KR7JXkOEPtplIjKQTLE3xspKdBmbK4gGHO+gmdfHru6UBwy8cxDy8ylFB80ETIMLCy59kOKQryKcjhSfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6cbtZmg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6cbtZmg"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso3783411b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722335239; x=1722940039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAP4JgQUQf4P0DvGAseoga/op/oHSVepCvQsUTCDQr0=;
        b=q6cbtZmgaWz+g+WV8KKOKrMt5WqnwKvF1PPNW2g32seu2cSsJfDsyUc4uVlYqZaEoe
         TXpdoXxGQdSXd3lI8ZIKZuaM2rSl7DCrTIQ/qtr+h7jno0kmXjoALD0WuoIreXT6rLYb
         uzG0wm0WV5v7Y5jxeq5Q3GbJEgl41wxGYaVwHjj5Z6zuW3ZZdDY7buSW1EHx9l2mPKI4
         Dwrs4QK5ydNghax6uxPQEXCwvrTXATWeSgQGqiW1lgl5kylB5lIghh7ptoYez7/jMVon
         32anTYLfKcG1Nq+8f3M2bO+R/GGVTgPvMA/EMR666Sq1dzI82autuuSKXEq2zuaxfDGb
         Cy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335239; x=1722940039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAP4JgQUQf4P0DvGAseoga/op/oHSVepCvQsUTCDQr0=;
        b=AsLQx+D7w+TciawM9E8UHbbePyqC60A0R/kpZBJLre6Ptt2Xj1/qmUL8Of0PvxAVxu
         EA6tumyBMZKPd5nZkQ0LCTRG37HkIYFua5B6oYhf5mTdpk5VddbOnz7NyJ0tCikOzedb
         6dWoyny+8Pui0KhGl/LBT/mLj7RcvS/zoPN4BkaVgtdV56H94SIwoNIWGbwgcFL6Vb3d
         yX/VcMMDfGv7FzaC6NTWLzRkMCabLViJvUfF4Hx561zZEpTxNa622QpQO7Xb1+QvqHQF
         pGPy/6NEZ7g0WXCtznuc47uZmAVxliw8++EMrlgMpJ5k0bjLfVO6jXEGKyvINkDW9SxI
         U/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhRQOStNBeKmOAfZ7yxBTwPdMhlBWLqtUFDbatwkUFTdHPK4ChQ9AEA7hZEnRAEFuyU/tNApNMUhqPCo8xWEzjvaHChQP9A8J3yM+Ww4M=
X-Gm-Message-State: AOJu0Yy3iJ1EzIYcCUZ0dVNvgKWcBiIsVIWvdW1ueNibWGFCWmw1ofSN
	BANxcZ7kCEiDysYpIw61JCVfii5PZSlUOELsK5X6mSwdYY5c11yQmcF/f6wCv+k=
X-Google-Smtp-Source: AGHT+IH3JOYNeUn52TjnAuIMzRNvQUM5eXeoYBqqi/ynI2wdeeF43VWgZQHcjLfWP5NoZfwh4szhHQ==
X-Received: by 2002:a05:6a20:7487:b0:1c4:8ddb:3fac with SMTP id adf61e73a8af0-1c4a12e0de9mr14002754637.23.1722335239141;
        Tue, 30 Jul 2024 03:27:19 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b9b72sm12227081a91.22.2024.07.30.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:27:18 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 0/8] Rust bindings for cpufreq and OPP core + sample driver
Date: Tue, 30 Jul 2024 15:56:57 +0530
Message-Id: <cover.1722334569.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series introduces initial Rust bindings for two subsystems: cpufreq
and Operating Performance Points (OPP). The bindings cover most of the
interfaces exposed by these subsystems.

Included in this series is a sample `cpufreq` driver, `rcpufreq-dt`, which is a
duplicate of the existing `cpufreq-dt` driver. The `cpufreq-dt` driver is a
generic, platform-agnostic, device-tree-based driver used on many ARM platforms.

Currently, the implementation has been tested using QEMU, verifying that
frequency transitions, various configurations, and driver binding/unbinding
functions as expected. However, performance measurements have not been
conducted.

For those interested in trying these patches, along with a few dependencies,
they can be found at:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt

This series depends on foundational bindings for several other modules,
including device/driver, platform driver, OF (Device Tree), clock, and cpumask.
Support for these modules is not yet intended for upstream inclusion.

The work is based on `staging/rust-device` from the Rust tree, which is derived
from v6.10-rc1.

V4->V5:
- Rename Registration::register() as new().
- Provide a new API: Registration::new_foreign_owned() and use it for
  rcpufreq_dt driver.
- Update MAINTAINERS file.

V3->V4:
- Fix bugs with freeing of OPP structure. Dropped the Drop routine and fixed
  reference counting.
- Registration object of the cpufreq core is modified a bit to remove the
  registered field, and few other cleanups.
- Use Devres for instead of platform data.
- Improve SAFETY comments.

V2->V3:
- Rebased on latest rust-device changes, which removed `Data` and so few changes
  were required to make it work.
- use srctree links (Alice Ryhl).
- Various changes the OPP creation APIs, new APIs: from_raw_opp() and
  from_raw_opp_owned() (Alice Ryhl).
- Inline as_raw() helpers (Alice Ryhl).
- Add new interface (`OPP::Token`) for dynamically created OPPs.
- Add Reviewed-by tag from Manos.
- Modified/simplified cpufreq registration structure / method a bit.

V1->V2:
- Create and use separate bindings for OF, clk, cpumask, etc (not included in
  this patchset but pushed to the above branch). This helped removing direct
  calls from the driver.
- Fix wrong usage of Pinning + Vec.
- Use Token for OPP Config.
- Use Opaque, transparent and Aref for few structures.
- Broken down into smaller patches to make it easy for reviewers.
- Based over staging/rust-device.

Thanks.

Viresh Kumar (8):
  rust: Add initial bindings for OPP framework
  rust: Extend OPP bindings for the OPP table
  rust: Extend OPP bindings for the configuration options
  rust: Add initial bindings for cpufreq framework
  rust: Extend cpufreq bindings for policy and driver ops
  rust: Extend cpufreq bindings for driver registration
  rust: Extend OPP bindings with CPU frequency table
  cpufreq: Add Rust based cpufreq-dt driver

 MAINTAINERS                     |    2 +
 drivers/cpufreq/Kconfig         |   12 +
 drivers/cpufreq/Makefile        |    1 +
 drivers/cpufreq/rcpufreq_dt.rs  |  221 +++++++
 rust/bindings/bindings_helper.h |    2 +
 rust/helpers.c                  |   15 +
 rust/kernel/cpufreq.rs          | 1039 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |    4 +
 rust/kernel/opp.rs              |  925 +++++++++++++++++++++++++++
 9 files changed, 2221 insertions(+)
 create mode 100644 drivers/cpufreq/rcpufreq_dt.rs
 create mode 100644 rust/kernel/cpufreq.rs
 create mode 100644 rust/kernel/opp.rs

-- 
2.31.1.272.g89b43f80a514

