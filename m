Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9698E823C7
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 06:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711432942; cv=none; b=T2DD5TOT3dMUoXQwjCbaSBHXFeC8CsVv4550BMdDxeg1gC6xC2RjoaX14ndG/lAh+EC0cppNOHMv7p9z8fQq1m612T1Mg/w4PTIDmB/uQAW5QZQ8HuHhklMtsCSQoLmvJcmwdTUFPHGAQ4T1XkBX8QuADfZR5ucPiJCbefj4on0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711432942; c=relaxed/simple;
	bh=/bUeg0GDwYTXsxeveP0N085DxjZefl0ikl6XHLIu+TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCZavAoxP7ArmkX4MMS4aveU3DR0nK7A30iesjZJzSxLHsgbhVHi26A44OxIGlqG9l3yYtRwk8v48uloZBsCs8RfYFbw0D6zwWzwAxG57LZ9mU4jTXAAgRrCBxkJ61qLH5Nl/g3hGLztuw3HA5ewsWl2YJNHb54WcA+dv1sLWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fuBmI+iv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fuBmI+iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711432939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TObN82cUc8l7ZLlVD4+WlQ5TlSdceF/P60JgrVAgnw=;
	b=fuBmI+ivsTxP4pAOvnDfETHFnSVYjyS6YgWCiDShI6mw7a7LVF4UdP+WUY2Ui+fmzFGSzp
	CS9VzrWl9139Ve4C+2gfm/AgoDIdNLLALzIgaVJgorlDnx0IZSqTFT+5wpyWwKlJvkGhmT
	1rlQnTIdIqkYqfe5HwOrwSfAVaWG/VI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-WjMLgoUxPt6J5v8DKGf0tQ-1; Tue, 26 Mar 2024 02:02:17 -0400
X-MC-Unique: WjMLgoUxPt6J5v8DKGf0tQ-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c38f7e7c46so4801680b6e.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 23:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711432936; x=1712037736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TObN82cUc8l7ZLlVD4+WlQ5TlSdceF/P60JgrVAgnw=;
        b=QcIPKYHNckERuP94MpOX2XR/Bs3dCrgAe4sx8Fu4fmp1smERZlBLNbl6VB8U984rMb
         YkJcrvZFQmGGWWLqOOEmrEVUnEkPKcvSg11AqDENYA4L554XMQqHn9uVZ73lwxY0OJEe
         Dr2GDzPWTGgR7iGvAzGmD23XTwIcdB+JeOa2sNUBCfw08+LaT6VXnbnTM1oOTybPsT8J
         VBB8y17gPd5C8Ik0KzxtQumuK7Y7sNxwnFNI5ZPqIV6dBy9m9uBY6gpPac8AqtyeLS57
         aNxbY+aZdof+zWApE6qAj2sguNi9fxTSqoK3ck6TPbqFStfqzLd1YtmoD6WT6q5UHEUc
         tUXg==
X-Forwarded-Encrypted: i=1; AJvYcCXk8DNpcgK2Z1ez8JBxYPXk5c/5DTLdYX62R8fuP6PCDHuK53ZXPoQmttELX3hUdRnj7eVJHsA0YiynRBpOPRp1u1LFqZGZ1FQyHtkJDOE=
X-Gm-Message-State: AOJu0YxtZLvLfd4F8ExU5zX8DDtYacDeqZLs9HWZBILM1ufVdXVbE615
	/S6Y6s5gIA/zXjO5GrTB+JEJ9TAJDNtaHalYRAKW16a5XeNrz0dmTfn3OpsMGhZRsserPZ4nUkZ
	zQGowkc37/Zeh3B9DbyFx9D/zD1wFoK4f8FOpdUHK56+b/tT0yqCNR05cJL2ip7f68ACTj32Y1j
	b07wQ4kAVhDkfuqxCL9jZKI6pmRRiY9MIaIxxyqOg=
X-Received: by 2002:a05:6808:3c8f:b0:3c3:bfe4:7da6 with SMTP id gs15-20020a0568083c8f00b003c3bfe47da6mr12541416oib.58.1711432936555;
        Mon, 25 Mar 2024 23:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr940U56ri+DXt88z3vOxMXCURgRfN46WMJZRLZrxl+9FG0Gt+EX7rzIW/YLrUroDOXL6o4p2y+EAJV2evQH4=
X-Received: by 2002:a05:6808:3c8f:b0:3c3:bfe4:7da6 with SMTP id
 gs15-20020a0568083c8f00b003c3bfe47da6mr12541391oib.58.1711432936353; Mon, 25
 Mar 2024 23:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-5-dakr@redhat.com>
 <2024032530-fester-dedicator-a8a9@gregkh> <CAMwc25ryKE7tqA4WdOeQXWJJ5Z++s+p8=bMBAXPKQiw_Stov0g@mail.gmail.com>
 <2024032601-deceased-premiere-1c02@gregkh>
In-Reply-To: <2024032601-deceased-premiere-1c02@gregkh>
From: David Airlie <airlied@redhat.com>
Date: Tue, 26 Mar 2024 16:02:04 +1000
Message-ID: <CAMwc25omcj6_OKdcBkke5yzC2M5oNO=E3EG4aezNfEMRAp9Wvg@mail.gmail.com>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, Asahi Lina <lina@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 3:37=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Mar 26, 2024 at 05:36:14AM +1000, David Airlie wrote:
> > > I stopped here.  Please build on existing code in the kernel, and als=
o,
> > > a real user of these structures is needed to see if/how any of this
> > > actually works.  Why not implement something that uses them that we c=
an
> > > actually review?
> >
> > Seems like you missed where the cover letter explained that this was
> > in the context of:
> > https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
>
> Yes I did.
>
> > Can we stop feeding the chicken/egg problem? :-) This posting attempts
> > to focus people on *device* abstraction problem, by posting small
> > patch series directly affecting things in an effort to get them
> > reviewed, or we post the full patch series touching every subsystem
> > and then nobody reviews it because it's 50 patches and it isn't
> > focused on the one thing they care about.
>
> Would you want to review new api additions without ever seeing how they
> are used at all?  I can't agree to that, and neither would you, that's
> not how any of this works, sorry.
>
> I can provide general "this looks really odd" comments, but I can never
> give a "acked-by:" for something that doesn't have a user, that's just
> impossible.
>
> I understand your prediciment, so work at it in tiny steps like everyone
> does when adding new apis, this isn't new.
>

These are the tiny steps, unfortunately to even create a driver with
enough "driver" that you have something to review requires a bunch of
abstractions to a bunch of subsystems.

In order to do a stub drm driver, we need at least the device, pci and
drm device abstractions, they all build on each other, and have
different sets of expert opinions to gather from different people.

We just end up losing the reviewers in the noise, because there are 50
patches to review and nobody wants to look at it. Maybe you would
prefer things that way, and we can certainly optimise for you, but I
think there'll be a bunch of other less rust friendly maintainers that
might be more painful.

Thanks for the review so far, and I don't think we are at the
expecting acks stage anyways, just discussion around lifetimes and how
it integrates with the C side are probably way more valuable.

Maybe for next sending, Danilo can try the all the patches approach
and we can see if your expectations of kernel maintainers align with
mine :-)

Dave.

