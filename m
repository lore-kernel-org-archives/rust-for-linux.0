Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBBC1DF25F
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762383748; cv=none; b=mNJ1GfANDJXpNwYChJr2WLyHMHPaPdhlxzdM2usI+y6JNqpEwxgNy2eZJdKOZktjoG5gEMnqKzxRg9hDxEiEn7U33UomBKhyH8vlSIs8FoAkH5gD3p/YKCzLD/5u+FnQxXaErosEW5OXw7D/VoRUm+Z5oby5b+G9GwEAA+m8knM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762383748; c=relaxed/simple;
	bh=unKKUkPd5pRTqG3L9Z0F/ADhxBnwusdEiP6PTAc6qPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NnuWuPil2jUy8M0rYC81+3Dd0HLI5qmSjVlr6IDeJDO5D4wwlGeNTTw040TT1g3AvkDnbTVTi7NXpslyxLoYZNwwjLJU2jRueTOTGgVgGOSCKPKPel8HgEr5DzbeZMgsMInbnhcr1M/OfBBX8icm/l1o5fmbKBMGqLHSzDAwj0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+9JOsrm; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+9JOsrm"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b8c0c0cdd61so262041a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762383746; x=1762988546; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m5P8jXB+dIsfoWVQD4/Et/l6O3PGrt87olQD+9nhTtY=;
        b=C+9JOsrm3uprfGAdTQPSzpv7Y9RRwWRSAwcp+VYnEwnkiic/NbtGRaI9g7NOXLIaY8
         aeElRLmvZ6YuFVZopO2Le1/CfzM60aWFjJ4RZVWx551CTr3VOtRAD+8z+Wg8rf1qNR7Q
         +xYMC1iqPtZrafAFaUOUdS71xuX/ZeUoA9nYMqwcDcVkibTdmaPGEnWcJyUw+degcFya
         sO1UQjU6gHtlkJZ2NzM7T41lzstJaLX3OW8HKQg1mw1k1FzE0746gboM4OcQLduhzvDL
         jRPyBL5e/UB/SeS7BuKwWFPAs2NOZ3CZid3/0bKii79B+HyrVCvNebs2j15K8rGzL7lV
         0h2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762383746; x=1762988546;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5P8jXB+dIsfoWVQD4/Et/l6O3PGrt87olQD+9nhTtY=;
        b=gFv2vApFjTxP4yLe28smn7h2jXziGrZEzuzxv2nag+mfKaXn4Eyf5euWFfEbnfc8n/
         Jq31wHdbq3cj+FWZb8Nn2kNCpPU+Ot4ZW3deDblQjd6ITuFpgCiDWcb0HiErwLnhn2vH
         TVkSTMg4BGH8710UBgpEZZcrJjjgE3f1kXRZan1oXtA0LwNDBVgpuGvAkT90XLVxG8cX
         fBfeydqu6zsE40gP38gUxXy/JrY/A0L1AclK8joWaQf2izS7MT+m/yY0uFnH+8FBm3YR
         CA8dfQfQ6dQcRFwx9w3MQ0ZorpUSjgpP4Y7YhZ17gI2sSWfZpZ777zzb/XY03+XH0Kgp
         LDow==
X-Forwarded-Encrypted: i=1; AJvYcCWwmxhpakMSRkYFWvzPHDq6zY6tlACOBOhocNu3uuWo6Q1T1QIsHI51ViB0umMh+odnZQg/uDJGx5/bGDJ8LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6u5Jysg8csrY+bl3cqRFsLKPlB8QnKBHepJUxfw6aet+HLMy0
	HS+7D3yubNe+viux9SKS9vaRLdwbiUTHViaGzoKJRxnpPZ5HpXnqw+Pa
X-Gm-Gg: ASbGncsFntzzzpRz92NQKn7t3nMA/Y+0b2QnStxonxpoaky3c1HfgSFR7OQR5CaMHE+
	EgCxAv1Nw5XaDxd33NIN8MvznfFYkbui5m6FfnilbGvz9fBWSCAKh8wCC12gWryhk0qz8Y7tbT+
	8Rz1AlEBO8EvntUmtZVKWRnSJhgiHaSIG64Yaf3B2eszf9ARConAF9Ac/8qrCqeWkDoL/IgeL3t
	TDkOOruLE/++KHm6dStRWtejuDDtWjt/GymHP/6vWE+XhXGb9ewt5avF+iSBBm0ITF2bPsC+Sp8
	IS42bSos7YnRntIX9qoeEjyc1jiRzpDQTtS8y/eZTCsWfdLMaALSIHXndr2EjZMzPps3pGeGxTb
	ZiD5IauYwo2behh90O/Ly8L4bifY7xyY84+D0R/e+l3Jbs/mG2pOATWRxsc54fzn3Iu131syPcZ
	39jHOMNhYIkPWGFE+B3L0lEkSEl5XdNy4k9vU2vRGKTgDk
X-Google-Smtp-Source: AGHT+IFcWQsxhsDJYw8BvHJ+cu4xy3Cbjz4NgQDldTTtvAA02XiwTojS7CTRnWKlbDVxorN9sS9LUA==
X-Received: by 2002:a17:902:d488:b0:26d:d860:3dae with SMTP id d9443c01a7336-2962ad83389mr72820715ad.3.1762383746250;
        Wed, 05 Nov 2025 15:02:26 -0800 (PST)
Received: from mitchelllevy.localdomain ([131.107.147.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096839asm6325645ad.13.2025.11.05.15.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:02:25 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Subject: [PATCH v4 0/9] rust: Add Per-CPU Variable API
Date: Wed, 05 Nov 2025 15:01:12 -0800
Message-Id: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjXC2kC/22Q3U7EIBBGX2XDtRhmgAJe+R7GCwrTXRJ3W6FtN
 Ju+u7Rq3B8vv0nOOcmcWaGcqLCn3ZllmlNJ/akO9bBj4eBPe+Ip1s1QoBIWJM9TGflAOQwTJ4+
 dVq2OXkpWiSFTlz4228tr3YdUxj5/bvIZ1uvmAQR35ZmBC47CARiyiC08748+vT2G/rhqK6NFg
 +qecUG7VpiI3oULZm3P+NvTQsENi5XV5EUUkUB6/U/PAN4zFpsOdWM0Qnvbk389i/aalZVVMTo
 kIOOEumSX78dlep/q98ef7y3LF3S2LbabAQAA
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762383744; l=5076;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=unKKUkPd5pRTqG3L9Z0F/ADhxBnwusdEiP6PTAc6qPM=;
 b=wJYwix5/zj4Vy0vQM6M/OltQSTZy+YEPGtMMsjgYxv3Uz1EwTP5wCYJJImuAi/rTC8Jt8quPT
 BKnBugpFEAqA+8tOxJtVekq+qC4/uZGDxtzL43n7if+USvw9ItaSj9r
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

This series adds an API for declaring and using per-CPU variables from
Rust, and it also adds support for Rust access to C per-CPU variables
(subject to some soundness requirements). It also adds a small sample
module, samples/rust/rust_percpu.rs, in the vein of lib/percpu_test.c.

---
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>

---
Changes in v4:
- Split what was the first patch into three patches (Thanks Yury Norov)
- Add intra-doc links to rustdoc comments (Thanks Miguel Ojeda)
- `get_remote_ptr` is no longer unsafe (Thanks Miguel Ojeda)
- Renamed the CPU mask getters to be more clear (Thanks Yury Norov)
- Add an `ExternStaticPerCpuSymbol` type for static per-CPU variables
  shared with C in order to make the extra soundness requirements for
  these variables more explicit.
- Properly drop the contents of dynamically allocated per-CPUs when the
  `DynamicPerCpu` is dropped, and properly document that
  `PerCpuAllocation` does not handle dropping values in the allocation.
- Functions on the numeric token types are now `#[inline]`
- Safety requirements of `PerCpuPtr` functions now include the fact that
  the pointed-to allocation must be live and appropriately laid out in
  memory, and SAFETY comments of uses of these functions have been
  updated to reflect these requirements.
- Included the cpumask patches first, since it might make sense for
  these to be merged separately.
- Documentation improvements throughout.
- Link to v3: https://lore.kernel.org/r/20250828-rust-percpu-v3-0-4dd92e1e7904@gmail.com

Changes in v3:
- Add a `CheckedPerCpuToken` that enables usage of per-CPU variables via
  a `&T`, allowing for a wholly safe interface when `T` allows for
  interior mutability (Thanks Benno Lossin)
- Add support for non-zeroable types to be used in a `DynamicPerCpu`.
- Remove necessity for `unsafe` to get a `StaticPerCpu` from its
  declaration (Thanks Benno Lossin)
- Allow the declaration of static per-CPU variables of types that are
  `!Sync`.
- Implement `PerCpuPtr` in terms of `MaybeUninit<T>` rather than `T` so
  as to keep all invariants in the `DynamicPerCpu` and `StaticPerCpu`
  types --- this would also enable `PerCpuPtr` to be used in a per-CPU
  type that does lazy initialization.
- Link to v2: https://lore.kernel.org/r/20250712-rust-percpu-v2-0-826f2567521b@gmail.com

Changes in v2:
- Fix kernel test robot issues
- Fix documentation error
- Require `T: Zeroable` in the dynamic case
- Link to v1: https://lore.kernel.org/r/20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com

Changes in v1:
- Use wrapping_add in `PerCpuPtr::get_ref` since overflow is expected.
- Separate the dynamic and static cases, with shared logic in a
  `PerCpuPtr` type.
- Implement pin-hole optimizations for numeric types
- Don't assume `GFP_KERNEL` when allocating the `Arc` in the dynamic
  case.
- Link to RFC v2: https://lore.kernel.org/r/20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com

Changes in RFC v2:
- Renamed PerCpuVariable to StaticPerCpuSymbol to be more descriptive
- Support dynamically allocated per-CPU variables via the
  PerCpuAllocation type. Rework statically allocated variables to use
  this new type.
- Make use of a token/closure-based API via the PerCpu and PerCpuToken
  types, rather than an API based on PerCpuRef that automatically
  Deref(Mut)'s into a &(mut) T.
- Rebased
- Link to RFC: https://lore.kernel.org/r/20241219-rust-percpu-v1-0-209117e822b1@gmail.com

---
Mitchell Levy (9):
      rust: cpumask: Add a `Cpumask` iterator
      rust: cpumask: Add getters for globally defined cpumasks
      rust: percpu: Add C bindings for per-CPU variable API
      rust: percpu: introduce a rust API for static per-CPU variables
      rust: percpu: introduce a rust API for dynamic per-CPU variables
      rust: percpu: add a rust per-CPU variable sample
      rust: percpu: Support non-zeroable types for DynamicPerCpu
      rust: percpu: Add pin-hole optimizations for numerics
      rust: percpu: cache per-CPU pointers in the dynamic case

 rust/helpers/cpumask.c          |   5 +
 rust/helpers/helpers.c          |   2 +
 rust/helpers/percpu.c           |  20 +++
 rust/helpers/preempt.c          |  14 ++
 rust/kernel/cpumask.rs          |  94 ++++++++++++-
 rust/kernel/lib.rs              |   3 +
 rust/kernel/percpu.rs           | 273 +++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs |  36 +++++
 rust/kernel/percpu/dynamic.rs   | 184 +++++++++++++++++++++++++
 rust/kernel/percpu/numeric.rs   | 138 +++++++++++++++++++
 rust/kernel/percpu/static_.rs   | 218 +++++++++++++++++++++++++++++
 samples/rust/Kconfig            |   9 ++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_percpu.rs     | 294 ++++++++++++++++++++++++++++++++++++++++
 14 files changed, 1290 insertions(+), 1 deletion(-)
---
base-commit: f3f6b3664302e16ef1c6b91034a72df5564d6b8a
change-id: 20240813-rust-percpu-ea2f54b5da33

Best regards,
-- 
Mitchell Levy <levymitchell0@gmail.com>

