Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7982DA77E
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768877775; cv=none; b=Vv1GlOssTWzC6aNXhOHZIPPz4YXAdmnfgH6j8808HQDNBKpG9/bDr+YZt5BFcIEG9dcwY559S+TAas12+31kXvFvSHxvjJSaQxq6gRC6cm0axlw0le9anQ8LuTHi2FUkxRZzbdpe5pmrbH4HXEIA4KK8BVDAp5VfVHsvH96x3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768877775; c=relaxed/simple;
	bh=LjNcosoBkd+hXxP41Og1FVblSHJi2Fltz3fRwIqy8ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbkCgZ+8rzLuZxTGDbvDERpXw8UGHVEqYK4qmK2D9XIwdG8G/yjBOuUsNjyOO7BWMvuQrIVsj9wnaKCuIZbcdbvmNq53G983H0N4W838Od7pAmdm8/UgD88Ny56l2T5X9h9UwgYYXErfn9CF927aPVCL4iGMF6DmxqxLlywzNVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1IubWYg; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1IubWYg"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-502b698e510so23177881cf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 18:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768877773; x=1769482573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUL8iaVLz+PdX8f+z3skj6jMr6TsFbqBgExIZRI0Ebw=;
        b=G1IubWYgk2TLkqzXiprThzSfa0xLGavGSrX8o7M7mUEzFDGjATKMd2szLqZqd89C6J
         rf51W8SfC0moQn9MomNnpuj/qjgA9pfZBvhnML0JmrOywU5oMTNcH3mM29e9DLX3VJpP
         B2Lj9R5hSQTU/KyW4xHFMnc+gNKjfew2BYLk7mBYWFbL1kJUe71zEgAidQf5P9AZTgMm
         ro3/nYnv13Ke4LOsoHqU6TpfVq6G/Vrfo68NErFqoBxCrWqi+/fPpkRQelBl3OMn3VtX
         9olPAt5SxA7sFkDynPBiNIzADE+VqPTNBVnbssp7XetqcorTLEkKLOlSuWPTmDK71BjT
         z9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768877773; x=1769482573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sUL8iaVLz+PdX8f+z3skj6jMr6TsFbqBgExIZRI0Ebw=;
        b=vzsqk+pVveyBMd60WmQC2bZ3tsO6Al9MHoGyrh6Nr0HFnKDXx0xZVcFaaRoDHSyTTZ
         I5DQw3El1/lUHnwxwiV5CfS2SjTMdCu4VOWQZ6IBywBJpaGDh/2ag2tsQgoYyNJBDpGM
         WPgf/GRJpAjEBwcxsCOe0k4NJAD+0rCncA1vOtPLEM0hduv1rh5nYSlLRZnJQ8JXEEZL
         8hP4KoAjzXXfiEQ+yU7kvr+sHduVdNYf8F5dkFXPpbPWa6e7ZGNgZpv8oI7rOL5A+GTL
         EMERC+d3Z4KW2/MqYEb4d+f4v8WRWue55od9+TO1VdE+v2G3PFQCR2sDXqR0TW7FKkPR
         PWFg==
X-Forwarded-Encrypted: i=1; AJvYcCXpZzjNXXfqeWkcnwBTDp6YtbqvVcClaSiiE7cnnM7wjAFNG9qZm8b3H+yJ8TV/18NwCSsWHUwNcJk7ap8lzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYyVHHQs29ltuPHC0Cw3GxKUlFLOMk39e7uotkvrd7E1odgLOw
	t3KSNlg4DbyFevzXdCVeysSEKE9Cw889eek8lnSEPNoWX/TyG+mwrhK8
X-Gm-Gg: AY/fxX4EtOOMnIoAwEZwri0J4tvs84s9WVhiSQWxHw+/fmX29NiEjiidLx6TO3rdde2
	LVxrglSRYgsn7vrZ7LgfK2USNl3XveRYfnWAveaPpHJMMtp/8pAN0nhqXYFHQYNtOjptvvZ9YVU
	UGBA3o+qiLLFLKg0Yz6okTtfsa9b7yLuFQK8fhZz+NF9j0l6zrbVbgFDkXXlG+pDSWpo+fd9wpf
	ik3D8oTn7jkfjYcg+doPmH9IMZrcxmnx7GPtV5zGuN4k5+Rk6hrGV9Ps22qLlJxn5PMxks409IC
	vxwxkqK3ebIg7zjnPQ1AbNfHY02dbK+HzCmHF05h29IQYHVQ+2TsI/MZw+FKrUu9R4+Rbhz+pLR
	KMp0jAGhuqvs61cJjZ3rTPJ0xfAK8yc9Eg+kSyr6xuBdjMP3xw0LatHucmq+oHzcfUIHkJIH6/F
	Ox4Xo8zciIPeeixgcHSSg+NK6978bQMi9UULRRT55YWIzSuj7wvPMyisURyM7L1OzWvAxU9Ip4U
	bBChQx68bzEdl0=
X-Received: by 2002:ac8:7fcd:0:b0:501:1458:b3c5 with SMTP id d75a77b69052e-502a1f99ed8mr182519291cf.67.1768877772701;
        Mon, 19 Jan 2026 18:56:12 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6031b4sm93625526d6.15.2026.01.19.18.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:56:12 -0800 (PST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9A98DF4006A;
	Mon, 19 Jan 2026 21:56:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 19 Jan 2026 21:56:11 -0500
X-ME-Sender: <xms:y-5uaemikq4lBJ1waGA6it7OGVomhFYH9sK76LRZsMr30yqBJ_w10w>
    <xme:y-5uaZimXu1nOLwOZX06DPMMG_zKSd2yWLUCOFkVF3EO1DFMgCTHCk62rYh0pfPO4
    Qo-O-wUtnZ2VoyBlLFNXg8IIxkg5uAonOEsWpBZpUVetgtGijSwbrY>
X-ME-Received: <xmr:y-5uaVTMkEargZjYXgqJqXmN8ZadJHK2vTddllWd--LDFuHXe2ZHdEpO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeelvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsghjohhrnh
    efpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:y-5uaT-_KomPAgVZHObaWwAfBrgsZOQ4iiBa8G3Cb_V5rnsJxafBIA>
    <xmx:y-5uaeOPhN6AG6rhBWv6Pi3-4nyZ4avrSEMtLW5vkQpJWWraZfCMAg>
    <xmx:y-5uach0GfXBrCDsPIs3t_iCiSRi_Kt1GgvbtqoYJckIEhEFZoPvvg>
    <xmx:y-5uaZn8nTXsaBno348SSMM3TV2EAPAuwf4PejfKm4epSVE9J2Ssig>
    <xmx:y-5uaRODIpGh2CMs0oyZbhjQOA4DN9Y7OjTs9EkbF6qs1GjGvFC40GDc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 21:56:11 -0500 (EST)
Date: Tue, 20 Jan 2026 10:56:09 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/2] rust: sync: atomic: Add
 performance-optimal-integer-backed Flag for atomic booleans
Message-ID: <aW7uybpl1rIYRffg@tardis-2.local>
References: <20260115021230.3297420-2-fujita.tomonori@gmail.com>
 <aW2HQvo2h46WecQ3@tardis-2.local>
 <20260119.121025.255021656975699898.fujita.tomonori@gmail.com>
 <20260120.080851.1721614339637284826.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120.080851.1721614339637284826.fujita.tomonori@gmail.com>

On Tue, Jan 20, 2026 at 08:08:51AM +0900, FUJITA Tomonori wrote:
> On Mon, 19 Jan 2026 12:10:25 +0900 (JST)
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
> > On Mon, 19 Jan 2026 09:22:10 +0800
> > Boqun Feng <boqun.feng@gmail.com> wrote:
> > 
> >> On Thu, Jan 15, 2026 at 11:12:29AM +0900, FUJITA Tomonori wrote:
> >>> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
> >>> users can use Atomic<Flag> for boolean flags.
> >>> 
> >>> The backing integer type is an implementation detail; it may vary by
> >>> architecture and change in the future.
> >>> 
> >>> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
> >>> particular, when RMW operations such as xchg()/cmpxchg() may be used
> >>> and minimizing memory usage is not the top priority. On some
> >>> architectures without byte-sized RMW instructions, Atomic<bool> can be
> >>> slower for RMW operations.
> >>> 
> >>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >>> ---
> >>>  rust/kernel/sync/atomic.rs | 71 ++++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 71 insertions(+)
> >>> 
> >>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> >>> index ca9cab77abf0..58f57903460f 100644
> >>> --- a/rust/kernel/sync/atomic.rs
> >>> +++ b/rust/kernel/sync/atomic.rs
> >> 
> >> I prefer we can move `Flag` into atomic/predefine.rs, I queued in
> >> rust-sync with the following version, please let me know whether it
> >> works, thank you all!
> > 
> > Works for me, thanks!
> 
> If we like to keep the intra-doc-links, a workaround like the
> followings seems to be necessary.
> 
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> index f6c7538cb47b..92e312c06595 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -156,6 +156,13 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
>  /// flag.store(Flag::Set, Relaxed);
>  /// assert_eq!(Flag::Set, flag.load(Relaxed));
>  /// ```
> +///
> +/// [`Atomic<Flag>`]: kernel::sync::atomic::Atomic
> +/// [`Atomic<bool>`]: kernel::sync::atomic::Atomic
> +/// [`Atomic::xchg()`]: kernel::sync::atomic::Atomic::xchg
> +/// [`Atomic::cmpxchg()`]: kernel::sync::atomic::Atomic::cmpxchg
> +/// [`Atomic::load()`]: kernel::sync::atomic::Atomic::load
> +/// [`Atomic::store()`]: kernel::sync::atomic::Atomic::store
>  #[derive(Clone, Copy, PartialEq, Eq)]
>  #[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(i8))]
>  #[cfg_attr(
> 


Good point! I was missing that, however I think we could use `super`
instead of `kernel::sync::atomic` in this case. Already pushed to
rust-sync with the following changes, thanks!

Regards,
Boqun

------------->8
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index f6c7538cb47b..5faa2fe2f4b6 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -156,6 +156,13 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
 /// flag.store(Flag::Set, Relaxed);
 /// assert_eq!(Flag::Set, flag.load(Relaxed));
 /// ```
+///
+/// [`Atomic<Flag>`]: super::Atomic
+/// [`Atomic<bool>`]: super::Atomic
+/// [`Atomic::xchg()`]: super::Atomic::xchg
+/// [`Atomic::cmpxchg()`]: super::Atomic::cmpxchg
+/// [`Atomic::load()`]: super::Atomic::load
+/// [`Atomic::store()`]: super::Atomic::store
 #[derive(Clone, Copy, PartialEq, Eq)]
 #[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(i8))]
 #[cfg_attr(
