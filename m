Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AD639937C;
	Mon,  3 Aug 2026 06:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738346; cv=none; b=CC5jmDA70ZLdCPNXJg3mPPwCJzg5SWY6ytBgrWBMQCjMgg0AvIlqjIyEiI9t+vrbsdvdedaQ6yKJVSRROsEqx++vUg39xtipw6YOMLRHLHjQxnA76mWlmYGqpq6QS0bSF1v+YVGY3d94x05G9Grs9rkcmfJAuRVsLluDzyWCqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738346; c=relaxed/simple;
	bh=4+m+4RBMqXlMhiWmRrAWgntDGPHIvLR9O1SSQpp1HVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rspUQRE+pavmP7+58TwXWplthFiUzEGL4YvfXoheDFIrf/TiBciJthk3djlo4aalZXW/+eTPYgcXUjV/2dj4sclnMJcpSNv3cT/ZCrh4wRWFfRFemji+wBrFjkwQYSL1kVaK0qn2bpM0lT65O73BEVYqrpy197SSUlVe4agh2tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tiAcMts0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tiAcMts0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615D81F000E9;
	Mon,  3 Aug 2026 06:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785738345;
	bh=Tsu/KpudqGBWzaDAVGI4h7Jq94+3vmXqw/9gHquVDn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tiAcMts0fLrmsv7DpvaYq9OupnujjOYSiMuokxSV4l4NxzE3eMlJ0T9OW9ARgS06w
	 42Gtm9GKFE0hIHq9eESb/y3s9/KnBstNrrYbQ8LuJiTB9hjvv7Kfp+jra6M1knrMoo
	 mdm30WxBr717N+A8cn2Y7mQJeiyeZks2oo3KSgMw=
Date: Mon, 3 Aug 2026 08:24:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
	Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>,
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
Message-ID: <2026080337-careless-viper-7a1f@gregkh>
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
 <2026073148-cushy-mocha-2ecf@gregkh>
 <CANiq72ksdfw57QE1+FsMW3uE5p056tTn=xxK1m3fg-ABhHU8cQ@mail.gmail.com>
 <CAH5fLgjZuKGBX7R4O1fat1s__mR2LHhQWD7tWdz6F_FxECFOGw@mail.gmail.com>
 <CANiq72kuB3dHDcsw0WApcVOrJJs3kS_BWt9ELqm8YmcEz6yeSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kuB3dHDcsw0WApcVOrJJs3kS_BWt9ELqm8YmcEz6yeSg@mail.gmail.com>

On Mon, Aug 03, 2026 at 06:56:50AM +0200, Miguel Ojeda wrote:
> On Fri, Jul 31, 2026 at 2:20 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > It's not too long until the next cycle so going via Rust tree is ok with me.
> >
> > I'd appreciate if at least the first three could go together so we
> > don't have split it over three release cycles, though.
> 
> Ok, Boqun: I think you didn't pick the first two for your tip PR,
> shall I or Greg do it then?
> 
> Greg: should I pick all this through Rust, i.e. including Binder's, or
> leave the Binder ones out, or do you want to pick them all?

I'd love to just take them all at once if no one objects, as odds are
there are going to be binder merge conflicts due to the printk() changes
in that codebase in the char-misc-next tree.

thanks,

greg k-h
