Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9294F256C82
	for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051754; cv=none; b=ir73u0o7fod3jcQ1BZ6EMkmswVQ59DrfjE9Um8qCoy/pMaePOQ+fL9nkQIUq8/gpSBKnLTZwOGD5DS15tbAmYW1cRnoSSq2gd9uW73OfdkR/i1C7hf/yJcyWZ5ABHUbWUAMsxIClaXtzVWkWZvMJ2kczqYs/ngQl/qivm/4MfOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051754; c=relaxed/simple;
	bh=rbOQFiKsaQKA8Dslp+szQU+13m9/TNNVGrRqAYHCIyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhmSTzjJRLy//Ma6UTvsYYgsmeKVJjokVrBu+VFXbgrpnEocFm3b/Psz3shkW1NdgHImzVbs1GtHTX5T1OD/bPR4u4lPOi4XRxpow2fFRj2NzkWXHbNa/hIV3SRzoY2ht/3Jp0yWs9hL0Ouhqo3N4+YJlo7zzi5cFs4YXnDlTWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDCOwjKf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDCOwjKf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9659C4CEE7;
	Mon, 12 May 2025 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747051754;
	bh=rbOQFiKsaQKA8Dslp+szQU+13m9/TNNVGrRqAYHCIyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDCOwjKfyGeI+pRaB1pX+m/OJFJqb6UwsrF+3tEwiEWntFt0OC2Nx6q+f7z6xz4Q/
	 Ye0/WPf1YebjMZxZuOXiA0R1XQZTAgUw+cFPcDpPFQJn3qyCrUK1RKrzlQ+SkLRkwv
	 CKn88pxM8vY9jELjjnk1r16AvLcemT27x3hwXTgOT3zk0JBcBGxlFzPS+U8DGVmPuD
	 kevQh+XXTBv7reksPAfcoypFckvfbA6aQTvsVvVlvf6LbaxHlj2z5dV8GOLWIr8pbn
	 CyNw8RrPLknRHDPIa5LS1YxUmt6SpuGC7s+UsLXij6NdH8C/IJ4SOdSermjtJAqu8D
	 dHe9ub9lll8OQ==
Date: Mon, 12 May 2025 14:09:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
	lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
	alyssa@rosenzweig.io, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
Message-ID: <aCHk4286hSrq2pym@pollux>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
 <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>

On Mon, May 12, 2025 at 01:41:13PM +0200, Miguel Ojeda wrote:
> On Fri, Apr 11, 2025 at 1:56 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > +    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self {
> > +        // SAFETY: All of our objects are Object<T>.
> > +        unsafe { crate::container_of!(obj, Object<T>, obj).cast_mut() }
> > +    }
> 
> Doing something unrelated, I got a Clippy warning about this public
> function not being unsafe, and while the lint talks about potentially
> dereferecing a pointer, it is still the case the `container_of` uses
> `byte_sub` which is why the macro requires both the in and out pointer
> to be in bounds of the same allocation.
> 
> So since someone may pass any pointer here, this should be unsafe, right?
> 
> Even if that is not correct, the `// SAFETY` comment should
> nevertheless explain why that holds, no?
> 
> I hope that helps.

Lyude's series [1] should address this and the other one you pointed out.

- Danilo

[1] https://lore.kernel.org/rust-for-linux/20250501183717.2058109-1-lyude@redhat.com/
