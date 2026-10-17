Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675D47D45D
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Oct 2026 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235511; cv=none; b=b39XwHmGmwH9EbHDWqAaKI8yBLrkbHuLJ1XtEq4tNxZ9xMESoKep2BGqz0ENk8WDcO+K1LXyuLLbGJEv2FJNSec/mgAI4fT0xHcZ2MIrG9z0176ezR1EfO0X2JvQPGW7JZA3KwwTnHfrAhFAI428tR+ici5h/3dl8B1jGClfFVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235511; c=relaxed/simple;
	bh=0kZNbm8CqPVP/1DeOV9SP8ksc9uA9FW8LCr2z86HVYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hefRPcQIL0oKgR/J+2T8J1Jn1ERKL/osQbNXbO9ZQOSTKWzoQdX4S85oF6I/4yQ6dQkAW8xuhxUv/HdOAg4ir2HhMEv/2BrgaIXgEkus6C/fFB+tB/TrIZB+l9m0iAERguNfWgFw6rnJDiUiiCc2v305x32wP98VVsQ2AqcnHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRxIfO8A; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRxIfO8A"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac96ba6a4eso134681a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Oct 2026 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235509; x=1792840309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=avWBpZ/UElEvp5NmPkry/WKtL+ZeCtFdMEuIhy1TEmw=;
        b=SRxIfO8Ax+YCRQdtNT2QhjBQxRXnHBvNi6Z4C8QgubypX7WWrXJfoVw3SLTavrxfD7
         DidxDc9FiM3CPxXZbJGGMubaeCh1pKyHpVH2hsS6rdCX9ZL2BouN8LTtWdwCvmJoMK8+
         dwGmL6QBMpjauhyBTnSbCPKrPuecxLRPdGb5JVh45vH6A7iZS2+BVC2Cn9mj+mux49Gr
         E2y1NQ3t9y3LNZrGR0cdNOFzHTH8waTyQoE8kXMAaPH9utlR8fiqQQohZqj5G/BWekSN
         vYi8wIHPYV35UBjyzRQAtC9kLrROyl6Jr+S2NEDqkgV49zZvysTLT1ctSGTKRj7toygn
         efOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235509; x=1792840309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avWBpZ/UElEvp5NmPkry/WKtL+ZeCtFdMEuIhy1TEmw=;
        b=jOqRWymWJqT5XuRLcoiaDuzS4YZJBRFA5x2oaISv4PO6W4p1sTx58xfOyljCaMUJ4y
         wQb4PE1mAzOFJaENxk8lU5YhV1ju/1+2hxGiDwRUQAi4N1Ezxt3QZbZj0ruCnklnNxE4
         JEIN+yrhEK7r8JaTmcTJsuo4mEYkZ84J+ZIyaLgQl0DvBhzkSXjFCEwoNirl9buz77p8
         MjR91ZHSVrIEZz1ne4O6YApWAg4SoO9LCderPrGAGXqtLBjeWaY4yfEDeuH5+fXL5fUJ
         +bWPs9GIUi4ef59mwipn+INBEYj0/UzyRxdspvAoFsKsgpla4fuwqXl/uGHYzPnM+DM+
         o/jw==
X-Gm-Message-State: AFq9FYK6GJONhXO7+EHuLkD/PbQZvQTW3jznyi9ACTgf58LnaqbbVn+1
	zHG4idkoQu6KKVuj+703HOdWnv+Vg1G5UshmNb6siPJDZl4O+p+/3zQxsNaQU08voG2r1p89h7H
	V
X-Gm-Gg: AYBFou32NFIE+YU8/a0mwQOOHLQeKOX80etaIufVZTwMiuGBb5nZ5l7759dO7xb7SKj
	VuSsDMStleZO0ZN7svj8byS6I+ooHqYK7ziM7AidDpBR+kwsSeY+NuXkzWXlfPNfGTWJDzmqYDh
	yl1MDBZL1IPKA+n8NYO8sbfatPsr/54BuPOuoV1/LWzWz8ZzZA3cru4Q8wjLKBmYCBmXvv96RCk
	RbFNNsq1dxkc7KotwPBNDeHgbgWessmwWMRsWAVX/1xpPKn7ePISv5oyVHVCL4B9Uqi05WvTcYq
	WQCNCLrEvIwIYDCUSybQBQnnYnzHcC0TQsERNbF39kRMCtYKELaXTzpWbJf4eSSDXX0Jo2iFSiH
	S4hmz01oOgwjrHnvTEQuRZRxcFzkeXr/1WBneI8qyTPNTLD6WLyE4OMnb0hydT3tUqWFzEMHpb6
	nEKdYj4pn3GF+Qmz9JtVCn+a9lRw2I1gdThFDMx6LXuSCQKKExx6O05C74qn1fmLN6eAEnCbkEC
	Q//ZjSyoUWNFUX7SNlMk97L1pgN
X-Received: by 2002:a17:90b:1c8d:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3acef13e5e4mr1404304a91.20.1792235508638;
        Sat, 17 Oct 2026 04:11:48 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a0c:9a40:9205:1:be24:11ff:fe93:ff0e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm2974687a91.4.2026.10.17.04.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:11:48 -0700 (PDT)
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
Subject: [PATCH v3 0/3] rust: time: fix Delta arithmetic and add math helpers
Date: Sat, 17 Oct 2026 19:11:31 +0800
Message-Id: <20261017111134.22546-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This revision separates the Delta arithmetic fix from establishing the
math module, following the v2 discussion.

Patch 1 corrects the rem_nanos() parameter name and documentation, as
Miguel requested. Patch 2 adds the panic checks in the existing methods.
Patch 3 moves that implementation to public math::div64_s64() and
math::rem_s64() helpers and uses them from Delta.

For stable, patch 2 depends on patch 1; both carry stable Cc, and patch 1
is marked as a prerequisite. The math refactor is not marked for stable.
The first two patches can be taken without the third. Backport suitability
remains for the maintainers to decide; I have not audited all stable trees.

Each signed helper still has one production call site, in Delta. The
current pwm_th1520 conversions use unsigned arithmetic and are not users
of these helpers. Patch 3 follows Andreas' request to establish math.rs.
Tomonori, it adds no unsigned helpers or PWM changes; if your math module
lands first, I can rebase this patch onto it. The helpers are public so
they are available to driver crates as well as the kernel crate.

Changes since v2:
- Split the parameter correction, behavior fix and math extraction.
- Explain in SAFETY why the conditions hold: the checks above exclude
  zero and i64::MIN / -1, and &mut rem supplies the valid writable pointer.
- Drop the redundant issue-comment Link trailers, retaining Closes.
- Remove the unrelated "a number of" wording, C implementation details
  from public documentation, and the "even though ..." panic explanation.

No in-tree calls to Delta's division or rem_nanos() were found at the
base or rust-next 7c306f00835a. This covered tracked Rust files, named
calls and division expressions in Delta/Instant users, including elapsed()
results. Fixed-divisor time conversions, unsigned jiffies arithmetic and
generic bounded-integer operations are not extra users of these helpers.

Testing used a built-in Rust module whose init function passes black_box
operands to the actual Delta APIs (a and b are i64, d is i32):

    Delta::from_nanos(black_box(a)) / Delta::from_nanos(black_box(b))
    Delta::from_nanos(black_box(a)).rem_nanos(black_box(d)).as_nanos()

A boot-parameter selector chooses the test. One boot compares 26 valid
divisions and 21 valid remainders against literal expected values; four
separate boots exercise the invalid inputs because each panic stops its
test. Core expectations are:

    dividend    divisor    division    remainder (nanoseconds)
    10          0          panic       panic
    i64::MIN    -1         panic       panic
    10          3          3           1
    -10         3          -3          -1

Other valid cases cover signed extrema, i32::MIN divisors and full-width
i64 division operands. Patches 1-2 passed on x86-64 and ARMv7 QEMU with
CONFIG_RUST_OVERFLOW_CHECKS=y. The full series passed on both architectures
with that option enabled and disabled: 30 boots, 282 valid comparisons and
24 expected panics in total. Kernel builds and rustdoc passed on both
architectures. The test module is validation code, not part of this series.

Base: timekeeping-next 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38.
Rechecked on October 17: this is still the timekeeping-next tip, and
neither it nor rust-next has a math module. When applying patch 3 to
rust-next 7c306f00835a, the new "pub mod mem;" line overlaps the module
registration hunk. Keep both modules, with math between maple_tree and
mem. Patches 1 and 2 apply there unchanged. Runtime testing above is on
the stated timekeeping-next base.

V2: https://lore.kernel.org/rust-for-linux/20261001042942.109012-1-chenhan0017.work@gmail.com/

Best regards,
chenhan

chenhan (3):
  rust: time: rename the rem_nanos() divisor
  rust: time: make Delta division and remainder fail consistently
  rust: math: add signed division and remainder helpers

 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 64 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time.rs | 46 +++++++++++---------------------
 3 files changed, 80 insertions(+), 31 deletions(-)
 create mode 100644 rust/kernel/math.rs


base-commit: 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38
-- 
2.34.1

