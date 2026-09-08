Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF543A9616;
	Tue,  8 Sep 2026 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854807; cv=none; b=R7KuTalXGfvUfYykcuP0tfihWBAL3yd0ApBerfYaS6J0RrCjIIcuF0MAREGeZ1JCewgT1QR/2ncqy4TTxoZVqBPU1T6oUwTYb5HCI6jKzSyvDZ8rNhjpAXYFN9uYoLtjF6U1+ZsN8CF2ih47jdZQpqbuQjDZFRqBIL8+7grOyR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854807; c=relaxed/simple;
	bh=2xqmYT9HDXnhzbfJRGQf79SeIwwTFyFfKijTt7HmlJg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=o5HwV4bzJKCueX8Aa9yiczZq+l3yZVj4w2SiJbQ+pP7+ORtOBWdg/jjuRW7BQaGF4/A/S1oTtbYjeOPwwHjbbFIPEiFo2o/e2qlIYpmLUMRobD90jfE3v6JbGxHnpNRajeu8Zs0Wt/CavseNliFKitXNBx352kDa3LFbPy9Xt4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=L7Ed/hK3; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="L7Ed/hK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788854792; bh=98YyOZdshhn5cPZjXVwyFbNEDVw72Ziv/YVFEcGoRpw=;
	h=From:To:Cc:Subject:Date;
	b=L7Ed/hK3+qnS4oGV6uXVbV0GmF63+DNoDaJsqF8bEhvhG6UKfOKB7vbcBUya1xJ3C
	 wBxA37Q0FS1iRrTVfG7Ik4KKMXJS0+G5MuYekKMwZQhBhMBwHACeZS+UADdn1Ms0ed
	 0yoL9Nb2NsHwCIhc4yVQXogwYLj9MqtbNAYY9z1A=
Received: from localhost.localdomain ([106.114.216.75])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 185190A2; Tue, 08 Sep 2026 16:06:05 +0800
X-QQ-mid: xmsmtpt1788854765tzqwk7xsr
Message-ID: <tencent_4E077A13DB36F0C12D69B0E89FD5C7DCB506@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeCWl6JLYX9iT4KFyTP4BOAs/TVgRKNN3qePWHPHaM937c3cEOSw
	 gEMzJx/6L0E7pc5TUef1oNNef8p7TaBjvKrF/RuJOmrVTIfaCeOvmZsFPvB4VWh+NPBfHW4fgepG
	 S6epI4g9XYvj4k/+LmAenIn3SD3b9iRPLZvagISGUTONATkxU5qyPFCMfm4JsBb0XgXlTy/q9vCo
	 8/fK7IyZfwNAZ0OxnohE1BC1b/AwTwihBMIDg+s5YnHRwW/Dcm+jV5XOVBY2qNw6cgv9CsuY6ep4
	 nRjBqW0Hm2/1f+8Pf3DXf9Z+afrT6Z+8X242hTZExMcHQ55yxCsXQaEbvd3Dc8khKuGiMfCEAPZr
	 ieljfu7Y1LaAbkjoziq4Pyy/WhJsMPKviVlue5loH0++WvQ5ct/bF0wAtI+0w5lLguC4Z2HxvMyu
	 VsOj3K/d2KxEVYcEQbKpvfRizlwHH/YBm7eeieFn/gfkt7iqmI3iPDjqoHkyp47F6fXqUWbwHQpJ
	 c0MetieAU+beo4icbzmRAwcvEgkvWE1NQz0kRg+vZO1ZhTDUed1wZqwfJ89Uath6NGCXr7znISJu
	 Xh7Uk9rtMje7g2C/cHgOlp5/lkAaINsUBLr0aRolBhdmMUTiIgZ/DIsDd7vn0R6HNSXMD1fYclhq
	 3/i3bYf9+7tbKMbohOSHSpnz3e1Kr1uHAH/sksflln8/pV50hni8IFgYS4FeMIW8/d+lHAD4aZoG
	 Gxg24rfVWjcAPJm5OLRp5jJaTRYier+zr0iHxs/jfTkzDqSoOStepPP6qGjTvx8/DtDKiegJo5dU
	 aURyrXNwvP8uLzycmv/1cJrxJ+BGEdbvBl+RLhy5rmZKZoT4YVmgwUub6mJRqCEmfT0tUVFfmyUq
	 sLfJVN0MgpLUlOkg/Cf5GXwnfYKZl6dP3FPmwJBR6mlGt55gi1YmAmFKavc4mAYsFfG5PNwW3x5w
	 31rpAyfDZpEf3q3EkVNhkopDgb1AtKeIK2m2L2W/LfRW1YSMw8fZB2lR1EK1GsW/lQJKSBlI4VwI
	 UeZGQSNDtKrzCvvmaRglCV4Y9uKxmWtlYsiyEt3J03e0+ZpB2o
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: JX <1239989762@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] rust: add unsafe precondition assertions to Vec length helpers
Date: Tue,  8 Sep 2026 16:06:01 +0800
X-OQ-MSGID: <20260908080604.34070-1-1239989762@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The safety requirements of `Vec::inc_len` and `Vec::dec_len` are
currently checked with `debug_assert!`. Convert them to
`unsafe_precondition_assert!` so violations are reported consistently
with other unsafe precondition failures.

The first patch makes the no-message form of
`unsafe_precondition_assert!` usable from const functions. This is
needed by `Vec::inc_len`, which is const, and avoids runtime formatting
when the diagnostic consists only of the stringified condition.

The second patch converts both Vec length helpers.

The series has been checked with:

  make rustfmtcheck
  make CLIPPY=1 rust/kernel.o
  make rusttest
  make rustdoc

JX (2):
  rust: make unsafe_precondition_assert! const compatible
  rust: alloc: use unsafe_precondition_assert! in Vec length helpers

 rust/kernel/alloc/kvec.rs |  7 ++++---
 rust/kernel/safety.rs     | 10 +++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0

