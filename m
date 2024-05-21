Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776374D9EA
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716278594; cv=none; b=LGM5aDo4ENkAyYielGItZL1/lJ04F9VtwelT/tdt3CCl95xM0Og+gsFWe7ksn2HaVfLPpMUFWzeUIbeiCGGqy6IRJM+nWkwvzHUP55x1xJj2AwjE2yiVQgQYnXxnb//7RLLDEFqR7+j7W7/wEILe+Xliv3WFTPpRoFjm3CRQWQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716278594; c=relaxed/simple;
	bh=P8i8lpZFDK9qhijLTo40alsf+/38zDsCsS5gsVu0+68=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfkfmiRmbMRJSuoogR25MMLGS0JXNThFjlWUUNHeGm+ZHcR+dLU8sJWyccZm0KWfUiAqgoGuidpzu7yzlFDV7ti7uHE3pLDaVUlFhO3c9sQo4vhK/839SUZB21UBzrRI2DCDGJFQ0yDcyuMIR1Z0ACeTA2M+tqiaI0CgD1ccWIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S1GZHcZF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S1GZHcZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716278591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8i8lpZFDK9qhijLTo40alsf+/38zDsCsS5gsVu0+68=;
	b=S1GZHcZF54lipAfTVHHkXhO5mLGl+Hbh3ju64kqYOEv3iUj2llAZedVoC0hiYizbJVmyVH
	016FiIWZFsa1be5y9jaCbSak4MR8KZ0xhqLi70nPYfTpjth45yxtlgXdnRVTNpc9ttgMcG
	xfK4ACiVHJ+2HFUYWBIKwrknp85ONbk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-ziibqWWdM9CUHh3tQY-07Q-1; Tue, 21 May 2024 04:03:10 -0400
X-MC-Unique: ziibqWWdM9CUHh3tQY-07Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-572afd2a951so722557a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 01:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716278589; x=1716883389;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8i8lpZFDK9qhijLTo40alsf+/38zDsCsS5gsVu0+68=;
        b=dyeW/CQXU7nXBGDMFo2vIuVEJMEGOw6WONhc8nXp/ujSnoM5VW/EpNyigcJQzIoI+G
         mURXdCHxBpORg1ghZcvlvgc7tG1JgftQrbEq7qgu9FEkAQVKTv1nlY1PtBKEO7Ft4URP
         4cqc377nyQpzW3at2BDsnEqi1uiuCoLWrJBAGArKO/U8mwahNOWeL+zgXBpcsxR86hdK
         0yFqfIz5MQiP+EpSLgSUuJ0s4vzYPZk0GSwKuflN6AMw0wXkLiLowD04ObjE79c8mnU8
         /sFySzaHBbJyjvs/a6B0Lfbe1vES1OMz2HLvnlJBDyYEvpOc9P3580fVdQUtJEsaIXsc
         fIMA==
X-Forwarded-Encrypted: i=1; AJvYcCUdxSaJqgwdf7vt8scjejU2AG1DgX+FUierI7I4YGmwXpQFAo1DFF+B6+AL8kCsQ7fCuryPGPLE5kqr+xBo9AW1ZR4mr3Ose/sWosmUmgI=
X-Gm-Message-State: AOJu0YxfiGK9nmKsMc+mvFAGPYUThqE29aS6B7LeFnkwwJxxqQrdhFQM
	GIf+0oITAC5h4GHTWURXl5Q6OcDm17VqGt/bqgoHPGyiEcZEecY+jES3dwkKfNX7CN/o1l0bWZY
	AafHLAxRwHkR5Utt4WQFyfFw2PG7txZdCNEwd7bTvkeooRNokFkKePhLKDUoD6BVi
X-Received: by 2002:a17:906:5a4a:b0:a59:bbd6:bb38 with SMTP id a640c23a62f3a-a5a2d6d1b90mr1909492366b.7.1716278589493;
        Tue, 21 May 2024 01:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+r903jJsCsfgUxdSOggtSi2Aisrx2uTa8+qStRPyE+96/oWSWqcZCONUYZVQp3fx1iO7+SA==
X-Received: by 2002:a17:906:5a4a:b0:a59:bbd6:bb38 with SMTP id a640c23a62f3a-a5a2d6d1b90mr1909489066b.7.1716278589063;
        Tue, 21 May 2024 01:03:09 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781e97bsm1560827766b.32.2024.05.21.01.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 01:03:08 -0700 (PDT)
Message-ID: <1c8bb8044bc1943ad8d19cd6fc84a2d886004163.camel@redhat.com>
Subject: Re: [RFC PATCH 10/11] rust: add basic abstractions for iomem
 operations
From: Philipp Stanner <pstanner@redhat.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>, Dave Airlie
 <airlied@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Danilo Krummrich
 <dakr@redhat.com>, gregkh@linuxfoundation.org, rafael@kernel.org, 
 bhelgaas@google.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com,  gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me,  a.hindborg@samsung.com, aliceryhl@google.com,
 fujita.tomonori@gmail.com,  lina@asahilina.net, ajanulgu@redhat.com,
 lyude@redhat.com,  rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-pci@vger.kernel.org
Date: Tue, 21 May 2024 10:03:07 +0200
In-Reply-To: <CANeycqpNeHFUu-RwSc6Ewa3r5TMhYYFDC6bO+sj3OZ398JfJ1A@mail.gmail.com>
References: <20240520172554.182094-1-dakr@redhat.com>
	 <20240520172554.182094-11-dakr@redhat.com>
	 <CANiq72kHrgOVrdw7rB9KpHvOMy244TgmEzAcL=v5O9rchs8T1g@mail.gmail.com>
	 <CAPM=9txb5STBo05xiTy9+wF7=mMO=X2==BP4JVORPFAtX=nS0g@mail.gmail.com>
	 <CANeycqpNeHFUu-RwSc6Ewa3r5TMhYYFDC6bO+sj3OZ398JfJ1A@mail.gmail.com>
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

On Tue, 2024-05-21 at 00:01 -0300, Wedson Almeida Filho wrote:
> On Mon, 20 May 2024 at 23:07, Dave Airlie <airlied@gmail.com> wrote:
> >=20
> > >=20
> > > Wedson wrote a similar abstraction in the past
> > > (`rust/kernel/io_mem.rs` in the old `rust` branch), with a
> > > compile-time `SIZE` -- it is probably worth taking a look.
> > >=20
> >=20
> > Just on this point, we can't know in advance what size the IO BARs
> > are
> > at compile time.
> >=20
> > The old method just isn't useful for real devices with runtime IO
> > BAR sizes.
>=20
> The compile-time `SIZE` in my implementation is a minimum size.
>=20
> Attempts to read/write with constants within that size (offset +
> size)
> were checked at compile time, that is, they would have zero
> additional
> runtime cost when compared to C. Reads/writes beyond the minimum
> would
> have to be checked at runtime.
>=20

We looked at this implementation

Its disadvantage is that it moves the responsibility for setting that
minimum size to the driver programmer. Andreas Hindborg is using that
currently for rnvme [1].

I believe that the driver programmer in Rust should not be responsible
for controlling such sensitive parameters (one could far more easily
provide invalid values), but the subsystem (e.g. PCI) should do it,
because it knows about the exact resource lengths.

The only way to set the actual, real value is through subsystem code.
But when we (i.e., currently, the driver programmer) have to use that
anyways, we can just use it from the very beginning and have the exact
valid parameters.

So driver programmers would always have correct IoMem and would have a
harder time breaking stuff, and wouldn't have to think about minimum
lengths and things like that.


P.

[1] https://github.com/metaspace/linux/blob/rnvme/drivers/block/rnvme.rs#L5=
80

