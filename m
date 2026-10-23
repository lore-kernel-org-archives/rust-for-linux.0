Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760671;
	b=PKgoPvRksqTHqyuWl7MI7etaEoPoIecbBhB1e3DxY+eJnBPEQDi8QUnZSwspEL3OmC/u
	 ZoA42ItNc8yYOjwfMC7RgeoO+f9xJ6x9/RcxS6ks9RIqSZy1hGxjLGNwZH4cu+SjF1XeY
	 hXDyYn2qACrwDmgE3X7lsoHMMzY6WUGJdOhCKE+lJSytp6Dsxk9GPY7umjfSuVKvrAmk/
	 yULlzPVYYVTUQ1L7E0sm0d+jiNVRpSiViFyxbfJl8d1SloD96ulW1H5EVf4fooKnorwSs
	 uJsyPP+HbymCcaTk+sWcpwJTMLQS+hbq6/gmtPd9ZHc3t7aUjw0kORsBgUitBRKeP8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wFzTp4McY4TXdVXyz0+uKI0uNjSlG+US60cFiZ2tb2c=;
	b=D4M96CNMl5M5wGoCJsyF3hd7TGtR2jOgxwghuoYwl/rB32rEEmByVDSnnC9mzsIVjSF3
	 t0W1GvUmREQE9ygDMNZudpnnHcNqYRaXd7hgCDZTCEMSIqzaYrePCHw4e5galAUsSqxzR
	 IPb+QacUhdSNAmLI9h0BhvmbuzTJDoavmKDf0ID936t962YcKWsMuvmFhVjpttzG80ZOK
	 XN1qp3EE1gx2ztf1edIEsath1smRpSGYP64R0aDineqoQoLwieKT9KzNTEPT4YiqFijgf
	 yk62gfkXMmBqLTMBcJgDHGdgFWGSCCce6GMpCApcnd6MpxEWdLI4+C8RIyvQWfd4Y5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FPv55LBT;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB8606A31B
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 13:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3EB8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FPv55LBT
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso218887a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760669; x=1793365469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFzTp4McY4TXdVXyz0+uKI0uNjSlG+US60cFiZ2tb2c=;
        b=FPv55LBT7TdUEzhW6iqyNuX4jiMfJSQfKoUaFpr6HLw+YQeNphapvIsI9h3sgnr4cI
         40HCsmUN0J56ypzHtJhAXR75U9PS/pwVQ1CqBnoFS/5WJaDc6srC2zCTLyz4PULsCdok
         Mt/jm9QD0jC7+qvCa9JcEbQnrSr2P+TIxzAvEjCBi95S/WFNzEfUgpmmipvbHZvTgv9K
         jT9jxVZe+mFv2vXij6IVf3dAGPahRV4LSlzL+mvUR7lMrdr7c4F5BxNM8kPmRiDNLN21
         Xibcg1JztY3tb0LS7MaQ3xc0p8SgE5laLVMYzhRiZuSZx9z5X21TMRjrUhOYGloZ57zW
         HoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760669; x=1793365469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFzTp4McY4TXdVXyz0+uKI0uNjSlG+US60cFiZ2tb2c=;
        b=dbpkFojyOcjHbFuHjSScUQPtr4c1TYAAnS2efNzHAaT8ewJzyAVfxY/5DMFajw99mw
         r6idV/9pJRSqNhgr2LKkfatDrWqDCkX5KEsFrSmiASDTAxEFMArPRrb+BSEi47A6yLYP
         wCHq73R+/CobL0RC6wqHCL4y5KT8UaqpqXf109pzPof7TfGwd7xjb12L7vGnDLHbJZpc
         oTCphBI7k3DlRZ4VpiGJ9XQFSAADvYOCr892yTypF5kp7eVPYFWnKjdRU6q8JE+OhQG5
         eDORtgupAKso66lQWi6lDEsww2LLm0kxSHfWW36soEu515sbdEf4nV++xxGg8VnWP8I0
         J6CQ==
X-Gm-Message-State: AFq9FYI6DclrsH9CLoecLeMIm5AXJhEX9a6xt4dIW9bOQGgoyxKohQhO
	XA6cUdf8M2A+rWwngA5LljY8pjUaJ32XJyexBiGLAweaNhoG/0bv8oG3qyuWxhnupA==
X-Gm-Gg: AYBFou3GL9C9UxheVmCUNonBrsMiUKpkefVJShIUGyHO2WAB30YgdcAopfkEZsBme5f
	H0gXLzOeNG8eoVB2veKwfJPZ9PLnBtHGIc3CBbJ1TMcVUhaLCltRegNZi5h81wSdEUAPhkkeIkM
	bSSZhdP5OFOCvBRvg84+S9XuhPiw1or3TBdNl1NZn922Jdf6QVVkqwBjzFhppV2CySnztuAHd1V
	byrEnuKstO191iWGmV9eVRCE7EVRWBBmY5xFfP5epfo6llv+DW8gt1hZL5Fz3TNHqDCthnEKpKo
	ZAz/P2fKdZl5W/2CaomgAqJeHRCwZZ9ssXlB7iLFVNEDfIvcv+TEqiUIdoMzzJ6oooj3UazaaGG
	pjIy6YLwo7c6ujn7948HeMgBmKQ+r5iuSUVglJ/Ejz+vqUwk2KmeYFxZiBY3Z1ALoAVX76YbI4i
	dxsJzOIKPPd0itP4xJMAaA6T4KJlHVCNkqVR7yjRg97bY1h8injHnA+Qj4+sq0CD50ElLwbqgqF
	kQ4L48EqHFoZfF4YUCZF2PadTyQ09WLb57TAIaNy7P/M8OHVzdX9SAWLwu1qHbmsMPRhytWg66D
	2VLcux80SQ==
X-Received: by 2002:a17:90b:574e:b0:3ac:9c37:9429 with SMTP id 98e67ed59e1d1-3adce0dc067mr1891969a91.52.1792760667464;
        Fri, 23 Oct 2026 06:04:27 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([109.105.193.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add282a8bcsm1349017a91.2.2026.10.23.06.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:04:26 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] rust: time: fix Delta arithmetic and add math helpers
Date: Fri, 23 Oct 2026 21:04:10 +0800
Message-Id: <20261023130413.178487-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the architecture-dependent handling of invalid Delta
division and remainder inputs, then moves the integer operations into a
math module with Delta as its initial user.

V4 addresses Tomonori's follow-up review [1]:
- Add the math64.h link to the module documentation.
- Replace rem_s64() with div_s64_rem(i64, i32) -> (i64, i32), returning
  both quotient and remainder. Document the semantics and the i32 cast.
- Update Delta::rem_nanos() to use the remainder. Keep div64_s64() for
  full-width divisors and retain unconditional invalid-input checks.
- Extend local validation to call both public helpers directly and check
  both tuple elements, including i64::MIN / i32::MIN = (4294967296, 0).

Patches 1 and 2 have unchanged code. Patch 1 carries Tomonori's
Reviewed-by; patch 2 is otherwise unchanged from v3. Patch 3 does not
carry its v3 Reviewed-by because the public interface has changed.
A range-diff against v3 [2] follows below.

Patches 1 and 2 form the stable candidate pair: the parameter rename is
a prerequisite for the behavior fix. Patch 3 is separate and is not
intended for stable. The caller recheck found no additional production
users for the helpers; each still has one caller in Delta. No PWM or
unsigned arithmetic changes are included.

The base remains timekeeping-next at
2ea0119f72dba597aa8a98cbdb72c564bfc5cb38, unchanged on October 23.
On rust-next at 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614,
patches 1 and 2 apply unchanged. Patch 3 needs only the lib.rs module
registration placed between maple_tree and the newly added mem module;
the remaining changes apply unchanged. That integration was checked
for application only; the runtime tests use the declared base.

Validation on x86-64 and ARMv7 QEMU passed with Rust overflow checks
both enabled and disabled. A standalone built-in test module passes
operands through black_box, calls Delta and the public math helpers,
and compares results with literal expected values. Each configuration
runs 100 valid calls (124 scalar comparisons) and eight separate boots
for zero-divisor and MIN/-1 panics. All 36 boots passed, covering
400 valid calls, 496 scalar comparisons and 32 expected panics. The
test module is local validation scaffolding, outside this series.

Both architectures also passed rustdoc generation, including the C
header link. The fix-only validation from v3 remains applicable because
the base and both prefix trees are identical; it was not rerun for v4
and is not included in the counts above.

[1] https://lore.kernel.org/rust-for-linux/20261021.183700.735437784476089878.tomo@flapping.org/
[2] https://lore.kernel.org/rust-for-linux/20261017111134.22546-1-chenhan0017.work@gmail.com/

chenhan (3):
  rust: time: rename the rem_nanos() divisor
  rust: time: make Delta division and remainder fail consistently
  rust: math: add signed division and remainder helpers

 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 71 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time.rs | 47 ++++++++++--------------------
 3 files changed, 88 insertions(+), 31 deletions(-)
 create mode 100644 rust/kernel/math.rs

Range-diff against v3:
1:  67c2d61e47da ! 1:  ed93030078ac rust: time: rename the rem_nanos() divisor
    @@ Commit message
         for documenting and checking the invalid divisors in the next patch.
     
         Cc: stable@vger.kernel.org # prerequisite for the Delta division/remainder fix
    +    Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
         Assisted-by: LLM
         Signed-off-by: chenhan <chenhan0017.work@gmail.com>
     
2:  25000522fc46 = 2:  ff344561eebb rust: time: make Delta division and remainder fail consistently
3:  69a07812a676 ! 3:  63d7f5dd76f7 rust: math: add signed division and remainder helpers
    @@ Commit message
         do not depend on time units. Move them into a math module to provide a
         common home for arithmetic helpers, with Delta as the initial user.
     
    -    Expose div64_s64() and rem_s64() so driver crates can use these operations
    -    without constructing time values. The division helper takes two i64
    -    operands; the remainder helper takes an i64 dividend and an i32 divisor
    -    and returns an i64. Both keep Rust's signed operator semantics, including
    -    the unconditional panic checks, and use the existing C helpers on 32-bit.
    +    Expose div64_s64() for an i64 dividend and divisor, and div_s64_rem()
    +    for an i64 dividend and an i32 divisor. The latter returns an i64 quotient
    +    and an i32 remainder, matching the results of the C helper without
    +    exposing its output pointer. Delta's rem_nanos() uses the remainder and
    +    converts it to i64. Both helpers retain Rust's signed operator semantics
    +    and unconditional panic checks, using the existing C helpers on 32-bit.
     
    -    Keep the Delta API and its panic documentation unchanged. This is separate
    -    from the preceding behavior fix so that introducing the math module is
    -    not required for a backport.
    +    Keep the Delta API and its panic conditions unchanged. Document the
    +    quotient and remainder semantics and link to the corresponding C header.
    +    This is separate from the preceding behavior fix so that introducing
    +    the math module is not required for a backport.
     
         Assisted-by: LLM
         Signed-off-by: chenhan <chenhan0017.work@gmail.com>
    @@ rust/kernel/math.rs (new)
     +// SPDX-License-Identifier: GPL-2.0
     +
     +//! Integer arithmetic helpers.
    ++//!
    ++//! C header: [`include/linux/math64.h`](srctree/include/linux/math64.h).
     +
     +/// Divides an [`i64`] dividend by an [`i64`] divisor, rounding towards zero.
     +///
    @@ rust/kernel/math.rs (new)
     +    }
     +}
     +
    -+/// Returns the remainder of an [`i64`] dividend divided by an [`i32`] divisor.
    ++/// Divides an [`i64`] dividend by an [`i32`] divisor, returning `(quotient, remainder)`.
     +///
    -+/// A non-zero remainder has the sign of `dividend`.
    ++/// The quotient is rounded towards zero. A non-zero remainder has the sign of `dividend`.
     +///
     +/// # Panics
     +///
     +/// Panics if `divisor` is zero, or if `dividend` is [`i64::MIN`] and `divisor` is `-1`.
     +#[inline]
    -+pub fn rem_s64(dividend: i64, divisor: i32) -> i64 {
    ++pub fn div_s64_rem(dividend: i64, divisor: i32) -> (i64, i32) {
     +    if divisor == 0 {
    -+        panic!("attempt to calculate the remainder with a divisor of zero");
    ++        panic!("attempt to divide by zero");
     +    }
     +
     +    if dividend == i64::MIN && divisor == -1 {
    -+        panic!("attempt to calculate the remainder with overflow");
    ++        panic!("attempt to divide with overflow");
     +    }
     +
     +    #[cfg(CONFIG_64BIT)]
     +    {
    -+        dividend % i64::from(divisor)
    ++        let divisor = i64::from(divisor);
    ++        let quotient = dividend / divisor;
    ++        let remainder = dividend % divisor;
    ++
    ++        // CAST: |remainder| < |divisor| <= 2^31, so the remainder fits in i32.
    ++        (quotient, remainder as i32)
     +    }
     +
     +    #[cfg(not(CONFIG_64BIT))]
     +    {
    -+        let mut rem = 0;
    ++        let mut remainder = 0;
     +
     +        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    -+        // `&mut rem` provides a valid, aligned, writable pointer for this call.
    -+        unsafe { bindings::div_s64_rem(dividend, divisor, &mut rem) };
    ++        // `&mut remainder` provides a valid, aligned, writable pointer for this call.
    ++        let quotient = unsafe { bindings::div_s64_rem(dividend, divisor, &mut remainder) };
     +
    -+        i64::from(rem)
    ++        (quotient, remainder)
     +    }
     +}
     
    @@ rust/kernel/time.rs: pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     -            Self {
     -                value: i64::from(rem),
     -            }
    ++        let (_, remainder) = math::div_s64_rem(self.as_nanos(), divisor);
     +        Self {
    -+            value: math::rem_s64(self.as_nanos(), divisor),
    ++            value: i64::from(remainder),
              }
          }
      }

base-commit: 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38
-- 
2.34.1

