Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED3A3CCFCB
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 04:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829000; cv=none; b=tSVMufM25mS7rHUs0nnKEbNJCqZrFbmHZnF461QtnvWMBs3eS1wfxO3NjZVCtfJRyJfQLRRb/rY1o3gt4xQR1cGHr6bD/bJfTK52lMQMv32kBKQybxVfqyIcaFZCdCjfd3NY3pjA/zQ7ap1tgBvvO1kzU+vigokmxO4STDXq3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829000; c=relaxed/simple;
	bh=wO1grHH1gZVZYLUkMH1hpsXiJoEGlVDvY+6TNj/wMME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bzc4Tk/4YS/gR0znN5UIH9X0waW9qEjb8WPZFIM/1M3ivap91/OoZblZ4++0e995vq9cMNncg0lNrbnFkC5NsqqHagepU0gcSrMlaVQoCksPg6yDClFF4UtluFEvLiBE52rh3q4vbIPnu8ce6TXi5YrJ/UlD2YZIAmE+kODU/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXEFh8Tb; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXEFh8Tb"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-cc7aefb09cfso315226a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 21:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790828998; x=1791433798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+DBetYDkgHMltZZ2jThCGZXBLaahoRFrj1tlEtdqYg=;
        b=MXEFh8TbwttAR20p9ts4oeJ8ETE4gJHib3JaDU7bprUaMjCrB/2xtDX/ynCvjikD/a
         eg/An/Drb+3OId0OCxomWk/k9vxlGFLAzOXVGELTPxfpyIp8Y0xqquiIHVBbPir/sGyS
         DZE8TCdFZDmCukq5Q4LzCs4YSYk9cm2JMSWWnYHD4yx47BMe1cMnqWuiJo2Qx772ShOE
         T6ibcoH9u1jBZQzgsmY/3EZrjShnAxbWeeInnwDJA6U3vIK2pZgsGnPX3w3Ybs+km6dB
         oAfXOm1qi/irHHOpNdPt76UASYEOFsveYzL8tKoGvRsYaKvD8xOMTWohZT2wPSC93IRZ
         cmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790828998; x=1791433798;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+DBetYDkgHMltZZ2jThCGZXBLaahoRFrj1tlEtdqYg=;
        b=NcfOcFqOTR5qHBIuITywCDSRA7Var6gexR0/pDu5cBSLOV96mxofJ6+NBh1cscqwz2
         fVL6dCCO2stu7Q1Gpv964HbSfzC8gMJTKctFpmJA7iiXBJ/MfFyJoPv3g92usMNxgL8p
         f3+1klsH0PQfezQfsK8qa4e5dnbxwkfIUogP4aF0KkW9QPmOEP0pukDhsnPkTrOUjTUF
         DfMKvZgA7Asshmt1KYBX46Xbtz1wNPlY35Am0zsBHYsh5Aytasm4PGzfZOyGfv4sKW1S
         z4iGw4rxB2kB7+c75eamJKgHv6fukuVTuKzoNN/JLSU5YP8U/5lbBc45JtpTn1W6zpOb
         Kv9A==
X-Gm-Message-State: AFuF++k+CpGLXd4m3q3wUrtv4/BZzywzLGq+cgxpchMPXyazlL+T2GhK
	FIBvHyjs6Mw0YBpTLTkcBqEtrG96DfVxdr5hz5kleH0Zr0PqV9n7+5E=
X-Gm-Gg: AYBFou3giq2JDCrCufTexNRS+QV5JQBSl607UvXJISJjs5vCX2ktIgWWhz8HXx4ZbZ0
	wdih8nUxvbVMnWfIlWIqaSvu9iHcY3AvlEerNfgPPeoe2ScLsSrFv6T3WXWRCGQKT1GCsH7meKQ
	aGOVQfMvqyhFoEbIM7zEMQMem6J0RZX4NZWUR32UGWwmKg0bJ4SBcvrm+vWGvQ1IiFswj/nMwkB
	hD8MyfLawx9Jhb2g8ZAKLcp6Rt4/k8YwV4lBngTBqJBTVPnQ3DVGDiiTb3ffpvJHGDYX3ILggg0
	0cI5YzXbqOhvP3fDq50QgYlFCKtesrHjI6EGHUOB8mpSdDwtlTuSJkzqFzfr6DbWRAcBMfq3ALC
	DxpTkq5Skl2T0MTY+YOxO/z/U1RklIrhz4330ZU5a5sio17Of+Z/eAQl8ouQAXfirLmnqc0Y3vq
	YeiI8su5PlJ1zuhY9pqoLMviHCRZkf6dvwtcbWHZsiT3PFdA4zidSGVHAHD9nBKsPlGXfgacSLh
	gojlEC/XHMXKnmVoDdJCTebW3o=
X-Received: by 2002:a05:6a21:2e14:b0:3de:8825:15b with SMTP id adf61e73a8af0-3de9e7aab35mr3682756637.12.1790828997556;
        Wed, 30 Sep 2026 21:29:57 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([139.180.198.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888196d5073sm431618b3a.46.2026.09.30.21.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:29:57 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: miguel.ojeda.sandonis@gmail.com,
	a.hindborg@kernel.org,
	tomo@flapping.org,
	georgeandrout13@gmail.com
Cc: rust-for-linux@vger.kernel.org,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
Date: Thu,  1 Oct 2026 12:29:51 +0800
Message-Id: <20261001042951.109054-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
References: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andreas, Miguel, Tomonori and Georgios,

Thanks for the reviews. Here are the details behind the changes in v2.

Miguel wrote:
> This does not add much information, since we don't have the reproducer
> here, i.e. what is `CONFIG_SAMPLE_RUST_REPRO`? I would instead explain
> what the reproducer is, if it is important to do so.

You're right; CONFIG_SAMPLE_RUST_REPRO was a local Kconfig option for
samples/rust/rust_repro.rs, and neither was included in v1. Setting it to
y built the test module into the kernel. Its init function read a dividend
(i64), a divisor (i32) and an operation selector from module parameters,
then evaluated one of these expressions using kernel::time::Delta:

    Delta::from_nanos(dividend) / Delta::from_nanos(i64::from(divisor))
    Delta::from_nanos(dividend).rem_nanos(divisor).as_nanos()

The inputs came from the kernel command line. Each failing operation ran
in a separate QEMU boot, since a panic stops that test. The expected
results with the fix are:

    dividend    divisor    division        remainder (nanoseconds)
    10          0          panic           panic
    i64::MIN    -1         panic           panic
    10          3          3               1

V2 replaces the unexplained config name with a description of the test.
For v2 I used an expanded test module: it passes operands through
core::hint::black_box to exercise the actual APIs, checks 26 valid
divisions and 21 valid remainders per architecture, and runs the four
panic cases above in separate boots. All passed on x86-64 and ARMv7.
The division tests also cover full-width i64 divisors. Both kernel test
configurations had CONFIG_RUST_OVERFLOW_CHECKS=y; I have not boot-tested
with it disabled. The guards themselves are unconditional, consistent
with the Rust semantics discussed in the issue and cited in v2.

On Andreas' and Miguel's suggestion to move generic helpers to math.rs,
Tomonori wrote:
> Do you have other users in mind? If not, each helper has only one
> caller, so they could go directly into div() and rem_nanos().

I tried the math.rs version, then checked for other users. Each helper
still had only one caller. Time-unit conversions use fixed positive
divisors, to_jiffies_timeout() uses unsigned arithmetic, and
num/bounded.rs operates on generic integer types. None is a concrete
extra user for these fixed-type signed helpers. V2 therefore follows
Tomonori's suggestion: the checks are directly in the two methods, with
no generic free functions in time.rs and no new math module.

Miguel wrote:
> However, this changes behavior -- did you check all callers etc.?

I checked the tracked Rust sources, including drivers, samples and lib,
at timekeeping-next 2ea0119f72db (the v2 base) and rust-next c82c75ae11fa.
I searched named calls and inspected division expressions in Delta and
Instant users, including values obtained through elapsed(). I found no
in-tree calls to either API outside their definitions. Existing users
construct timeouts, compare elapsed times, or convert to scalar units.
Valid-input arithmetic is unchanged; invalid inputs on 32-bit now panic.
The audit does not cover out-of-tree users or all stable branches. I kept
the stable Cc alongside Fixes as suggested; please let me know if this
consistency fix is unsuitable for backporting without an affected caller.

Miguel wrote:
> What "both operands are passed by value" is trying to say? i.e. what
> precondition are you trying to satisfy?
> [...]
> What happens in the `min / -1` case?

Passing by value did not establish a relevant safety precondition. The
comments now state that the divisor is non-zero and the quotient is
representable. div_s64_rem() computes a quotient even though we discard
it. The MIN / -1 guard was already before the C call in v1; v2 keeps it
and makes that condition explicit in the SAFETY comment. Without the
guard, the generic 32-bit C implementation can produce a wrapped quotient
and a zero remainder under the kernel's C arithmetic flags. Rust's signed
remainder operator panics for this input even though the mathematical
remainder is zero, so we reject it to match Rust's semantics. The pointer
comment also explains that &mut rem provides a valid, aligned, writable
i32 for the call.

For the documentation comments from Miguel and Tomonori, I moved
# Panics immediately above fn div(), removed the redundant architecture
sentence and private-helper references, and added intra-doc links for
i32, i64 and i64::MIN. I also removed the claim of identical inputs:
Delta division takes a Delta holding i64 nanoseconds, while rem_nanos()
takes an i32 divisor. Each method documents its own panic conditions.

Miguel wrote:
> The kernel requires a "known identity", is "chenhan" one?

Yes. chenhan is the identity I consistently use, and
chenhan0017.work@gmail.com is my email address. I also participate in
issue #1254 as WindDevil on GitHub. V2 uses that identity consistently in
From and Signed-off-by.

V2 includes all M: and R: contacts in both requested MAINTAINERS entries:
DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST] and RUST. It also retains the
discussion participants and mailing lists.

Georgios: I added the requested tag to the commit message:
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

Andreas: sorry about the HTML reply and sending it only to you. I will
use plain text and reply-all for this discussion.

Best regards,
chenhan
