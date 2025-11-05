Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D14F26ED3F
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384588; cv=none; b=X9K0WeMuIsnQ46doUW1JPzk5UwkYkshrVes/nbfKwmNgATER4pZMjzLMyMn9g8Yoh91j4YTR38BXpfk4Qftr3kHzQK9jc0FbUICZKwhC4ncanGJkxhdiZWBRs+pLADecbH07hGqsydOw5D0xLWzIw2JkstG4NfP2Ny38OqrZon8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384588; c=relaxed/simple;
	bh=e6jD5hdSCkP9wj9F2pVu+mv4QnPWEtyyZd10Wf48DLk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LapgcXe7ugSAGLrOaGx/SFGtj0uAn9XtP+JIM0igPta5V0SSabA1gn0kTHHRjtquNC31Ik80RIuITYoajd5pGHaR4xURD/dTDb95Vnl+c+r97/NQTg+dj/xFX1zOEqX5tui18ssmC31YoVfKPOBYN/ziErtneqb7wR1GYO3M3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODue21CA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODue21CA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33be037cf73so430670a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762384586; x=1762989386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RX1qE9JfxvrjTv2HrVqHbweUGcmRUr75mVzjILMuovE=;
        b=ODue21CAHcCp2wxcltdGLt1/v42uqheVEW16dsSaoTsFlFh8rNfP4y/nf/LyWphYi+
         lxGViqqAyaOJT6nZpe5Wu8pAlDbrq9MMTW3rOmqghS6DMUayKEKLoHgf5CaaJxUxP8Nc
         tc31qs9v4SZxbIo/F+qIoHqEnuaxBjvd8ShldpBXoF3krCSvSXdnkv9LuBKW1M6QsrAx
         2/zkRymOqRe7BKH3pct4sj7GzsKMbbeB+kS0bTsDfC83I6XX3+Dhvz3yBssxBQ8Nq6wU
         GtF8bCfIu8JF9T8JhKVnd2xa7YhAbRatUhBZZZ5OlYSMJKrPU5rjAiRDDzjTu8Ey7nIj
         TLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762384586; x=1762989386;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RX1qE9JfxvrjTv2HrVqHbweUGcmRUr75mVzjILMuovE=;
        b=bxBcxBHiK4vk//Dtqs4+77C+E6FuYQZzJ4ri2erpkvYBvEna0W/KWdUFeM70Q5HLBY
         rMlVCfO3SHJeUaBiMJnImTHcND41U4ISDfHNsOS47Rhe/PXaFu0LcddSI9SL5i9mtDX2
         klI3Dempcf4fb5q8sTMAUhFg1OY0CPgtwzfmSCx0s+QvkBSxn2ByNp+ajNou9QUB0r6d
         JFDLjF9QKx+9GHvlNri2tS8GyA3V5lB0yn83dbJ3PwZru+q4uBEWx9ZeFHyrtUhECjXf
         J56DWxtVVB10NE9PEmLslx5tFotlRUrXrIOpYPmM+iuY0edf9slxpU/AOwgxsjOE+xyo
         rxkA==
X-Gm-Message-State: AOJu0YyHT9woiz5ANf6vcAuUBfBTFpAmDF5YvmBp3rPLy/QDp9Ut2AM9
	MG7Hoocc7Bg6oaGxEHz0iO2nr16h954X8O80Qf3DffJNxvgnvvEG7ndR
X-Gm-Gg: ASbGncsYrFWp51tAyylA1LT0yWu7RzjTpIqv2ZJ+2MW+QP2J5bV8uGyPCt7C1CyiQBP
	oVkZfbuRqGsHEjf2K9dFb9VCdUKwjSQnTSayRe0mIWYgdTDSls9R1zfdGjKyFX1IHk64nw7FCfx
	dAxg/v5+19oO04DKLPvbLc0+tzhty4V4yEPNBe/sHmQr4JIGUw8/1c2jbHCcQ0SSrG8WDze5LEw
	HvkokJ28XoiQX5iqaPr4o6Cb6WG6HNBZ5fDbRlkpXGT6nc/ujTrFCTSj5vyyeRrMNTNAhmOWZnN
	r8gPVOX8HwUeHNsWF2xZtSnunnrqHet6f2j28nJ6y+2a0ukaJKI0sOcdqd3RoSEUZ+Ams93T9Q8
	zZOWo7tF3PAUW5aLOM/wJc/CxtAkEMs8gufHlBu5CBvUuF5pbIgE+Cv0yzJCMtct6S9Ocs9twwV
	6alibAaCX4lWa8bbef+Pnx7cGNDJtx8i4=
X-Google-Smtp-Source: AGHT+IHwGnokLCjvbcdSCINEWl8ApF2UrW7eRnkmyHI1JquVYGX4YrDuAGrD18oyRDIe0c25ehldhQ==
X-Received: by 2002:a17:903:17cd:b0:295:987d:f7ff with SMTP id d9443c01a7336-2962adb91e3mr66930325ad.42.1762384586138;
        Wed, 05 Nov 2025 15:16:26 -0800 (PST)
Received: from mitchelllevy.localdomain ([131.107.1.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93ce0sm6391925ad.88.2025.11.05.15.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:16:25 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Subject: [PATCH 0/2] rust: cpumask: Bindings for core cpumasks and cpumask
 iterators
Date: Wed, 05 Nov 2025 15:16:13 -0800
Message-Id: <20251105-cpumask-iter-v1-0-7536f906d7ed@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3aC2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNT3eSC0tzE4mzdzJLUIt20NIM0w0RTC0vLJGMloJaCotS0zAqwcdG
 xtbUAxNVusF4AAAA=
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762384584; l=1188;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=e6jD5hdSCkP9wj9F2pVu+mv4QnPWEtyyZd10Wf48DLk=;
 b=ChVOHNPTUc/c+seiCWWmxZ4Pl21Y12dVmttpw28i93SVkwr2K1YyQVNlyum7ql7gazUAxqtZM
 2NxEnp1ucRhDNM+uLmVq+NlnUANtz5EyOrOLM+rQs/j4OvvPp5c/WGn
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

The kernel provides a number of very useful CPU masks from the C side,
including CPU masks for possible and online CPUs. In particular, these
are very useful when some operation must be done on each CPU (either
each possible CPU or each online CPU, etc). Therefore, it seems to make
sense to add both of these functionalities at once.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
These patches originated as part of my work on a Rust per-CPU API [1].
Boqun suggested to me that these may make sense to merge separately, and
it does seem like these might be useful beyond the per-CPU work.

[1]: https://lore.kernel.org/rust-for-linux/20251105-rust-percpu-v4-0-984b1470adcb@gmail.com/

---
Mitchell Levy (2):
      rust: cpumask: Add a `Cpumask` iterator
      rust: cpumask: Add getters for globally defined cpumasks

 rust/helpers/cpumask.c |  5 +++
 rust/kernel/cpumask.rs | 94 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 1 deletion(-)
---
base-commit: f3f6b3664302e16ef1c6b91034a72df5564d6b8a
change-id: 20251105-cpumask-iter-ff0f1a5899b3

Best regards,
-- 
Mitchell Levy <levymitchell0@gmail.com>

