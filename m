Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1583A640E;
	Tue, 31 Mar 2026 19:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983668; cv=none; b=ZYdAKfWE0/8rhXP/pJdtzrRsIoyPtrRf6eXYd4e/pzR9c7waVEiqaqztY3I8HAJ18PK9E50X4VqsNgnmWjpsafm1MDcX4gKitQKT6bMdZjNsnoCDJ+KK6ZHcD8oAauyImgSc02HryjoGq3pGG1MsLtb8wWfDojce945JkVbo/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983668; c=relaxed/simple;
	bh=SwrpfwNcoOScq1B0/gz7R0Ml2sFtOOebgapbWsaQjCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrdLEX/wwiAu59WFhnEJ6pG20+p7ennGrniG2l3kaIrP8kg2gme9UlJ3ibuyATQ0sj9RRdVL66sZuq/HgHCKqervoxG5sGES5JTOARqyPOxP9l1tkEvmWJKc6qjUfGtk+lJTB0Y9SHi7APVxQ3+J2eI/V2TLKdxu5b5yyyXiB4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXGzM2LL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXGzM2LL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14EDEC19423;
	Tue, 31 Mar 2026 19:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774983668;
	bh=SwrpfwNcoOScq1B0/gz7R0Ml2sFtOOebgapbWsaQjCw=;
	h=From:To:Cc:Subject:Date:From;
	b=FXGzM2LL9pd5DI98Af8ILNoiCZ3Qe8jaDpY73+fXW2KCfPhEYerlgbC12OOfxCj6d
	 iGJJrIvY3hTSQ/TVldtj88ym/jJFIk6TUzfR4Vm5GZqlf3KTFHviIsrzN7UgevZvtj
	 E59SB/SHkKEzyRvp+4j3pAlSHmGc8FyVjKG4anbYc38w2fnUTkNwR7+f6G/aWvhuS5
	 037OCQYbsKabEpTgh4JDaWXGHQFxmnvObExyekIjKGSW3D55p2ase8S9XFGwQkzVGK
	 3wBBxaA4drKHamuVndrCmVvrj+f2921MKNRv3t+iUWOUJbQQXJ0jSd3rOlTU/qpQGM
	 c/wil/L4kfweg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Christian Schrrefl <chrisi.schrefl@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	=?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
Cc: Rudraksha Gupta <guptarud@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: arm `rustdoc` Rust 1.85.0-only build error
Date: Tue, 31 Mar 2026 21:00:53 +0200
Message-ID: <20260331190053.482607-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian, Russell, arm, Fabian,

For Rust 1.85.0, for arm32, for the `rustdoc` target (i.e. all those
combined), I am seeing:

      RUSTDOC   .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/lib.rs
    error: target feature `fp-armv8` cannot be toggled with `#[target_feature]`: Rust ties `fp-armv8` to `neon`
        --> .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/arm_shared/neon/generated.rs:7538:48
         |
    7538 | #[cfg_attr(target_arch = "arm", target_feature(enable = "fp-armv8,v8"))]
         |                                                ^^^^^^^^^^^^^^^^^^^^^

The issue is [1], was introduced in Rust 1.85.0 and was fixed already in
Rust 1.85.1 [2]:

  Link: https://github.com/rust-lang/rust/issues/137366 [1]
  Link: https://github.com/rust-lang/rust/pull/137632 [2]

It is unfortunate since our minimum is going to be 1.85.0 since that is
what Debian Stable has (even if patches may be on top) -- I generally
test the latest patch versions for each minor, but I noticed this since
I also test the actual minimum, and I am bumping it to 1.85.0.

To be clear, it is likely almost no one actually cares about this, since
nobody complained yet, and this can easily be fixed using the already
released Rust 1.85.1.

By the way, what is Debian's policy on upstream Rust patch versions?

Thanks!

Cheers,
Miguel
