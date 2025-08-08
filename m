Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA82234964
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754646247; cv=none; b=Fug07Pv9bUetNNvkQNvCr0Zj2DO0bnQ6d0XSbs2IpOMGxWzT0CYtZZDLHhfKxTGF9DHy5NVQyMr9FlKiX2f6akq37g50iS1ic/EhmWeCgirRazKfdTVp1U8NM7arnbeTJgMT6eJsdXWenDBqUxkw3kShahGgeMTuLg9NU/zBjNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754646247; c=relaxed/simple;
	bh=2ONNWiBHw/oqdposC9WyZkS5cEHu6ThUfHJGiPmP/24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JASzuj4y5exP/qGld3oQCfuo9ukhGTrUovICTCIlpsxtek2Z0GSiPVaAfOK9J65LwMcbZ01nw6kqO/2UshDeAG7vBdomiTCYExipCgbvQTY71KO7kziA4UZmxuMq0u6Kwa2OZKpAozB6bL8gsGsNoJTFHhhoGbF4teGOgV4wRLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=fM/hT2KT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="fM/hT2KT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2403df11a2aso13742325ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1754646245; x=1755251045; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I/HbNOoHN43aeLaYTHSxOHdyc1vKo4j/LLzcp6bQRpQ=;
        b=fM/hT2KTuSzR8XZjPYiU/HfPP/zpTa0597BtkS+Pjbp4XiEuJcw0ptBbEZPRwJbz/3
         4cPYUuUTPsWvDDmTygUbrP4YvUl4e4Q17+k368N/RyAyM3zosZ26KEidsxS6fqlayTnu
         HNH314wTZujIZuavWfNhacZWTon+JsAWM41ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754646245; x=1755251045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/HbNOoHN43aeLaYTHSxOHdyc1vKo4j/LLzcp6bQRpQ=;
        b=bgh+SGXgoPSSVWkYhw4gzWkKDTMVqHXNgNBrbqlzvvScyrBEFzFvG4hD7JhGqK2lAH
         5KP4aD0BJAfKjDmg/fYVHUWnXhEah/2pTWJHWCpG8ddWrhC8pbtv+/czf601ecYPybF+
         vXz/9tVDSUr4RcGfTUYaFRZ1+32nIK4UtY7GYVcgLvFz92NSFGSxWVaA1qsWnHtSjZNy
         jwnOqa51VLZtZKUIs/Ng9FLHH899MSiFXfLpEyOZGXwtu5lpPfsIJXGjup/IwWEVLzv+
         Vj8kT4Nn3c5cWC7V2loE1b/a72vC+gzhjMKy2P5nVSRrXsE3ClDKzKQoa2Vd8tYG9CRU
         B62A==
X-Forwarded-Encrypted: i=1; AJvYcCVaJg5MWIMTY/eOF3//GfOMPXcptefx2/FVPKnNvNpPWKAMeCNOrWp7oqcwio8G6Qke7qDAOTJSlxepkSQPvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY0Xbzn8+Ef41dwIZxrlB65AzvpL9+ZYjBG5aHmwGSU1UfGS0L
	tu9ZKbASrVwg8RHJ1+KBTsLRF0TftcLERDg6pQ6aRCsrt2DVl2Q+OuSBCd8kngrb0aY=
X-Gm-Gg: ASbGnctVxbclfuMdAuliQ1X8+3p5PDrsQUlFXyPSHF4QhS57XxWmhhD+IMYbkuXsVUg
	8z3VAgGSrHSmGe2HB/5cKkuRJX5gcsgJZTqtS35EP0nNBvBE+g4R1sUoDKryqgs+kMlqMuff1ER
	dBabYIt6rgJyX5LZp6dQlFn21Mp6hmI/5ai6tWzmSYMvr2htaWZ05Z7K1OI58AnZGpisLQHUe95
	nEnFJeXPANHuYUy8/Rqyt99YQtLepp1rCZN3kbZO439wLUdDD4AM4U3NlAZPmRdTtZi9nfYSFbB
	QmstCJPZtaEY8vgrqqlhyDBZooa89Z62WoJDUkJeX5YVtkrDRY+0grSbx936P0+QKC/BoYaNn/p
	vMmjFeroaBDZwhWngK1Vwq3nrkshw2DrUiPYW6VpR0Cvuu1gcX4euntkfj/dejw==
X-Google-Smtp-Source: AGHT+IElzxwoctaZf17T0S8BK3BIrOBE/qPK2Pn4r25u9c96NAy3wADeFTDgVWu+sC8F0hrWcABkNQ==
X-Received: by 2002:a17:902:d502:b0:240:86b2:aeb6 with SMTP id d9443c01a7336-242c2206c4amr39578445ad.26.1754646244956;
        Fri, 08 Aug 2025 02:44:04 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89769absm206462945ad.80.2025.08.08.02.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 02:44:04 -0700 (PDT)
Date: Fri, 8 Aug 2025 18:43:59 +0900
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
Message-ID: <aJXG3wPf9W3usEj2@sidongui-MacBookPro.local>
References: <20250727150329.27433-1-sidong.yang@furiosa.ai>
 <20250727150329.27433-3-sidong.yang@furiosa.ai>
 <D6CDE1A5-879F-49B1-9E10-2998D04B678F@collabora.com>
 <DBRVVTJ5LDV2.2NHTJ4S490N8@kernel.org>
 <949A27C5-1535-48D1-BE7E-F7E366A49A52@collabora.com>
 <DBVDWWHX8UY7.TG5OHXBZM2OX@kernel.org>
 <aJWfl87T3wehIviV@sidongui-MacBookPro.local>
 <DBWX0L4LIOF6.1AVJJV0SMDQ3P@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBWX0L4LIOF6.1AVJJV0SMDQ3P@kernel.org>

On Fri, Aug 08, 2025 at 10:49:14AM +0200, Benno Lossin wrote:
> On Fri Aug 8, 2025 at 8:56 AM CEST, Sidong Yang wrote:
> > On Wed, Aug 06, 2025 at 03:38:24PM +0200, Benno Lossin wrote:
> >> On Wed Aug 6, 2025 at 2:38 PM CEST, Daniel Almeida wrote:
> >> > Hi Benno,
> >> >
> >> >> On 2 Aug 2025, at 07:52, Benno Lossin <lossin@kernel.org> wrote:
> >> >> 
> >> >> On Fri Aug 1, 2025 at 3:48 PM CEST, Daniel Almeida wrote:
> >> >>>> On 27 Jul 2025, at 12:03, Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >> >>>> +    #[inline]
> >> >>>> +    pub fn pdu(&mut self) -> &mut MaybeUninit<[u8; 32]> {
> >> >>> 
> >> >>> Why MaybeUninit? Also, this is a question for others, but I don´t think
> >> >>> that `u8`s can ever be uninitialized as all byte values are valid for `u8`.
> >> >> 
> >> >> `u8` can be uninitialized. Uninitialized doesn't just mean "can take any
> >> >> bit pattern", but also "is known to the compiler as being
> >> >> uninitialized". The docs of `MaybeUninit` explain it like this:
> >> >> 
> >> >>    Moreover, uninitialized memory is special in that it does not have a
> >> >>    fixed value ("fixed" meaning "it won´t change without being written
> >> >>    to"). Reading the same uninitialized byte multiple times can give
> >> >>    different results.
> >> >> 
> >> >> But the return type probably should be `&mut [MaybeUninit<u8>; 32]`
> >> >> instead.
> >> >
> >> >
> >> > Right, but I guess the question then is why would we ever need to use
> >> > MaybeUninit here anyways.
> >> >
> >> > It's a reference to a C array. Just treat that as initialized.
> >> 
> >> AFAIK C uninitialized memory also is considered uninitialized in Rust.
> >> So if this array is not properly initialized on the C side, this would
> >> be the correct type. If it is initialized, then just use `&mut [u8; 32]`.
> >
> > pdu field is memory chunk for driver can use it freely. The driver usually
> > saves a private data and read or modify it on the other context. using
> > just `&mut [u8;32]` would be simple and easy to use.
> 
> Private data is usually handled using `ForeignOwnable` in Rust. What
> kind of data would be stored there? If it's a pointer, then `&mut [u8;
> 32]` would not be the correct choice.

Most driver uses `io_uring_cmd_to_pdu` macro that casts address of pdu to
private data type. It seems that all driver use this macro has it's own
struct type. How about make 2 function for pdu? like store_pdu(), borrow_pdu().

> 
> ---
> Cheers,
> Benno
