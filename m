Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18615380A;
	Wed,  7 Aug 2024 23:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723072100; cv=none; b=Wm/GXvC633mbnFzZsGHUn+vj22+FjF9iXEjsXnyA1ih066lsfrPFuzB8RiOvCT0bT+xPGoAjXc65wZYSJJCtgiQ7Dsst+jV4zMPPzlI97OoA1gt39rgCp5wz3knohHF0AzFybtkfNBs8c2iOPeIbB53XcEZgUdI7pd612nituR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723072100; c=relaxed/simple;
	bh=bHfCnWmNYxbaKKzxHQTqa7O20DJNwlaKnBAYJ0PhuyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqVs2tfUOX2QDIrBGxTWpPVVYiM73UxWM8ddrxjQTrD4pkBj8zm4ydwxFTff7suQZBab6SIRVVGPOow4dCY7QtTMDbujqsA650g9bFZaqZnuZv+YncHBt82BugES5EOgI0oWbA3kaJweh18WbsXxcDSO2SDdn8juIz081osXaRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMsEHE3y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMsEHE3y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EF0C32781;
	Wed,  7 Aug 2024 23:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723072099;
	bh=bHfCnWmNYxbaKKzxHQTqa7O20DJNwlaKnBAYJ0PhuyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMsEHE3y/pWW1U1EllnlhbwwlaFzPhDnZ5q/9mRghGr4oAJty127nwLRLPVLg7vVd
	 ZBIdT24VQTCCKEWOAfdo2QrTPEuFyDo25XLMPF64VT6NqjWICwEvCAZeksEcqm4UYv
	 Dq0Au5x7W1SKp51k7oGn/sTtqydDvHM4cKzsvIswHKkeWCIZAbSDWGcfJ80XYwSufY
	 +HQVahl1WUh+j7yXzxORAL/4hLHpwgXYs3JHOcOlnErBlQGhnvn045k5yGM6+sxw79
	 qVJPo8R1IMUzqh0RYcY1iUhF6cNit0U7rHge153dn+Us9Yg1mNmOmqo61hn+Pv0vZ8
	 T2/7j72Xsz6ag==
Date: Thu, 8 Aug 2024 01:08:12 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@samsung.com, aliceryhl@google.com,
	akpm@linux-foundation.org, daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com, boris.brezillon@collabora.com,
	lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com,
	acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com,
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 10/28] rust: treewide: switch to our kernel `Box` type
Message-ID: <ZrP-XHrIQr2qBWkM@pollux>
References: <20240805152004.5039-1-dakr@kernel.org>
 <20240805152004.5039-11-dakr@kernel.org>
 <1b17b4b3-69b4-4af1-a816-b401a1bb6ef2@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b17b4b3-69b4-4af1-a816-b401a1bb6ef2@proton.me>

On Wed, Aug 07, 2024 at 08:57:22PM +0000, Benno Lossin wrote:
> On 05.08.24 17:19, Danilo Krummrich wrote:
> > Now that we got the kernel `Box` type in place, convert all existing
> > `Box` users to make use of it.
> 
> You missed a couple usages of `Box`:
> - `rust/macros/lib.rs:{242,251,281}`
> - `drivers/block/rnull.rs:{35,50}`
> 
> or is that intentional? (for me rnull doesn't compile after this patch)

No, I missed them. I probably messed up my .config. I really thought I had
everything relevent enabled for compilation.

Gonna fix those.

> 
> ---
> Cheers,
> Benno
> 
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  rust/kernel/init.rs               | 41 ++++++++++++++++---------------
> >  rust/kernel/init/__internal.rs    |  2 +-
> >  rust/kernel/sync/arc.rs           | 17 ++++++-------
> >  rust/kernel/sync/condvar.rs       |  4 +--
> >  rust/kernel/sync/lock/mutex.rs    |  2 +-
> >  rust/kernel/sync/lock/spinlock.rs |  2 +-
> >  rust/kernel/workqueue.rs          | 20 +++++++--------
> >  7 files changed, 44 insertions(+), 44 deletions(-)
> 
