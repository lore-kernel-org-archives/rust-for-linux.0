Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68CD13B280
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 20:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309959; cv=none; b=VmN6p4iC8bUkOa/V668WS8yenlLvy9NHuUbqjDTQn2mAguOFMbgcXudXOp6QczdnylGtS0WqiIizS4d3bh0zcEMg9iPbbdklPhBfrDHAR/7VO/he9zDrBNt4yT0HFdPt7lQ9dCO+diFoEtmCMXISPNez5v05N5Edj/B2V9atsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309959; c=relaxed/simple;
	bh=Jqdp3U67GObwq5246ghxD3ALRxVeQ0KFTivrPhuYxVc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6W7pdh2jlVhIkRYnO1bzmKlfbWo0+jnYCVDnXuYip/iYpnr4R9KAU3uCxfrChCtNPTlpMY0kQfbz331MXzyUgTDin2GlyRzL2FqgHxs4GH8BPrBA6Y52xa1Az9OooOPpCt2peLyMcyWJ9HJAj0WjEBlZlBzeQB+AE4+W7BsDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emM7S1ah; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emM7S1ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718309956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jqdp3U67GObwq5246ghxD3ALRxVeQ0KFTivrPhuYxVc=;
	b=emM7S1ahyuVzORPebjykdUKTnmzLkLwiBJLIz4jZKGus0AK4uvEpblfbLRo/BrE415LE1q
	lz9DOdKjMwgND6sZoP59jhU6OjCjJKEu088qBxpYJuCmyaevBmPn1ZHX7M54w9ogsrzLUc
	e3lSynb+X3h8IG9bglsqrifXLP3uoDg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-hSNSVkW2Pd-DIt058s5MzA-1; Thu, 13 Jun 2024 16:18:58 -0400
X-MC-Unique: hSNSVkW2Pd-DIt058s5MzA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b2aec935f5so4529506d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 13:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718309938; x=1718914738;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqdp3U67GObwq5246ghxD3ALRxVeQ0KFTivrPhuYxVc=;
        b=mnH7pKxMix24Xf4SpFfvRWqqeU1obxpxjXdlOgdgr4cTzpBw0mjEgF7AMSWpJLtCi6
         sGCEnzqZ6ly2t2zFvB6eNbRhlRQY5ycuvTEmo1c6IXCi+32z6MzVoR+5nHgqqspRaLE+
         umF6PYz6T+WvEDm6kVA2FvPQNo5uQeOmMfzpR9Q5LUnl4Y8giXeopbPaOIhDV2P6cLBo
         /vU9kYNyAePli1ie1Z3879N0gnpCTnahYPXS0GEzL3FBMzzY3jAm9jJJwEizhbOIrKvR
         mtlwws20ETb0yJcBn5E8oJIylbb9XPMrZ0KTt+QnOpT/+gNdz5poUw1QN9oweAv1UknG
         n09g==
X-Forwarded-Encrypted: i=1; AJvYcCU/1E31m0YiB9i98Udnl346Qh/vaRJ1e1IDdviPy5+HJfqOANdULrf64HQk06qCRnKnotMR7dxTej7w/6OknTzHtDZ8tLJ45rwWnvmJ1dg=
X-Gm-Message-State: AOJu0Yx19oj/3tVvVgJ5+PfTMTAxs0ZqYACFyvVSxHsA12bZouhFdfJi
	bzfD8EqGjEfUNCkJU5t3oRYXCY8amv8jWQxqhkANyF4VDr0FwqnpJbALt1C7W6TWGLP5Upa1hUZ
	RgS7rw+p1nlWz7sN7I09/ZA82U6ANzoM+39IZiw/EKWT6ehkQsBRDZtN2lavunUpm
X-Received: by 2002:a05:6214:5016:b0:6ad:650a:855d with SMTP id 6a1803df08f44-6b2afc9e1f1mr8824546d6.23.1718309937638;
        Thu, 13 Jun 2024 13:18:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErJd8M9fqhwfjCydqbIqLlZFHMREZAW10/WLYJOeLO/N0JndEwGAHhKdPLaAPDMteuOgnpLg==
X-Received: by 2002:a05:6214:5016:b0:6ad:650a:855d with SMTP id 6a1803df08f44-6b2afc9e1f1mr8824256d6.23.1718309937268;
        Thu, 13 Jun 2024 13:18:57 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5efb07csm10255266d6.134.2024.06.13.13.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:18:56 -0700 (PDT)
Message-ID: <3fae55cb4012c137072b54f4ec96027190958048.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] rust: add abstraction for struct device
From: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@redhat.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, rafael@kernel.org, mcgrof@kernel.org,
  russell.h.weight@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
 airlied@gmail.com, fujita.tomonori@gmail.com, pstanner@redhat.com, 
 ajanulgu@redhat.com, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 13 Jun 2024 16:18:55 -0400
In-Reply-To: <Zmrkg7oOceWWV4nz@pollux>
References: <2024061136-unbridle-confirm-c653@gregkh>
	 <Zmh3oN9sWamaYHOD@Boquns-Mac-mini.home>
	 <d74edb73-1dba-43f4-a50c-36354c39d758@redhat.com>
	 <2024061245-kangaroo-clothes-76e1@gregkh> <ZmnAOfCUFkZqhDji@pollux>
	 <2024061214-dusk-channel-e124@gregkh> <ZmnKXoBYf0qOcPU4@pollux>
	 <2024061254-scoured-gallantly-5e41@gregkh> <ZmoLi57aT4EB_97W@pollux>
	 <2024061345-troubling-visiting-830a@gregkh> <Zmrkg7oOceWWV4nz@pollux>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-06-13 at 14:22 +0200, Danilo Krummrich wrote:
> On Thu, Jun 13, 2024 at 07:47:13AM +0200, Greg KH wrote:
> > On Wed, Jun 12, 2024 at 10:56:43PM +0200, Danilo Krummrich wrote:
> >=20
> > As someone who has written comments in code for functions that are
> > always ignored, I am happy to see you think that this is actually
> > going
> > to do anything :)
>=20
> One advantage we have in Rust is, that if something has a specific
> requirement
> we mark it as `unsafe` and the user of the API has to put it in an
> `unsafe`
> block, which we require a sfety comment for, where the user of the
> API has to
> explain why this is the correct thing to do in this case.
>=20
> In other words we can technically enforce that people read the
> comment and
> explain how they ensure to fulfill what the comment asks for.

Been going through this thread to catch up on the status of the patches
here: I've been working with danilo for a while, but have been busy
with kernel modesetting bindings for rust. Anyway, as someone who's
spent quite a lot of time writing up really detailed documentation for
some of the DisplayPort MST kernel APIs only to keep running into
situations where said documentation was ignored (not to criticize
anyone! I'm certainly guilty of having misread documentation or not
reading something myself :) I like to think about unsafe blocks in the
sense of being one thing I'm less likely to have to keep repeating
myself about over a mailing list. Because I know at the very least that
a contributor has to actively ignore a compiler warning or be aware in
some sense that there is some kind of safety constraint they're being
held responsible for that will come up during code review. If it's just
a comment in C code, I don't even have a guarantee that a contributor's
IDE isn't hiding large kdoc comments by default.

Also, in regards to rust code relying on C code not being guaranteed
safe even if it is 'safe' code: frankly, sometimes I wish "unsafe" was
just named "danger". "un-safe" implies code outside the block is
perfectly "safe" - but it is still possible to introduce UB in entirely
safe code bases (source: cve-rs) and most rust contributors I've talked
to don't see safe code as being perfectly-safe either.

>=20
> >=20
> > Heck, I have put huge messages in kernel code for when people
> > implement
> > the api wrong[1], and they still ignore that at runtime.=C2=A0 Only way
> > to get
> > it noticed is if you break someone's build.
>=20
> You only see the ones who still do it wrong. You probably don't have
> visibility
> of the ones who did it right due to your effort to write it down. :-)
>=20
> >=20
> > So you all need to really define what `Send` means, as it sounds
> > like a
> > userspace thing that isn't going to fit in well within the kernel
> > model.
>=20
> Please see the explanation above.
>=20
> >=20
> > thanks,
> >=20
> > greg k-h
> >=20
> > [1] See the pr_debug() calls in kobject_cleanup() as proof, people
> > just
> > =C2=A0=C2=A0=C2=A0 create an "empty" release function to shut them up, =
thinking
> > that is
> > =C2=A0=C2=A0=C2=A0 the correct solution when obviously it is not...
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

