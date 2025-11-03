Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22551C6B4
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 20:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200010; cv=none; b=OOikTACc843TxlBTQ2A3jW1HFmFGNyLc9iY79gh1wz2k13ICMQ05IHUI5Z2ZkSg5gEg2FKFDqa7dl17Llg31EUpdtal6GYS4j5h7gvQZ5Gu4hNC3BNBGPg7U0msbBOpanjdP3LRUWqu5rvJ5uvvr8J3ayhV5v9hcEFsFmsIwN8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200010; c=relaxed/simple;
	bh=H2iI4vgRjvJNYnHtrSUqyU1Cq31SNxet0+xmtihJL6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfaCEiMAgwc1l/dDJ5COjMrJiEioy48+gdv/QFZyM7GLaY6FZFxM8IKRmUGCbu2GVcbFM8ovbPsBdAS9xRumpv+4lgCyLcy8Mlrljgd4gOW9ynqf7P2MGUOYXHkrAwOGzVWRRF/Go9yrm/XSAmChzcnUGCqweNFXreaKXf2RByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Trr6tgaN; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Trr6tgaN"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63f996d4e1aso3007007d50.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 12:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762200008; x=1762804808; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jetwJhKKnP5hEpNy345LkI5gvCQLRWl4+5Sty4m/RRg=;
        b=Trr6tgaNT8FO+C663W9/Mr8knUy7tM67iKP+UkXJ7ZDBfXYUAGRF9nO8SF75mg71M2
         8W7jkD52pcuTfKm7ezn8kwpMdm/uRV7gg6EgFKhazODJS7nYFVd+s8YVVaz40iUZbF20
         B4g6C33r9elPwbZlFjhrhLp8u3a5elRGUFJ7F7O2YSM/vSecPYrKRSnNO1S1bE+Ssq6O
         MfQUnGjy11OxoUO/fvdkhDHNQyAB4OmxPqBMS0gZtLrYZ2gwVPrPJNHjyKWYiA0lFIco
         SFd/GB44zd7gJmM44I7hZB00cHq+MMtGCF/DvExJFsr+qnWtiakuKAC4w3UtswDvK1GS
         vQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200008; x=1762804808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jetwJhKKnP5hEpNy345LkI5gvCQLRWl4+5Sty4m/RRg=;
        b=q63sbT+n3o/FG/2T98ssAI8Q+iDjk8laJXgaazjkd82U4lPdMjFKmy5p0hxgS5MCAf
         n6bDnAX3kvi8IMhxIhgS8MSRoWaGAZ+2n88QYF33eQzUXY+XrfJd/gGCjIIRlOOmMJA1
         bZ+Qb6UuviSMBgQj2aMtfSaQqj79uVVjhAkAR7EwteZe0ujqMCw6oy3NV0+aIWYZJV1d
         2n9IIJ2AyzImHooIn5yy7JA5ZxqsgEWwcLbDqIaGEZR27V/fbVLQ8Dn9SNmlwVJJPalz
         KqJVpwpPUOzSB4exE8LuiL2ij+Er4/iJh0bMgJ3E0gDQTFPECF5V2o/UBLb3fBAKXfHQ
         Tg1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtAbcIULvcZrELpj1tJ+Qp67xz5xquo77PMBfLSW+VxtzD0K+Cj6c1x2kxB7MqICi65MmV3QppikaVVV+ulg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24hM5Fy2RQNT5v/WASFCzb76Fb/+MkAconGMQ9TSkAv+oP3U/
	miPloxvfmEr1BEr5s/tV95B4vXpYfcnq+4/e87bIITYZK6rDJfhR65IL
X-Gm-Gg: ASbGncvEnrL+SXQmlvcBvr9RQkkzDklAXqASPqhdNVOLvujWyDWhd4+JY6YiDmD5gCk
	yy5c14mRfx6/HXZq8mrjPlHyiEPfHLI3UtGZ0js8kDTXplnhGlVptMNyv937/ls+Q/2wLfabEeH
	lmXdG9rsKNIW0+2tbORveUbckmXkTwsU8l8dch1rHNLjc5x+ocWgKt1weJ8C9bdgQr6VhGA87uF
	0FIHQ9Jm49lpabgzXz38Cv18RvvE9nt4CGLHEewhPi/70h0kQuo4EL1RA2ooXs0+35ZvPT5VZoS
	7AGX5yYLcFH242NPC/ojdUBZ5qIf6OETRwaBB+a5I0p61AB1J8i1ZbFtBycYGcWAm95kPhX+VTH
	Yit9lFL14cN85XrcAbtPAfsbHp0HwowmKoSRbpZBk2k4xB/oRrwHrxL2nRScvE7OmcSn9Q7eTez
	GAEf+x2Hgy2gAfJroIUEyttBGET5zi7h7Z33rHL62iBUc=
X-Google-Smtp-Source: AGHT+IGJ87Q3cBow/qm5dM5tdwT1qsmjXZS1JLAYHfLfr72pTqVIDzkShPLVJmss6G2QPZIUMbBmCw==
X-Received: by 2002:a53:d015:0:b0:63f:bd67:7c63 with SMTP id 956f58d0204a3-63fbd67a6a7mr2645920d50.15.1762200007510;
        Mon, 03 Nov 2025 12:00:07 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78691fd7e50sm3605907b3.38.2025.11.03.12.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:00:06 -0800 (PST)
Date: Mon, 3 Nov 2025 15:00:06 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: add BitInt integer wrapping type
Message-ID: <aQkJxlaHoOdrlrWx@yury>
References: <20251031-bounded_ints-v1-0-e2dbcd8fda71@nvidia.com>
 <20251031-bounded_ints-v1-1-e2dbcd8fda71@nvidia.com>
 <aQgQv6F0Ao4DH6U0@yury>
 <CANiq72mg-NntJLf_jbigz++0hK7G3WAxbvejRq1EzOc7GE+doA@mail.gmail.com>
 <aQi7e6VgFsqpq1Rn@yury>
 <CANiq72=4UXemR3ea5nNbqGt0Zh9q4hwiGVAn+hxfcZ-Zqa8y4w@mail.gmail.com>
 <aQkFx-brq-_njd5D@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQkFx-brq-_njd5D@yury>

On Mon, Nov 03, 2025 at 02:43:04PM -0500, Yury Norov wrote:
> On Mon, Nov 03, 2025 at 03:54:08PM +0100, Miguel Ojeda wrote:
> > On Mon, Nov 3, 2025 at 3:26 PM Yury Norov <yury.norov@gmail.com> wrote:
> > >
> > > This is exactly what the patch does:
> > 
> > No, there are no arithmetic conversions going on here in the sense of
> > C. It defines a particular operation for a set of types.
> > 
> > What you are seeing there is that literals, in Rust, do type
> > inference, and so the compiler picks a type:
> > 
> >     https://doc.rust-lang.org/reference/expressions/literal-expr.html#r-expr.literal.int.infer
> > 
> > Thus if you do:
> > 
> >     let v1 = BitInt::<u8, 4>::from_expr(15);
> >     let v2 = BitInt::<u16, 4>::from_expr(15);
> >     let i = 5;
> >     assert_eq!(v1 + i, 20);
> >     assert_eq!(v2 + i, 20);
> > 
> > That will not build, because `i` cannot have two types. But it will if
> > you comment one of the two asserts.
> > 
> > And if you do:
> > 
> >     let v = BitInt::<u16, 4>::from_expr(15);
> >     assert_eq!(v + 5u8, 20);
> > 
> > It will not build either -- there is not even "widening" going on from
> > `u8` to `u16` in this last example.
> 
> The current BitInt() allows this:
> 
>   let v = BitInt::<u32, 4>::new::<15>();
>   assert_eq!(v * 10, 150);
> 
> It looks and feels like C integer promotion. If Rust doesn't like it,
> we shouldn't allow such things with BitInt()s.

Sorry, send an unfinished answer.

So, 
     let v = BitInt::<u16, 4>::from_expr(5);
     assert_eq!(v + 5, 10);

is OK, 

     assert_eq!(v + 5u8, 10);

is a compile-time error, and 

     assert_eq!(v + 50, 55);

is OK, and in fact an integer promotion unwelcome in Rust.

This is not what I, as the user of BitInts(), would expect to see.
