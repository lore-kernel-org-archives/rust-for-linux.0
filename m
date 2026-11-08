Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111432;
	b=jh+pCL375RHLVtHiexF58q9gP44AWYJtDkTW618Kz5QZ8WD5hKFNQwBrBdLHUUa6XPSr
	 Pi/zN52h8K8mNJfq5gmRo1klNqh4ETa85CNnHQvWq3e3Leav0RKlCPZlZRjV2Pb9aJOk4
	 npq/rLvNnp6LLdpooc1DQxqXCk2L4Ds/eECGLW29vG/KD6YQNUMurj9xxZ81mmOgLgwbj
	 9HvVTK1nTCcqEdUQXPa98NoWWzHkYslYvcLnC1/dyTGcgPWU7Wp6rX/7n8GGVpJPU64qV
	 ai0iyx8WNfD/9ld/IcD6RelbTz8vMr/fy4Igoy3XQ8cIKytpLvQo+h2XWp1EA5OLPxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111432;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xf350kiWMiK9O1wpWwY7HDmzSJXiIhOkt3WgyUFMN9I=;
	b=vrkwNK01cpnPoYe9WZwFTbVWdeCzTa+X8NxKztaXnm4Wcq7+DMhYb/awc647lS3hvcIu
	 5E+Jg7VVgs+2G2dFrlN0M+2Gqehj/PrKsCwyKETNOhNAuClaemIXtKXLlR9U5gJyh19Oj
	 3lqo2+64Gyzu0Rv7UCQlwUdRmDr8OOmENAZOvNTEayDJFNY6/ug/S7MvGNb/Y6J6mf+fN
	 zgk7cClulY2X5xORJFOnHpOim65ic3mxBKn98dUyKcru7qoB5Zx7a9k/RIpQt6OSAXelv
	 NeTQ7PtOVh3jFjyjaiecoGP41JYbNzitt6zDH8lvNdV9DXhEEaiuIQayvpsZU13GEVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGf2buBt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51450606A31A;
	Sun,  8 Nov 2026 04:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGf2buBt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D801F0089F;
	Sun,  8 Nov 2026 04:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794111431;
	bh=xf350kiWMiK9O1wpWwY7HDmzSJXiIhOkt3WgyUFMN9I=;
	h=From:To:Cc:Subject:Date;
	b=XGf2buBttgHpApnHi9gEu2vVFkCf2HG5ErPIlQkrxG+hEKR/UeEqTACO99Wiaki3R
	 Fv5SDN39lhCL/TPH3UT4rnszLlWzRhZG4m3Im0TpqWxQBlTXW4IPf7+QZHvlFc+jPa
	 4m/hJ7UpHAtWL6BsMKfmjppwEiS7wixkTfr9pcLf5tc9VxEVRCLDp4rJd4KM01QwcM
	 75eV585mORwleIBRJgPdXI5lyMw1FKJuKpn0qrWw3Mel1p1LOdcnn2G5QFp1SPrjRL
	 XsMv97LfUnVKkPmw7arAtk/tkI+BvzWt5EudT4OWdsZSPK55FcwqVhHreNGRYTY/ei
	 h4u7ZaGdTEI4g==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 7.4 (2nd)
Date: Sun,  8 Nov 2026 05:16:59 +0100
Message-ID: <20261108041659.97199-1-ojeda@kernel.org>
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

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next for almost a week.

No conflicts expected.

(One of them is just a warning that one only sees with `CLIPPY=1`, but
so far we have kept the builds warning-clean even with Clippy, and so
I am still including this kind in my -fixes PRs. But I know you are
trying to keep -fixes to actual issues, so if this is too much, we
could also say that Clippy is out of scope for -fixes.)

Thanks!

Cheers,
Miguel

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-2

for you to fetch changes up to 57d916a3eb765ee0577d269bb2ac1bdf3a7a7f40:

  rust: bindings: derive Zeroable for bindgen's opaque array wrappers (2026-11-02 03:06:57 +0100)

----------------------------------------------------------------
Rust fixes for v7.4 (2nd)

Toolchain and infrastructure:

 - Fix build error with bindgen 0.73 in certain configs such as
   allmodconfig by deriving 'Zeroable' for opaque array wrappers.

'kernel' crate:

 - 'cpufreq' module: clean 'undocumented_unsafe_blocks' Clippy warning
   for Rust <= 1.86.

----------------------------------------------------------------
Miguel Ojeda (1):
      rust: cpufreq: fix `undocumented_unsafe_blocks` in `PolicyCpu::from_cpu()`

Sasha Levin (1):
      rust: bindings: derive Zeroable for bindgen's opaque array wrappers

 rust/Makefile          | 9 ++++++++-
 rust/kernel/cpufreq.rs | 4 ++--
 2 files changed, 10 insertions(+), 3 deletions(-)
