Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782AD1C5F27
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754636190; cv=none; b=A9TrEC5MKaE4Uvg8b6y3VUl3dwonoT5pdQ01Fb0ZK5T857otO+lXQfxHfqMn9w2ykmNgSSl1KxfVE9y7XoLsfGvnTQ4HKJT7zExeUJKYJpr+9F/Q/rW+4KQ+Fco/8dHM1OVot7gjfn31ThabM+YErPLbDDKTEfvAHr8tlQQP81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754636190; c=relaxed/simple;
	bh=WsMFsX9rI/MR4482dUjWIW9KG1CwbzogAuN1PmMV95U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC7coqhg8D//cHmVfn6sXlrFEe80OY3DNFMC6sRH7hRTJoAgQnhEqPrt6UgCHJjLQThsXg3uiG+yX/WCfn/PxSNYsCCCcFjWWkMRv6vQgi6WsZeiHEEeyIgcEelMArICU0mDLvuOBdyQZ9H5FxT98zkG2jwhHd6SBVcNHpw0sKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=LiKydgnT; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="LiKydgnT"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76bde897110so1559918b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Aug 2025 23:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1754636189; x=1755240989; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EhfcZbysLPTN6Dd84Mx3cVIHOXMMLtVJ6fpljAwuNzE=;
        b=LiKydgnTx3QDtkx+siqOcq6MTmjCYhVHb7Ke7Y5KffEBajDbgW3VyZD4NnPgaXd19l
         /vcZof/+AdoAvekR7919IjcXVzN50/vtNEoeMVcvH0f3j5TZ6zYWW6P9Bh4SXcq0vFs0
         YvwZeEy9lehSGsQeGfKklUTE3/MS4N7DqsN9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754636189; x=1755240989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhfcZbysLPTN6Dd84Mx3cVIHOXMMLtVJ6fpljAwuNzE=;
        b=aJ4elH38VCqeaN8Igb6IQmytQKQeDlYxJsnTneMnarstjcuNyWUVbGSXfxw5e1A0hk
         J3YoJDvMzBchQz5qlX1I0+FaQKSRzEo6hbGgTrTe7bnn09IaP/90oPJvLi6clqRJA2j4
         4DdDHHGRKBUtCXYMv58qhfXXE7Wh8bVZspVsrYp5+F1L9SBQU1jHMGWOyyf/+/4udsRa
         hNc0Co5VQDcZUK3ZCGdsNM1OUXLH5lJnMKJiUW0QuO8YkLv0rDMpeRCbadZtINkUj4B0
         N+iZT4KEXdnVdM4wmX07gGK6p0LSjlBGjnK4mMbzzJZRcoN8wCxSKMud2ZK71Atn3jMJ
         40Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXKOh58mN8SbSh9Lm1KIV6i5UA1EbWJhymSbX5SSYXy2NduRRwcXSf2BPoW9sf8Vk+X//9/e6xrXyDpXmlizA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/Qpe0CIDUC1V6bT15PisRqF/HSqeNxTeuRlSX5uTAnFRBz6E
	wo7rdRY5Vm686Z+nYYRnM89EVos2FrT/WrZ/sV22GTJD9cl31Zgvq03nBXtGuQnW2EE=
X-Gm-Gg: ASbGncs0u3E6jYEte16RGY/q7UgEdoH36rP1X/FLNGx/uncbm+CwtM67KLoj4GTK7s7
	yCFWB8zN9NqsLUm2TO15DyXLNRj5h0vdH60mzRe08Ve6/SkkKPbenMPAM34zER7mQUL92lz9dUC
	lM+PWFhmOmxiMtK43RqbJlbSwh3gS9hXrmn+jihIYJeSWP0N/+uFomI8aEGPX20jIHEjOOC48Pn
	EV2x3W4flvmw7ga6dWcnnvjfzuSFW65ZAcMvB0H8tLtAfxZZ7ytCmGllHrfQLsXiSQa/pA/boLP
	rzmUgfzqibur5R0hQua04FtBP2KEE+kT7M0IiuzELLn2XmMoBNcE/ADfHWej8xyeg9GfjNPJTJw
	HasiIysUY+zJ6adjN81uxULNQHnZ+uUnB6ZUraH+esSdsZ7xydGY2tQbkICcDzw==
X-Google-Smtp-Source: AGHT+IE3hAqzLrTBhTY5Ya+9CrhJfIsOJHOrILP0ExPfcok2Clc4Gt9jHoPD5aDn4VtBNA+4A8gs8A==
X-Received: by 2002:a05:6a00:230b:b0:740:afda:a742 with SMTP id d2e1a72fcca58-76c45fccf09mr2710386b3a.0.1754636188680;
        Thu, 07 Aug 2025 23:56:28 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c2ea6893csm5448866b3a.104.2025.08.07.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:56:28 -0700 (PDT)
Date: Fri, 8 Aug 2025 15:56:23 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/4] rust: io_uring: introduce rust abstraction
 for io-uring cmd
Message-ID: <aJWfl87T3wehIviV@sidongui-MacBookPro.local>
References: <20250727150329.27433-1-sidong.yang@furiosa.ai>
 <20250727150329.27433-3-sidong.yang@furiosa.ai>
 <D6CDE1A5-879F-49B1-9E10-2998D04B678F@collabora.com>
 <DBRVVTJ5LDV2.2NHTJ4S490N8@kernel.org>
 <949A27C5-1535-48D1-BE7E-F7E366A49A52@collabora.com>
 <DBVDWWHX8UY7.TG5OHXBZM2OX@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBVDWWHX8UY7.TG5OHXBZM2OX@kernel.org>

On Wed, Aug 06, 2025 at 03:38:24PM +0200, Benno Lossin wrote:
> On Wed Aug 6, 2025 at 2:38 PM CEST, Daniel Almeida wrote:
> > Hi Benno,
> >
> >> On 2 Aug 2025, at 07:52, Benno Lossin <lossin@kernel.org> wrote:
> >> 
> >> On Fri Aug 1, 2025 at 3:48 PM CEST, Daniel Almeida wrote:
> >>>> On 27 Jul 2025, at 12:03, Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >>>> +    #[inline]
> >>>> +    pub fn pdu(&mut self) -> &mut MaybeUninit<[u8; 32]> {
> >>> 
> >>> Why MaybeUninit? Also, this is a question for others, but I don´t think
> >>> that `u8`s can ever be uninitialized as all byte values are valid for `u8`.
> >> 
> >> `u8` can be uninitialized. Uninitialized doesn't just mean "can take any
> >> bit pattern", but also "is known to the compiler as being
> >> uninitialized". The docs of `MaybeUninit` explain it like this:
> >> 
> >>    Moreover, uninitialized memory is special in that it does not have a
> >>    fixed value ("fixed" meaning "it won´t change without being written
> >>    to"). Reading the same uninitialized byte multiple times can give
> >>    different results.
> >> 
> >> But the return type probably should be `&mut [MaybeUninit<u8>; 32]`
> >> instead.
> >
> >
> > Right, but I guess the question then is why would we ever need to use
> > MaybeUninit here anyways.
> >
> > It's a reference to a C array. Just treat that as initialized.
> 
> AFAIK C uninitialized memory also is considered uninitialized in Rust.
> So if this array is not properly initialized on the C side, this would
> be the correct type. If it is initialized, then just use `&mut [u8; 32]`.

pdu field is memory chunk for driver can use it freely. The driver usually
saves a private data and read or modify it on the other context. using
just `&mut [u8;32]` would be simple and easy to use.

> 
> ---
> Cheers,
> Benno
