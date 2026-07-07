Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B641D4E7
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444330; cv=none; b=c+L/Q03F0y4UgtaLmh79nTFslJSvPejchTd24T9K3npWGCcUa/y1cU44iaTOZBs//ZX5MrwEDz/ABzOgT0kYBrgLo1814vISSComcnKD/vSaGlrziF8AX5vqVqmalx3C03vvY64yrC/D/XIpz08pGMS0nClisXL5RxeOS5yED18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444330; c=relaxed/simple;
	bh=MZlwoLji55LDEIi/ba35T6ENHdW58XbSVzpHtLVVU/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuVeEVm9Oh+3GMHp9Vcer+8S0cGNhBDp1GzfcIDHlQI4pB2Pmr29vIaV/NMDkZh0Zt54vvbtbezxQTeB7CkelPzzm5HLaLXnJB46OR5cldpC+0tjDfX4mCyOCO7usyPJajbXhCPd76rsdtWzaH5X4AQlPe9CXanxyFWvLIBPxUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EV/JdUb6; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EV/JdUb6"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso2136180a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783444328; x=1784049128; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=maQBLqx55rvjjXzubLY4/j31Yf1uTR7Ozp3LJ/moHrI=;
        b=EV/JdUb6kjTivWB19ymx2uqv31cJ70uyFWylooFay4tlvPa86F+2M/AyLl4Pz8TJ2I
         z453Cp2Ftbfi44fReNhSmry3oqvcsHEpbR0ptongxoEBSKMqk6F4UggODFn3sRvrcweU
         J1TWsQqpASNi7t28bRaDZieILIzxTDs1h5p9DQ+wdX1Cw5JhBwIq2h0Mp3lHoEU3gQTD
         AXfLEp1OuYqZa7jyouVpFM4D3Vfk3Prhf61NlETbQSzAt4xA81xE5JYg8L80Tojs4BBW
         tgkAuXlOuyYsb/UA1+zfXOaWv5em78q7EBodbjmyfgncRd/Xe4LbyOxl244oHoiNYVNO
         uGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783444328; x=1784049128;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maQBLqx55rvjjXzubLY4/j31Yf1uTR7Ozp3LJ/moHrI=;
        b=ey/VQqXwULQVMTdkH+rxm1udz7sCkyd8T0TvmqXc6LqE+4gQFF0q9/z977KjJ2GcYK
         l+Jb6mz3/zKsx8DtCZdypULtVFKBp8IfLGceuXMESCV59kONFPavf3GdxhAURBHXvdBY
         g+5tzWM6L55qEzpW+p2jZQLkgpLDLLqyxIh2a6vMHjcNLORsB2bM2HM30zY/S4B1x3Nc
         Q9pYIYwrGBA2tdcRvf13P5alwNt6ngsdMjMAGMhh6Q7QUDHyknxx9liBai5u3uXIipSH
         yT9vRin0GImivWc80WqjhsNqS+GRYxJNjNfsrZYof+PcE9z9+fJfC7ZamWDYxptlP3hZ
         XSfg==
X-Forwarded-Encrypted: i=1; AHgh+RpLO/PWL13YoeTrWQERJIsQql8Rf+0wV1FaGPdpjdMsMw3koo4BlEwGpBbv/uRQ7UeQWTh7NNrcq74F8W27sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcEp7sn3M7TLS8CPi6uxVc/+d1AV+ePv3/lM+yPX2B6Z9T+EWM
	YuHhezAmVLvstjFkBLBgZlVXOgbfhNMyUUzrjod45Hx6Qgpxk1j0Oz1s
X-Gm-Gg: AfdE7clb7+rCMXE04AuRHsP5sVT4DSk/nxNMwvA3y3pg8jZfijZZhEu3lvw9DhIpQx5
	KHqDHYteaF60Ytb7QR9mqaSSAPqp5XVS2kejm3o9cJuKD32b7464dUSm231s6wdmKinmhno+qGH
	qaoC9M5bTiWconFTKpMpDmTNAzIhoNTTkc7nEubynLIbljRuAMvDepZ62jMFeOpy5msS5s3cPDP
	D4B6i2ADWUxkl0AA5iOszn4hZ5zC43J0p3oZ3Sa6/0w9MIemxoBpGAxFNnn230Smx+mD4nselHa
	60eArVO2B21q8z7ZxjCHL0dlKTIdxeZGm5N7RLqRD3KBJWqkoveqbfyNaD1aOQUDEpNY8O0l5fx
	tLrNQy3MGPoRc6M5++hLXDFH4w19Mp9WIEpHuKtT9QJrtMwHQ4594yevowUulJ9iCDGn8Xj1s46
	0u7KUs6JEcg3Tj5AYOeZooWumG2KBtn7xJ7uk5iB/EnC53LaZMONNUwYtftBVT
X-Received: by 2002:a05:6a21:e098:b0:3bf:e94e:e38d with SMTP id adf61e73a8af0-3c08ef09cdbmr7227999637.43.1783444328420;
        Tue, 07 Jul 2026 10:12:08 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm15539333c88.14.2026.07.07.10.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:12:08 -0700 (PDT)
Date: Tue, 7 Jul 2026 22:41:53 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, fujita.tomonori@gmail.com, gregkh@linuxfoundation.org, 
	prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, lyude@redhat.com, 
	airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ak0yWkEQtCzBt9qe@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
 <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
 <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <akyiZBPCaZOOyTw6@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <akzTCxnSgxba7Yen@luna>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akzTCxnSgxba7Yen@luna>

On Tue, Jul 07, 2026 at 12:20:59PM +0200, Link Mauve wrote:
> On Tue, Jul 07, 2026 at 12:41:37PM +0530, Mukesh Kumar Chaurasiya wrote:
> > On Tue, Jun 30, 2026 at 11:15:03AM +0530, Mukesh Kumar Chaurasiya wrote:
> > > On Mon, Jun 29, 2026 at 11:11:44AM +0200, Miguel Ojeda wrote:
> > > > On Mon, Jun 29, 2026 at 6:57 AM Mukesh Kumar Chaurasiya
> > > > <mkchauras@gmail.com> wrote:
> > > > >
> > > > > Sure i'll bisect. Meanwhile i would still like to get this upstream.
> > > > 
> > > > It is very early on the cycle -- I would suggest bisecting first.
> > > > 
> > > > But it is up to ppc, of course.
> > > > 
> > > > Cheers,
> > > > Miguel
> > Hey Miguel,
> > 
> > I was able to bisect this. This got fixed in 1.87 with
> > #![feature(asm_experimental_arch)].
> 
> On 1.85.0 though, with this feature allowed, the kernel gets built
> perfectly without any need for 1.87.0.  You might want to require 1.87.0
> only with altivec enabled, whereas on 32-bit we can build on 1.85.0 just
> fine.
> 
Even without altivec and vsx disabled, It's not building for ppc64le.

Regards,
Mukesh

> > 
> > 1st commit that contributed towards this is
> > e4f539ea17a3 ("Bump to version 1.87.0")
> > 
> > This caused another issue to come up while building
> > 
> > ```
> > error: extern blocks must be unsafe
> >   --> /home/mkchauras/.local/rustc-src/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/powerpc/vsx.rs:38:1
> >    |
> > 38 | / extern "C" {
> > 39 | |     #[link_name = "llvm.ppc.altivec.vperm"]
> > 40 | |     fn vperm(
> > 41 | |         a: vector_signed_int,
> > ...  |
> > 44 | |     ) -> vector_signed_int;
> > 45 | | }
> >    | |_^
> > ```
> > 
> > Which is fixed by 
> > a78d1b092c9c ("Update stdarch")
> > 
> > Both these commits went in 1.87.0 and fixed the build.
> > 
> > Regards,
> > Mukesh
> > 
> > > Sure, I'll bisect it first.
> > > 
> > > Regards,
> > > Mukesh
> > 
> 
> -- 
> Link Mauve
