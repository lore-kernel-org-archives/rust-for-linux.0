Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C914F13D882;
	Thu, 23 Jan 2025 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654975; cv=none; b=KFDVbVRiIuMXxM1j3AQGvhJ7hjrh3xRGq016xl7CJkUj55DZ39s0VxWfzxmAKUdS2TWe8KEMOQX5sQ01wxeJNJTtQm+xWamOFGDlKITnMWPu5wE2OYGDcT1A7mpIG0VF4253ZhcITwo5ezSiOCKPt7GUcoJr76vR86ycmldzznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654975; c=relaxed/simple;
	bh=oB5byHYcXICr48oguFHqQiZwNiiaUeJzBGH+h/I6T+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMJ4oJREOm0aIjQo9EgDTYKDbe4fv7hmr/3bQHBPlgcaq9FZqJwaSbCb+an6ZWYGIkQXHDFocj/wWNrAFa54YT77a/ae0y1IqbXpszAV2h+J9PzWucb81TSOmJY3W/5dJjkTGlLo2WDZrP8jQfAcWzP19OHwgEb3u3m/NkmuyfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpjT0c6o; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpjT0c6o"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b7041273ddso108265485a.3;
        Thu, 23 Jan 2025 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737654972; x=1738259772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oUAu/OqEeLAQ0fvRyiESHa5gLpc0dvW8KSbvVOnv/s=;
        b=MpjT0c6oGMWlWAvx5oMrkQlTBxBPYUIhT7DsiXueHma2BQNscFBzr5E9/VJ9hFiJyz
         MgLcCdQUKx2LkamqNgARlDU//pMCiRuXXXKThFQg70EnCZksDcobQYBNPHeRgEZLBsPH
         SDh3N6ZyEbh5Rr2Mqm/2LznJQsTxDJl16nxaFNdO4UneJM/6xkuBbc9gA1opoHVv0T7X
         FwHDGmB6+1dOpGwoloN3x6D00X0nsh4Lv9+qAqRjG1XN/VsC0zTdd4bZDYWGHS6wxi6Z
         5w1SaARS76niuK/qoSwXP8ZXwQ7fEogFTe0BusJn2iJ18pXPSXYFbesCAFlSe++3K0OM
         3G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737654972; x=1738259772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oUAu/OqEeLAQ0fvRyiESHa5gLpc0dvW8KSbvVOnv/s=;
        b=v0VDfNAIvWfFOK8p8SoN0LNHYJfTWTcf1lA/Tz+7Co+CG6WEDo5AhZnJ25kTpiehAp
         vQMELWqbgMVpkg8rBLRqt8kTCzqxG23hZ1YPGRZIquvv96Fzppzz1K2rBpW/tXSxo6Q9
         nSfgnsGskO1JWbXZO3BOjPS/etntG4CbSjZ/HYbIC+k9skz5L2ZVzBm7fhRf/jmcxL+t
         FnmiEUxyV/dP1J0oy/pAzT3MX0wLEdFVYR95TR8borIl9VHsopCPT4B4I3b22ojBzBcR
         3LIZtb3agV8jGeTjyKWNOIJ9kodKyFnLTel42IxNZ0Aig7Q1pskBrlD3C5fXWYUhtfBX
         QmRA==
X-Forwarded-Encrypted: i=1; AJvYcCVbgf1j6Xuvq1AGd+XCBsU7E6mYLJXs/1G+CZseCtk2EBixIUe4RXI64bkYWxtx9lSq87YgTrMEZ/rQvv48zmw=@vger.kernel.org, AJvYcCWQU6fAnC9CXSp+sDrwQKGBMVQ0JEY06FA2cuUNymJvkO14NCdU4lI/coK6f1Oih7egld/twQfWnEd5hxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHmqtqBD15cJVSUdNsUCmX5tyu+1ZjiJuhHCgirh++y4HQAZbZ
	FLxXHjLkM32tDvRlTAurKF5/SrGPOJRmqZCxilQMLBmxBfZ6QzCO
X-Gm-Gg: ASbGnctskuBg1s0WGyGv90XIINDC4aCr1p++MaLRN61xAc8RwpmYlsvB8CIB10BlG3X
	qlPAME8DfIRmn5dkk1bmcq+Ugmj9sFC8wOV/XQinSZOxWVo2xYt/sxX9I44yLCbO5Vp62Jrd6VT
	H4ZVvrrf435cI2M/ghDAW3hPlJ452wwvPZMkMT+0P/6bu5l6eDqQtvSy9T0Padug/dGmWPv0Zej
	sQqSkQ+i7X+ggwuO8MSj48DmK6msS1Esi0Z8GRFsrXfrYyAaUR4O8cJSOvsMBGCX4y6F9TDkqTE
	Bb5IlyC4kKUptYeZVAkDWuyCNqzAiRKRh+CGlQH/B/hpXtsEFgtUm1q4uih95dF2tzqH70Q=
X-Google-Smtp-Source: AGHT+IEgNHJadBKXHjjyzOD0Wv6hgxPNtUxEnG701TRPH6tw5ic+GzC1EVVk6w5KiXUwr+onxL3RcQ==
X-Received: by 2002:a05:6214:d63:b0:6d8:871d:49f1 with SMTP id 6a1803df08f44-6e1b225069emr331515216d6.44.1737654972587;
        Thu, 23 Jan 2025 09:56:12 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e20525b0ebsm809416d6.61.2025.01.23.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 09:56:12 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 71C761200082;
	Thu, 23 Jan 2025 12:56:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 23 Jan 2025 12:56:11 -0500
X-ME-Sender: <xms:u4KSZ_xSdPnCkDnQwyZXAtel7ymnHCDLDj9jhtoDsMRp_PlMvUCbhg>
    <xme:u4KSZ3TZWwkefjDj63KN8RnRCDC379yuhqcElrtDZEjqgD6HUNOCSeVjtX0BfQ71Y
    h51qfSlnJb03FBI_g>
X-ME-Received: <xmr:u4KSZ5UmyocURuzPlNetaZkMkzbt4qhqaX6Es4IZ_MJ2uipv4bD3I32sEfsNgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvdefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughr
    peffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvg
    hnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghr
    nhepieeuhffgudelhfevtdetleffheffgfdujeevtdduhfeuveeftdetueekuedvfffgne
    cuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdhiohenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmh
    htphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedv
    qdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnh
    gspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhhr
    ihhsihdrshgthhhrvghflhesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoh
    epsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggv
    nhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusg
    horhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:u4KSZ5i3-3skdPz7tzY-Yk6GOF_vOkXAuynW7QQA-NYe9ecAHc4FRQ>
    <xmx:u4KSZxCAgz23nNvHWgsOmT5bbETZW8cKtAYt6yKMHrHp0Q1kh51yfQ>
    <xmx:u4KSZyKDssVl1JwJ-vNV0IN6KgVhf9P_CmKt0s0-wyn7FZYij1UAjw>
    <xmx:u4KSZwDzx2AK1SCaeIpi_meM-LfBiXhgdUKF39KrttVJ4DfnhZuojg>
    <xmx:u4KSZ9xDJeaBXPb_SrYXmlGKr1Z6r_Q95E2JWLDxC0ykLuoRDE9w7c7H>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 12:56:10 -0500 (EST)
Date: Thu, 23 Jan 2025 09:56:09 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 1/3] rust: add Aliased type
Message-ID: <Z5KCuct3QmgGUkIU@tardis.local>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
 <Z46Gzg_5kv-MwZNL@boqun-archlinux>
 <b7492912-3e58-43c4-aa0c-e6bcd4925e24@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7492912-3e58-43c4-aa0c-e6bcd4925e24@gmail.com>

On Thu, Jan 23, 2025 at 11:21:23AM +0100, Christian Schrefl wrote:
[...]
> >> +
> >> +/// Stores a value that may be aliased.
> >> +///
> >> +/// This is similar to `Opaque<T>` but is guaranteed to contain valid data and will
> >> +/// Call the Drop implementation of T when dropped.
> >> +#[repr(transparent)]
> >> +pub struct Aliased<T> {
> > 
> > As I already mentioned [1], the name `Aliased` is more reflecting the
> > fact that this wrapper will avoid generating the "noalias" attribute(?)
> > on the reference/pointer to the type rather than an intuitive idea about
> > "why or when do I need this". Moreover, I think the argument about the
> > naming of the counterpart in unstable Rust (UnsafePinned) makes sense to
> > me [2]: this type alone won't prevent `&mut Aliased` getting `swap`, and
> > it has to be used with `Pin`.
> > 
> > Therefore, I think we should use a different name, perhaps
> > `(Always)Shared`, or just use `UnsafePinned`, or, as always, looking
> > fowards to a better name from anybody ;-)
> > 
> > [1]: https://lore.kernel.org/rust-for-linux/Z407egxOy7oNLpq8@boqun-archlinux/
> > [2]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#naming
> 
> I don't particularly care about the name, I mostly used aliased, because that's
> the name that Alice originally used.
> 
> `(Always)Shared` seems confusing to me.
> 
> I guess we can use `UnsafePinned`, but most people won't know what that means,

Hmm.. but doesn't `Aliased` have the same effect, i.e. most people won't
know what that means? Moreover, people who already knows `UnsafePinned`
will still take some time to realize "`Aliased` is actually
`UnsafePinned`".

> also I'm not sure if it's a good Idea to use the same name as a (future) 
> language type.

The benefit is that we won't re-invent the wheel since `UnsafePinned`
already does what `Aliased` does here. If we don't have a good name, we
should use the one that most people are already using. Honestly, at this
point, I think we should just use the unstable feature unsafe_pinned.

Regards,
Boqun

> 
> If there is a consensus on a good name I'll use that for the next version.
> 
> > 
> > Regards,
> > Boqun
> > 
[...]
