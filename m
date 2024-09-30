Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81A18C914;
	Mon, 30 Sep 2024 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727698304; cv=none; b=ifHpYwPydbGhutZVxTl4yNjyfdTumTc7nYvEO5OtJSpFOXUQvE61+l6V6mbvGO+0TY3EnRz1+DdppQfqCh38816700mn0tBDUDKnQpz1/f0acGJLFIES7wmQanYFQ70Ahdrea8istxFrMCOlQR6sCBBaa4l9zhV/wsoAYqy5Ds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727698304; c=relaxed/simple;
	bh=oq3KtUpOAIfHyHAiEBZ8yU5kDI6r5YanfJ2OjSY5yB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjaQH+fqbvtpcTvIDPiqJhlrD+txJh+zF34yo14nnlYYmDVtWsNEzKD0SN9bCcgiyRgurpsV1QAp/mxTRisps/PUo4wf4wplbSs3pwGiyXF6bhVBEsKO5Pllia7wlA+TwLObZ4IxrUN5V9pj/XqqXLbi7eVS0+1Bll5UbLEo0hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Od0MQhSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Od0MQhSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DC3C4CEC7;
	Mon, 30 Sep 2024 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727698304;
	bh=oq3KtUpOAIfHyHAiEBZ8yU5kDI6r5YanfJ2OjSY5yB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Od0MQhSIdgc/LSJSbwwnCH4XDSw8bveiTbHUCQ0/D0JwidpdFAukL5fmbmF70DHEt
	 Gc0/JVvriiAvpp+QgutRX++NPogwLbtvfUPixnugEiiZeD5LabclmdhfwQ9arAA2Ie
	 5yI6HLyJO60c9/hf0fRWa33xtHmA5HrdwWycBEw0vaGmkrbYIaxZ4vEZ21rtsfE9c8
	 YcvHDJIy4awcktS4Qn/U9I15x11JeyIuWEqXfSVNT714Bn/6Pho9VRvESVWrw6AH4A
	 BE3V2mecI1XxgdM0NkAJ9NMXwfozcsZahJCEOv0cjX8AjvylI1YX7wsdKsDJRIlfhD
	 jqMz+3AVN5Vtg==
Date: Mon, 30 Sep 2024 14:11:37 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Guilherme =?iso-8859-1?Q?Gi=E1como_Sim=F5es?= <trintaeoitogc@gmail.com>,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, aliceryhl@google.com, mcgrof@kernel.org,
	russ.weight@linux.dev, dakr@redhat.com, a.hindborg@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] device: rust: change the name function
Message-ID: <ZvqVedQhdyiWREcd@pollux>
References: <CAM_RzfbQK5fzqXQN89JCEzD1Bz5ZtQdAz3xD0yaYFx_GC7Pm0Q@mail.gmail.com>
 <2024093044-emblaze-disrupt-d479@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024093044-emblaze-disrupt-d479@gregkh>

On Mon, Sep 30, 2024 at 01:35:09PM +0200, gregkh@linuxfoundation.org wrote:
> 
> >      /// While not officially documented, this should be the case for
> > any `struct device`.
> > -    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
> > +    pub unsafe fn get_device(ptr: *mut bindings::device) -> ARef<Self> {
> 
> With this change, nothing broke?  Does nothing call this code yet?  I
> thought the firmware interface did that, but I could be wrong...

The firmware code uses the `Device` structure, but it doesn't create a
reference from a raw pointer.

This function should probably only ever be called from bus abstractions. I
thought the PHY layer needed this urgently (which also was the reason we merged
it already), so I'd expect the PHY code to use it.

Though, they might just use `as_ref`.

- Danilo
