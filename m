Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DB826296
	for <rust-for-linux@vger.kernel.org>; Fri,  3 May 2024 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714746976; cv=none; b=TDhIyb3zi/G1RLWXPfa9cnMX0gwELwg7D/h0GQPARbLNuJ6/7btuoeVYk3PUpgHafhHXhGJsdWCt55Ha20MSU2Ojr7ymmZrlNIrMlyjvK2U41165EgUJ8OinlgJZX0pDIOlzSSMB6IJSGfR98E6BNe/fyMng3SLi2caoEzuinaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714746976; c=relaxed/simple;
	bh=daN1x2gi00cSob1DmX9fc38vEUCgnDKbKOdXdiCaBCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZiOXFcxRy5y6J6gj2xylac0qkkjJh4Nh26y+hqfC5tFjVkgZr8TYvZlkScm8gzD8kexGtXekEWGJDi2A78xnMA/KniaT0gJlcIWg4ybIECC7tqopNef/Z2gkvUuD0K6OcD/DkffQ0LfMxHyERkC4huUsAyB1bpGtXcm1tvuKIM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PNVOBWjT; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PNVOBWjT"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5aa4204bacdso5416269eaf.2
        for <rust-for-linux@vger.kernel.org>; Fri, 03 May 2024 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714746974; x=1715351774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajN0BJTmgIGLTJx2+JqXb38Pd8n8N6KRNSjh1lBU7Gg=;
        b=PNVOBWjTY0oFb8n1NssmzOAVRRL29bTP7eVtzsyehKp34w3gEQXEevvThQ353ZW4K8
         0E8jXoesKUE0+m1OVThcl+t14OUX7saF1/DBmA2WlmV1W5q/nRvpZQxkFuR7vhXH7MnQ
         csD/+vjPwLc41PpOj5j3IPYBfy7HlwAPs6t26JdKyerdNeewuNWtLTV5JahuDF5R4lFh
         Ei885Oyb2RXkzCKC51R5mHFk6I7Le+vcjzX9X4dysFVaLK35S5tZVFbV18c/R19lUr7Q
         I5QTMSTnFaqQn2gsOTi773F1585nS0Z/qvlAIbXvCP6ryVc3YEidffftugFXfRUwosh/
         rxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714746974; x=1715351774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajN0BJTmgIGLTJx2+JqXb38Pd8n8N6KRNSjh1lBU7Gg=;
        b=ZK1OFLIlA3rbpsQ2UcYi8fAgjG9JpQHvNqNAbsL4SARPvPdF1YdoWHPT+xqGgq3E7M
         aG79mbGJPuXcXEF+Ajre5Nut8id1vgxdC3DVUb5xuopIBt//VxYciJYr89y479vC5CKJ
         aufS97yN5ZGFsNIwrmGLcFyDX32r/G+BYBLpMVtgeDArhb8ZsiEMhGMInvBQb8ZXILmF
         IV7l20bv2RvBNd5YsPZBcoSRpKwbT2FZwFqo2B9Q0v+Sxydf6I6yHbM4ChK0a88I7+gq
         NOpwSZWZJ26QSZxnJMzEspw5nC+15P+WOfUvuiuaEAIFd8G3exP1JVATQHjOlLYusZoZ
         1exQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNg5y1ukGk2uFS/KX//QhKofcyOHdkb7AQYk8knoKMyGP5Ccy/RkhoihMQcR8JkTdE9IrR5C3t9iXPecyzCcVLAsSFXFdsFhNMMNEPLlg=
X-Gm-Message-State: AOJu0Yx30E/9J8/FQlmZxgTrvvZqmOwCM3SPJs402DiQ+Za62CfaBXYq
	+e3E/fA4pHCpz3OVmU0xIcIbbHbAfkWhzVlZ8++OakV5GiD4geJl9a8wAQ+wRVLgyxuca5LBEoK
	/Mf1eGRqFxrRV1GWI1ED4l/iSrMUyeR57vIEP
X-Google-Smtp-Source: AGHT+IHoTU5A3vFElJmmz36t8Ht05rUxakrvP1P6x/IV4m/3JuZwplO8bo+8j4PHy+v5410tkSzd4K+jp31EaDezWyY=
X-Received: by 2002:a05:6358:311c:b0:186:2ac7:316c with SMTP id
 c28-20020a056358311c00b001862ac7316cmr2859376rwe.20.1714746973495; Fri, 03
 May 2024 07:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
 <20240402-linked-list-v1-1-b1c59ba7ae3b@google.com> <2f25f21e-fad8-48bb-aa2b-d61bf8909a41@proton.me>
 <CAH5fLgjqyfExjckh7KnSLnT+Ok+yjcoJ+DpDkj0gUZRmoz=M8Q@mail.gmail.com>
In-Reply-To: <CAH5fLgjqyfExjckh7KnSLnT+Ok+yjcoJ+DpDkj0gUZRmoz=M8Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 3 May 2024 16:36:02 +0200
Message-ID: <CAH5fLgj49zs2=O-e3h=VqkRDDzhozvV6p=-5AKN_Q9-caT++cQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] rust: list: add ListArc
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, 
	Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 4:00=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Wed, Apr 3, 2024 at 5:51=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
> >
> > On 02.04.24 14:16, Alice Ryhl wrote:
> > > +impl<T: ListArcSafe<ID>, const ID: u64> ListArc<T, ID> {
> > > +    /// Constructs a new reference counted instance of `T`.
> > > +    pub fn try_new(contents: T) -> Result<Self, AllocError> {
> > > +        Ok(Self::from_unique(UniqueArc::try_new(contents)?))
> > > +    }
> > > +
> > > +    /// Use the given initializer to in-place initialize a `T`.
> > > +    ///
> > > +    /// If `T: !Unpin` it will not be able to move afterwards.
> > > +    pub fn pin_init<E>(init: impl PinInit<T, E>) -> error::Result<Se=
lf>
> > > +    where
> > > +        Error: From<E>,
> > > +    {
> > > +        Ok(Self::from_pin_unique(UniqueArc::pin_init(init)?))
> > > +    }
> >
> > pin-init has a general trait for this: InPlaceInit. I don't know if the
> > other functions that it provides would help you.
>
> I will use that.

Turns out it's not possible to use the trait in this case, for the
same reasons as why Arc isn't using them either.

Alice
