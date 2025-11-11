Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58972798E8
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 05:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762838234; cv=none; b=RbmVvXSgbzkagsJ32Vie9tPWilA0MAftXX+swCRZdV5TdEI3Zn9tuGGRoy4si9uTKBGg59LMNqJGvY3faaYKAPLlWIjgwA6Nf3fi2YzX53G8utUrHcCKn1C1BdFiM4ZoGkC5Pa2Uj6zT7ypvUUEZHNkzWFUV/FvW3NslBU68k9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762838234; c=relaxed/simple;
	bh=bs7Zd74Vn3rEnEFE63Jt0gNnUXePXAxYicxJBDp9sek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2Ysx/XxyhMxxuqqavkoU5EDicUx6foyuy4Cvg5oNPGUByihCsW9TtRBM46qj56PTtzDd+uXoH5hH30ypHsD5g2yeKl81qpKyF+KNQX1GYjS8KRPHgUnKVGKfavWe65s42nMNLSM9nQ7ibOc799jFuWmPGmwY/2L5emWBRlE7Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ergHyjZf; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ergHyjZf"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-88f239686f2so353413985a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 21:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762838232; x=1763443032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTVkEfNUTdtNyey6PEbu2GWDsGKroMYTEC4JgNbxK0Q=;
        b=ergHyjZf9dQ4F2/wWLBU3xcMQwtoznEvuYxGbSvsuAe3q6wb+cRjq9chC1ZBTQ81Tc
         lSB3xTGhnMciZ9uos+9KBdd12PgeCvPJjjLlgSLsa6WKgRzasAGW1vRS3mpRBOvi7xJQ
         2jJLtmw+ILMICE0sZ0HLn/xSTnzd5ttgRDVGFMLvEy7VdyBDg87u7U/mDQFwT2bNg5uO
         ROryhMtE2O8YPJnSd9PvFvjo2/mG57Q9gmZykpym2TimpRTiwAW2yqdGYQIKkDRXWxaU
         SXNI8KSEY91eVSl0ErSm0AOwFWiyv9y0K05voCexbn292xXpfz+swQ9cARylGNepjWtl
         uG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762838232; x=1763443032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XTVkEfNUTdtNyey6PEbu2GWDsGKroMYTEC4JgNbxK0Q=;
        b=efBapfX3iLj/RS7PKFa34YhmOSoFnUiBUq2ZyC6UU6XYNONv8WXyaw3HQefs7sv7+v
         B9e9O/Kw73ai9m0BF+YZY5YgX3oyyZuOnoEzGl7v17+ACscc1Y9mkbWWjFE9de33A3qC
         PmRYmCblPrMGpLnlt8zp39aXRXhQ/wN+vrZp/mmT4yaBMgtknEiMIbbfucUlaq9Ec5WJ
         tO2qkaOu+9R+3AuvQHeakgnsIsUUckN1nO/bJ5oQ89dmxg39ZS6AmXDWQi93WDvFTRsL
         ee35hQS1hg6xwtkhBn8LuT73FEjB5Ava2Pzb8mELcE9EbaA4sBc24/eRFml1sKC9pGtr
         5NMw==
X-Forwarded-Encrypted: i=1; AJvYcCVPwGL58lx5IwCG06+6aoLCIsMw8LvFI7MDOytWIl0+YRfrS5+j8lF5w1bsPkh661Q45P+zx+M8mIuHPQZaoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiuUmSwandJmvPao1MPiMz5U8NDiX8HF0PyhinVM5tmgFIgrER
	oVxBDI8O2audjO00OAgUCugYYMtHvIdiTZs5G+fwN/pvy17XRLfMedX7
X-Gm-Gg: ASbGncuLtSxICs2DGfolOZhwrx/rhQk7aU+6lwnw7W0IOMS74Bac8jKuhcvDmoYX23w
	abnk0Y1oCfwR2smDpD+c2Dkkiud5VglQDhbPI5DPSfbKbj/EnugYupiyMBaFR0c44Objo8zTqMZ
	9ty+nvzDOWYUk1u2LnYhbw67HdI3HcQUuCW26CS52rQYs8WisuwfesNhz77bsabeZ3833CoxX6S
	vnKU0elg8volELdHawb1LqHDz6aKSH4H65XK118BTgSKwIzvzIN0Z8YLixZuB39UUUABiN+y0NC
	//6NTtg1Pc6IqJ/gxNz/gO24Qlj0LMdTTRIoimS2ORV/mwOcjEmh3DFlkOjj1F8bPwG++a05mSs
	MGKICk50N7HRZAb5YFtfIYT2GcQFiCwxWLWRF2x7s5ge2c6ZE+4Z2es+sA4PnuUwkiWcL2kvJmT
	8eqTICE4Q4HWdbasSQj7DB2ECb1m3I6hA7KDwQhiPUrbfLV3fwsEndn06v2XGr+fygDMFBcG0uJ
	MHU
X-Google-Smtp-Source: AGHT+IFXOPlmnf8hSV1amH0pSGek0ly1sKmowM7VjhXNqjg+nDgLIcKwb2f5phfoheJIy/B0PhnsTQ==
X-Received: by 2002:a05:620a:404d:b0:8b1:ac18:acce with SMTP id af79cd13be357-8b257eee8acmr1381544085a.28.1762838231557;
        Mon, 10 Nov 2025 21:17:11 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2611d7a22sm596045085a.18.2025.11.10.21.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 21:17:11 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9095EF4006A;
	Tue, 11 Nov 2025 00:17:10 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 11 Nov 2025 00:17:10 -0500
X-ME-Sender: <xms:1sYSaVm2ppsJfdKkjep8txLpNOOEBfcvHN7JaiWslJux0ch74hSjAQ>
    <xme:1sYSaZCqTRgtmv3AlQfAyvtigxuxqEkf_UQ2rm97ZU89HHaFISGm4fCxBagOvxSJK
    zrkr-VQI5MU62v6SIDn0ZTQHQiM0B4Bd7axC33i3-W-PWrrRFIa>
X-ME-Received: <xmr:1sYSaXPBicZdMbKgBqhWhlkLpxHtt-Ae4xyuP98Wha2E_2N_GKc7fR6gbapOvhDEtzuui9h-JmvrY0bkH30vEBBXsMgGApTZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddtfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejiefhtdeuvdegvddtudffgfegfeehgfdtiedvveevleevhfekhefftdekieeh
    vdenucffohhmrghinheprhhushhtqdhlrghnghdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghp
    thhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrth
    homhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhes
    ghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurg
    hkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhn
    vghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1sYSaQM28b5CLuA6DoBOTE95COnP1dkuN3n2ipvOkVQbp2_-zHlV0g>
    <xmx:1sYSafn0TF-jJ01TqEWnOzOhHcbg8NWauk2ubd9Bw6LjFkgH80sZ4Q>
    <xmx:1sYSaevWTHIaKRLv-nzuAoYo5vxGgKIygIx6ia-0FSe9vm3_BpV1nA>
    <xmx:1sYSaSq_PW5zh-fbt-K1lUMVoD8ba1rChLFMmh8QQZP66dm9eqaGwQ>
    <xmx:1sYSaceL883GcuI4jdrFbuHdkzYSiwN0HLq-ymCkFF-wkR_GYEcv8OhV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 00:17:09 -0500 (EST)
Date: Mon, 10 Nov 2025 21:17:08 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, a.hindborg@kernel.org, ojeda@kernel.org,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <aRLG1Ofr5QpJGFaB@tardis.local>
References: <aQ21xajAygTbi582@google.com>
 <20251110.182150.1392834304602894143.fujita.tomonori@gmail.com>
 <aRIPgOPvi4uhGQcM@tardis.local>
 <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>

On Tue, Nov 11, 2025 at 12:09:49PM +0900, FUJITA Tomonori wrote:
> On Mon, 10 Nov 2025 08:14:56 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Mon, Nov 10, 2025 at 06:21:50PM +0900, FUJITA Tomonori wrote:
> >> On Fri, 7 Nov 2025 09:03:01 +0000
> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >> 
> >> >> That's my point (and probably also Andreas' point), we already has the
> >> >> type `SetOnce` to do this, no need for a `OnceLite` type if not
> >> >> necessary, and the fact that it can be zero'd by debugfs doesn't change
> >> >> it as I explained above.
> >> > 
> >> > The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
> >> > three different states, but OnceLite only needs two. I don't think we
> >> > should be reusing SetOnce here.
> > 
> > I mean 3 states should cover 2 states, right? In this case we only need
> > to support SetOnce<()>, so I think it's fine, see below:
> 
> Yeah, that would remove access to the value member, but I think that
> init member could still be accessed in an unintended way.
> 

What an unintended way you mean? Do you have an example?

> 
> >> Yes, SetOnce provides three different states and the feature to set a
> >> value, which are not necessary for this case.
> >> 
> >> So there are two design options: 1) to add a new minimal
> >> implementation that provides only the features required for this case,
> > 
> > Just to be clear 1) will still need to be in kernel::sync module, as per
> > our previous discussion.
> 
> As I wrote before, I think that once_lite.rs could be put in
> kernel::sync but I'm not sure it's a good idea because I'm not sure if
> there are any other users who actually need this feature.
> 

Rust std has its own Once[1] module, so I think the concept of "doing
something once" is going to be more general in Rust code.

Moreover, I don't see any downside, right now you are putting it in a
random place, and as we discussed, there is no synchronization problem
on the implementation, so putting it in kernel::sync is not worse than a
random place?

> Any thoughts from others?
> 
> 
> >> or 2) to use the exisiting, more complex implementation with richer
> >> functionality.
> >> 
> > 
> > or we can just add it into `SetOnce<()>`, for exammple:
> > 
> > impl SetOnce<()> {
> >     pub fn call_once<F: FnOnce()>(&self, f: F) -> bool {
> >         // ORDERING: Relaxed is fine because we don't expect
> > 	// synchronization here.
> >         let old = self.init.xchg(1, Relaxed);
> > 
> >         // We are the first one here.
> > 	if old == 0 {
> >             f();
> > 	    return true;
> > 	}
> > 
> > 	return false;
> >     }
> > }
> > 
> > Thoughts?
> 
> Why not using populate() method instead of accesing the init member
> directly by xchg()?
> 

To follow the exact behavior in your patchset, but either way it's fine.

> Anyway, I tried and got a following compile error:
> 
> error[E0277]: `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
>    --> /home/fujita/git/linux-rust/samples/rust/rust_configfs.rs:109:9
>     |
> 109 |         kernel::pr_info_once!("print once\n");
>     |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
> 
> 
> We need Sync for SetOnce? I haven't been following the SetOnce

Yes, I think `SetOnce<T>` should be `Sync` if T is `Sync`. So good
finding! I would say it's actually the effort of trying to reuse the
existing solution makes that we find places that needs to be improved.

@Andreas, thoughts?

> discussion, but I wonder if there are use cases that require Sync. If
> all access goes through its methods, it seems safe to add Sync.
> 
> 
> I personally prefer the OnceLite implementation of not using SetOnce,
> however since it's not directly used by users and can be easily
> changed later, so I'm fine with any implementation as long as we can
> reach an agreement soon.
> 

We should always try to find a unified solution, if there is not much
trouble. Otherwise, we will end up having MyOnce, YourOnce, HisOnce,
HerOnce, TheirOnce etc in our code base.

[1]: https://doc.rust-lang.org/std/sync/struct.Once.html

Regards,
Boqun
