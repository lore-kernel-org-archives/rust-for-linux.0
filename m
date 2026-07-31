Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2400314B8C;
	Fri, 31 Jul 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488812; cv=none; b=USnAwj0m42wZ2azRVsXriWnURdQXFoQd4D40l50G4N6hb5RGkJtBnKuzJWgUYUNlxGhwlQKVMk8rU1LkI30KTrjqlcFP+T3n642vSvzk3ghIHOLMbfUm8I9qCpvQ64nAnJjqIhdkBpE37eA7Kb65RxeG7Z+j1MM4wG6N3IfApcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488812; c=relaxed/simple;
	bh=Dzy4UkReShagXyOq2ja8a+9sLpHX8QuTrRINWkH3mhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ex9bLTrlB3DQQD+MSt957sw3V0km3fZf6VvirPjy/0OHiWKnpDHl8eI82YrN8E2J2Um6POSssTsEM4pUQ6JjLU1R/j+6ysgc2v8dyeGT5n4WJ1XTuMULD+OrVl5ZxR1UKiIEVWE47Jz0qq7lHRPQuiVYXTmaR4ez7WUDSUiF9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n0bn2r80; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n0bn2r80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB051F000E9;
	Fri, 31 Jul 2026 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785488811;
	bh=KqgwBfTviH76YBE9Sz/IZ03tV4bDhx3D5RG/LDEIe8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n0bn2r80+wXVZ0BmenhToKG8wyVHHnOknskGp61BfO8hOOcan/uHIHX+nUt7B+0b3
	 UqJcNvYh4rC16tbcYWzgnz9tzQRqrxN8gT5W/n2pDpfaVPm78XAdPO4Vr7oneVZmwc
	 Xcj7fC2hEAviPm8i8lnSPoDY22KaMaQ1W4tfg340=
Date: Fri, 31 Jul 2026 11:06:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v4 0/5] Rate limited printing for Rust
Message-ID: <2026073148-cushy-mocha-2ecf@gregkh>
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>

On Tue, Jul 28, 2026 at 09:32:50AM +0000, Alice Ryhl wrote:
> To avoid DoS on the kernel log, the Rust Binder driver is being switched
> to rate limited printing. But before we can do that, we must first
> implement rate limited printing for Rust. Thus, do that.
> 
> However, it turns out that before we can implement rate limited
> printing, we must first implement the ability declare a raw_spinlock_t
> in a global variable. Thus, do that too.
> 
> Based on top of char-misc-next plus this patch:
> https://lore.kernel.org/all/20260728061236.198267-1-aliceryhl@google.com/

Doesn't apply on my branch anymore, perhaps due to the other binder
patches I just accepted?

Ideally the rate-limit stuff could go through the rust tree, but that
would delay this a release cycle, so I don't mind taking this through
char-misc, if someone wants to rebase it yet-again :)

thanks,

greg k-h
