Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1314EB44
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 02:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715050464; cv=none; b=WKeI2nxvVGBQ0GjZUEdoHPFzXwT59MnISIE0q9cGBNgwRUFdMjDwPbGdSsG1XgLtPgW/uF9fAtj7PLjyVjm6G9343Lbl8svDtXoYIlznwBJ5EFCmr5e3ZGsnWeHooO89ifKooJcrs96h7tizSHUAvRpg6BUomXiUTeacpXonmlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715050464; c=relaxed/simple;
	bh=ZpAb43NQBc94vYrcszOHF3EjS910cL3LGI+ICD9N0Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpK2pq9XFyBilu827rM/apevowsT+vvnUOV1KbFOEbcsnK8ZkHjafHEP55RFnmHo2UpczaoIOxgEuj1n+DtqVnlYmP6GAHzQhsHvzkjkQdxYpJynCsqaxjuaO7gTLSuFElkZWBcKm76IO2Luazaw3ZlUkGGFsGaOfKbM7OLHPbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jHW2caNk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jHW2caNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715050461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpAb43NQBc94vYrcszOHF3EjS910cL3LGI+ICD9N0Uw=;
	b=jHW2caNkNVI/h00v5nz4VJiYsUuqElw3QMAxe/t164lyW04WecaX+1AcGKy7dIg4bVqhzf
	Vo2NHI80yMnICO0W5PsPSMdcfB0iVx2KnFJtifikDMD6kAlDHu+r7WiwhCYfT5Oas+ortA
	psaeZLZcTg8zjaxF9eEQwHBGzy6vKEY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-F7C1uL5kPomAIxSHdyfSGw-1; Mon, 06 May 2024 22:54:17 -0400
X-MC-Unique: F7C1uL5kPomAIxSHdyfSGw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2b413f9999eso1946770a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 19:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715050456; x=1715655256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpAb43NQBc94vYrcszOHF3EjS910cL3LGI+ICD9N0Uw=;
        b=GxpI8tvvfd8yszUi+9eZZDCrBuStl+Y17ThlPBx0HH8+RBV8xJ14M7Jixn/2YVgGa9
         MRCkyEOiScArSxx+aS19aDpSSMaktDrtuNNL3RK/bdMNxbtn/52lLg/vl4ADBF0zZJSI
         SLLVX4GgAjQdlLAbdt73A+XWEe3TEXYdrGgcwH0/qdgQ/NIKDEmcjpDUaAhS7530emCA
         7pLn18Adl1TgjJVFFBFsxouDUQreSLnAJ9A2xRFhTWshlp71fbkkpG2uhaKOEEh7DTYQ
         uVN4DCe0ilIppmgP/heaf/9Dl5CVArN1LynvJ7ri/a0jOAEOVtEBMzeyakHIz6AJ9JX8
         /SZw==
X-Forwarded-Encrypted: i=1; AJvYcCUoRS9qh7nESNFDpCUDmQpOtfB5LgyfVnzLsxJ6h1lfppJ8nE6Abu7iQ3bf1tYOzJj40p0i8EOFK51v19WktpU1z7Dfy2Frxvxz5Ea3Dl0=
X-Gm-Message-State: AOJu0YzHqjTPFdOL3EOyCxgs9yyIdG+QyPN3Zd/EbmBf4jJW1tMLDB2H
	kuRRIXR8ag4D9+SyD+WfRfEByiVX+Q/WCG/9J7YN9DcIAl131PPbAcwAT6hhP+U02rCMn2Xl9Hp
	iF7KgTZ7q4MZHwXomiXCWcxgl6nAV7MXsM+xl8rzjerTVf12G04fJXqk1HwRoejD9yztWoeB+2j
	FtfRgC34P8cSMF0mTbbyB5u2RjK1DJui65jbGxP3s=
X-Received: by 2002:a17:90b:3704:b0:2ab:8324:1b47 with SMTP id mg4-20020a17090b370400b002ab83241b47mr2212730pjb.15.1715050456473;
        Mon, 06 May 2024 19:54:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL0yxKQP6FIU8JJ4wLMSQ+03elZVUYFWFG4zeUkC1sl1oT/zXcBvOut40H422TbRwWGU1C2VDgIWKRF4H7YXE=
X-Received: by 2002:a17:90b:3704:b0:2ab:8324:1b47 with SMTP id
 mg4-20020a17090b370400b002ab83241b47mr2212706pjb.15.1715050456136; Mon, 06
 May 2024 19:54:16 -0700 (PDT)
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
Date: Tue, 7 May 2024 12:54:05 +1000
Message-ID: <CAMwc25qc2vFVsDjCNY8SZZ-s0pd77oXVzyTtoMiNTz2PjMnA6w@mail.gmail.com>
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

So the same problem exists also in this thread, there is nothing
actionable for the submitter. There are suggestions of a discussion
being useful, but no actual do this to get this patch accepted
clarity. If you want a change to be made, be direct and state it
otherwise people will not take action if further discussion is needed.

Dave.

