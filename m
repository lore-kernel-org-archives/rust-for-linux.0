Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7BC21D596;
	Tue, 27 Jan 2026 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502620; cv=none; b=rcUcAjoYnmzGmSHz+k2TdDu7tXfxr6IHctpLqa5aTQbVEZoBMGtKBBnZOtmjhJx+BHSFo787I1WZG5JmO0koIbbMJSRz1qI7gaBPfvC5WYZ1rlsr4I1tPa9/iBwWYfg6+RT2lQXYxwl9nZkUIvtrOqPeb9WXC9UxKm/v015BDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502620; c=relaxed/simple;
	bh=06ZezMlsvXKYs2JiZ3hBOuKmJ1ryOs2vHGeIpRsXldY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4gWKchuWqp3fCJrkSyYcinvxeFALBvJpNW7ZalQB5pFnM8SUdl9D3AAOMTI4S6T6e+AZeKLuuFCY+bUjNifrjMZ2QajPzgvDLDMsueskIgHHKR+Z0ZCULT7jarRrh+Gx6YbgJordQmKs7SAWuQJXXM5ONn/KsdokRTGm7oim7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=In3BfqfX; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="In3BfqfX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bl03uKc0ELJ2Fi5p/6I6WEfhdgRleeMOE843RDNRsm0=; b=In3BfqfXDoigiRGfq8EygTNg4E
	AFo+wAActwTIkmj7hIceb3+S5V0yruJ+MnFvIacpMHC9GY/tpfPitejNDNd90nrC55hf4gkkke7N2
	uxPjQVy34sgfqLWKc0yxZ93Fc/euY2UIQsxq2vqN7S1Ha6Sm72NTDlKY+dbWUr44+0js2mlFNK2EI
	611O8dby59F9IvDbPS2qA2wM2z+1PZzTo6W8WqKA9R+j7r5MGEiiCHdJDXoSxV3uHqQG7KvoB5JO+
	AkTMdQd9W36o37tP0libbUkZewuNzuPf8dOvykrr2LgHnNUKTTFjst7ySpjxhE5S15p4dstTGKWDa
	EUVBI9OQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeSl-000000079a1-1y7J;
	Tue, 27 Jan 2026 08:30:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EC3F0300756; Tue, 27 Jan 2026 09:30:14 +0100 (CET)
Date: Tue, 27 Jan 2026 09:30:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL][PATCH 0/1] Fixes for Rust synchronization PR of v7.0
Message-ID: <20260127083014.GT171111@noisy.programming.kicks-ass.net>
References: <aXAnTVnprfDnj7se@tardis-2.local>
 <20260123054624.8226-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123054624.8226-1-boqun.feng@gmail.com>

On Thu, Jan 22, 2026 at 09:46:23PM -0800, Boqun Feng wrote:
> Hi Peter,
> 
> Although we chatted about this over IRC, but I figured it might be
> better for me to just send a fix PR for this, so here is it.
> 
> Thanks!
> 
> Regards,
> Boqun
> 
> --------------------------------->8
> The following changes since commit ccf9e070116a81d29aae30db501d562c8efd1ed8:
> 
>   rust: sync: Inline various lock related methods (2026-01-10 10:53:46 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sync-fixes-for-v7.0-pr
> 
> for you to fetch changes up to 6583920e15fc567109e1c64ca58c917f52f40736:
> 
>   rust: sync: Replace `kernel::c_str!` with C-Strings (2026-01-22 21:36:57 -0800)
> 
> ----------------------------------------------------------------
> Fixes for Rust sync v7.0 PR:
> 
> - Remove the usage of `c_str!()` in the example of static_lock_class!()

So I'm notoriously bad at keeping track of version numbers; but I'm
thinking you want this in tip/locking/urgent, right? Thing is, it
doesn't apply :/
