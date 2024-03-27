Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5DF6F53A
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711538720; cv=none; b=dVkVwGVmDkkQ9svNgXF8wjR6lcoRUKedsvEOjV2Rze7Qhh2aL4cXquEcRatqGrHTz28AZ9KaPdB/aacfWVJQRfTAwPvb5hZIrhiE3LPhwS4Cn0Q15+8hvT1B+9wxijp5GiOAioDdo4sRuG7dvDEksfRffE4tEUgc02upItKy6bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711538720; c=relaxed/simple;
	bh=tt3uYLcmwp60gY89yf3+gAmiY7Gi0Bg7JTaW7JDyKfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Du0BMiwZ3QUvgqdQ9DQZxEMID5H3WS4kKokui12qU/OExKOdwYG8M0L2G4yDs+LX1llMWVH1ippDX2WrzZz4tZXB3Ux3cCxuvzXURl64tVNCcVABD2PJuxnpxBBgnvS78BiNoeoQWidDLWupADeVCdBXFmRWZJLO1TrMq4UIKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LhtpeGc3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LhtpeGc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711538718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PlqgO9bfXuGRYNe6qd69JuIZ2ZjoVMXD+6DMGi4T6E0=;
	b=LhtpeGc3GXmQLRxRbAtNGH9TjsGoISORoFUmZ/5aLg326X40T8fgKqxK4p+pW/ChFbpN+z
	Ah0MkaHjzDsounubNMUwO4Jf9kkEeX8WLNhIT9XXeKmtgn1XmIPtbCzfyvFQChO3L38kcW
	VHOuvvKsUoW9909qtADaMPSIqSxzTjc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-i9kKlvzhOyu_3z5SAfd2Kg-1; Wed, 27 Mar 2024 07:25:16 -0400
X-MC-Unique: i9kKlvzhOyu_3z5SAfd2Kg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-513e31aef6cso5564822e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 04:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711538715; x=1712143515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlqgO9bfXuGRYNe6qd69JuIZ2ZjoVMXD+6DMGi4T6E0=;
        b=vY1YMj9LzLlBHKxZqgACJuiUERNelt8PV+3w2Yaa7Aip4ZIZYY/KK15xkYj6IviNip
         pUEaiFQt1vX0LMFsQBPra3eylg1+c1ANx49epqiuUX8hReezRnjer3rjNfhv24ydKLrx
         gwoNWKcPwMQJ4f3AAVZwvzZ/PlzYb5TGJLT3phP8T8LyMvjdFfSkGcWR17m5M0jdU9Lx
         I5z8/GEoHXQ2+k7+zV2f0mVgfCiVPhFqPuGAyc+wjzK3E4FDQ+DkUKF8Xnrl/AicsLkf
         IJiACUtJhQyjC4hIt+oWojJhTkIHyV9CQpUDNR7eKwf/nSkVrl8NbyrHLk8VD4+Vo9eV
         W6cw==
X-Forwarded-Encrypted: i=1; AJvYcCVz2gUh1MxII73meo6pzA2041DNiaqEcFEdWAU5rg7lUgm3sav55wLhKzUdXJJUiTMHRtVhIPPyEEOBYO8jAD2ns4MiFYC3HZ/83wqv0BM=
X-Gm-Message-State: AOJu0Yw8YaT+Mbge3zCyErq3aIQ5fDDTGzQxOUbkwCFrBJ8jNR8a5/ZY
	BfyNh6fKHqfqDL/CU/DI0GKkCFVtTaPHs7282kZpXqaQDfL/6mnnjoNiTTvvESTKQnoaQde8ETi
	19iwj1u3GsDwazfXbfzrg6FE350Ga252udjU54Vm16yIIomKL9hsHp9DEEO+IWvZa
X-Received: by 2002:a05:6512:34cd:b0:515:b0be:3a42 with SMTP id w13-20020a05651234cd00b00515b0be3a42mr1767592lfr.33.1711538715115;
        Wed, 27 Mar 2024 04:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFElcIsrWR+FI+I+KEdfzHSfNoxRD2JE7NzKX/u2qUsC8OzBcotpoK803NhliuzyGZo4FxPuA==
X-Received: by 2002:a05:6512:34cd:b0:515:b0be:3a42 with SMTP id w13-20020a05651234cd00b00515b0be3a42mr1767567lfr.33.1711538714569;
        Wed, 27 Mar 2024 04:25:14 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id u8-20020a170906124800b00a46d6e51a6fsm5365487eja.63.2024.03.27.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:25:14 -0700 (PDT)
Date: Wed, 27 Mar 2024 12:25:11 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH v7 0/8] [RFC] Rust device / driver abstractions
Message-ID: <ZgQCF3jp73n4BTs4@pollux>
References: <20240325174743.95542-1-dakr@redhat.com>
 <CANeycqq=qETyG5ZwmKo0-iLehWeGVf_WqLf=OK3D1LN2yzYbCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANeycqq=qETyG5ZwmKo0-iLehWeGVf_WqLf=OK3D1LN2yzYbCg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 26, 2024 at 09:48:07PM -0300, Wedson Almeida Filho wrote:
> On Mon, 25 Mar 2024 at 14:47, Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > Hi,
> >
> > This patch series provides some initial Rust abstractions around the device /
> > driver model, including an abstraction for device private data.
> >
> > This patch series is sent in the context of [1] and is also available at [2].
> >
> > - Danilo
> >
> > [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
> > [2] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device
> >
> > Danilo Krummrich (1):
> >   arch: x86: tools: increase symbol name size
> >
> > Wedson Almeida Filho (7):
> >   rust: device: Add a minimal RawDevice trait
> >   rust: device: Add a stub abstraction for devices
> >   rust: add driver abstraction
> >   rust: add rcu abstraction
> >   rust: add revocable mutex
> >   rust: add revocable objects
> >   rust: add device::Data
> 
> Danilo,
> 
> It seems like I'm the original author of the vast majority of the code
> in this RFC series, yet I wasn't contacted by you for coordination
> before you sent this.

Agree, it would have been better to directly contact you again.

Except for patches 2 & 3 the other ones are created from patches that
"extracted" code from the HEAD of R4L/rust. I just fixed authorship before
sending them, hence I think I didn't really notice that you are the original
author of all device / driver abstractions.

Please also note that I announced these efforts a couple of times, e.g. in [1]
and [2].

> 
> A bunch (all?) of these patches were already submitted upstream with a
> lot of discussion and decisions made to modify things. Why are you
> resubmitting them basically ignoring all previous discussions? Take
> patches 2 & 3 as examples (I don't bother to look for others now):
> 
> https://lore.kernel.org/lkml/20230224-rust-iopt-rtkit-v1-2-49ced3391295@asahilina.net/
> https://lore.kernel.org/lkml/20230224-rust-iopt-rtkit-v1-5-49ced3391295@asahilina.net/o

For the patches 2 & 3 I'm aware of the previous discussions. However, I have to
admit it's been a while since I read them and hence I forgot to mention that
this series is, besides others, also a follow up of that one.

For everything else I'm not aware of previous discussions, if there are any,
I'm sorry I missed them. Also please let me know if there are any, such that I
can follow up.

> 
> Also, these patches were written in the rust branch. Before we
> upstream them, we have to revisit them to check if changes are needed
> given the changes/improvements we have made; for example, pin init now
> allows us to initialise pinned objects safely -- we need to follow the
> new way now and I see that you don't in `RevocableMutex`. PinInit also
>  enables us to have pinned modules, which simplifies how we do
> registrations (so they also need to be updated), locks have been
> redone with a common `Lock` type, etc.

In [2] I was asking about the preferred way to get some immediate discussions
going. When I proposed to send links to the corresponding branches to the
mailing list or send a patch series (for rust-device I ended up doing both) I
did not hear any contradiction.

To me the mailing list seems to be a good place to revisit, review and improve
these patches.

I'd propose to just continue with this series and collaborate on improving it.
Are you fine with that?

- Danilo

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] https://rust-for-linux.zulipchat.com/#narrow/stream/415254-DRM/topic/Topic.20branches.20for.20staging.20Rust.20abstractions/near/426580539

> 
> In summary, we can't just copy code, we need to revisit some of it and
> at least check suitability before submitting them.
> 
> >  arch/x86/tools/insn_decoder_test.c |   2 +-
> >  rust/bindings/bindings_helper.h    |   1 +
> >  rust/helpers.c                     |  28 ++
> >  rust/kernel/device.rs              | 215 +++++++++++++
> >  rust/kernel/driver.rs              | 493 +++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs                 |   6 +-
> >  rust/kernel/revocable.rs           | 438 +++++++++++++++++++++++++
> >  rust/kernel/sync.rs                |   3 +
> >  rust/kernel/sync/rcu.rs            |  52 +++
> >  rust/kernel/sync/revocable.rs      |  98 ++++++
> >  rust/macros/module.rs              |   2 +-
> >  samples/rust/rust_minimal.rs       |   2 +-
> >  samples/rust/rust_print.rs         |   2 +-
> >  13 files changed, 1337 insertions(+), 5 deletions(-)
> >  create mode 100644 rust/kernel/device.rs
> >  create mode 100644 rust/kernel/driver.rs
> >  create mode 100644 rust/kernel/revocable.rs
> >  create mode 100644 rust/kernel/sync/rcu.rs
> >  create mode 100644 rust/kernel/sync/revocable.rs
> >
> >
> > base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> > --
> > 2.44.0
> >
> 

