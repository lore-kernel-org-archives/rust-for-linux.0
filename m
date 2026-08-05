Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC083E025E
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913146; cv=none; b=D43/hy2ZZcgDPYE1BBx45Kw3XvNlhvX8AJeIYfx7uHXExWB/K7U+OEPrzLNkaEYaVt7nE5djfE6f06ARavvlNGYoy/K8sgnX6Gvp0FZhwPfk7vg4/w6KUOkjBsL5u8tZf8aWe+fia4cxds8NTXhg0ODWVjszk91HmgGhjXcbr4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913146; c=relaxed/simple;
	bh=JA/uGL08SJ0WVV2n25qF5Zgg6/c2G+lKfw2AjFzo/jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zl+0jVou/Q5tyd48bojTkpCfh1FSdGGXTeZai6TaCw1PCwXknnSKSyHgvjmJtMi+7qW9zcwJQUQCjIoPuTC7XJs5HfWJdiXYSd3wPx6x911CHh9J01/0dE4owbFslFUIv5OlKazpKyyxHN1NMwWmBpu7YiXW1diLcS/qmoNZyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKvKY4x9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKvKY4x9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6511F000E9;
	Wed,  5 Aug 2026 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913142;
	bh=sXscN+71JA7OiY5ha6DilSoxlKVGNEk/jJYtO+tjGm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZKvKY4x9VxFEiyONRQEOn16KQ3aUuLD/1i8SkekRWpOLoPfG3FfGGl2et5ejg0zMA
	 b7uT8ZAI7bh7Iw60wwewktAWTERuX2KOJnrrwjsDjXq7i96TFcwCDhwDXaO+Urle+a
	 hQ96GA6KPun1mdNXpO80tRvEZ9Yru+2NDRygNWeQpO+jlfbKhp3zA22um1gffoUFGC
	 aqFv1wCsWC8DGqHb31P/Kl6H+9lhPF0OxNx4soEq33B5GvnKvd058xRdzGnUpyRQc4
	 v/nvgYycSHHzamu5KdzH1NPbt+pLqx46fb4mCXQNcueskGSL/xCNDqO8/kXTtOqgJu
	 8ykqPIo3GBkkw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id D78AEF40066;
	Wed,  5 Aug 2026 02:59:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 02:59:01 -0400
X-ME-Sender: <xms:Nd9yavbBpYsb9PYvK3N_clP8bRd4uJK6wJ0jzrdppWH7mQvfCddeIA>
    <xme:Nd9yajnhHrVqfu6flBX0mI5ZCXFOjkBPdCIXHoj2CQCEAS_wznPIqZm5Cj8Wg80AO
    _62QCptF1OodBJBKqxmd2z-sebDdz4ctH4rnqdSXG8k-USPYcb3iw>
X-ME-Received: <xmr:Nd9yalWjdQpFg0mkVuNb0piN15uZCzZsO2lceZ30wLXazfIaxHmf54Lerx9h9jW4Zk3IDWXu40o2R8PSlCPpLPWyoNQW4KVy>
X-ME-Proxy-Cause: dmFkZTGHR7KcFeoGLIb80FEhuwtUi6mLHP4pQsoJF5uq56q0Xa03VfHqFmVdUXqoeonc1O
    ZCmqQnMm6SbNhh0tSibeFj87OAxfnL1lTug3SNkwgyw3+5bqWeCfRVrHOWnkAnUfriWTyK
    G5/sE4OfeH/jbbMtocXiL59CQl3lnGFavj9BCnZ+6nlfM22WQ6t6kKkeJxAXb8zzENfhK8
    /BmpLFhpqv+Yz1CsdnqTGKgAIOLaOgKmBwF2PWtS1OUNJMWBoEuoKKvl1MJzoKdPmMouG3
    FIBDE70JT3CNgGQmfY0SmHUoboDmu/9hInQi1d8ptLG9SxGf4OVwByrn98sgcOrJN7YQOk
    +4FzgIhCm2dmC+HXaYjIYcJZESWgfdxeffL4lltwDI3uPrMF5MAoeIayH0mbcgG4UP/HAZ
    TcjqMKLWsH5/CMiRYFzsUpcRMrrmsnz0r102fE+psiJHKvijgnIAv/S99HyHngIhLzsO8Q
    io0D2ANEoYU1BXp9T1nYRghB/h/lDPwYUee8PUfgg808RTRNEgUn9OPo0BjmzzNwJIUhh0
    NxW/ylldXez8zX22uWZmDCjvQV3deBCbFuyPjXn3swjhIWOOWfV90EHbrUz7+5U0IWRjOJ
    imKcCsr9U0m0bMiNwqsDQvZMy7EtZfR1EVGuxVmtG5pEpZHSQ89NGSrPI99w
X-ME-Proxy: <xmx:Nd9yalIoTwtds8YjUZyP73bDaPmmKKgVkFXYviYmkeczhRlRt8R4dQ>
    <xmx:Nd9yaltqARnPPol31aEkU0kJaWvzteQDIqsJwieRwpS3IychzCYa3A>
    <xmx:Nd9yaq2K7CFnz45r0GIHRnzfjB8o_f99WS4_pJ2rEVLhsJELhFQ9UA>
    <xmx:Nd9yatMKhhbIqwSDLiNSXw7q516ruzjtYW-ijPQl-wpBUWpoXFs-6Q>
    <xmx:Nd9yaqVChYC-DwPXLr0cTdgLGZ9qaLiJkzS-86MZ9SASqoAtnz7ubqaQ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 02:59:01 -0400 (EDT)
Date: Tue, 4 Aug 2026 23:59:00 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 02/17] preempt: Introduce HARDIRQ_DISABLE_BITS
Message-ID: <anLfNKRDuanYthFB@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-3-boqun@kernel.org>
 <20260805063128.GN776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805063128.GN776954@noisy.programming.kicks-ass.net>

On Wed, Aug 05, 2026 at 08:31:28AM +0200, Peter Zijlstra wrote:
> On Tue, Aug 04, 2026 at 09:14:24AM -0700, Boqun Feng wrote:
> > In order to support preempt_disable()-like interrupt disabling, that is,
> > using part of preempt_count() to track interrupt disabling nesting
> > level, change the preempt_count() layout to contain 8-bit
> > HARDIRQ_DISABLE count.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Boqun Feng <boqun@kernel.org>
> 
> This still isn't right. Either it needs a: 'From: Lyude ....' or so
> Co-developed-by or however you spell that.
> 
> Since current from is Boqun, first SoB should be Boqun.

Got it, it happened when I switched mail addresses, so it used to be

	From: Boqun Feng <boqun.feng@gmail.com>

	...

	Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
	Signed-off-by: Lyude Paul <lyude@redhat.com>
	Signed-off-by: Boqun Feng <boqun@kernel.org>

;-)

Will fix this.

Regards,
Boqun
