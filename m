Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B046D2C9;
	Wed,  5 Aug 2026 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935198; cv=none; b=JPX65Mm9LnOY0qAFHdjL5c+JrK3v9uWIv0KSzEn7Hn19vhTM9uON7mD0lMLKcY5viWeU3na+6oh4eIG3lzGU/KrpcMOkvQruZxvXxWFFy3Jd49Puf71oTwSgLshsp0EAZ0Cb8EgR3Jx0QvxfpVmZhP98eApw0W5H+mpzbjszgq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935198; c=relaxed/simple;
	bh=cZnLNfj2K1ebBwV46t/tm06IBFd7OmwjXNxbzsvyfEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zazv5xevW+9EYYxKij8qw8yU+Ob/qn40VE3h4fkpyCEf62svD8zHReYtHXldxHj7yHZwk/6XU07a/xXO1RuxR/ipvEjfSsuboexqaKAZUIcjcJgfHAkxAYTxsgNfnhCvOr7dfnzteEYrX+Yw8MJM9tqKEehCXd8GefahKJlCexU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiA3ozyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiA3ozyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686A81F00A3A;
	Wed,  5 Aug 2026 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935196;
	bh=l44B5Wq32vKzN++gu65gHNfjaDaJOp31q6MT82vzD1U=;
	h=Date:From:To:Cc:Subject;
	b=hiA3ozyF1krt/rSlOxIBLpb52kS+cH7aCJ0ycpKsev/EDQU+haGIl/6o38OfyVRM/
	 jhINV8tQLHyYRw89Ss92Pnr6iEcNblx8ftWkRZByi/mU9jMs/HmUt2U0NzyJtvFpct
	 AeFsrqkJD4GEgBcPeUsiZvHuCkNQO7xsAFxC6PfDZOT1U55ww3OWyM0HeKaL6hvLur
	 S1ENA663t9J/jcduiAAN2K+TOuj7tERhB4dD2X1AWgrgzOTudb7V7AGr/GKbdZnLAe
	 XpeJi9Z+f5i5VPYZZtCJQKq1pEcwsYG0iAVhK7A0Zb9StXuYd/EpvP4CM2O72oxAqe
	 n80YXocBCDoXA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id A0BDFF40068;
	Wed,  5 Aug 2026 09:06:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 05 Aug 2026 09:06:35 -0400
X-ME-Sender: <xms:WzVzaktYEDKTotRzu77JQFaW1FbOOkeXol-evPJfP93WCOpUZ8-Q4g>
    <xme:WzVzar0OovatYm1j8se05l2yGZ8KIAlWdRU-JV-HmioMpkRJSl0jnU9gzj0_jPtoh
    voQhf0Uky3Q39lIMW4MJ8NoqF766ABU-TVn6o5OZyP57_0m4qaDyg>
X-ME-Received: <xmr:WzVzal60QMV9fwDIpuJr4UlJi30laR2sNYmB0h5HijeHrXkcLNOvpTJ66vRtJ_KExHEaZuhTIm0YIlB7aAbtHZSkxSdlu1AG>
X-ME-Proxy-Cause: dmFkZTGCnOeuasTF7xUD7BnQaGf6WAEG6RikHP4DB54QwdJqk5JbyW9l119ay7sdF20ECP
    1A9Ap8NvKOa6/XE8NCaw0ai1eBJKIHJp+7JmH7MSDPz13atB5kT0YcoHYHOc6x7znMGTCg
    +rxeYt0e6fH/CdxQWF9uaoPEhzgxRoHjdSpY6rNDVrEE2KX190Wb3eT9rhtmoPU2iYNEMh
    hgO0AbfGK85wqrmAMI7g1MGMATrnLNW2URhXxiI5FkViE9BnScACz+Ij+BVmx4LlnyN1RI
    9ctv8x3LZ2y9PJHdQSPpwid3MMrrvcd+OCTuDi3qXWocwYYrNkwuvfHAePvMJy9Mg/Xxb3
    ZEMrmGvTtgN30FtjJAtWXsNi6e62pvHmtveuiubJ+LpM0KefwL6O/ZdAmSuJyf6n5SIKH1
    mVRwfr7l1ElEL6NO8IyA3mv6cCdsNkeRav90NuXcmpzX1QSNwb1qvt3xYnBsTmaFbETahW
    lW8Twd6Y9HLeggGhJb7wNhNZyrIODYHU0jChPDjCEwPeXtfdEQUlUA1/0whtuOwAdHbuMc
    3RUfqgnB4V0pyv2Ot2XGnf5sFEw2XIjWgXxQA+3skJWFu5sMQ1xLLKFJ8NWtkrRjcZ4H9I
    hFqdfQL2TTTVFNEHdnizScVE40cN6+rDFwYzPvWy/e8vJIp6PSwO5cS8d70A
X-ME-Proxy: <xmx:WzVzaiVkqATikc5GgwnIsxaEl4jl_pCT7AhT9l9B0Cg36mGAJZY8qQ>
    <xmx:WzVzatjm8kGEb-G53arHc-YKLZo65-gFj7uFvRKPlF1dGoQpMCJQBQ>
    <xmx:WzVzaifNnKJOD0iLgqwcmd47W10oF0p6BLeBYfsGADqg0Seikms8vg>
    <xmx:WzVzas3T62951TNVNwXxBIcaJ8Lf0JirfwJIYZUklViSavr1Enm0SQ>
    <xmx:WzVzauorQeW6blPQsk7Wi054kvYEG2RbiNBmgc6tMj_fVvLH27QIgaw5>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 09:06:35 -0400 (EDT)
Date: Wed, 5 Aug 2026 06:06:34 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: [RESEND] [GIT PULL] Rust synchronization changes for v7.3 (Part 1)
Message-ID: <anM1WvFfRYfc-wHV@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

(Resend this since it missed the public list Cc)

Since the SpinLockIrq still needs some reviews. Let me send the first
part of Rust synchronization first. I'm not going to resend them as
patches since they were in [1] already. Could you please pull these in
first if they look good to you? Thanks!

The following changes since commit 1c7efabfbaf796f11000a46094a69955a01ec6cc:

  futex: Avoid private hash use-after-free on final put (2026-08-04 12:29:45 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sync.20260804a

for you to fetch changes up to 3f90c16d413b2f68407f1c5bb112a1b16ea35dc4:

  rust: revocable: Use LKMM atomics instead of Rust atomics (2026-08-04 05:52:54 -0700)

----------------------------------------------------------------
Rust synchronization changes for v7.3 (Part 1)

- Add synchronize_rcu() safe abstraction.

- Generic memory barrier: this extends Rust barrier primitives to
  include the DMA barriers.

- Replace the atomic usage in Revocable with LKMM atomic.

[1]: https://lore.kernel.org/rust-for-linux/20260731203031.13679-1-boqun@kernel.org/

Regards,
Boqun
