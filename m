Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598A929BDB4
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856984; cv=none; b=qg4aBmOvtDItjYjOCmvD3fPtYn+7V6x2rRi+mePq3V2Gu5y3c9C3U2lLPa64h6KK7cVz1eY/ORvVg1dn4PzfwdF3lNIWyaj5HyRgdjQ0hFqmjOLmYqfs9YJUih5V9HV2EvWQO4NgxnRF4EnGhgC/MehU1eBl3PzcGLpHzU/Coqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856984; c=relaxed/simple;
	bh=hnAIvYLiIWfQPZ9W7jbssmsqX0poA4NOwFeQCUBzju0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jfuL9cL7avojJoDleH1mBm1lsI2sLmN7W+ADa96To6r3TV/XpPVFgVsV/YxIvhv3sZBJQnAsq3NMiCuHjhwqJQg+ZiJwehC8UO8GAwYZr8RzsMRKQ0DbBfIDTkxlL3jvrYc/DXzIGCLJc4iV5rzAv/2ximKxTvnLsWyI2BN3ygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJHywtL8; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJHywtL8"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82ce49785a0so1197606b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856981; x=1776461781; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgBk9xfaTaIhz7BKaj+gDTnrVInusTqsyGsO5zeX01Y=;
        b=sJHywtL80ypAx9ajZn8SafZ9Scx0ny9PDz1ZjhjS4bwF9/IIN9Y3TldUJoWSFukMwE
         FvpeYZ0AMw5ihaGdNPnP00ycwdW2A/9YyzZbuiN6GFY2qRYUX9kF8mw2LJKOziiqmIYM
         YnGuSxN7sx10aqs/j6OaGW3p7B9oMd5dcGMElOCdmoUWWerYvun60RJn5HXawLRIVye+
         Y6wbQsCjEUz7HNiYL/4wgFU+Fu5KwHa9+mFvnmfIj86jwsaUec+7M8q3+PirxQmw8y0k
         8Q1I3xxQrK3Csi95GgWBi5u6EaiFQSWXvbZrfB7SZkqLasmtGyS/Z5D7z1CP+s/EbQNi
         /uQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856981; x=1776461781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgBk9xfaTaIhz7BKaj+gDTnrVInusTqsyGsO5zeX01Y=;
        b=Hc7StDP+Y4BjnAGwThjBHW4QYHBbJUwX5zKb0jjYj2c31hVBzaAjyIMyg24aW8BgWs
         P4YLzNvZXA1AyUlyxdq7dQ9IlzY39b9uNET06XAn0DGidXjAATZ8fLpTS4fTcPvWky1x
         AnpW0XCn41Lmh68x5uZ9oTvJYhINkVQy7i7V5437aRuJ86fuEF2GNU87XvQYKF22Ivsn
         00Jg/YIRSoDgC7Xv0n1RRVlZ+h4K5NdeZpEZCn/bUXX9AKhSg5HCXF02gjrK3qconypq
         VDg3amxIjIJnrWJQwlH5cfdRxTTNmIBEWgHFu54JnkjQPCP/6FYBk8Fu5rFfXhCUjEgV
         qEYA==
X-Forwarded-Encrypted: i=1; AJvYcCUxraDEk9vWUY5wSi3T9X/OPOt3wfTz6ruuIJQmK84x3wKpw3t/pbR2MyQSh2U4zFPSccWUh4MOdoU3qA876g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT7BNq2T/DwP4LcSUsFRzNqATFoPSfrqhZxUfh+XUH9A0Hjq02
	AaD3C9xD/oRvE4+ON61bMH8qLoYdmZwgESffO9O46/Eahn1RfwD5WfYf
X-Gm-Gg: AeBDiev+qVfGX60Fi4ukiBos1HMvDeV2WWEM8T1AcL8ZnustuS/YspNJz99ziTUlAJg
	5dkHCuCMkV8il/WjvZloIEAp74IAuNF6mFMJKuZ9vVZDYg+mw8HE3EUa0C1P4FnteGgs2pXATZB
	PJeVq1LxCGBoBf0S7HHHxCg+CXL50ItGv0eHxKlcufjOLilWYpedOGlAjjBwUbzXueSn5moUnjE
	2gcU+MP03b9uEX3Xm5KLPropN15zI0QRAT4IrYY+CJW2yIyXBgkTBjyY3l0k5wdgjp9QB40NNpd
	jJ/aq1O2VUNOlgqB6GsH8V1KxpOVv5utHDdSDVj2aQmaFHfV95ymie4Pj4z2A5RNCbI75t3pjeT
	8NcZavmMY/G0YWvepPeEZVHoDXX9h47FvzkNUroj1ANlufJtkKXJCRREmzXZ/ls9zGAQ2SMtZMD
	lnXgP+1kkxo1U29b8hsSjbLX+I55U0xbHyCaWI/R2xpnXV
X-Received: by 2002:a05:6a00:12ca:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-82f0c1896c9mr5253153b3a.21.1775856980448;
        Fri, 10 Apr 2026 14:36:20 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:20 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Subject: [PATCH v5 0/8] rust: Add Per-CPU Variable API
Date: Fri, 10 Apr 2026 14:35:30 -0700
Message-Id: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJt2WkC/23Ry27DIBAF0F+JWJeKGcBAV/2PqgsM4wSpiV38U
 KvI/17sPu10OUjnXjFzZT3lRD17OFxZpin1qb2UQd8dWDj5y5F4imVmKFAJC5LnsR94Rzl0Iye
 PjVa1jl5KVkSXqUlva9rTc5lPqR/a/L6GT7C8rjmA4DY5E3DBUTgAQxaxhsfj2aeX+9Cel9hit
 KhQ3RoXtKuFiehd+GOW7gm/+7RQsLNYrCYvoogE0ut/+gzgrbFYNagroxHqfZ/87bNot1YWq2J
 0SEDGCbW36scCCL21avmnVTUoI3wMm975c+mZXsdyueFr8/P8AcOF//nXAQAA
X-Change-ID: 20240813-rust-percpu-ea2f54b5da33
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Boqun Feng <boqun@kernel.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=6467;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=hnAIvYLiIWfQPZ9W7jbssmsqX0poA4NOwFeQCUBzju0=;
 b=O9W2xljSfMWOmdcmOeMtCGsXYlEt2lu39FqFz1eSPuHWK7fz92+HJnD043jzSALQGk5bGWZwX
 io1Sw1d/PAoCPEvxoLxPy2Auqrua8a/yXGJXCCARQf2pQZ4QHVyfOG+
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

This series adds an API for declaring and using per-CPU variables from
Rust, and it also adds support for Rust access to C per-CPU variables
(subject to some soundness requirements). It also adds a small sample
module, samples/rust/rust_percpu.rs, in the vein of lib/percpu_test.c.

---
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>

---
Changes in v5:
- Rebased
- Documentation clarifications, typo fixes
- Added an early out in `CpumaskIter::next` to avoid WARNs under certain
  configs
- `CpuGuard` functions are now `#[inline]`
- `PerCpuNumeric`s now use `ptr::cast<$ty>` to get a `*mut $ty` rather than
  `ptr::cast<*mut $ty` which gives a `*mut *mut $ty`.
- Changed `make_optimization_test!`'s `CpuGuard` to be bound to a name
  rather than `_` to avoid it getting dropped immediately
- Remove `DynamicPerCpu::alloc` in patch 8 since it's not necessary at
  that point
- `CheckedPerCpu::get` now has a `&self` reciever rather than a `&mut
  reciever`.
- Consolidated the non-zeroable dynamic per-cpu support into the
  introductory patches
- `CpuGuard`s were previously automatically `Send` and `Sync`, even
  though that doesn't make sense for that type. So, added a
  `PhantomData<*const ()>` to prevent those from automatically being
  applied.
- Impl `FusedIterator` for the cpumask iterator
- Used the cached `self.ptr` in `DynamicPerCpu`'s `get` and `get_mut`
  since there's no reason not to save the indirection.
- Added `$crate::percpu::` to `PerCpuSyncMarkerType` and
  `StaticPerCpuSymbol` in the define_per_cpu! macro to avoid needing
  extra imports where its used. (Thanks Andreas Hindborg)
- Cleaned up logic in `CpumaskIter::next` (Thanks Yury Norov)
- Link to v4: https://lore.kernel.org/r/20251105-rust-percpu-v4-0-984b1470adcb@gmail.com

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
Mitchell Levy (8):
      rust: cpumask: Add a `Cpumask` iterator
      rust: cpumask: Add getters for globally defined cpumasks
      rust: percpu: Add C bindings for per-CPU variable API
      rust: percpu: introduce a rust API for static per-CPU variables
      rust: percpu: introduce a rust API for dynamic per-CPU variables
      rust: percpu: add a rust per-CPU variable sample
      rust: percpu: Add pin-hole optimizations for numerics
      rust: percpu: cache per-CPU pointers in the dynamic case

 rust/helpers/cpumask.c          |   6 +
 rust/helpers/helpers.c          |   2 +
 rust/helpers/percpu.c           |  22 +++
 rust/helpers/preempt.c          |  15 ++
 rust/kernel/cpumask.rs          |  97 ++++++++++++-
 rust/kernel/lib.rs              |   3 +
 rust/kernel/percpu.rs           | 282 ++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs |  48 ++++++
 rust/kernel/percpu/dynamic.rs   | 227 +++++++++++++++++++++++++++++
 rust/kernel/percpu/numeric.rs   | 138 ++++++++++++++++++
 rust/kernel/percpu/static_.rs   | 218 ++++++++++++++++++++++++++++
 samples/rust/Kconfig            |   9 ++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_percpu.rs     | 314 ++++++++++++++++++++++++++++++++++++++++
 14 files changed, 1381 insertions(+), 1 deletion(-)
---
base-commit: 8a23051ed8584215b22368e9501f771ef98f0c1d
change-id: 20240813-rust-percpu-ea2f54b5da33

Best regards,
--  
Mitchell Levy <levymitchell0@gmail.com>

