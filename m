Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3892018991B
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727425512; cv=none; b=SxE0BZZjUAbE9TqaKP3s593KixSshr0XgXkOaDPf9Hmv+hIpLLQnEsQd0O0rNgqqvLZzVQ7uOTX9M6y7IFNKYnMa/y/g3DcOfHGgBntseQ/ity1itJd3FvUr4uNQ0V+KsfGFv4EPs2VI8mE1KpBSrVNN9bFAXMce2oHV7ztOOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727425512; c=relaxed/simple;
	bh=kfMECvOvu6eqzc9JWxO75XObKjU1fzkt2sI/1ZBQXc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4sqJxAoLwHd8VtTDxlGFrqesgyPBvppJYBw9DxiRcOQfLiY4XRFHLr3dMxqVWMF5sh1MnMdsUKA04AX0I4rtPwY21CvGRDzmt1hqk2tArqSmDqwTLtYcp3nr1HfA2+yGWU+NcvT5kefTLy2+pyoZrhV31fhwVG+J7rSu0a0/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ffu79p32; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ffu79p32"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a99fdf2e1aso209501285a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727425510; x=1728030310; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sSw+l8n0kkiQlR6h3xqaBNbPAZ0Rhg8gMej9QNK3Rxk=;
        b=Ffu79p324xddxbMsa0wlZgVv77SO7DRkuU9h8p/YT3Kumbnv+joQoZDgkrO8Z3RDm9
         jrBGGyrV7BdTKs+uAh+9Sc3MwxFOasdYAbiRFFS58woTJqvzWWVdukdIHDJP8XgYgWMW
         y6O0dN0WTkNgQj8BhU+u9xnhnRsYNgLEpq30y/DtiC5dXcO89wLIEesPPsrCxVt5NT2i
         IBuGCkFGrmOA9QuRDU8KepQoW2kYOvZjHmgAzvgO4HcOfs4iAn3AAvpr/klu0l6P3a91
         X85O32qnoy8gAWdGL5Pw5bHtJb9XwSeD4s4npGjNdRqBnJYq4/wJsmG9XWMuwzAM3+2q
         SU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727425510; x=1728030310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSw+l8n0kkiQlR6h3xqaBNbPAZ0Rhg8gMej9QNK3Rxk=;
        b=MXcp6g6X9jhlmSewuZKWb75FRAKhmdhz3wNsg+x6Ihom3Fr1qF6fSa/UgarfVuYXoD
         f+cADKYhvQFRWO5yl0hgT7ejIc3fcrv61HfBDM1Aw2u0y2LQd+EGwUCb10nn8eqi9wc5
         V3WfTasjvgrd5VZlnty7W8EqIMBFXDUmyWai537vf4ORr4zKT9ZH16a962LLa9cq95Ww
         qAsw3GbXsfremZWtyGPdQ6AZ8U+uWzWCfBGo0Ew56n187w2CPYvLTqFyWOxjIJxyo5bm
         5ryvLzYDqpmAxQvFwbUC1nH4C8+nqaZZrVJtnrXfB6eZVjB8HK+T8CyylTfAB3JxLIeL
         1WCA==
X-Forwarded-Encrypted: i=1; AJvYcCU/c47Plz6rdwj1MI3LWFIKuMRoEMk2IMBNII/+nRauUzpGbXgV9WHJooCr3eRi+CjsTdFjsd+oyXqI2X0CbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQVfB4rSOhI6ykZLmXb6jmFLtMXJF3qp0WS4hd5AtDAY18LE2H
	plldAlPXTIQynoD3TNWe2XzShhpnNKGrsHpknguVoxGoD7Ca30rh
X-Google-Smtp-Source: AGHT+IEdXJl+PEuMsIjH1X0VZlLE4JPlbLLolGKJQUg86trnbGRb/k5rPHOYEPPR4j6tLZAcdIfUFQ==
X-Received: by 2002:a05:620a:19a3:b0:7ac:b04e:34c6 with SMTP id af79cd13be357-7ae378c2d79mr397463685a.50.1727425510010;
        Fri, 27 Sep 2024 01:25:10 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3782cd54sm64049885a.94.2024.09.27.01.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 01:25:09 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 909FA1200043;
	Fri, 27 Sep 2024 04:25:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 27 Sep 2024 04:25:08 -0400
X-ME-Sender: <xms:5Gv2ZipB_nEdJRzhAWhb_E3WV7O0CuoQIuHHhdZxYQqMrQu8GWNjkQ>
    <xme:5Gv2ZgqXe746N_MZdoE0wZsWmVpM7vSJ0uRqZLXgiRCn79S5L0s6542AzW_S4XpCZ
    pMO8RZiuQsXKMdthA>
X-ME-Received: <xmr:5Gv2ZnOj6gSeRTLFqzxm7hbsHrLXTqeLeKt98DBt2hlOTxNcPM8aRrBdNsFgNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtledgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepjefhieekkeffjeeggeeuvefftdegfeduteel
    geejledvffetiefhleefhedvgeeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfhgvlhhiphgv
    pghlihhfvgeslhhivhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohep
    sggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtohepfihilhhlse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtgho
    mhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:5Gv2Zh5WqJNMHZ8xR_ynMkrWMmOImrbsyjhOmHdHG7GoNj69skyMqA>
    <xmx:5Gv2Zh5j97-JV1S6UKE3Y8ribuUd4dbJv6Lx63WY5u-tptdRX6X3kA>
    <xmx:5Gv2ZhjE8OMyvlg4JyBD1iS-9zhO_zgysjNNWvIda9SV-bAOerTwHA>
    <xmx:5Gv2Zr6fbmYwaXZCzdcslzq5gUL_ProRBOQho-8sPvYoGC-MX9pIfg>
    <xmx:5Gv2ZsKEdxBV8hG_QPSfDylKIh7t4kNwG-xVr9G9Pbg-IHZkgpsQRBP9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Sep 2024 04:25:08 -0400 (EDT)
Date: Fri, 27 Sep 2024 01:24:20 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Filipe Xavier <felipe_life@live.com>, ojeda@kernel.org,
	gary@garyguo.net, benno.lossin@proton.me, will@kernel.org,
	longman@redhat.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: add trylock method support for lock backend
Message-ID: <ZvZrtDAaqq-XHqGy@boqun-archlinux>
References: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CAH5fLgjLLvaT2n9seJRp5WFTHG9kNG1wEWAi5FUWzR172tf4cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjLLvaT2n9seJRp5WFTHG9kNG1wEWAi5FUWzR172tf4cw@mail.gmail.com>

On Fri, Sep 27, 2024 at 10:03:43AM +0200, Alice Ryhl wrote:
> On Thu, Sep 26, 2024 at 10:50 PM Filipe Xavier <felipe_life@live.com> wrote:
> >
> > Add a non-blocking trylock method to lock backend interface, mutex
> > and spinlock implementations. It includes a C helper for spin_trylock.
> > Rust Binder will use this method together with the new shrinker abstractions
> > to avoid deadlocks in the memory shrinker.
> >
> > Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@google.com
> > Signed-off-by: Filipe Xavier <felipe_life@live.com>
> 
> I guess there is the question of whether it should be called trylock
> or try_lock. One matches the kernel, the other matches the Rust
> standard library.
> 

I prefer try_lock, not because it matches the Rust standard library, but
because it matches with other try-like APIs.

Regards,
Boqun

> Either way:
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
