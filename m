Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F0F377ECC;
	Mon, 12 Oct 2026 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819467; cv=none; b=kyKXgjLARm4lREMh0sFVmQpl1ri0H1ptrQ4h/st5dAIr3g0Eqh/+mVWPzpST8x6sd9W5IG7xqYApTn/jMdzBIY+lEUPpWXtynZg38HaEiefO7QEHcm5InT2AzoHe6uP0720eiiLLJrzaR4p7AFnAPVpz77UzPgWwaEzt8I+81VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819467; c=relaxed/simple;
	bh=nGOOjrZQ9vQTrVsVYxJirsK1R//qfD//QDoncz6f/Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fK9GjZpyTsB2k9XPwgrVKjL2WYXydV9U7unI7oaIaIxZEibEwcTILQoc5Ql9TktLZ7Mu9D88Qykg1F4uXZIR0jvRL28MXz5OvU88HeWZdfilYXNfj6j4YejXwQdH9zr6gLdqNiAOnX/ePzukjWYu3nugKfFRqKNFIY5jbV6SkwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OexIpR0A; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OexIpR0A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bmEBzjtGY7aLkmAjI10fqgFl9crk74BPMTb3u+QXLYY=; b=OexIpR0AbtlyuqpOma1HLv7/Lu
	ggcdjsqXA+UA0/uT+wD/8cBA1zC3OrHHLS/KIEBlUykNSuUQ5AQ74YPgKi0KKl0y3L3p0wkU9PNgs
	CBZtk000pCuXvcTWbo8HnOuvpJUzIVpae6OK5xqUMN8o8Yvx/EPWf4owmSkI4txni8b2bPssAZiL3
	pwlnAAfIteP3s7Z3CO5oPhiouQAdhTrL2IZELhIafND4k3E7kfhgTn/n4TuSopsSK7fXtoamZ8fL8
	hJh+isSfzOg9r94EfCcC5Avv9OelXeIXUzI/j5Xk3LeEz1qqM6DU0yloNM+6unS6QCP0AxZukcmx0
	7YEtQSAw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI5p-00000006VHw-2UX7;
	Mon, 12 Oct 2026 15:37:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 64F9430045A; Mon, 12 Oct 2026 17:37:36 +0200 (CEST)
Date: Mon, 12 Oct 2026 17:37:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C
 function
Message-ID: <20261012153736.GV4121339@noisy.programming.kicks-ass.net>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <20261002092438.GA2823843@noisy.programming.kicks-ass.net>
 <87o6db9ej6.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6db9ej6.fsf@t14s.mail-host-address-is-not-set>

On Sat, Oct 03, 2026 at 02:03:57PM +0200, Andreas Hindborg wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> 
> > On Tue, Sep 29, 2026 at 07:56:48PM +0200, Andreas Hindborg wrote:
> >> This function returns the maximum number of CPUs that can be online.
> >> 
> >> The wrapper is needed by the Rust null block driver.
> >
> > What does it need it for?
> 
> Setting an upper bound on the number of submit and poll queues.

OK I suppose. As long as nobody is going to try and use the return value
as a max for cpuid. That is, num_possible_cpus() <= nr_cpu_ids and all
that.

