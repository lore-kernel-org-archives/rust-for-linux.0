Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7392315760
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766069793; cv=none; b=FMicc8jOQ/iELqKI7rELR+o15GgbW2d18Xk5f/moDBtpNViBiikFb/IJRZyEz2LsT6n21BWrLh9Nf6Uu4bhGDLXEZX1ZDKqXRK27WNqa9RGoQZTTQrD6orDBcxz8Bc2iCC/Y4r43DF/nmXzLRWZnuTC+Y3+OK1JB/CKtzXnba4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766069793; c=relaxed/simple;
	bh=gYULV1FEE/FOvKtOyz1laXpXEHTdf0gHFVTVpj2gEbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwrL4F3dTeKGKH6GE7ZOkuQ9XrmYJHsh57bQsv5lomJi+ek6pfXgsts4HtdZ29WK/6bdlrz5YIda/J3NFTAeHnP6hfdpfWtnxamDj85de9oY25IhMUyxYjK+vrWi7+BY5vj1iej8Ib/+AfjRAzoYruNahHiEm512UMOlxdbAUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k67oHedT; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k67oHedT"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a2d21427dso6917236d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 06:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766069791; x=1766674591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbPS8zrJHKrj+2iNgu/qj/8+YSnPcB7MhOyL7fsmzkk=;
        b=k67oHedTOMYP0VkkjXrpEpe998YKIHkvkdWWGp7wkOQVXx+Bxgyo3BC5mvR17Uz7S0
         YkCYnLuGKRDp3QAllVCELx4Z0YS8yWqgrelu23elkUJTBM43z2fj7cdWpBykWEQ5rMtN
         AsRPl9dOUThmq7FZhgzHUDRPButT/K100wlD9KqOGmSMcNFehhB1hGFuD2rnOyNIqjPD
         6lZRe0uPgEJyXfktl3+owVeDeHsAGkHcthP7opggfhjSntTmXT4bt/OnGKKehEszNrGs
         HEatfRyQxDRdhkM3w0Egqd6ql0YCVsuAW7P9lZnixwGezqocCespAK4kYpH6NQqpYZAT
         Gk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766069791; x=1766674591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbPS8zrJHKrj+2iNgu/qj/8+YSnPcB7MhOyL7fsmzkk=;
        b=D0VkIz6RQazbHayTufr7Z/5nOeAjQX6c3CFMxgCeQLotgv8VXOMXzuob3At8GnzwA6
         YvUfj/nccVpfStVOmYmzpEBqMIOyC0qM05U2lGHqxnqGZKZTQjqnN40ZHGSHsIHjrqi8
         o5pbeV9UtOgJwA97vK7IbjkFQ04CyFrZ/BdWq8lEdbY5zhl306bbJUV0OJFznH2tW06x
         21uxuArDMSQqwm0a+FW88JaJYBVdigTZL47XPZFXp+OZW9xz72BMsqsNBtPO1ZX7/wjz
         9csrFIcN65n4nqD0K6+D3nuoqxuGs4UQWlTL4L2WDnmmwt9cLxFLWDPvT0tNA/xouX6r
         FROA==
X-Forwarded-Encrypted: i=1; AJvYcCUfvCPOgmUrmUPdsJJXuAhYtcQryMGiaeH4+67O/DAfImfr2TgXHNq/FvwbC4OFBBGv5lO5bTawvSKaeGpiyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI5lBkYT3gPAsW0SfUkz0oZzHqs9QoYSkwV1/Myyrnke+Li3z3
	4vJpCEG7Vg9GXwc8lisNEP9QIANxKuom4iUprhMneYM46GRjVD6uvgxRwhvMGlGz0QQ=
X-Gm-Gg: AY/fxX4V/8IrUxBY68F3Fxsjru8LcGoZM3VSLh8ro2xJz6/00zWcKb0ehgwYRYw6zU/
	DPdo/NYwrgTeWbdEHoRvJ/efpvfJfhYMrcvRbw79dF0va3y6sQmh846vIDaVpOkzSBclKsnuOFl
	sceQmnFlCSEDzVU5fByUv9OByjVHJlJtycpOYnLTD+UST7g2P1bootSlYKr1Fr9kcNAe3DITiHG
	+lv1e1MM2dddAd9zNSwokuGE2qHepJYq9M6wQ/AhVw2LmA2aEQZvNxteriS4hACWre7XMqJ91Sl
	/1bqRNVaKGbKoHWlIUffRXxQ6QgfAsm9hqlQ0p0Y3ZphU9K6JzyQNwVpp0Z6mAj6CR6m9qDHeJG
	FSEDN6H/29WQjxEcCIWndaECaGzAUJ6sL0Iv83JBOdZOK4ysus7T0MkgrDPMRFT3wsdTqKGHGtb
	9re0G6y3rKW6tc82kv/nv6rN9xjjTMxI9WRswkTFEm04Ng9Gk7xgdG+L5Pk8u8JDFHBc1/BG0Xp
	iSuRmsZvpar6JIJ6cV5Km10QA==
X-Google-Smtp-Source: AGHT+IFgYwMS8JxvwkLn4/c1AKRQNySaBw67YvHLNKRnKlOzNoNLp9HjiJzMYvwFlemvkoo/ONjSxw==
X-Received: by 2002:ac8:7f42:0:b0:4f1:83e4:7247 with SMTP id d75a77b69052e-4f1d05db49bmr319191271cf.60.1766062626078;
        Thu, 18 Dec 2025 04:57:06 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f35fc7590csm14385301cf.7.2025.12.18.04.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:57:05 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 29915F40068;
	Thu, 18 Dec 2025 07:57:05 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 18 Dec 2025 07:57:05 -0500
X-ME-Sender: <xms:IfpDaQvLQGu4HZeITBU0BhlqTwhPwIp7tGLnjbKWJtvuaOlPZEBWWA>
    <xme:IfpDabvbnvtAZqMbYlMGYdrjKuw-6HDEg0Ovpun2K6tnSuoY-Xgn7_h-pQSPQ-dyX
    XcQHqePui07cHeDKbzecu9fauFkXudny2IZeYy2iUqpgSB2-NPj>
X-ME-Received: <xmr:IfpDaVHUv40qNbjatAPXpfJ0wIe9eXRcMSrSKFbxozLbO4pybgDlheUjycto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepvdeigeevhfekteeiueevtddvieektdefvdektdehgefhledvudetkedtveelkeet
    necuffhomhgrihhnpehlfihnrdhnvghtpdhkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhht
    phgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqd
    gsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgs
    pghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehojhgvug
    grsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgv
    thdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprh
    gtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlse
    hgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
    pdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsth
    dqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IfpDaWP__qIWfgOrRoAsooiJOAP29LXK-_z0cFNDil_a3MxGXat3Hw>
    <xmx:IfpDaULKFJmV0BRTHP8FsEGf7ZR4vCAdKumRFHdFG1jtOEJ5gp14iQ>
    <xmx:IfpDaf_Umkmhoe7O2K4U2LH84vcQK_WwafWO5UiuWdsVVsclTxveFw>
    <xmx:IfpDaQEEr7e-qhFZu5xUxIz3n6IFdw0nczWu2juMB6E-X9nm1NNYpQ>
    <xmx:IfpDaa7XtzQ98dmvO57I2ElApVePahX99A2tFZKYxGFbMi8ZSF6ZJBj7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 07:57:04 -0500 (EST)
Date: Thu, 18 Dec 2025 21:57:02 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: conclude the Rust experiment
Message-ID: <aUP6HoSwNmXiaQ8e@tardis-2.local>
References: <20251213000042.23072-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>

On Sat, Dec 13, 2025 at 01:00:42AM +0100, Miguel Ojeda wrote:
> The Rust support was merged in v6.1 into mainline in order to help
> determine whether Rust as a language was suitable for the kernel,
> i.e. worth the tradeoffs, technically, procedurally and socially.
> 
> At the 2025 Linux Kernel Maintainers Summit, the experiment has just
> been deemed concluded [1].
> 
> Thus remove the section -- it was not fully true already anyway, since
> there are already uses of Rust in production out there, some well-known
> Linux distributions enable it and it is already in millions of devices
> via Android.
> 
> Obviously, this does not mean that everything works for every kernel
> configuration, architecture, toolchain etc., or that there won't be
> new issues. There is still a ton of work to do in all areas, from the
> kernel to upstream Rust, GCC and other projects. And, in fact, certain
> combinations (such as the mixed GCC+LLVM builds and the upcoming GCC
> support) are still quite experimental but getting there.
> 
> But the experiment is done, i.e. Rust is here to stay.
> 
> I hope this signals commitment from the kernel to companies and other
> entities to invest more into it, e.g. into giving time to their kernel
> developers to train themselves in Rust.
> 
> Thanks to the many kernel maintainers that gave the project their
> support and patience throughout these years, and to the many other
> developers, whether in the kernel or in other projects, that have
> made this possible. I had a long list of 173 names in the credits of
> the original pull that merged the support into the kernel [2], and now
> such a list would be way longer, so I will not even try to compose one,
> but again, thanks a lot, everybody.
> 

I would like to take the opportunity to thank you, Miguel. Like what Dan
Williams said during the Maintainers Summit, I also cannot imagine a
better person to lead this than you. Thank you for all the hard work,
commmunication, collaboration and most importantly, keeping yourself
postive despite all the other factors.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> Link: https://lwn.net/Articles/1049831/ [1]
> Link: https://git.kernel.org/linus/8aebac82933f [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
[...]
