Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8613D8A3
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727217425; cv=none; b=kGdYSuDviNkykHo++ZFSzss0rxNjjyvFxbea9YFLyiVvnof3eDLdo7SofSUuQgNWOkRMm1foy2r90b60GS8A7UyzfUbk3fRIsDONyLkEFv8O0EMJV058lX2jVo96F5NCnbwOiEusc65wl7FCMPFQcTfAmwITXaRUA7i0CkJbbeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727217425; c=relaxed/simple;
	bh=5jNoZluaEpAq654xuDfhZKFpYefgLZP+IVBlTcD1Znk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNNsOiu9jiDvrfrrCgrRPn+vbWEmb1PGHltMYRARSN+xy86xa3hWCCGdK2miuqG2PIQ6ToZeLRYaB5y2NsdQzZg5vAG5/Y5eNqX+271KZWtTqmGjyF5wlKzHEwhr5L9bwZL5ZygFyvA1SXtFddlfMxPHMHrHHSmSq2MKVJcBraU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FU43Gax1; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU43Gax1"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4581e7f31eeso48723791cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727217423; x=1727822223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVKebC+SxjL1vk58US9CiY5jHt/C7DSyoeIpUdiNeDM=;
        b=FU43Gax1Z0QrZOg44dw97qrY92U2j7M6cXLklmMButg+N0bqH78hT7+r4HGsPhDnJg
         i/act9bIxY3ZKm8E4pVMa6s53uy5tBMWDtB57+TCSySxZaVSIxDNXnQgN0fqcRjSYwM/
         S8kGk6AkZw8DCtr8s/86tNK5YocqMRCESL2iPtx8RSHz6uuZEmqy2Fbt1NaNYEgn1Wud
         4vF+M+iY8JGEclzOWIm8JD0juakUOz/cI6pobJCp2WqdNld8HzaB5spKr+zfBqrvQAnn
         BfAF9u/ETw+kZiBmdjNzeMENs0JJWUoRk5L1fdbRCr/n40ViyWcj1nf7gE+kIAEZHxMa
         GXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727217423; x=1727822223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVKebC+SxjL1vk58US9CiY5jHt/C7DSyoeIpUdiNeDM=;
        b=TYU+YrnUDnyJnmu6BI9Z2bAGRyQglgeltOWCaSRdHM1UX5GgSz4TWhtWVj2cpyJyGi
         F7vs79HpF2o+V6jd/Al42DMNcsc5Ko5btd8FFtOjQPUVTumaVUXgZdEsVPSB9TvWvtOI
         4eq4xl7w46zmYyJmGUbjql3zH0cJIIx+/Orq2XDymJP8Jhtpfbd9AxqkwMpv1s1gVT25
         FZoRzYrSdkBSQwWG2vBbm+8Wt7/sVHH6Xvc7vfM+WmdTdrIPJAmKd9dr2R7SGKkyEHRo
         RS3UrmNtpY2s2ATmT0B/7hq7xNaR1+bwnGQiS5Ct03jV1+vNCL/0+IkmqLe+P4eUF1UW
         /P6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqJK/1J3s/fyKsm7hHw1bR65yxgLWlI1DlEuo5A68tP6rE7bX/07ixdkPBz7wu3g8kNyKeNccGDAZSNfM6AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeD5hSgxZ7BHuvme9Cks+bdQ1OUH7A0PPBYhtDtR0GEZRaPBDa
	WEoHgQ5TVTsXJ5M2CnVQV4jyGzLAtnTwx/YHsF9rRS98z1tpucWV
X-Google-Smtp-Source: AGHT+IHH/jAiS8eztdDv3OJ54xX4e+wGfk35wgeg9O1xl0RwV4+cHPWGc8qgfJO9GJ/nw75zI9A9tA==
X-Received: by 2002:a05:622a:134a:b0:458:3751:3df9 with SMTP id d75a77b69052e-45b5dedf233mr11314791cf.18.1727217422648;
        Tue, 24 Sep 2024 15:37:02 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5268e99fsm10583191cf.81.2024.09.24.15.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 15:37:01 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5A6EA120006B;
	Tue, 24 Sep 2024 18:37:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 24 Sep 2024 18:37:01 -0400
X-ME-Sender: <xms:DT_zZs4MbTKSlLN7rw8DuMeHEDry9xXFNgJQDi6sNOGXWiHJilyeJw>
    <xme:DT_zZt6jzStcQuJzG1zRZxNBK-9c9MpvkWWvfBgHOvnXPJxkgwX8Zgyh46n28yJdA
    tB_uRjulCMldERcNw>
X-ME-Received: <xmr:DT_zZreR0POvCEErD3r8AdhMwHhDszXAZYq80nH1mMkd4jXMIk3Q5WJQodGmzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtgedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepledpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpd
    hrtghpthhtohepfhgvlhhiphgvpghlihhfvgeslhhivhgvrdgtohhmpdhrtghpthhtohep
    rghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoh
    epfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhi
    nhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:DT_zZhLhT37nLquJue-6yJP4QZcyksjtDnKFwzxQqGkDF7geTuQf1g>
    <xmx:DT_zZgLFFOG7i6VBKU8vnnW-U_Prsas5-kkWfzzlplZW-n0Aej-tJA>
    <xmx:DT_zZixKllnaVr0FecbvW-XLLtZook-Q2XjcwASFVcYSk3cKEkKGsA>
    <xmx:DT_zZkKuziYfywRFlYyr6upxGtZVdxVt8wol-JtuyGuM5sYyVajEhg>
    <xmx:DT_zZvZKGCDUSnbcaI_hzItkQVy-CpzBIIQRmcciSrz7sYcVkk_SYjad>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Sep 2024 18:37:00 -0400 (EDT)
Date: Tue, 24 Sep 2024 15:36:19 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: Filipe Xavier <felipe_life@live.com>, aliceryhl@google.com,
	ojeda@kernel.org, gary@garyguo.net, benno.lossin@proton.me,
	will@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: add trylock method support for lock backend
Message-ID: <ZvM-46lb_CSPr19h@boqun-archlinux>
References: <DM4PR14MB727673292DEC9134C3FE559CE9672@DM4PR14MB7276.namprd14.prod.outlook.com>
 <ZvJkFr6kdVx8kIMq@boqun-archlinux>
 <4c94912d-b0d9-4b7e-8490-ffd91fdd2184@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c94912d-b0d9-4b7e-8490-ffd91fdd2184@redhat.com>

On Tue, Sep 24, 2024 at 02:31:43PM -0400, Waiman Long wrote:
> On 9/24/24 03:02, Boqun Feng wrote:
> > > +
> > > +int rust_helper_spin_trylock(spinlock_t *lock)
> > > +{
> > > +	return spin_trylock(lock);
> > > +}
> > > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > > index f6c34ca4d819..f4e51a5a1f23 100644
> > > --- a/rust/kernel/sync/lock.rs
> > > +++ b/rust/kernel/sync/lock.rs
> > > @@ -58,6 +58,13 @@ unsafe fn init(
> > >       #[must_use]
> > >       unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState;
> > > +    /// Tries to acquire the lock without blocking.
> > As I suggested in v1, "without blocking" is not accurate here because
> > a lock can be a spinlock. So you can just remove it. I think the word
> > "Tries" itself implies "neither busy waiting nor blocking".
> 
> Actually a spinlock in a PREEMPT_RT kernel is a sleeping lock. Not all

I don't see why a spinlock sometimes being a sleeping lock can justify
the inaccurate phrase "without blocking", it's still a spinning lock
when PREEMPT_RT=n, and function document should cover all the cases.

> people will associate "Tries" with not blocking. Anyway, I don't think it is
> a problem with the "without blocking" phrase.
> 

The problem is that for a generic Lock which includes spinlock and
mutex, "without blocking" is really inaccurate or redundant. For
spinlock, raw_spin_lock() also doesn't block, but it's not a valid
try_lock implementaiton. The phrase "without blocking" doesn't provide
useful or correct information to the users IMO. It should really be
something like "without waiting for the owner infinitely when
contention" if "Tries" is not an enough sign.

Regards,
Boqun

> Cheers,
> Longman
> 
