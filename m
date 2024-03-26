Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DFA839E2
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711438882; cv=none; b=pidRvUSyjq5A1bdO2hEjAxRTsquJztufbvoc9OdDACz3Y6fRvNMe9dDFbfiQE0T7HqWaAlDhsLrHCTQ1lR3vp4E+yoodLFuW6ZAs1K+35y3DxKClGjwfFIsRaXaIt3qTor8AUvuL4/4Tjw5SO+H3z0lUYRFl3T7lZ7SjDj2LObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711438882; c=relaxed/simple;
	bh=u3PS2SF6PeFEJTqOpWkhsZSn92/PKgMdF3MiFBG5OQw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kVytWr4wlSRkiZzv8Q7fTvZ2UNjyx5jPDKl7ntNvyq2UHWuJqS82czU6iWXk2IA0DlIbjJkwxyNIHPunOtDoyITXdaaT3Dt5y6wiJW01IV059gTimPkXRWmIp3MtTMKc7nqWcWDGr2Sm9M7gaN5zee15STERXlt2O66ZrwDYfK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S2uZVvUL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2uZVvUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711438879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3ZavT0wcpNZAquKgtlLZ3VH8vB1+EoTz/yO0QPyy7Y=;
	b=S2uZVvULT7p8FzlrEAfTsznsadXcKOYGwe+lUbWw/kjB9NrumjFqChgz1SmJJztuzTy+0z
	13C/n2GfmAdM1j9ebqwaNtoecAKBiME5LxBFKnFimpauUatnlQ83leqZJIi88T60SEUWj5
	dxoyqwiPxFBULLpTQSCji8Q2VeTyo7U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-nHFxsCBYOje2yaFT3nSFkw-1; Tue, 26 Mar 2024 03:41:17 -0400
X-MC-Unique: nHFxsCBYOje2yaFT3nSFkw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33ec826d427so598242f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 00:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711438876; x=1712043676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d3ZavT0wcpNZAquKgtlLZ3VH8vB1+EoTz/yO0QPyy7Y=;
        b=s9AQzgqxXXBnXcnM0NUh2ajEMp+V6I9bFocee88YLZZShnRzYf8IMCQX4ObmnYMPJb
         qBnQpGEoYU334BPquSw7l0gQHyHr8YlchuFakQiqmhNJPcR+91FUivdgB1fk63oSLp3o
         6Sy0nSXzF4Wyi+G852SZL0oqvi3WB4IOYYQaOvN6Dc/JVrnlYnCixC2U2efh+3Z/HdQj
         v0r/+8wkeTnwk1yuAib2/kV3HGJqkjqAx8QEGHXFy2KGnagrmqH8K162Kqr/st6oQbxl
         CR7RUsVgtHaVgLzqQEErg5ob0xKRGyKX3j6BQHhfaHftjE83EpyU+CAErfoVtXASCBzO
         8tDg==
X-Forwarded-Encrypted: i=1; AJvYcCWNUnrRKc79JauzjnYALXdU9ODH7J64mZxMmSVVSm8D4UMqbuwMaogZY/XWmTKlzNMVb9qo4I7y082a4mFHJB2BcWFLiLd3qxmZnMz5vNk=
X-Gm-Message-State: AOJu0Yyb+PCJ7aJ47bg9/s2ZZ4i1MrdHb5hZR6QTljdq9mpo7BcXS4IR
	449LU0re+xLNPISehyMKd4zi8dxyg2Ms52lsqwmo0s4LT7cCCwhWDMg3Hwwp5UCJLcJw6SfF3F1
	epxb77/uXWCZ8PuEe7UO9rtHXUuJIjTXPMdYMYnbotqM8Dex7Euzkp+SLJwgmYF6O
X-Received: by 2002:adf:ea0a:0:b0:341:8f18:db39 with SMTP id q10-20020adfea0a000000b003418f18db39mr5994493wrm.1.1711438876482;
        Tue, 26 Mar 2024 00:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUGdSh2ZVWekmrdhYDBf7bJH0jWd1ndgMMu58/HE6/SRNci0b5Purlw6O/kIThYSzJEfbHSQ==
X-Received: by 2002:adf:ea0a:0:b0:341:8f18:db39 with SMTP id q10-20020adfea0a000000b003418f18db39mr5994489wrm.1.1711438876083;
        Tue, 26 Mar 2024 00:41:16 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ay9-20020a5d6f09000000b0033b87c2725csm11618924wrb.104.2024.03.26.00.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:41:15 -0700 (PDT)
Message-ID: <31263f2235b7f399b2cc350b7ccb283a84534a4b.camel@redhat.com>
Subject: Re: [PATCH v8 2/2] rust: xarray: Add an abstraction for XArray
From: Philipp Stanner <pstanner@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Asahi Lina <lina@asahilina.net>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida
 Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>,
 Matthew Wilcox <willy@infradead.org>,  rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,  kernel-dev@igalia.com
Date: Tue, 26 Mar 2024 08:41:14 +0100
In-Reply-To: <Zfzc09QY5IWKeeUB@Boquns-Mac-mini.home>
References: <20240309235927.168915-2-mcanal@igalia.com>
	 <20240309235927.168915-4-mcanal@igalia.com>
	 <CAH5fLgi9uaOOT=fHKWmXT7ETv+Nf6_TVttuWoyMtuYNguCGYtw@mail.gmail.com>
	 <c8279ceb44cf430e039a66d67ac2aa1d75e7e285.camel@redhat.com>
	 <f0b1ca50-dd0c-447e-bf21-6e6cac2d3afb@nvidia.com>
	 <Zfzc09QY5IWKeeUB@Boquns-Mac-mini.home>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
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

On Thu, 2024-03-21 at 18:20 -0700, Boqun Feng wrote:
> On Thu, Mar 21, 2024 at 05:22:11PM -0700, John Hubbard wrote:
> > On 3/19/24 2:32 AM, Philipp Stanner wrote:
> > ...
> > > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ret < 0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Err(Error::from_errno(ret))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 guard.dismiss();
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Ok(id as usize)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > You could make this easier to read using to_result.
> > > >=20
> > > > to_result(ret)?;
> > > > guard.dismiss();
> > > > Ok(id as usize)
> > >=20
> > > My 2 cents, I'd go for classic kernel style:
> > >=20
> > >=20
> > > if ret < 0 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 return Err(...);
> > > }
> > >=20
> > > guard.dismiss();
> > > Ok(id as usize)
> > >=20
> >=20
> > Yes.
> >=20
> > As a "standard" C-based kernel person who is trying to move into
> > Rust
> > for Linux, I hereby invoke my Rust-newbie powers to confirm that
> > the
> > "clasic kernel style" above goes into my head much faster and
> > easier,
> > yes. :)
> >=20
>=20
> Hope I'm still belong to a "standard C-based kernel person" ;-) My
> problem on "if ret < 0 { ... }" is: what's the type of "ret", and is
> it
> "negative means failure" or "non-zero means failure"? Now for this
> particular code, the assignment of "ret" and the use of "ret" is
> pretty
> close, so it doesn't matter. But in the code where "ret" is used for
> multiple function calls and there is code in-between, then I'd prefer
> we
> use `to_result` (i.e. `Result` type and question mark operator).

Yeah, the issue we're running into here is that it's a quite different
way of programming since you create bindings on the fly with `let`.

I actually think it would be nice to have variable declarations at the
top of the functions, but that would obviously very frequently collide
with Rust's concept of data being immutable by default.

Regarding our example, my hope would be that `if ret < 0 ` should
always be fine, because, what else could it be? A float?
And such patterns should only appear where you interact with C, since
pure Rust should definitely always have all result status packed in
Result or Option.

>=20
> > I hope I'm not violating any "this is how Rust idioms must be"
> > conventions. But if not, then all other things being equal, it is
> > of
> > course a nice touch to make the code more readable to the rest of
> > the
> > kernel folks.
> >=20
>=20
> One more extra point from myself only: if one is using Rust for
> drivers
> or subsystem they are going to take care of it in the future, it's
> totally fine for them to pick coding styles that they feel
> comfortable,
> I don't want to make people who do the real work feel frustrated
> because
> "this is how Rust idioms must be", also I don't believe tools should
> restrict people.

I'm very happy to hear that we're on sync here :)

Though there will be a lot to be discussed and done. As I see it, so
far the clippy rules for example are global, aren't they?

In any case I don't even think they shouldn't be global, but that they
should behave more like checkpatch.

I think the ideal end result would be one where we have rules and
enforcement similar to how it's done in C:
C has checkpatch, which fires errors for some things, and warnings for
others. And, if it makes sense, you or the maintainer can ignore the
warning.

When the build chain checks global rules we can't really ignore any
rule without some kind of annotation in the code, because otherwise
we'd permanently spam the build log


>  But in the "kernel" crate (i.e. for core kernel part),
> I want to make it "Rusty" since it's the point of the experiement
> ("you
> asked for it ;-)).
>=20
> Hope we can find a balanced point when we learn more and more ;-)

Yeah, I get where that comes from. Many new languages attempt to end
endless style discussions etc. by axiomatically defining a canonical
style.

But we're living in this special world called kernel with its own laws
of physics so to speak. To some degree we already have to use a
"dialect / flavor" of Rust (CStr, try_push()?)
Will be interesting to see how it all plays out for us once the users
and use cases increase in number more and more


Many greetings,
P.

>=20
> Regards,
> Boqun
>=20
> >=20
> > thanks,
> > --=20
> > John Hubbard
> > NVIDIA
> >=20
>=20

