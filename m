Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E153125C9
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711461199; cv=none; b=KQ4tLdOUgez92mb99uNZOGqhRIUi2NbAcDLQVwKi+NVeh8WA61mjZS1xFWfJnpNijLWzzIDM7VOGhh+ffKfLPCSsuU4i7J4FoJLoQxM5vJqR0xfU1/TGDzLk4aSZC0m4gQ85cMfnE5KoCnZhd1XqY1pPo0hUdHh7gnHA3FC7LnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711461199; c=relaxed/simple;
	bh=LmbPj9Sz56PDQPhrUcJg35eb/a+ldi5hVc9pPr/gYdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZBiEw7ChfowCLWdktvTyQjps2QJvUPgBH4kUCwvzK70liBqENlZW+AmVWmrF4eohtWv916uFXZEGFtgSVT7Zo8SmYU6s//08e3d/E48+K8K0NfgvZSjsdeQzRquNJ7Qnj3o+gTxY9HZbRjdqF+afnYixJhLUE+GPgX2NJo2Q3Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S/vkZlsd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S/vkZlsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711461196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LmbPj9Sz56PDQPhrUcJg35eb/a+ldi5hVc9pPr/gYdQ=;
	b=S/vkZlsdjl541ELjjGGRg/Cy91ySXgKr5yLX1DharlZn9teZC2Sjwz7/24+JtnlHh6SeM7
	8u9LZJmj8xoXk66TAKQZcXZYRAoPaNEAIoB4CyGtYMKgQH8Smsq+H5RdFXNvPYE2eTjptq
	1klBpBPlL8+bT88heeXvd5kiyPEys84=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-mwOPcT7jMt6dQ1vsnjhb0g-1; Tue, 26 Mar 2024 09:53:15 -0400
X-MC-Unique: mwOPcT7jMt6dQ1vsnjhb0g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40e4303fceaso8176475e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 06:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711461193; x=1712065993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmbPj9Sz56PDQPhrUcJg35eb/a+ldi5hVc9pPr/gYdQ=;
        b=h0tHcw68W9B/hRX+3ZBtMWHfKzjBWltDDKq3Zx1N+LDc7CYLc7fB201ZVvSA8JYXpd
         idjNZ8KmD4Lq70BdRXgsFXtzq1Izisv6BM/cRxtbznCS/9eyuYGXGAaW3j3ufZO116Kn
         j8OTnk8tzAB3dzCaA8hGA8AsjqV02oMvLZiqpuoYq01F3+bTOuRfJu1Z8Fn9ZzP/q530
         5g0fojp1PN7VemZnufxXFr4+wY6mVVNkULRxNsTDt0Q/iX0TJZI87V+wbkZVyISzWQEi
         PE+10wh3d46XS0Slfufx3sMESWAw7XLiciFDRTd+BJZxSUunONFkoeuRfZ/2yTn3noQl
         ZHAA==
X-Forwarded-Encrypted: i=1; AJvYcCUWcFquyTSWl7wP29lbLC5auuk38L3UgnoDVXUu9sW+tGyDowhHShY35s+Mp6SOBiQktlMJsSj7h3oXOh2StIeHJdjeklfHvCe1EeVXE34=
X-Gm-Message-State: AOJu0Yyzz7JuMQLiptbwzMHfaHv2jFjplUPF8CEMDtB7U9fs7FeiCqRy
	LqwwA6Bo1w+ED4zooksth/YH/7ZHGE750zzmbIjERBf39jW6KaL0b3KDC31uB5QMTRjZc0N0v8x
	NZSz28I2uN7xnW07Q/cQHSqRNlcoOQai9RckmEl1caJTsF5OT3b1/4FqbE+8BAQ8H
X-Received: by 2002:a05:600c:5121:b0:414:6467:2b1d with SMTP id o33-20020a05600c512100b0041464672b1dmr7927730wms.0.1711461193664;
        Tue, 26 Mar 2024 06:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqLdwYsEb7dABPRqa9OLZc2sZV/oTxXbG8zfwK47AdWt86fHunROIj6WiUofHy3s8oikmuDw==
X-Received: by 2002:a05:600c:5121:b0:414:6467:2b1d with SMTP id o33-20020a05600c512100b0041464672b1dmr7927712wms.0.1711461193297;
        Tue, 26 Mar 2024 06:53:13 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b0041409db0349sm11665395wmb.48.2024.03.26.06.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 06:53:12 -0700 (PDT)
Message-ID: <5e19d7959d43afe0d95d5b8e9a9b58472fe56656.camel@redhat.com>
Subject: Re: [PATCH v8 2/2] rust: xarray: Add an abstraction for XArray
From: Philipp Stanner <pstanner@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alice Ryhl <aliceryhl@google.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Asahi Lina <lina@asahilina.net>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida
 Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>,
 Matthew Wilcox <willy@infradead.org>,  rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,  kernel-dev@igalia.com
Date: Tue, 26 Mar 2024 14:53:11 +0100
In-Reply-To: <CANiq72=1hY2NcyWmkR9Z4jop01kRqTMby6Kd6hW_AOzaMQRm-w@mail.gmail.com>
References: <20240309235927.168915-2-mcanal@igalia.com>
	 <20240309235927.168915-4-mcanal@igalia.com>
	 <CAH5fLgi9uaOOT=fHKWmXT7ETv+Nf6_TVttuWoyMtuYNguCGYtw@mail.gmail.com>
	 <c8279ceb44cf430e039a66d67ac2aa1d75e7e285.camel@redhat.com>
	 <f0b1ca50-dd0c-447e-bf21-6e6cac2d3afb@nvidia.com>
	 <Zfzc09QY5IWKeeUB@Boquns-Mac-mini.home>
	 <31263f2235b7f399b2cc350b7ccb283a84534a4b.camel@redhat.com>
	 <CANiq72=1hY2NcyWmkR9Z4jop01kRqTMby6Kd6hW_AOzaMQRm-w@mail.gmail.com>
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

On Tue, 2024-03-26 at 13:23 +0100, Miguel Ojeda wrote:
> On Tue, Mar 26, 2024 at 8:41=E2=80=AFAM Philipp Stanner <pstanner@redhat.=
com>
> wrote:
> >=20
> > I actually think it would be nice to have variable declarations at
> > the
> > top of the functions, but that would obviously very frequently
> > collide
> > with Rust's concept of data being immutable by default.
>=20
> It is true that deferring bindings sometimes allows for more
> immutability (this also applies to kernel C to some degree with
> variables at the top, by the way). However, it is more about other
> things like when new objects can be constructed (when can invariants
> be set), when destructors run and in what order, even the type itself
> (rebinding).
>=20
> But it is not just this (where to place variables/bindings) -- there
> are other kernel C guidelines that do not make sense for Rust, and
> trying to apply them is a bad idea.
>=20
> Where possible and where it makes sense, we should try to keep it
> consistent, of course. For instance, naming concerns have been
> discussed many times (avoiding different names for existing things) -
> -
> that can be indeed be confusing and introduce mental overhead, and
> thus we try to avoid it, even if sometimes it may have been locally
> the best solution.
>=20
> > Regarding our example, my hope would be that `if ret < 0 ` should
> > always be fine, because, what else could it be? A float?
>=20
> I think one of the things Boqun was referring to were the semantics
> of
> the value, which is why one advantage of `to_result` is that, when
> dealing with a C function that does not follow the usual pattern, it
> stands out more.

You mean if `ret` was a pointer that, consequently, would have to be
checked for equality rather then for less-than 0?

>=20
> > I'm very happy to hear that we're on sync here :)
> >=20
> > Though there will be a lot to be discussed and done. As I see it,
> > so
> > far the clippy rules for example are global, aren't they?
>=20
> Yeah, and that is intentional.
>=20
> Of course, as with anything else, there can be exceptions where they
> make sense. But the point is to avoid diverging in how we write the
> code in different parts of the kernel unless there is a good reason.
>=20
> This is essentially the same as the formatting discussion. The flags
> for `rustfmt`, Clippy or the compiler diagnostics can and will change
> to try to come up with the optimal set as we learn more (and as new
> flags appear or if they change behavior in a way that we didn't
> expect
> -- hopefully not -- etc.), but they should be consistent for the
> entire kernel, except where there is a good reason not to.
>=20
> > I think the ideal end result would be one where we have rules and
> > enforcement similar to how it's done in C:
> > C has checkpatch, which fires errors for some things, and warnings
> > for
> > others. And, if it makes sense, you or the maintainer can ignore
> > the
> > warning.
>=20
> I may not be understanding this part, but that is already the case,
> no?

The difference is that checkpatch is an additional tool that is not
tied to the compiler or build chain.

>=20
> In any case, I am not sure we should look at `checkpatch.pl` as a
> reference here, because it is a tool that we apply against patches,
> i.e. something done at a given point in time once against "ephemeral"
> entities.
>=20
> In other words, it is always possible to ignore any and all of its
> warnings/errors, at the discretion of the maintainer, and thus it is
> not as big of a deal to have false positives for the checks (in fact,
> it is good that it does, because it allows `checkpatch.pl` more
> leeway
> to catch more issues).
>=20
> We could have different sets like with `W=3D`, though, including
> perhaps
> one for "development" where it is even more relaxed (e.g. no missing
> documentation warning).
>=20
> > When the build chain checks global rules we can't really ignore any
> > rule without some kind of annotation in the code, because otherwise
> > we'd permanently spam the build log
>=20
> That is the intention, i.e. that they are enforced as much as
> reasonably possible, but one can still ignore the rule if really
> needed (and even better, one can do it as locally as possible, e.g.
> right at the item that requires it instead of file-wide).

Yes, and I think that shouldn't be done. The C coding guideline is more
of a recommendation.

Nothing in C complains about you doing a `return;` over a `goto out;`.
The current setting, however, would fire warnings (or isn't it even
classified as a build error?) if you add `return` in Rust at the end of
a code path.

I believe that memory-safety-related mechanisms and rules should be
"enforced as much as reasonably possible", because that's the entire
point of Rust in the kernel.

Everything else should in my opinion be as free as in C.

>=20
> > Yeah, I get where that comes from. Many new languages attempt to
> > end
> > endless style discussions etc. by axiomatically defining a
> > canonical
> > style.
> >=20
> > But we're living in this special world called kernel with its own
> > laws
> > of physics so to speak. To some degree we already have to use a
> > "dialect / flavor" of Rust (CStr, try_push()?)
> > Will be interesting to see how it all plays out for us once the
> > users
> > and use cases increase in number more and more
>=20
> The "dialect" you are speaking about is global for the kernel. That
> is
> completely fine, and as you say, needed in some aspects.
>=20
> But what we do not want is to end up with different "dialects" within
> the kernel, unless there is a very good reason for exceptional cases.

Agreed, that should be global.

In fact, almost everything should be global.

The only thing we don't agree on is what should be a per-default
strictly enforced rule, and what should be a recommendation.


P.

>=20
> Cheers,
> Miguel
>=20

