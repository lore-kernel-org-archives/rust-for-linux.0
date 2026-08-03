Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CF540DB46;
	Mon,  3 Aug 2026 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764028; cv=none; b=SN/ZFfuLhgvZlR5KLbc0JZMuKWjcWXvU1CU68p7NIy8tAbLUXUt9kVmNpdddt1RFs/68abn6IJdNS3NW6KSA2TjSmcPX8Ycutoi6FhSuWXGaMFcIlN++uy9/9UDJjqHMOIA9Ya74O4Dt0dYIZTl7NVY83kVKn/f8jglJrwPXW8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764028; c=relaxed/simple;
	bh=OHFDOAhweiUuFLDQ/3BK15YmODizrF5SWYOHKSqAtYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUykqnylphjvm2inMjjWAnz1ripVZddLt/xalEJ14imNuhwsMhyCjvup1f6zfMlvvFqAh0G1A96rajFMjnnkUDmqdHXGM/f0v5YXcAELcUrAt54ftsawOIvyQq0B2nJbIQJeQtHpCPR3Wkyvq5DCHo5v/DSA+Lb06DKaW6zxhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moXEov3z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moXEov3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485CE1F000E9;
	Mon,  3 Aug 2026 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764018;
	bh=d41hCeiycC+wWgDxm6kt/c4vnyXjZ/50o5dbGR9UOsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=moXEov3z9/GaGpjIOMhDSuHArd0J5h9w1UNqcET3NAuEzYp8YhRRbhEWIkocL9GKF
	 vN22SYE04BM6pPrOJHeRV1XaRj5Rb/RwyORxmpd9t7fBWCQ2Q/vr323NQX7UMEWf+g
	 jpwa2slezMLdSoDBDC7XByMNSYGH6OxoT07nL55WZ+wVxC40TVemJeGCvMYhFsNCM5
	 ROhSwAaypiMeNpgWZ2WhgPY+bw5ne8c+QAI6IKqey6PwuFAC5JpAJU6JFSbodysisp
	 vbjH/fIjZLl7Mw2WekKRccrO8oantAZ5iH/BM50yiSUdn7wvu9X8ZJdUm3/2WKmR3B
	 SdKK79qYlWuKw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4F7CEF40066;
	Mon,  3 Aug 2026 09:33:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 03 Aug 2026 09:33:36 -0400
X-ME-Sender: <xms:sJhwaqzi1v5jh6m8iMOolG8aRZex4ykx3zY0a4DqNiiZqw-dKS33bg>
    <xme:sJhwagog6jZroS-1o_YeGn03ioYZnyZ6U-pcdkpWvAZmlIaWZv6ZdSmNLqzfIX9VN
    17uSTBkRzfGQKEY4MAmGGMSD--Lcc2687kgW_St73YclepcjaI9>
X-ME-Received: <xmr:sJhwaidAd5wWJpqSRbb-pRTrn5sejzw6KN8DrPLyA3oM5BWW4SQ2a-RQW0BkPnswMARJlcqxcqH91D4N22etcjbCE4A6dXnt>
X-ME-Proxy-Cause: dmFkZTE3XmN7zYcFm9FeRyHbBKMzCw8RHVKEBEa27dI7hQsrmgTXJgSCSK10CNEG/UpzR3
    lkDcTaGwYhE7SiHZ1Rvs1D8ZviHeaDVuzcepd72tXquseyUZimY60Zw7xwVVjxCTY92XOk
    zrKjlVDzqO52Po0dlU/nlFMlgomOHsGJZg71BQFczrVSfKjYkfOLhJpczVFt3ilJ6DyKSW
    rOTSyN+KncoswOIo+T9WaTTCj2QdjNWNT4ewHCkZZStaKW9ywfbCKKRHuCWTU6+UAE6mIE
    LBobuEgzgjQ/kKq+k9MDufD8DKH53jozSlv7xsvBtMVqR6G309VP6pk2i74QbSm7R9HHAf
    6pnJ7MoSSe1exE0AcKSs20uI7o06lQmN91/AuZBN/QxhL1kC1U4iNPkJWsaCeOMAQ0NxvJ
    jNSPfr9EIow6JJ2gVywZY1DGOH1xfPm2SQlQ48Sl7Rqa0mdGoxpCscNlpFdKprHFkN3jGw
    A8BM9/CYWFDU/8mUAptz1kMbMxyvL9njueUstGMAgvmNm+U0atI6yixDfXp+jwzQoYvJtX
    uzSXk7TTTtehTkMCIBI7UAndGqbMiRG3KS0pZ8efDkbL7hDXvuJmPd5siBlOlJY4LDgsyq
    HUnkZ63JWNeL33JeqvgABfPYXAxoK+jB031OZw4xMVDr3lhK+dRqx3A0Hn3g
X-ME-Proxy: <xmx:sJhwarp-xNNOaTEGoA-ZpUhic2W-T4DX0K7xi0HP3NMwC3x1rArJgw>
    <xmx:sJhwakkWKGhjcUH2ZcNedFvRCJfqzT_C7_txyoyqbfnMajYN3v4XNg>
    <xmx:sJhwakSGDWoqBwJZHK8GxoEY8c8fUGIcUDF6Mirloi31JHjpHM4jMw>
    <xmx:sJhwaiaz9m31ujW7fopxuQg8DckTcw_E7iy2RZlUYwTImTVHhHOsGA>
    <xmx:sJhwas86mOjDiNFF8eXhN5ADMwtt9GV4qqg5BbPh8G5s3-E952FToIei>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 09:33:35 -0400 (EDT)
Date: Mon, 3 Aug 2026 06:33:34 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 05/24] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anCYrn_3Nb9qpBAA@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803091919.GC49951@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803091919.GC49951@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 11:19:19AM +0200, Peter Zijlstra wrote:
[...]
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Boqun Feng <boqun@kernel.org>
> > Link: https://patch.msgid.link/20260121223933.1568682-6-lyude@redhat.com
> 
> Same SoB chain issue.

Fixed, thank you!

Regards,
Boqun
