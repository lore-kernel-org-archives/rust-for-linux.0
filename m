Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D433B101C;
	Fri,  2 Oct 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934174; cv=none; b=dqYS6cqYfPxbVAHYKlMIDl7oKBpXPWcadNV7DefjKLBvN0tWuiemzabMrQxvHwKJoSKmo9XZuFd8lHBBM0VFLiPA3DrfSA6s4SaSLBqJugHannkBEFclBuifn8u7/glUcu9opYEzXNpI70i8SY3slsYwlRloxaUOoJwraCGrndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934174; c=relaxed/simple;
	bh=nRNFUTnOqnuStRWVWyapWWZVFqiU43ifkPH1Agr9PWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWvFCx52i71dUTU6o4tVko0QrwCl6pkmThjyP6AXVZkaSUW64kah0A53k41Acj/rLi2AMManxeoExoNS9T241f1NmWx7x3naNDDbD7Xp0z4OvccPHXMpna8PUoMIeP7qsOC3waDJmKYuWLrm3UHybBSxnfwI06fhepE5wWgUkFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EH/5NKa4; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EH/5NKa4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PdYQrz2lFzS5ViOuB67QEy0q0NeCPXpDZXosNNAvECs=; b=EH/5NKa4Sx7EuP159P9R96g4GW
	UtZ6NTijuRJ5hQ63rmJDFJ1vwisJjmInx1juCM4IJd6g+/Vm4joCJYVV9O+osgtvCSr/bhU+vCd2S
	DmAPPJOPFd7I5MN5dB8mIZT3v2Pjp7BzYI9u4q3J2EfgP21wePzNJOzW9blCY3vdrq1D+F4MG7tbF
	QvKBh2C9Icdg7AgacSLKZW8meyYQ6ByslKlnrzS7waffsu/v8K4ljv9afSIsb4Vav9Mr54V+itz7B
	fg9XlazQCN+bcvWkPPIC3THCU2jwQ0CZcUmHy797Kqhcx+iVOo3o/2Cw7EjJUX6PP69sxg1aEszK1
	ub//EnZw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCZmv-00000005ny2-2ZTQ;
	Fri, 02 Oct 2026 09:42:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B003B300390; Fri, 02 Oct 2026 11:42:44 +0200 (CEST)
Date: Fri, 2 Oct 2026 11:42:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Improvements and fixes on SpinLockIrq patch series
Message-ID: <20261002094244.GU88198@noisy.programming.kicks-ass.net>
References: <20261001082519.16195-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001082519.16195-1-boqun@kernel.org>

On Thu, Oct 01, 2026 at 10:25:14AM +0200, Boqun Feng wrote:
> Hi Peter,
> 
> I realized that v1 [1] was left on the list so I just want to respin it.
> Just to refresh the memory, v1 was requested [2] as separate patches for
> changes between v4 and v5 in the main series. I also include the
> refcount_interrupt kunit test Kconfig change in this version as well.
> Based on v7.3-rc5.

The first should now be in tip/locking/urgent, while all but the BPF one
are in queue/locking/core, which will be promoted to tip/locking/core
after the robot had a go at it.
