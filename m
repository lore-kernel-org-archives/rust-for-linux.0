Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7266196
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Mar 2025 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741411957; cv=none; b=PfLx/JSn8i7ObLkkW+Zz5gFijkrFGMXJytGXENCGp/3Yb7xcmCiHd6XSo0s5cLe7bpR1ZuUMYYBLhYdven3uPn0BZa06eRqtch68bHoxsSrkytP+AkkL/Jl9nyg4fbHzByNXyBmnwmtjAKoXOxO/quSIQCBXWHdPkqkm3w7kP7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741411957; c=relaxed/simple;
	bh=Diz0o5iYN84VwuvwQOoc5HZBn186KpLolBCji9g79Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1neAJis1TErJO0SLu5J+fg++lYCM4DQPR+e54VEl5SloWZuERFWtmVPwS9GNigXzsblb1aQ4jRrf4MWYsQ9z1+hzaBfT77vGfVyIS8Bd4pM6oIvuyO7LsD4EkoLKxdh5OCPRPz899HFhPzh8hRxeyodRtK0YLCkAqgTvFsfzQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bof6fh7g; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bof6fh7g"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c53b9d66fdso95225885a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Mar 2025 21:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741411954; x=1742016754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K67TDbiTyzQGYWfCLJEBWA0HKyUTzEjvMYp6LBTAL1Q=;
        b=bof6fh7ge0OhYRyT8gOsMMd6PGkWxfMTTGd37X11MWOI4yeY6HRRi9txSP61sjsycO
         4Y2y1d/YEKtN7OrwNkR3ip+8z3T/r9bQ0a05PXhTB7PppovicnG8dEogM2TkSuoX97oF
         +WxbwZA3ZrHkIQeaqz+fk3Ibvbvl1CJVBjViyzSH8Z25dURVjdsj/Mr+bF5R7I9xnukU
         BxUcbkNiU0mDiO8il7MDhKPsU7MpB67tQx1EQSB1cOnJoNJRndccuEkvRtrDqeOQfCRm
         AhiTYQkhxAPnSdlG2ixrY5eGAdP0qjchsErW/q/g7IKIyw1NyPbn05y9E4d+mFFAy2/N
         gt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741411954; x=1742016754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K67TDbiTyzQGYWfCLJEBWA0HKyUTzEjvMYp6LBTAL1Q=;
        b=Rf1sID5LkHonfj9pCw93Ujpi3eyEe4ys40B7fHy0D1/U+vhYL5jGqWjrOaRdl71wNL
         5B60SnsgmFSNlQxrUSprsnIWRaYep3cfsvi3gvC4mg7MGyp3qj+6fPzBy3vWjJoPuXBC
         e8GmbsS8XD7MebjzjIeS5xRqNNTsPgu1c6V76zOgDgZReYM60o6FVBXVwj791fAFvW99
         OCL3KHT2uBEDQsWHaZS84R2BPYob0TMqi38gYHf5LnlE8WzbcwBgdDXVEd7m8Ug9m72g
         4rivGP61XkLm1QXD9i3wMlxIi4H/sofNOtXQb4y3MviAJ/nw9jXN6Obn/4S2jKSdUyhP
         Nb3w==
X-Forwarded-Encrypted: i=1; AJvYcCWfKLUk1Ne2eHrN8qboqArGVzI1cFrz7OhJc9QAAYfnnwvUgaVfp10v4azBLl4D7/tCu8evP7AGSD/UmqBPmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFV/zKYqMLuwy1alrQM7dyC7GxABiQzDG+qN866mWAALs6nUVS
	ogJXn1x3rPGdS1t+f4YJ20CX1CAZMOMgEllCulGLooKDQqgj+hnE
X-Gm-Gg: ASbGnctR3vHKaoZt9XH0CikV+5nqFuJOn0OzWo+fF4UMr0dPASr2fDRbd6NpAwp6jeF
	Oxuxma724BytSgF4P3kFTOrwn5HZ2ViYabfYav86VnLnrjGnrL8lhR5riKyLfZK43zbAMmDB5dc
	iCTeYXAUZFD7VkmxD3CAlXwQv4mRmevgsdgyx4P0QfPF6EM2JqQ/Ekiqoxrv5pwfZu6eF/s3Yk6
	fSvuK/SLM3uL2pJAF70+BtpwhW6djioV7itGJ7d/rW9DD1JWjiGubA7sSBXHtMKyd3oi9y7v2uk
	l0iWuoF+sfWhQK8HO7SspB0NmckjOHntZz9uL66HViO2JBIOuDXSSHMzNeF0QApmp55DNU8hcBf
	hFFOIekrP8U6LaPgThIJo37jmTaUO2DkDmik=
X-Google-Smtp-Source: AGHT+IFuCZ6++NMvfn0lkrBwT8eIlLCwQTpIKA1vFEJTzt60I/LcNvczw9TkSqSkch3u/x58Z11zNw==
X-Received: by 2002:a05:620a:2b86:b0:7c5:3ca5:58f2 with SMTP id af79cd13be357-7c53ca55ae0mr372282485a.7.1741411954243;
        Fri, 07 Mar 2025 21:32:34 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e5511047sm342819285a.100.2025.03.07.21.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 21:32:33 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3BA4F1200043;
	Sat,  8 Mar 2025 00:32:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sat, 08 Mar 2025 00:32:33 -0500
X-ME-Sender: <xms:cdbLZ927Qhsix-5v6qVQSZ9M1IssLLsGOgYU_kAcQeYn190H7jnb6A>
    <xme:cdbLZ0Gn5K2KZ8TZu8yuPeQUc_0dZyz23nWGJPY-mWDySZ_ufK9WkaphBlPsoM4jg
    D5n3ohihDwReBug1w>
X-ME-Received: <xmr:cdbLZ9706_3imwtt5Isqa6YZxVe0NjxggPk3pkTgrqbYN0gpAx8b5gAF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddvjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhise
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhope
    hruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpgh
    hhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhi
    nhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:cdbLZ60iAqF3gyta6erVxw7ZVFOwlPBA0hYHhT9RG1Jz1avCia90tw>
    <xmx:cdbLZwH2z7LSAGPx2c8fCTJme4Ru35tCkAQjNheVCt58_vL7JwwC2w>
    <xmx:cdbLZ79AYyHvoSijb7M9x7REp6n4i-2V-MifDYKt09-X16jp7JbT4w>
    <xmx:cdbLZ9m8HyjKnZE8SewZMtorywFCpkzRIyWOu8jj3qatmXk_yRiBQQ>
    <xmx:cdbLZ0Er6-e7poK6kc9-Y5MBYGUqX1kMCo5XDooJb-fe3RhFWFUsL4EA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Mar 2025 00:32:32 -0500 (EST)
Date: Fri, 7 Mar 2025 21:32:31 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: module: place cleanup_module() in .exit.text
 section
Message-ID: <Z8vWbxp7BS3fKd5f@Mac.home>
References: <20250308044506.14458-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308044506.14458-1-fujita.tomonori@gmail.com>

On Sat, Mar 08, 2025 at 01:45:06PM +0900, FUJITA Tomonori wrote:
> Place cleanup_module() in .exit.text section. Currently,
> cleanup_module() is likely placed in the .text section. It's

Do you mind compiling a module and using readelf or other tools to show
which section the symbol cleanup_module() is? Putting that information
in the changelog would be nice, and it also shows the actual effect of
your patch. Thanks!

Regards,
Boqun

> inconsistent with the layout of C modules, where cleanup_module() is
> placed in .exit.text.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/macros/module.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index cdf94f4982df..36daa149a691 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -275,6 +275,7 @@ mod __module_init {{
>                      #[cfg(MODULE)]
>                      #[doc(hidden)]
>                      #[no_mangle]
> +                    #[link_section = \".exit.text\"]
>                      pub extern \"C\" fn cleanup_module() {{
>                          // SAFETY:
>                          // - This function is inaccessible to the outside due to the double
> 
> base-commit: 6ad64bf91728502fe8a4d1419c0a3e4fd323f503
> -- 
> 2.43.0
> 
