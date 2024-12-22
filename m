Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563B259484;
	Sun, 22 Dec 2024 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734867883; cv=none; b=RaxJAQtVfFLKGwlYFv3CLqopX6toCFOt1vChU3cl3btUCVqtkvCuuf43HnelZ2u4Jtg5hAkM7EWdfw7mqacgLkLtE/nJAz7fpx250biys2r1f4p1o4xJZPj1eiaN/pPc4wVlw0qO4/jrA8yvXKJKMllJ/pfC2Ecw2ILlzW0xFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734867883; c=relaxed/simple;
	bh=x3R0OUBy8pLd/lm8gucui7GxzCb0YJJSJRyDVTXuK30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GV9XbuvHaJnChtSt7RZhrKUsm1+iezVEwHijZSxx8e0w/UYhInGd2FvlVxwFGBxg6kqBxS9sYB1YGqaj+GrDdM45mHS/OfgwY0cerRWh8TV5ltLD7Ee6z0L+GGBIKRnAicGx0nwX0qSa6yFPTuW1pl+tobQPRA/DQUU/wWY0KPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hYi/BiW5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hYi/BiW5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1q3mYZh2ry9dOmjCfq6E/V+BoMbDFUOZqSJlQHBkrJQ=; b=hYi/BiW5Ws+UCZ5c2XwwZB2bzE
	5rvAWzl8Vt830xxXqTbYf39gexAx7ajYbosXOtsH3qVQTwyBxv75/bQ5GDQF7aQwWXagirfzlF2kF
	ORgDFgb1i0K6CJSAcQ1uD+w+CwbFiql9s0Hy9dghjdGgXWVKLOTFtALsKDhC6fktg558qBIVjAUxD
	BjNa4JGg45LJQa3EsjHp9sZ6GNBMYhPHnc3CZGN3sCvaQyvxSod8ClVV0R+34UUqWw6aEPBwtDNOC
	hpACjDMGaWTXLcv/X8Rajp+xpeJ02Jpp3N+t/Qix+N3i/+Kn3y1w5wj+5U25kqWgBVHMAzBCBfxsb
	6M7ttIUg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tPKNv-0000000673O-2H9I;
	Sun, 22 Dec 2024 11:44:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C80DC3003AF; Sun, 22 Dec 2024 12:44:34 +0100 (CET)
Date: Sun, 22 Dec 2024 12:44:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: mingo@redhat.com, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [GIT PULL] LOCKDEP and Rust locking changes for v6.14
Message-ID: <20241222114434.GZ11133@noisy.programming.kicks-ass.net>
References: <Z2YFO5zr9vm5kdjb@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2YFO5zr9vm5kdjb@tardis.local>

On Fri, Dec 20, 2024 at 04:00:59PM -0800, Boqun Feng wrote:
> Hi Peter & Ingo,
> 
> Please pull the changes of lockdep and Rust locking for v6.14 into tip.
> 
> The following changes since commit 63a48181fbcddefe5fb4c6618938bb64c543945b:
> 
>   smp/scf: Evaluate local cond_func() before IPI side-effects (2024-12-05 14:25:28 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/lockdep-for-tip.20241220
> 

Thanks, I've pushed it to queue/locking/core, and will push to tip
tomorrow or something.
