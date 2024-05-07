Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C993FE4
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 02:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715050046; cv=none; b=C1SEX/6YvySsvJyMjqjqs2pyy0aJMgZHJV6/m5v1mv17sznu/tWd2WclgjTYMBxD3/r2oSims12tUd+4kKOLFc88H3ICin4RSkyIpHNH6LKqxr+mA78hqGR+RtuduTIueg/rJYwMRaAc+ihmKUqNuAAuYvZg5yu7HEDKvF+HnNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715050046; c=relaxed/simple;
	bh=mQuSgvUEtK3QpHVBlRVOnf0XtbkF+nTrffwJgkjr3nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZTHbEXZXLInaBYPkTOtj2l7huRr2mHMHHRPqVFpvj1Vp/Eaa13rfT+GKC1zDz5B5kHt4jSbnGpyFsaOOZ1IdHfVt9n2W3JCLmW2PyufYy3Iga8JhZYAOL6QuQcuhU6XwQ3PWWIg0M9t1Kupx3KHF1o51ZMf0RXjaaSp8qALyoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JWhMtfKa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWhMtfKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715050043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQuSgvUEtK3QpHVBlRVOnf0XtbkF+nTrffwJgkjr3nc=;
	b=JWhMtfKaVgU5RfmHqm2n28kKylVzRZF+8Sgk58un8C7f5KChb7V5aVjIn5MPpSp4HveFuv
	EMIKmBecVJHbmHXbeDBtrjmYVlSsJgzwpfyccQ4quWrIC0aaTgoOCvsMv2X/s4d40VnvsQ
	xwkgThs0m8ki762dQ/3txV701SRuHMg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-RKUVjrrkPOOu4SVwamqCEQ-1; Mon, 06 May 2024 22:47:22 -0400
X-MC-Unique: RKUVjrrkPOOu4SVwamqCEQ-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6f452eb2066so1238630b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 19:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715050041; x=1715654841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQuSgvUEtK3QpHVBlRVOnf0XtbkF+nTrffwJgkjr3nc=;
        b=NwLb29m586yyEZ5TO0IyM2RBBtAjGjkiyYEF0ozimRY23u60yiHF1kwrlWEFkuB2Dg
         Vm5QRO1wDt75NKexQzqRbC0aiojykxVBfXJkIvtiaOO2AASJxbwEJaUAxtb5fFPkgJG1
         ez81rIrQXQTizxRoYqnhkj5FtRWX3hcJZ7zO77wD+QR0/WNxLLScNL8r56kNYb/2xfec
         dyMxixLrh07Fx0mx/E/KcnE1A7nrpIA5gTdVFGDyhVzTjg/UMcqMWtglizcPWfPb6wm1
         rGVjIhaF6NCc4fMIC1LeQU4NOvUiDQ0QNzN/wNTEL6h0Y9zXWodqGLTfHJGASDFVIkfP
         r4iw==
X-Forwarded-Encrypted: i=1; AJvYcCVFYWqb7Xkw1LIdObvI4hMVzii3hSgW8cCDGwu6UMAMSPcCTbAeO9ho7aC+tCl5G6bcUwFLNAJpzp7ClByS2eI3y2NK78dOPXc22A3u7v0=
X-Gm-Message-State: AOJu0YwPojcJGkHa19xfyabKWyhBPLMOI9O1P+37n5y2TK4WvIo3KP2o
	Hw20EHXElv5LZnTWi4vpkwJ4kPw8FREh1Hn9SbvO4r5LM6HuZ8QmUOQhvpaDgEFpU7sNwyUgIIo
	8qUAeLOhVFJpcF8ilR/oVB6wUj2GExxHZJIMtv9dHEXx2w0p8YLDKG5FsqhC+PjYcwgGdlsOybV
	C3Fv/K58Yo9J1pK4xv/4ztariwa4VqHicRYZ4RQI8=
X-Received: by 2002:a05:6a20:3ca8:b0:1aa:5ca9:c565 with SMTP id b40-20020a056a203ca800b001aa5ca9c565mr13132210pzj.8.1715050041104;
        Mon, 06 May 2024 19:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCv2igHEzS3aPFY9ZrG7WJFTHP39l5WdCvrDCUptAkSx448wvhlsqBf9wMJjlrx1Ulji4zJ53NSWIjThYUaws=
X-Received: by 2002:a05:6a20:3ca8:b0:1aa:5ca9:c565 with SMTP id
 b40-20020a056a203ca800b001aa5ca9c565mr13132191pzj.8.1715050040681; Mon, 06
 May 2024 19:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501134834.22323-1-dakr@redhat.com> <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
 <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com> <CANeycqppeewOc+OH_KPLOdbPLx1BMGMcmuye=uKM2-K80J7Vwg@mail.gmail.com>
 <CAMwc25oNYPkHTm2NoCiP2Yc0K1J_JVPpv3gS5+9O2kwveLYgCw@mail.gmail.com> <CANeycqq6KBqBiX-ckm9MEGW+JcynvjAw2TJa0K2-mGgN5snZsA@mail.gmail.com>
In-Reply-To: <CANeycqq6KBqBiX-ckm9MEGW+JcynvjAw2TJa0K2-mGgN5snZsA@mail.gmail.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 7 May 2024 12:47:09 +1000
Message-ID: <CAMwc25q6CE7AyDWJg+qw0=kZYht=0aZ0Rn-Gd5b9MjoLL4uHuQ@mail.gmail.com>
Subject: Re: some aside maintainer advice (was Re: [PATCH v3] rust: alloc: fix
 dangling pointer in VecExt<T>::reserve())
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 12:33=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> On Mon, 6 May 2024 at 21:36, David Airlie <airlied@redhat.com> wrote:
> >
> > > On Mon, 6 May 2024 at 12:22, Danilo Krummrich <dakr@redhat.com> wrote=
:
> > > >
> > > > On 5/6/24 16:11, Wedson Almeida Filho wrote:
> [snip]
> > > > > I still think this should be an `if`.
> > > >
> > > > Is there any benefit using an if here, or is that your personal pre=
ference?
> > >
> > > Readability.
> > >
> > > I don't remember ever seeing anyone implement a !=3D 0 comparison wit=
h a
> > > match or switch.
> > >
> > > But if you insist on innovating on what seems poor style to me, go
> > > ahead. I'll fix it later.
> >
> > I'd like to just respond with a bit of maintainer experience here,
> > please try and use less suggestive language and more requirements
> > language in reviews if you want to see something change.
>
> Thanks for the advice.
>
> I don't want to be intransigent though: if there's a real need for
> this to be a 'match', I of course wouldn't mind it (though I don't
> believe one exists).
>
> > "I still think this should be an 'if'" allows for disagreement and
> > discussion, but clearly in some cases you want to directly inform the
> > patch submitter of some maintainer requirement, I consider stylistic
> > preference one of those cases.
>
> By any chance, have you seen the thread that precedes this comment (in
> v2)? In case you haven't, check it out here:
> https://lore.kernel.org/rust-for-linux/ZjFq1uVXi4k1jjQc@pollux/
>
> Between sending this response and sending a v3 that completely ignores
> the discussion, he waited a grand total of 16 hours.

I think sending a v4 would not be a problem in the same timeframe
though, even for a one line change like that.

You used nit: prefix and asked a question, answering that question was
the objective of the question? if changing the patch was the objective
"nit: please change this match to an if" would prove a better idea,
asking a submitter a question and them replying while sending a v3
doesn't mean they ignored your questions, it just means they are
wanting more information before sending v4. Review questions on an
older version of the patch can still remain open while a new version
exists.

There is nothing against sending updated patches as quickly as
possible, and adding feedback from open questions in another round,
otherwise patch series could be stalled on "nit" for a long time.

> The latest exchange didn't lead me to believe this contributor "would
> just make changes and move on" (as you suggest above), so I had two
> options: reject the patch or accept it and change the style later.

You can just ask for a v4, turnaround time for patch generation
shouldn't be taking a long time here, if v3 was 16 hours why do you
think a v4 would have stalled out the process for long?

> Since I obviously want the fix and for him to be properly credited (as
> he deserves and insisted that it be by means of his own commit -- see
> the discussion in v1, of which I wasn't part), I chose the second
> option because Miguel and I want to finalize the changes for 6.10 now.
>
> > I'd suggest if we wanted to establish conventions and rules around if
> > vs match we should hash it out on zulip and update some docs
> > somewhere, or we can just leave it as is and have maintainers state
> > their requirements to avoid ambiguity.
>
> Zulip? :)

or in the RFL call, but somewhere outside the flow of a patch merge
that we've admitted has some time critical pieces to it.

Dave.

