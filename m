Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E20315D43
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014384; cv=none; b=qQX1XaiwkqnPv1MuhKFn7SON5x5M9VeQ3lN6wsIP5hF1/TkI6B+UXMgEViaRgWk2urAJnutwaj160Aua63Ad4/UKW5KOGMzmPC+UIAvZ26l2uOyWtfQl6fhAZDeqJNWugeO0ktR1xAbb6X5UJesV7xPGjuze9DwtfZRrA2qEbkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014384; c=relaxed/simple;
	bh=vKyqIlDT9VgsO8CEEafhUWBQEgKSJNkWpZyYYR+wV3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j73Lq88ZlYoEptR4Nm1M0qjGCT64APGiv0Czx2GBeFS2Xqw1rxqD4aYDnTjsD0YyxtbypZk4rUg7ypoPgDj2hk82Cg2r8fhFfdgm2lP4s5iXKCVVdSIIywXQvRZ0okKaVL3Tl0iqN/CvB5ftwD2iSAUam1M2EbpaN7Vap+v7DWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C16f3DXH; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C16f3DXH"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b23b6d9f11so1012190485a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 05:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767014382; x=1767619182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8dzyqZ5agFXiOLV8QgjZGpnf5TGn2pbb4cFubbUjmQ=;
        b=C16f3DXHHerHe4A15rfvRZyeZ0jPl3SHGMHOJ/wvhv+xEAZBMLGJd9sckMoPI3IIHK
         51R6RiHp1CA1NmUZ8nMIoGT98opUoPNLl8sA9uQjfEX1Hz+krJcyqKoAuMFAZXokPWEx
         ubo0c8W09+l9IfMD3i1YrCWCJUfmzEREJZdIf8bLurDrSPraT4qBJFjOJJZ6ZYooN6uc
         i7UBzVOd9o75I1JD8qRifSkQBewYiPhsIuFfjt8ceAUl0glYKZnPziIdLhsCMQOuR3nQ
         YdvmoaLJDyUebZPmHVSDm5E25JFH0TL2JnbYCavx6w8Q6Vfhkh54TQL7lJqHomejKNuK
         BvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767014382; x=1767619182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8dzyqZ5agFXiOLV8QgjZGpnf5TGn2pbb4cFubbUjmQ=;
        b=vas/PHNdiyaykX9XeFEfmxQYYgfVObuyfhGN3kopsNM8qZVRYP40Wno4p283c5R1TA
         I3LjxXX5ONROMHal5/dLJRsh/aM21+XhbuBE6GY/HfYoky6miAmWScMOEBbczYb/niZ3
         BoxLPefMHzGOVvKhOo40IfbSs2YkurUuvK7pszrvMG+Mwd1ZQSjixDJbrjnqgqNw/uE/
         wP6l3YPskdIvxDACe57BzL4+hTT95vacjz0Atx9wTP1WpCSXs69l97MuvAd+e2YJcIV+
         3jBEHjlx4jRogpwxB3y29S09ypmlKnGMGbuUGM0MQODgm+aSvWtbduCKChS1eUfWSRsX
         4cPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdiczdl8Eb60hdGh29+ommnGREJu+r4UGPZuMai6VqVA6Qo4grWGJyclHhHwMHQ/AFKVKlrnOaQ4uOD3t8/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTpxlUrCioyb0OQUZFTwAnsGayUYKPm/GiWGXbr9W1WGWiPTG
	gupZP+v8y32F7pOl7597EHKZyQmzYKQ/qxfC+icv4BCOt3Zsg4dNq3YN
X-Gm-Gg: AY/fxX5QiN5QCnC5OBI7aG0jOEUzmRIgV2Ie4LiWwWy60jdzRefbTR/YXrT8yTQmgM7
	60a6Cm/o28pfRMBvIqK70M+qoJshAHcZRUPf659jFNYeR8/QxK2c8lgE5y9UonqsUPXjTzHJf/n
	AV9XZAlLNpdXk1UkCjuVwdlcsjs9qrdlD2jSGz06oCS2DCCEdZI1b7H+7s7DmrAF6jOtjHZHJno
	xBFjovK72lTbD42kBZ0+XkXM5DLWDNwISsv33y0jXKrce710KRPlPUCT7btnjDlPl3WFFGCaFS2
	PwCnQnx8NDMFaVK1svExkBC3r8mlVGC+1CGbnU62QekFmgWAHOvUXdo+PaKJe1NIGfJSbwRJIJ6
	rXWCZ/rAH6XUq5lAEycpJYOfpTdoJUR5Ta6sNEgWem7RLdln4Vsk78BNGUOBdjqr2X9Tibcl8pU
	2FWz1XwG69UtaQAbXV7o14psuThLyYQTdXo+LQ6FADsgAtwELnTJ+eWteTRpZR1zaBKRIRP7Nbz
	yEYhxgpRpcg/gA=
X-Google-Smtp-Source: AGHT+IF4My1gAUQWEgRyDinLNsbN0UU0OdtVQrGTOgglm7kCC6zlBSGvkN3FsMMiG4G2CBfGnFkqug==
X-Received: by 2002:a05:6214:3118:b0:720:e4bd:d3e6 with SMTP id 6a1803df08f44-88d84a2559cmr386084546d6.15.1767014382101;
        Mon, 29 Dec 2025 05:19:42 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9aa363e3sm227055386d6.57.2025.12.29.05.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 05:19:41 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 611A4F4006B;
	Mon, 29 Dec 2025 08:19:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 29 Dec 2025 08:19:41 -0500
X-ME-Sender: <xms:7X9SacgwgjlumTGB--o2XPjsv06DiWTsdBl4gyomJiEAwY54vaoLFQ>
    <xme:7X9SabgUEELd3I0apRTv_4C-B7PceNwTxaprxLn8oqHEyScOxq2wfDPBCNcrw96Vt
    kzY3nniGY6lgfGpkCOZr7F1111PfDsAUk2y-2hGdz0GUvZIQUshDQ>
X-ME-Received: <xmr:7X9SaSEtANZNeW-UPrzMoqNmxF4mUUQ4pEbdE2elh5nzQtw2EUAoTfQozw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejjedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonh
    horhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhho
    rhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrh
    hoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:7X9SaQAptYzuquXRTEvdxhWwwu513cpBwbeFVNqc4T-qTyl_DN_LeA>
    <xmx:7X9SaQBY5vHI56SfoYA6Z-rVSMs9lmpDT9wndTMjkPLTmDGqKWUYAQ>
    <xmx:7X9SaWNr6a9AMO2m29F0Yx5qP2KVb8kGlXlXZlwdJBAPBLbfzMyK-w>
    <xmx:7X9SacP4mD13bzYmwFmV7tO_wYjnMI8z-kekR3laaTbxzIL1_v4dCg>
    <xmx:7X9SaYJk5UeMMZpbH1Shdau_o9_ZPRJsBKcnVY02uyTAAFmdGyFWQwnM>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 08:19:40 -0500 (EST)
Date: Mon, 29 Dec 2025 21:19:27 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 2/3] rust: sync: atomic: Remove workaround macro for
 i8/i16 BasicOps
Message-ID: <aVJ_35voSG8xnUk-@tardis-2.local>
References: <20251228120546.1602275-1-fujita.tomonori@gmail.com>
 <20251228120546.1602275-3-fujita.tomonori@gmail.com>
 <aVJs-D4V1IpfzR7z@tardis-2.local>
 <20251229.215558.697746619121630518.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229.215558.697746619121630518.fujita.tomonori@gmail.com>

On Mon, Dec 29, 2025 at 09:55:58PM +0900, FUJITA Tomonori wrote:
> On Mon, 29 Dec 2025 19:58:48 +0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Sun, Dec 28, 2025 at 09:05:45PM +0900, FUJITA Tomonori wrote:
> >> Remove workaround impl_atomic_only_load_and_store_ops macro and use
> >> declare_and_impl_atomic_methods to add AtomicBasicOps support for
> >> i8/i16.
> >> 
> > 
> > I did the following so that we can drop this ;-)
> > 
> > 1. Change function names of [1] and [2] from *{load,store}* to
> >    *{read,set}*.
> > 
> > 2. Reorder [3] before [4] to avoid introduction of
> >    impl_atomic_only_load_and_store_ops!()
> > 
> > [1]: https://lore.kernel.org/all/20251211113826.1299077-3-fujita.tomonori@gmail.com/
> > [2]: https://lore.kernel.org/all/20251211113826.1299077-2-fujita.tomonori@gmail.com/
> > [3]: https://lore.kernel.org/all/20251228120546.1602275-2-fujita.tomonori@gmail.com/
> > [4]: https://lore.kernel.org/all/20251211113826.1299077-4-fujita.tomonori@gmail.com/
> > 
> > I also reorder a bit to make the introduction of helpers are grouped
> > together, please see at
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/log/?h=rust-sync.20251229
> > 
> > I feel this way we have a cleaner history of changes.
> 
> It looks much cleaner now, thanks!
> 
> Maybe, you could consider chan ging the following two points:
> 
> - change the first patch subject
> 
> rust: helpers: Add i8/i16 atomic_read_acquire/atomic_set_release helpers 
> 
> - drop the following comment in 12th patch:
> 
> +// It is still unclear whether i8/i16 atomics will eventually support
> +// the same set of operations as i32/i64, because some architectures
> +// do not provide hardware support for the required atomic primitives.
> +// Furthermore, supporting Atomic<bool> will require even more
> +// significant structural changes.
> +//
> +// To avoid premature refactoring, a separate macro for i8 and i16 is
> +// used for now, leaving the existing macros untouched until the overall
> +// design requirements are settled.
> 
Good eyes!

Done (along with other fixes):

	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/log/?h=rust-sync.20251229b

Regards,
Boqun
