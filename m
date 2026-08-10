Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D89F3DB96B
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368065; cv=none; b=QETtauO8lBnEyj9x+VbZt123OPytOUV8+v6MSvpRWjjqN2DMyu+LbSaehtdMxFDdqwNehWXNASDkobyC1GFHQklWwdIGY/iiBvx9+8mtVshvjgf1wZvNiCTkviolW0SVTOoXBs6RoQnkfDlHmaulBM0Xw1uTGh6VEprZ0A73cmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368065; c=relaxed/simple;
	bh=LveGSp7CfVoCeyYTJLMf6SfkgONuKD/AsiW+6U8Sh4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXaYyt43yEkmnIxZunX/XQqiGA7gddDhtA/8CVuQ805hcQUIIxHp5TF90SMh4ot8AYFvUlJX6LCOi2v6+bNdyCZJ+PbR337Dp5e7VwT+PxcAKzDbJ7IDlAaeg4JU201+krhPGIpazIA5kKncoZku1CGqTKiRBOVBQX2QoElf4lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcVYIRg6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcVYIRg6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AE21F00A3D;
	Mon, 10 Aug 2026 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786368064;
	bh=XdfIt9492201Br/Fv17FyaRwlOkGpXQ9wpYpyh0tES8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KcVYIRg6MQ3+gFZTNyrKkYBgoLHc7C7eltTV80SLh0v1ZCZIYN03AklXqGwEdgDIh
	 ybZ2fbn6kTTXVcH7Eg6/9VXXVWy+q7+1StEY3RGSZPD0aow6AyJSaIQJUJRX9HkGDF
	 VBonhUriJyLGq7By/UAsRiCD57tcLoYZ5Ufvp5PyQ83Vs5+e1PKNgwy+Xk2uyEvgHr
	 DR9DZKgfzjAoJz+3he0pwl4C1lf/oVfjOIpY5/w8MjLOIms+gb7w/o3u3WZHZj9TD+
	 ApKjD1BcQgo9lMkV8eYICTWdPpnr6yC2EwD1/YHxvHE9xLHXwYUmKgXsJECIc8a5Km
	 5gXj09nNEoCjA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7E597F40066;
	Mon, 10 Aug 2026 09:21:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 10 Aug 2026 09:21:02 -0400
X-ME-Sender: <xms:PtB5asV1T32aDAfDGaJOxHT3Kas7B8nsRsEX0wL5p8ZBQY3bA7u8_w>
    <xme:PtB5akvFNeDSuQ5bcsLJsrfPdugWDdwKdWWL0IK3m5gAiApH9jHaGIAX0XUCvP8DK
    RkzecNSAzz85PzqQDzcma-mbPblqCjbsblkhKktj-NPVlT8rmKR>
X-ME-Received: <xmr:PtB5atYhj_pxuSaoqg_GgB8_M_A83-jlKCqy6cuMBX1Gec8N7XvpzghQP3uT7sTot5IisTN89TCZShBqka3OpPxup0egNpPe>
X-ME-Proxy-Cause: dmFkZTGzQFpf1Z8C/eRZsiVETwJbTbEepJR+prhzbifflWBnn/S/Qe+0R7Mtcp2h2rCoxO
    jpn4YRFt+5iuyuasx6XaUPhmqbKRGxdHrd4OsVr4BIUIxvVPlAT3Oh88hAqb/ldTt6PqQM
    RPuONbPD79WnpRQn2Jk5ht69v9QDuMujuQui+MRA26Q88E82zUqfAqGOlVtDGOdJNrqP/x
    ORgV08/y5hPz8FZkx1R6j3CBTSfBfL37pHQ6PNGurjtP8OU2KHoVeazwowccy22deigzMV
    EX3hWfBqFVUwcBVeT3IdQhGykP5f9n3u395tRQRpn4sRhPGJ+HYREBZsFwWWhTyGeq2Fg7
    uIRirMa1go50EADTRlBpFzlyvXWq1WAD+FbuOmT0uoOSc1awBfmErvWmtgQtSIR3b/tyt7
    geRWW6VIYORAsov0M6yqaWsib6z4TjfILh1HSSz1wBX1xkY8bXi7X1ytNGbv6Ljv1hwVAi
    HlxIHwBRdGuS+60a2Xxt5dAvs9YbwQoxYHU5qLDJZyWmDgy8D24y47rz5bDzoQfEeoXRns
    UvzxANZGT43liHgsO65dPMVn2L/2/NfI1wOXAbh15ILgOxNfr0daCsZ5DaK5ny79GhAJ+h
    aeF1gape3DUAEHgzrdSKRsncKGGSh9tP0aYHE972m6jxdKKUl0useuIDF06w
X-ME-Proxy: <xmx:PtB5al5Igc-G94Y0zy5tWi5Brrf1Z8t2AvW-WGfLWRXvbw4-rLhmZQ>
    <xmx:PtB5atkcXt6qa_9r8T9OfXy7PRPdi4Jl0kb_HCKkvbxQ5ruPakBPnQ>
    <xmx:PtB5ajHxyA6noOi91_UJDeEtEsza4nzY3Ax4YeNd2GOxY5s28QuVOw>
    <xmx:PtB5apFTlUiCg1fQj2GnNGMbxv29UamhWzyvENqSsSgth7IIRb8bjg>
    <xmx:PtB5aj368yL9PwVUIbRYwg9FPTwr8g3-t8c64usRFohTjWgUkKZPVy4u>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Aug 2026 09:21:01 -0400 (EDT)
Date: Mon, 10 Aug 2026 06:21:00 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v5 17/18] rust: sync: Add SpinLockIrq
Message-ID: <annQPL7XfXzLLpnQ@tardis.local>
References: <20260807070218.27144-1-boqun@kernel.org>
 <20260807070218.27144-18-boqun@kernel.org>
 <20260810090213.GG1642880@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810090213.GG1642880@noisy.programming.kicks-ass.net>

On Mon, Aug 10, 2026 at 11:02:13AM +0200, Peter Zijlstra wrote:
> On Fri, Aug 07, 2026 at 12:02:14AM -0700, Boqun Feng wrote:
> 
> > -pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
> > +pub use lock::spinlock::{
> > +    new_spinlock,
> > +    new_spinlock_irq,
> > +    SpinLock,
> > +    SpinLockGuard,
> > +    SpinLockIrq,
> > +    SpinLockIrqGuard, //
> > +};
> 
> What's this new_spinlock* stuff about? It has sensible naming; unlike
> that CameCase nonsense the rest has.

They're the counter part of *spin_lock_init() in C side, similar as C,
they need to macros to expand at callsite for lock class key generation.
Types and Traits use CameCase, and macros and functions use snake_case.

Regards,
Boqun
