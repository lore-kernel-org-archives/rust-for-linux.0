Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DD1F9439
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736341009; cv=none; b=jjB4F+uN0HIsndTc1CjyJXFuoEh/EI3YinbF8RHRCgPZHICq3My0hw/bwGv7lu+Kawf7RR6X4Cldum2o19/KqINwdCfFeXZn4iPQucuAa4GMlt4IEaUR5iNytXvV9FlEy3uQviJhrYlKyTCMoXSwfdhVvut5tDXbo0rwkKlAJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736341009; c=relaxed/simple;
	bh=Mt+Y+eAlI83vkVz0/uHM1GOoU0OcM2i3QBoRY9pzfhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyCo6V1sx8jm/upTkkzVQYXnwki9kqGxjYvi3AgMPnCchu+32EAG84SKOiZlEn3C21WTIK/eDRO/HAguFV+bUT8sWxiTsY4ZD1/8iaSXxvhsC7jC30I/DPI8HCrocLLaqOLx4roB5ViHv4BSPvKqLmGIPRNyH0Yr1Q36cn+uJlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Klf7ut55; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Klf7ut55"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso165974985e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 04:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736341006; x=1736945806; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kWo+GlKIigtpa34bkHtmr0MamXMbRLQ/pZ7GQzj+wuI=;
        b=Klf7ut556MvNBqWRbjyDDKgo/0LoHg7yMyND07WCgI/0qKMQdTs4eLPBcclAoQcmDM
         MarSHAYVu85iu7xi3340VhNwFiZ3btLWwgAAhu9/+vrYZjix5emaBGawxxDBR/vMBmCf
         h1YomZSk4m20ZcJxDiS8Z8vQJpNJIpoixuTw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341006; x=1736945806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWo+GlKIigtpa34bkHtmr0MamXMbRLQ/pZ7GQzj+wuI=;
        b=TwrzRnFxFYt8dW1g3OCcvKzTS62oSIlEomZ98LQ6Z0vnyPAk5wuxw7uw1l+INotRs1
         Cj/+GN6GGF/Euhw7zMeuR7XKHhQRa5rF+PD8wkGCbfFwaMtv066ToeR/AC3isEBOu4tX
         5bmJRFyMjJev9uJEPPMsoTEVfRbkfSkxeEpZcKvAHCzDNMjR3anDMyoPtvTloddSu68K
         poP0QE5bn/EkaBRIw32uRZXC8E8V40hcbmNnE93A4E3R+MwUYy+TMe310H9yHkY7uXqw
         +lff2vg+FbOM4JC9igRDMkgW35gmKm5IBSqB2IbQrZhNnilZZXtoRafJ66T7Ouc+cJjp
         /twQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUGTTw3GVo475HxazZyLBKYZPCwHo5FUkqB6HhAfTjwPeDYMKERz+uK+26im3OHZ/HTy7Y/aB5y+hxTFbn7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF6tZlHjJlwBIVE2ExsQRCIgwFj5PjD7HK1RFJT48oO++v0Otc
	v9ETYkDYL3RbIQtrIa5EoklHKGLCB7GpDoawDhyDojxVw+HkLM6Eo8j4CkkVZQk=
X-Gm-Gg: ASbGncsxzgbCyzKzFrKoZBN6ZWyVkTKixr1hXd0VgClYJ+AnbWebGN/YAU+etsSQ+UW
	6r3QkVQ+Qkd8/ZP1sLZ9IrUd5ut7DzQf3JcUiVxbGnFHqw9s5BOe7fYQkqV/C34pVh3CS+PIiXA
	XA7V4WO2nNHXfq8p7YG6ZlyF5RW44Do6X7XBM3u+IzcTHVCLji/5ZQ/VmRPsUECJIww38TVCOMr
	T4617BeBIC32f4t8GRRVbmTig/4IAtn/TrBOJCORcEAvEADXEy77h1MgkMUap4qufB+
X-Google-Smtp-Source: AGHT+IFYUt0wdrIln88qUKqM/5Tl4MtyUA5lucQ+sLPiHIweT2zj1vcz3JMVtOBCX9RnY7ZqRFTTQg==
X-Received: by 2002:a05:6000:1a8c:b0:382:4ab4:b428 with SMTP id ffacd0b85a97d-38a872d071cmr2236620f8f.8.1736341005164;
        Wed, 08 Jan 2025 04:56:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e150sm52759253f8f.66.2025.01.08.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:56:44 -0800 (PST)
Date: Wed, 8 Jan 2025 13:56:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] devres: add devm_remove_action_nowarn()
Message-ID: <Z352Ctq6MN8LEDNl@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250103164436.96449-1-dakr@kernel.org>
 <Z3vC6MzIG7zN8zBT@phenom.ffwll.local>
 <Z3z8Ra2PUQjL91kn@pollux>
 <CAH5fLgjvP1=aaw9hC8M6L=0uWO+-z+RkC8aW+pn6Z7SkSn03+Q@mail.gmail.com>
 <Z30AmzdLNaKVAIqV@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z30AmzdLNaKVAIqV@pollux>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Tue, Jan 07, 2025 at 11:23:23AM +0100, Danilo Krummrich wrote:
> On Tue, Jan 07, 2025 at 11:11:20AM +0100, Alice Ryhl wrote:
> > On Tue, Jan 7, 2025 at 11:05 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > >
> > > On Mon, Jan 06, 2025 at 12:47:52PM +0100, Simona Vetter wrote:
> > > > On Fri, Jan 03, 2025 at 05:44:30PM +0100, Danilo Krummrich wrote:
> > > > > devm_remove_action() warns if the action to remove does not exist
> > > > > (anymore).
> > > > >
> > > > > The Rust devres abstraction, however, has a use-case to call
> > > > > devm_remove_action() at a point where it can't be guaranteed that the
> > > > > corresponding action hasn't been released yet.
> > > > >
> > > > > In particular, an instance of `Devres<T>` may be dropped after the
> > > > > action has been released. So far, `Devres<T>` worked around this by
> > > > > keeping the inner type alive.
> > > > >
> > > > > Hence, add devm_remove_action_nowarn(), which returns an error code if
> > > > > the action has been removed already.
> > > > >
> > > > > A subsequent patch uses devm_remove_action_nowarn() to remove the action
> > > > > when `Devres<T>` is dropped.
> > > > >
> > > > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > > > ---
> > > > >  drivers/base/devres.c  | 17 ++++++++++++-----
> > > > >  include/linux/device.h | 18 +++++++++++++++++-
> > > > >  2 files changed, 29 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> > > > > index 2152eec0c135..d59b8078fc33 100644
> > > > > --- a/drivers/base/devres.c
> > > > > +++ b/drivers/base/devres.c
> > > > > @@ -750,25 +750,32 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
> > > > >  EXPORT_SYMBOL_GPL(__devm_add_action);
> > > > >
> > > > >  /**
> > > > > - * devm_remove_action() - removes previously added custom action
> > > > > + * devm_remove_action_nowarn() - removes previously added custom action
> > > > >   * @dev: Device that owns the action
> > > > >   * @action: Function implementing the action
> > > > >   * @data: Pointer to data passed to @action implementation
> > > > >   *
> > > > >   * Removes instance of @action previously added by devm_add_action().
> > > > >   * Both action and data should match one of the existing entries.
> > > > > + *
> > > > > + * In contrast to devm_remove_action(), this function does not WARN() if no
> > > > > + * entry could have been found.
> > > >
> > > > I'd put a caution here that most likely, using this is a bad idea. Maybe
> > > > something like:
> > > >
> > > > "This should only be used if the action is contained in an object with
> > > > independent lifetime management, like the Devres rust abstraction.
> > > > Anywhere is the warning most likely indicates a driver bug."
> > >
> > > Yes, I thought of something similar too, but wasn't quite sure if it's needed.
> > > At least for me, if something has the postfix "nowarn", it already makes me
> > > wonder if I should really use it.
> > >
> > > I'll add a paragraph.
> > >
> > > >
> > > > At least I really can't come up with a reasonable design in a C driver
> > > > that would ever need this.
> > >
> > > I tried, but couldn't either. The only thing I could think of was a revocable
> > > thing in C.
> > 
> > Potentially if there are two cleanup paths that could run in parallel,
> > they could use this to avoid needing to synchronize which one removes
> > it?
> 
> Yeah, I also though if I can make up such a case. But I think the real issue is
> that even if we can find one, it's probably an abuse of devres.
> 
> Devres is there to indicate that the driver was unbound from the device, which
> causes remove() for the driver to cleanup. So, rather than removing the action
> from some async path, we can just wait for remove() to clean up. The only
> exception can hence be probe().

Yeah writing a correct ->remove implementation in C is already really
hard, even when you're using devres. If you think you can write one that
runs concurrently with other stuff in a way you need this _nowarn variant,
you're just too dangerous to write driver code in C imo.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
