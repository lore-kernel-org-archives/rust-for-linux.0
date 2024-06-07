Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490E81514C3
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717774872; cv=none; b=rKL59Qv9SL+zSJoVmMExzgU8hP510P9tVv3PeXhizwPeZOWDnE3hRKpPyH360RQedcv+vec2GHU06Gzhc30eg2S2kss77hKR0Xw+Ozip4r3CC4TVub1nViwUuDg7UeInJX30LtqaRQUQWqybnykP1f5w/8C9+hhUazVb9S0k0kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717774872; c=relaxed/simple;
	bh=lSNsjez0w/wb93cv+wK7nT1BdHR+WTVkmUkwEyzKfaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoyEBBWN5ea9C+oAc4nxLCyeUdh92tOzCWPkA947JvRpPjzRyc47bq3uOvhP0sjB2wDCCVHdqiiWqhuLCXkbno3UapvDhoGv7pzDQEJwuaty8BvIQL5cgVKiPBE5zAHiBRb285gw77T9UqkiHzLHAIQBY4WVeuIq5ta9GjIDFEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YhS3AEpZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YhS3AEpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0EAC2BBFC;
	Fri,  7 Jun 2024 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717774871;
	bh=lSNsjez0w/wb93cv+wK7nT1BdHR+WTVkmUkwEyzKfaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhS3AEpZKmcu3LvZLyghdcTPel8ph7bgdT4+bxZzju17gn5m30zNgh9myK2fo9ynk
	 zhzMgkOSKFYlbjE18+VJOs3Ik8jB+in2WgrvelGGAXeOYCW0/3jYORj8jkK0Gu+9HK
	 D+eYOvaIar+r2TBCvJYA1ECKsiLJnFLhpuL9UBE8=
Date: Fri, 7 Jun 2024 17:41:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, wedsonaf@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, mcgrof@kernel.org,
	russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <2024060745-palatable-dragging-32d1@gregkh>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
 <2024060708-residue-hardy-af36@gregkh>
 <ZmMMMyi3uXTFtIae@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmMMMyi3uXTFtIae@cassiopeiae>

On Fri, Jun 07, 2024 at 03:33:39PM +0200, Danilo Krummrich wrote:
> On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> > Anyway, that's all hand-wavy right now, sorry, to get back to the point
> > here, again, let's take this, which will allow the firmware bindings to
> > be resubmitted and hopefully accepted, and we can move forward from
> > there to "real" things like a USB or PCI or even platform device and
> > driver binding stuff.
> 
> In order to continue I propose to send out the following series:
> 
> 1) minimal device and firmware abstractions only

Sounds good.

But after this, I don't want to take ANY driver core rust code that is
not able to live in the "normal" part of the Linux kernel tree.  It's
just unsustainable to have it all in one directory sorry.  If this
deadline makes that kbuild work actually happen faster, all the more
reason to have it.  If that kbuild work is somehow stalled due to other
issues, please let me know what that is.

> 2) v2 of all other device / driver, devres and PCI driver abstractions

I will be glad to review this.

> 3) v2 of basic DRM driver abstractions and Nova

I love it how one of the most complex driver subsystems we have (drm) is
attempting to be the "first real" driver use for the rust apis.  Bold
move :)

> The v2 series would contain static driver allocation (in case of DRM even const)
> and quite a few more simplifications around `driver::Registration` and
> `device::Data`.
> 
> Does that make sense?

Yes, but note, I'm going to probably push back on the "driver::" stuff.
But will do so with more constructive criticism as I want this to work
very much and I agree that I think we are both talking past each other
in different ways.  Mostly probably due to my total lack of Rust
experience, my apologies, thanks for your patience with me for this.

thanks,

greg k-h
