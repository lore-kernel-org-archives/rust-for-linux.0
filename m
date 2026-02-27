Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A2838756B;
	Fri, 27 Feb 2026 21:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772227546; cv=none; b=RJCkZpyzivC+SywU9X5aLH7K9EbENDKgWz2fl7OsvL7RXznbNIUMJw/RlZDucvt1xmiCLm3tu5kPIYdTxNszYE0XwdTP/eFlrk7zB4zAqcg8nkQuBbpjwT4NbU+0CyIyZMaDMIm6F0n0c4HdHZHNggc/lArttt6NAVYX7tx+A7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772227546; c=relaxed/simple;
	bh=IzUfUzsQ14WPi7jG488YIQobfJ4iY2tZZ4J8Z6tS+KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqHsiURqh65dUmMgo2YwqkeasotNASwij/uijpEohseEYr5QG2+CGBgRNfm7sqIBxXxr4NDrlnXzld5TOp90GxIWnPHpmV2Yh12zUIPLHA14CJ9dJCnFlRxjTS42NsnQtsO2bDwDysltu/9kildTm2lxYVmusPqdWssVWbLOW1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQLlGGJW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQLlGGJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A783EC116C6;
	Fri, 27 Feb 2026 21:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772227545;
	bh=IzUfUzsQ14WPi7jG488YIQobfJ4iY2tZZ4J8Z6tS+KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQLlGGJWsOABZIarA5XUdTJiqAX22Lyu8VT+BFsLjEp9qptGpYZDS+TpP7fzzKl5r
	 +PmbwHmkcKTL3n1vx984ZQMdhAfHL34eR2/1USwJOd6wSVsQZIZJ68PYYhjaHLxliU
	 508Cvh5HSktFenrhfENRDXlJzcHOfwcQAARtnFIqCFtthVrU4Rz2MnelpKkj6uN6FM
	 +fIxQPdx40iO8s5aD4w3fBGSBiHTU2ebRVPpfynBm5J+fjuZgq6jeaeZP6ySrU7KpQ
	 VpOWXHFpVC/2efegI7lUbiB996CaoUUJwZUq+rBcAZ543BEjw724aYVL/Jf/Jw3o5O
	 HMsd/DW5hkMUw==
Date: Fri, 27 Feb 2026 11:25:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: workqueue: restrict delayed work to global
 wqs
Message-ID: <aaIL2DSrp7XgSVp6@slm.duckdns.org>
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-1-87de133f7849@google.com>
 <aaHPs-nULPEt_wJB@slm.duckdns.org>
 <aaHp_pGBxA4pNiXJ@google.com>
 <aaHrxzWIFFUjzWhu@slm.duckdns.org>
 <aaHuXEO64ONKMW4O@google.com>
 <aaHvcvbmkl7oSFOR@slm.duckdns.org>
 <aaHwSxIaTqLWndkw@google.com>
 <aaH0e5YKnH7x1gCB@slm.duckdns.org>
 <CAH5fLgh5M=HQ8XRNnpqMxHU5q-T5OYVGCLq46aqOP5dxOYDMuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgh5M=HQ8XRNnpqMxHU5q-T5OYVGCLq46aqOP5dxOYDMuw@mail.gmail.com>

On Fri, Feb 27, 2026 at 09:36:22PM +0100, Alice Ryhl wrote:
> On Fri, Feb 27, 2026 at 8:46 PM Tejun Heo <tj@kernel.org> wrote:
> >
> > On Fri, Feb 27, 2026 at 07:28:11PM +0000, Alice Ryhl wrote:
> > > > delayed_work is just pointing to the wq pointer. On destroy_workqueue(), we
> > > > can shut it down and free all the supporting stuff while leaving zombie wq
> > > > struct which noops execution and let the whole thing go away when refs reach
> > > > zero?
> > >
> > > But isn't that a problem for e.g. self-freeing work? If we don't run the
> > > work, then its memory is just leaked.
> >
> > Yeah, good point. Maybe we should just keep the whole thing up while
> > removing it from sysfs. Would that work?
> 
> We can but there are two variants of that:
> 
> If destroy_workqueue() waits for delayed work, then it may take a long time.
> 
> If destroy_workqueue() does not wait for delayed work, then I'm
> worried about bugs resulting from module unload and similar.

I see. Yeah, neither seems workable. We should be able to flush the delayed
work items. Maybe we can make that an optional feature so that rust wrappers
can turn it on for safety.

Thanks.

-- 
tejun
