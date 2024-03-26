Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D26A823C7
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 06:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711433669; cv=none; b=fKVqc8kd04QGzMtTjKtl/bRnwo4dxXrNxZIB/Bc3brlv3z6LDw7I2fdtpTx32wsksegH2RSWwdC9/O0JUUMyBJa3x597aUh09kDD0xfAhqx48yBrhZUSj1+MTFjK09JitCgwQNhpB8gCGtYlVRinVz3H8tCsFPih6OUMLdsaW5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711433669; c=relaxed/simple;
	bh=cTEK8x06/OStCtTrKrpqIKuuoGoBYpMIhikHZGujxNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPFpPskWcue+2ymQIkho0enQrK+XD/uFG+XYsx1SejeOgowiDUiT/6cSDFKg8v+foaWOiq6q5kjbF3Pcj6x+2aIM9FSTnLk5/96Ba4iLk6ECUyMc3dzxQYr6DjndFiQFKw0gB0b58pFeDh2BECYBQkYJDyMPq7Q63ephoOfYTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vgm++Js9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vgm++Js9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C06CC433F1;
	Tue, 26 Mar 2024 06:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711433668;
	bh=cTEK8x06/OStCtTrKrpqIKuuoGoBYpMIhikHZGujxNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vgm++Js9T5iNYqPyjsFkQ/PCOlD8bo3pT9jU4SWeSmjMr+OcK9phQLZ5PDHM5Euz0
	 OebJkCcKccMTouRmHWKgwYIiREdBZVnoi+ugEXbsTXTgk2ZeKlYTO7kXUY2YkoT/DI
	 wgakn4KsRMphIcTsDLbOf/URb289MJyOB1uOrq5Y=
Date: Tue, 26 Mar 2024 07:14:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: David Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
Message-ID: <2024032606-dutiful-tusk-5da3@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-5-dakr@redhat.com>
 <2024032530-fester-dedicator-a8a9@gregkh>
 <CAMwc25ryKE7tqA4WdOeQXWJJ5Z++s+p8=bMBAXPKQiw_Stov0g@mail.gmail.com>
 <2024032601-deceased-premiere-1c02@gregkh>
 <CAMwc25omcj6_OKdcBkke5yzC2M5oNO=E3EG4aezNfEMRAp9Wvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMwc25omcj6_OKdcBkke5yzC2M5oNO=E3EG4aezNfEMRAp9Wvg@mail.gmail.com>

On Tue, Mar 26, 2024 at 04:02:04PM +1000, David Airlie wrote:
> On Tue, Mar 26, 2024 at 3:37 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Mar 26, 2024 at 05:36:14AM +1000, David Airlie wrote:
> > > > I stopped here.  Please build on existing code in the kernel, and also,
> > > > a real user of these structures is needed to see if/how any of this
> > > > actually works.  Why not implement something that uses them that we can
> > > > actually review?
> > >
> > > Seems like you missed where the cover letter explained that this was
> > > in the context of:
> > > https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
> >
> > Yes I did.
> >
> > > Can we stop feeding the chicken/egg problem? :-) This posting attempts
> > > to focus people on *device* abstraction problem, by posting small
> > > patch series directly affecting things in an effort to get them
> > > reviewed, or we post the full patch series touching every subsystem
> > > and then nobody reviews it because it's 50 patches and it isn't
> > > focused on the one thing they care about.
> >
> > Would you want to review new api additions without ever seeing how they
> > are used at all?  I can't agree to that, and neither would you, that's
> > not how any of this works, sorry.
> >
> > I can provide general "this looks really odd" comments, but I can never
> > give a "acked-by:" for something that doesn't have a user, that's just
> > impossible.
> >
> > I understand your prediciment, so work at it in tiny steps like everyone
> > does when adding new apis, this isn't new.
> >
> 
> These are the tiny steps, unfortunately to even create a driver with
> enough "driver" that you have something to review requires a bunch of
> abstractions to a bunch of subsystems.
> 
> In order to do a stub drm driver, we need at least the device, pci and
> drm device abstractions, they all build on each other, and have
> different sets of expert opinions to gather from different people.
> 
> We just end up losing the reviewers in the noise, because there are 50
> patches to review and nobody wants to look at it. Maybe you would
> prefer things that way, and we can certainly optimise for you, but I
> think there'll be a bunch of other less rust friendly maintainers that
> might be more painful.
> 
> Thanks for the review so far, and I don't think we are at the
> expecting acks stage anyways, just discussion around lifetimes and how
> it integrates with the C side are probably way more valuable.
> 
> Maybe for next sending, Danilo can try the all the patches approach
> and we can see if your expectations of kernel maintainers align with
> mine :-)

I don't mind 50 patch long series, those are fine as we can see how
things are actually used.

But for complex beasts like DRM drivers, perhaps people should stop and
implement the tiny "easy" things first, with working users, to verify
that it is all ok first before biting off the big ones.

Like implement a "simple" bus, which means that you have to have the
driver core bindings all working properly and correctly.  Once that is
done and merged then move to the next thing (i.e. a more complex bus
like PCI or USB or platform).

Drivers consume from almost all of the kernel at once, attempting to
write a driver in rust requires bindings from all of those things at
once, a very daunting and difficult task as people are quickly finding
out.  Break it down into smaller things, like the phy driver did, and
move forward that way if people wish to see rust succeed.  Don't attempt
to go and do the biggest beast first, that's just going to make people
frustrated quickly as you have to interact with too many different parts
of the kernel all at once.

Heck, we don't even have working atomics in rust yet, the basic building
blocks of almost all drivers that have complex data paths...

good luck!

greg k-h
