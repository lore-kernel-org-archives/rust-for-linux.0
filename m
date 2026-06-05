Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC98D3033CC
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 05:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780637015; cv=none; b=gYhctHYCEBCFNfoeG24DKA5YtvCeRF7g9gBdBKMjuQxSanqtB3yTWNTGBseq1s875iESWfM3nmPywRhhcqwH4z2814HUN7uQEQd02FhvykS55StOY4Vm6rXLM6kmpgsSnOMlrqgMRnHp5ux7DYYJZ5Q4dK0NiRCEqqyOo3RuqR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780637015; c=relaxed/simple;
	bh=PvsSeE2ChQ1tI69wTU4kKv9ENYqVN1rPDK4jlbQTgGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bgkmc0j35j+xEpT4Xjm4AZV4kgJiF17iCuSpwJ/ygdfJm8RWxVMCL+O9qGR8S+yK6ARB5RGwc3oGbEy3VZ7vR/q5ioC0F+iXlgYty9WFJQGzIRNn6nndiO1pSws5bJHQRSW2Hv8fUBapVL0IdxOlmN7NMr/D+dckxhGtypP+YNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KO0emYX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KO0emYX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8351F00899;
	Fri,  5 Jun 2026 05:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780637014;
	bh=Ag1qZDlFglvMfHJffMSCoFRCAtiG7m6LnL2rPrdd2Mk=;
	h=From:To:Cc:Subject:Date;
	b=KO0emYX/N4vM3kXyj3dNenr3IuLuW/xGkMMks+YosQ4N2hxk1hNcmebY52hgWx0QO
	 Vgs7/yJR64jy4wcNveZifb6oxTcvSmtN2ZyBk8uth4DorjxYe8KJXdIPDgZEhiVEqP
	 n0BgFWs+LIbxaXzF3b5/eiMwGdzjsOB+kAJYV64o2EiSv5pBAVo72Xdq1+KIVlBAj8
	 RwrAA4hQMoaCBz5Q2AH2oFXZjCnL7GICyIu6wc4SOOXCYgRM4tHggp3vqWyBGd14cj
	 Y3cSbTElhGTICoVgkoQwnQ4njLSs/x5Z258bS2EyI9MlARG2umT9SNXd307bp6+a70
	 IpHG0ug1ixO+A==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 57A08F40087;
	Fri,  5 Jun 2026 01:23:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 05 Jun 2026 01:23:33 -0400
X-ME-Sender: <xms:VV0iajGAzs-l737P40o24spXjKlwUlCq5KCoClhdIF74Yy5srfDfOA>
    <xme:VV0iasRZifZrReS4F3T6Wec144QCJUmIT9it3StbslUYuquk-Pu71txBdI-f0Acdk
    md5w08KnoNisHQXnq5kizSGIuiBHY2hSmQwNTgsg7XCZ-qJus-NBA>
X-ME-Received: <xmr:VV0iarTsstqHq3P4fGDL7wSH58EMB_FkVJxn8vJqdoFQ0nHJhx9Zglhh_D0>
X-ME-Proxy-Cause: dmFkZTEOdd+DOBTTBIaZhHR+fyS2s+mFaqQZR7A7rhCt6qWiBA+qJitV7Z9V9KXR3mTG6N
    2Ot10J2Uc0VrkVqe9yswFH4jQiJ9eraJfSfEnpUAsEkBzNlrfl0jKBLgoyVs/MF/htdVM0
    nYf+TQ5lp5R7zHlcA/wu8EVBkTetFCmBz7GkVfYYDPhNLSihoX4wgyB/8PjFDQWafVmEZ5
    TTBhUjMjPb9Uzwuhf5ScVx6bks+fJJT7xrLTAgkXvl72LMXsDOK6LSPvaGP4+h1vrw2lmG
    unLfwV4tDlamMPbYyYVgwNOFwVqlFLor7wn1d+2QmEIyeFW7fHtcACzqQyOlqel68HRClG
    eHLEmQzuSLgdG89SPmIVfvFPKbOiX/l1/oY4eOym8R2iKfHjzicZd2VpL4xY871PoSmJCr
    LtKwsV4ONzL2j8xpZwnCwxLIKKIkzi9CukZi/CHXIQPRN+KXS3ytBkLDFbh1pYKA47BbN9
    LwnaKshbi1PAwBCc++5Jhivf/6kEhtqjO7pHG+tcG5xBhOQP/65oLImjy8ntD8cGw2jxfI
    tbkZhFYLmtCKbzTZF8CX9QptjqC7Kfq1zulgwoUyhM/V6mBYayUyaiGBynX/Uua7WJoYhB
    RZLIcVjlNeBP5azzovxhBkGN6FqXoaXceKbIZb9kTvwZqTK1aMLe/ivALMbQ
X-ME-Proxy: <xmx:VV0iandZbk_hlM-TnJgWiwyPqFTZjNnG6PIxi8ulVtpYxwbF3eOrFQ>
    <xmx:VV0iane00K5kexC_LmMFruS_DH5a9hHjfm1iMSyqTuJ9VXmGEHbv1A>
    <xmx:VV0ial9c3B2Ov1c-TavUFRX_NzCp0kK3_m0x2JV_VOHlW6Q1XQvCDQ>
    <xmx:VV0iavPNA4YD_noj9cnIU7NJZueF0MosKZ-Mu-Ovihnt5D-Kn-N2Gw>
    <xmx:VV0iarWZxXK9R5r6eBczwEGcs3CKWwhD9k0-OyVQWgvpctjaByIXCLnQ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 01:23:32 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [GIT PULL] [PATCH 0/3] Rust synchronization changes for v7.2
Date: Thu,  4 Jun 2026 22:23:28 -0700
Message-ID: <20260605052331.1628-1-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Peter,

Please pull this small set of changes into tip.

Sorry for being a bit late on this cycle. I was trying to get the
refcounted interrupt change [1] in this PR, but I feel maybe I should
make that a separate patch series for more reviews, which I will send
out shortly.

The following changes since commit 608323bf7bb85bbb647eca4373acef247f105e67:

  selftests: futex: Add tests for robust release operations (2026-06-03 11:38:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-sync-7.2

for you to fetch changes up to 33d221f06eb7e068fd6c3c78d432322f807a3f0f:

  rust: sync: completion: Mark inline complete_all and wait_for_completion (2026-06-03 11:52:08 -0700)

----------------------------------------------------------------
Rust synchronization changes for 7.2:

- Add "RUST [SYNC]" maintainer entry.
- locking/lockdep: Replace snprintf with strscpy in seq_stats.
- Mark a few completion related Rust function as inline.

[1]: https://lore.kernel.org/rust-for-linux/20260526152148.30514-1-boqun@kernel.org/

Regards,
Boqun

----------------------------------------------------------------
Boqun Feng (1):
      MAINTAINERS: Add RUST [SYNC] entry

Fabricio Parra (1):
      rust: sync: completion: Mark inline complete_all and wait_for_completion

Thorsten Blum (1):
      locking/lockdep: Replace snprintf with strscpy in seq_stats

 MAINTAINERS                    | 14 ++++++++++++++
 kernel/locking/lockdep_proc.c  |  5 +++--
 rust/kernel/sync/completion.rs |  2 ++
 3 files changed, 19 insertions(+), 2 deletions(-)
