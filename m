Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F132FFFBE
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766470938; cv=none; b=N1DvBVQ1QzbnAgm4XuPEjkCLHX0doyp5FfXmy3qgifiNx183gjqsBQa1XTPkmDS2Ae63fDWFIuWq0Y5aZD+VCiI5vamt+an5YXLrYVcwwByVoP1X7IS99hqlMLgSnXlYC9QHaZiiwSu9qZ30g5ogq0xqBFpw8QzTBFhLYUW7g2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766470938; c=relaxed/simple;
	bh=9IpNWk4XZs89WEN3U5XtWoTeUoZhaaQQghmf0KvaYR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVl/upNs7FG2QAtJKp81N4jIKWChbUC4McEhbZL3/MBJ17EghQx+4uQkwr43z8lwncfJXnekKraz3j4skY+RzY9V/Pa/kbNJvRrW0oVnUnZTsR08v/UZ0EmQfnHRESMV2g7b1YXhRlYkzTOZKacqSyb5wZZgFXczYWXM0TE60dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsknRvkQ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsknRvkQ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7baf61be569so5043212b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766470935; x=1767075735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ovND0kPjb8CwNQINf6h6haDpGM/6RmL30Y0iCssV0xI=;
        b=WsknRvkQSSIV6OyXtapWZX2CI0UdPmnkyZuSNL6VZ7v7ilahi5KbWMUTqxgMv5FBtR
         oov+sfgzqbzGXW8zqwSqxfLOctjdjUdWpvOrxaiISfhUU/2ssf0wPRk5MI/nRYDNPLDQ
         0DQPlSN4jdUfkytv8Ypy2+ZuUor+Wb9wKEmmhZUUEJiCjfHbqYyBbN+nfEngHTBLmPsH
         vJWuQ1Mzd/KvZCLtjKjFUvd71WnUBcGwWQpkOfp1yJ/Bcq3lJNc/VFdBgYrLjEpgvNQm
         58TTC77q4VOQYnxQjph/BsGMHbDq7F6+sGSebKFPusmn7Ivh8LqSD8xTHF9MwO5Ua4Iq
         aMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766470935; x=1767075735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovND0kPjb8CwNQINf6h6haDpGM/6RmL30Y0iCssV0xI=;
        b=GRdMpviJBmaaMI7S/+Td7dNL6xHtn0Xl4Rpl7k+/+Vxet39b0jzMsy8GtIEEqDQR93
         IG0viSCL00pv5EehbBJcEBrQC+XmJ9ZR42xyhJxFBDtPBqnUCpW5ix+QFs/APTaRyNBN
         sh0maF8y1TYBLUZgafyvfNIjNEMtw5yCUgdX4nI+6FEKqvfuadbVnTW8UCjuIWs/zitO
         wQO2ukEhLjJjY4zoEVATqz5gweKallSIZgLNpezcqt2mXD6Lt8PpqTQ4PiHBWHKHDkW1
         ChXSgyl7COMMWeScZ7B+LZA6XwVFYwtL1cG6FxsOqKU9pQ0akmUlDzPH+4c6gvfC6TlO
         ju6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw9VovBa9fB54p3JX0cPkF9ts3trkh4SPOF29HwY9pKHi7GkVJUJYgQUmrAEOBBWKLMkhxPnIHY14fxhL1lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsidhuxqJJXAQFljx838NH8B/DYhjHC4eEHGp3NpAznW9GVj/K
	HznWPBB060OEO+Giemrm0TvstJLPl9A7kszrbgnWOUgc1ioqmzXa8f1z
X-Gm-Gg: AY/fxX6Gps8hnyXoEdsU/GgjnHkAQPoJlEG1OXhwCTGX23m0MUD80kTB5esf7zC29dI
	cfrbHJLrEaKZ22eSteNn/KVj9M4i53byWgvx61vq1CX64u7d6mz+5pbRKvZvpHvCDxaXTtleygI
	gEzQ39IklHSPhvILY8uLQlPuPSvb4sWeHRXRxYkjQsOyCJWC5yzEXK7vchMJLvFbZDSMkhrv5nO
	sPt9TE1w/fyKRs0+MTz+6ZAEi7WHKqIoDvy7QPd7aBqQvxO8nH2HdhNYGYgVpkLCIsBdw9Esb9X
	9/SqpHlH2ClXwazfgRLY6IiyAyJNsXpk63kZXN9UAAJwI9ScaKM19UmF5PMe03dTBupxsRyjoco
	7rTzkQkhLYa6Jv9R1io5wE2qMCUWzt2yDt9pIXjGrpdeBgxz602uoJCQ/DizbWk26kkuprEp3Oj
	rEwXKg5Gp+KPwG8s/ScnKv0V2YIeiq+eU/4/4PR4Hde/JM7f/B1L/IUKAC0ox5HA==
X-Google-Smtp-Source: AGHT+IG1KaweWMqCFNI5IyK2Iyck6ddrbW6P6bYU8dxPQsEM6rx7XWMSfbevH/CsT3hoWXQm1yjYUQ==
X-Received: by 2002:a05:6a00:90a2:b0:7e8:4471:ae5c with SMTP id d2e1a72fcca58-7ff67456c12mr11022198b3a.40.1766470935217;
        Mon, 22 Dec 2025 22:22:15 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab841sm12395362b3a.35.2025.12.22.22.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:22:14 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 0/4] rust: Add i8/i16 atomic xchg helpers
Date: Tue, 23 Dec 2025 15:21:36 +0900
Message-ID: <20251223062140.938325-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This adds atomic xchg helpers with full, acquire, release, and relaxed
orderings in preparation for i8/i16 atomic xchg support.

The architectures supporting Rust, implement atomic xchg families
using architecture-specific instructions. They work for i8/i16 too so
the helpers just call them.

Tested on QEMU (86_64, arm64, riscv, loongarch, and armv7).

Note the architectures that support Rust handle xchg differently:

- arm64 and riscv support xchg with all the orderings.

- x86_64 and loongarch support only full-ordering xchg. They calls the
  full-ordering xchg for any orderings.

- arm v7 supports only relaxed-odering xchg. It uses __atomic_op_
 macros to add barriers properly.

v2:
- Add comment about ARCH_SUPPORTS_ATOMIC_RMW dependency
- Add Alice's Reviewed-by
v1: https://lore.kernel.org/rust-for-linux/20251217213742.639812-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (4):
  rust: helpers: Add i8/i16 atomic xchg helpers
  rust: helpers: Add i8/i16 atomic xchg_acquire helpers
  rust: helpers: Add i8/i16 atomic xchg_release helpers
  rust: helpers: Add i8/i16 atomic xchg_relaxed helpers

 rust/helpers/atomic_ext.c | 48 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)


base-commit: cae418334e4c402e410d3ee234935da33c7f904b
-- 
2.43.0

