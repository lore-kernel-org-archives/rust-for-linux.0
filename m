Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442743;
	b=W12Bp9j4ANG2ZV2+Xzt8CtdjXDNHztp+dWS/WZwylZ62+kppTCfP5WE1ltBVB5CqCLG3
	 GQZCO4P1dgyAE+Xa+FbWMyoJaJUCDleTDcyerdVyMb62bzBvh5ufKo9F44BP2/WHsu+3h
	 EaG6tXTT3yYR2pCbNnn6gssgAbMuyelWXoVNz9p4REEoezNf4coe5EvGUvRN0HSNufXWM
	 qR6hGRzM0S+51+QQm0fJzpVS4VCzy1dGxE3m9Vv8IjyUNKflsQLkMKEZUYeQXFyVFDes7
	 kcBvdaIZ/EZInlS6CDgivWvAak6yFWPUy6cQvdigk/uq+GROoNpJpHz5qb/kc2ogwFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oPY5lhcw++gPf54FwE96VpaykMluB7++7cp+zVzrA0A=;
	b=AOZEYaPZr9nq4pj8VmRd3bShK0SfhVssWsVMJHwH9I5Y3Dmz9JpsaKio8bYJ8rjAZF61
	 O/aDc3CUuPC5DjFRpzHeuVAUSqU8wcQKktD8XfdqPas5x3Q12fp0jUnsUowkRRrxTq8s1
	 vPa1o4gtUfu66AIJsvPYFYbXPfvhlozNJMoairkW9dKZXSepQICnwqLER+50CfC3obKkW
	 mop56ZOjjQ0m1mZcyeYn2Meujkw+Ayc/it76PMAtB0EMaw0V2CX9jdpYXv8rwDOWpGwkB
	 IYfbfkwtulwhfKDoX1MHw4lGun/6KYRQID0LnqJhj1U6cYfGo5OTggvGVosWPCwk/Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQ5urIJb;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B8606A31A
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 10:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQ5urIJb
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2e876f468e5so6078455ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 03:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442741; x=1794047541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPY5lhcw++gPf54FwE96VpaykMluB7++7cp+zVzrA0A=;
        b=BQ5urIJbmF4FhhMyMWEx8LDpUokm/W4rpv3QWdy89r7+5hFnMvPM0rt7549uqlFWJF
         QEM1z4k7pFVM/QbSbCS+u8EUkLWMNUvkmikYCdVU7+Xv/7U9dX3CthWWSefKO0vk2o1W
         pwbHgDRQfDoVya/C01jzD/kX6sZ6LoaTuzk2C3N65WJJB5zdL2GjNsdLINnrmPnXyrIB
         mRSZuQaL8fCvU982VWcRb4e+y4Gg9ZSqit/ipgoHzGUjGJ1LBT1zT7dp79ZpYprFhnh2
         nsA5NO70ogwsuQX3C0wH7+3y74ng+tAIZwaO8Ydu9wmARrMyKnILFmZ0ydaZW6JR862h
         M0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442741; x=1794047541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPY5lhcw++gPf54FwE96VpaykMluB7++7cp+zVzrA0A=;
        b=xL4oGJiPk4uUC/tEjE+2U4775mCuXPldR7NXbmP26SZx9kFbZQLFoARgzlHYBimeh9
         pfBYwHpjgp+Y2BaJlpxN5Qi5+u07R6WXydtBm9NHp0O0WzgYjt4oNo072HJ4OlplfZSa
         vFy+Lji1TZVHcopjWAVW+7mmp5jXSaD6OedKhgwzhTSllCoFaybLzhBtDgb1owmgYlf0
         wJbqw0PJVWJdyf2CBgifWpIXRfd8LpQcOGREHKr6iGpvqDwWVZARn6RLQXFfZtbfgjdv
         u8m0xmb/FjmkVSUjlzWNGQlCrt/BDySU3GQvoW865qapdwlnFcvhQarPw7aYIWDJuiNH
         fc8Q==
X-Gm-Message-State: AFq9FYIBYEwByaE+V8gZv6mSYNSdTNNFfTH5x9T818UVF377l5Qsvmjq
	+8VcRL+OJn0we2WgcRHBcRSIuQyzqsYlvGPzB1wemBsh7dfyqM5dr1odk/S9MjkY2w==
X-Gm-Gg: AYBFou1QS7dyzkwyhIZI7E6cMERXw+Hw9u3+n7nJ3ElPOk+7NCyumvjxXWyKrFsow6I
	pzkl8w07zcNXcOf/rhjdUK4oKag01rZN/08hq86XmdoOwIoPqftyZb3wHZpUbjvtxUdlLhsyT3F
	R5xnLifQF2i2sc6pxnC7Fu0ZCmipXZrI1KVvzA1KECRb+dUtkkELN/caTDnBfTv1+/4pPjEoe0l
	NfknfjDgvDNpxoTzADlvtrgEhk4Fv3nOJrwLleyxkq9lgL5lSFbe+85srNcranYqQ5rHJ2Hhqqs
	OEnK+dR8AlQ/pQ1kNDUI3CRtN8huMxo7kFdAlqH7PhpUZMEv0ZF8MltzR93fp7RKOCj3WY4+b3O
	2ggScZdYIhN4pG8QyfXGWnEgCMbMVLhHzKX9Ow19USLqz5iXNoH12ynOis7VhPFIZEdiTyFZaPE
	F+kqFnvtoqdz6ByGDjM2lldF3IzhFLk48uxhcLCJrSX5nYZzW0iekvnZl5VqvVup+5MplKYysfH
	+Eri+ZaoJ0CYfbfrG91Ueey1AxXJpRGwII6bgXuxs59KYyprgPczz43gk3HIpcn2GcCaI3NEnac
	qpTUMMvTs4MkYqG1G3vdrwdPbLObfNBJc+nJQ8f/8WoRrUhigIaVfcl3oS8pDg==
X-Received: by 2002:a17:903:384d:b0:2e9:9bac:2e90 with SMTP id d9443c01a7336-2eb3650d23fmr42816325ad.65.1793442741065;
        Sat, 31 Oct 2026 03:32:21 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a13:a5c6:1ff1:280f:be24:11ff:feb0:8690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928104asm14817275ad.53.2026.10.31.03.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:32:19 -0700 (PDT)
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
Subject: [PATCH v5 0/3] rust: time: fix Delta arithmetic and add math helpers
Date: Sat, 31 Oct 2026 18:32:03 +0800
Message-Id: <20261031103206.24051-1-chenhan0017.work@gmail.com>
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

V5 addresses Andreas's review [2] of v4 [1]:
- In patch 2, make the SAFETY comments cite the preceding zero-divisor
  check as establishing the non-zero divisor required by the C call.
- Keep the remainder output-pointer explanation and carry the same
  comments into the math helpers in patch 3.

The MIN/-1 checks remain for Rust's panic semantics. There are no changes
to executable code, public APIs or panic conditions relative to v4.
Patch 1 is unchanged and retains Tomonori's Reviewed-by. Patch 3 still
awaits review of the tuple-returning interface introduced in v4.
A range-diff against v4 follows below.

Patches 1 and 2 form the stable candidate pair: the parameter rename is
a prerequisite for the behavior fix. Patch 3 introduces the math module
separately and is not intended for stable.

The base remains timekeeping-next at
2ea0119f72dba597aa8a98cbdb72c564bfc5cb38, unchanged on October 31.
On rust-next at d89e1d186ec9271bf78e62771779e9fc03bf0fc3,
patches 1 and 2 apply unchanged; patch 3 needs its lib.rs registration
placed between maple_tree and mem. This was checked for application
only; the runtime validation below used the declared base.

Tomonori's PWM series [3] also introduces rust/kernel/math.rs, with
unsigned helpers. The module header is shared, and the signed and
unsigned helpers are complementary. Whichever series is applied later
will need a small rebase to keep one module declaration and header.
Neither series is present in the above branch tips as of this posting.

V5 passes rustfmt and whitespace checks. Applying the exported patches
reproduces each commit tree; the affected source at each series prefix
is identical to v4 after excluding comments. QEMU was not rerun for
this comment-only revision. V4 validation on x86-64 and ARMv7, with
Rust overflow checks enabled and disabled, passed all 36 boots,
400 valid calls, 496 scalar comparisons and 32 expected panics. V4 also
passed rustdoc generation on both architectures. Those results are
unchanged evidence from v4, not new v5 runs; details are in [1].

[1] https://lore.kernel.org/rust-for-linux/20261023130413.178487-1-chenhan0017.work@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/87bj8goc6x.fsf@t14s.mail-host-address-is-not-set/
[3] https://lore.kernel.org/rust-for-linux/20261030020209.3833766-1-tomo@flapping.org/

chenhan (3):
  rust: time: rename the rem_nanos() divisor
  rust: time: make Delta division and remainder fail consistently
  rust: math: add signed division and remainder helpers

 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 71 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time.rs | 47 ++++++++++--------------------
 3 files changed, 88 insertions(+), 31 deletions(-)
 create mode 100644 rust/kernel/math.rs


base-commit: 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38

Range-diff against v4:
1:  ed93030078ac = 1:  ed93030078ac rust: time: rename the rem_nanos() divisor
2:  ff344561eebb ! 2:  fdbb042d5743 rust: time: make Delta division and remainder fail consistently
    @@ rust/kernel/time.rs: fn div(self, rhs: Self) -> Self::Output {
              #[cfg(not(CONFIG_64BIT))]
              {
     -            // SAFETY: This function is always safe to call regardless of the input values
    -+            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    ++            // SAFETY: `rhs.value` is non-zero due to the check above.
                  unsafe { bindings::div64_s64(self.value, rhs.value) }
              }
          }
    @@ rust/kernel/time.rs: pub fn rem_nanos(self, divisor: i32) -> Self {
                  let mut rem = 0;
      
     -            // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
    -+            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    ++            // SAFETY: `divisor` is non-zero due to the check above.
     +            // `&mut rem` provides a valid, aligned, writable pointer for this call.
                  unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
      
3:  63d7f5dd76f7 ! 3:  79891109d486 rust: math: add signed division and remainder helpers
    @@ rust/kernel/math.rs (new)
     +
     +    #[cfg(not(CONFIG_64BIT))]
     +    {
    -+        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    ++        // SAFETY: `divisor` is non-zero due to the check above.
     +        unsafe { bindings::div64_s64(dividend, divisor) }
     +    }
     +}
    @@ rust/kernel/math.rs (new)
     +    {
     +        let mut remainder = 0;
     +
    -+        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    ++        // SAFETY: `divisor` is non-zero due to the check above.
     +        // `&mut remainder` provides a valid, aligned, writable pointer for this call.
     +        let quotient = unsafe { bindings::div_s64_rem(dividend, divisor, &mut remainder) };
     +
    @@ rust/kernel/time.rs: impl ops::Div for Delta {
     -
     -        #[cfg(not(CONFIG_64BIT))]
     -        {
    --            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    +-            // SAFETY: `rhs.value` is non-zero due to the check above.
     -            unsafe { bindings::div64_s64(self.value, rhs.value) }
     -        }
     +        math::div64_s64(self.value, rhs.value)
    @@ rust/kernel/time.rs: pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     -        {
     -            let mut rem = 0;
     -
    --            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    +-            // SAFETY: `divisor` is non-zero due to the check above.
     -            // `&mut rem` provides a valid, aligned, writable pointer for this call.
     -            unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
     -
-- 
2.34.1

