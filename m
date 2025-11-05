Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C33191D1
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357540; cv=none; b=tg55JUVhYg7c8V3x0peepT/xRVwZwukGh+yyoUDl082P4VSpMIZxDy1KWFEHis5TR5pg3PAfNKWIzQSTvzs30diUgExBnhzvIrzXtO8KOTdaYbGSAl6w5GrLVBOWI05au7O4h8t7BSmUIRSfiAhDU38NgzogALbw4ymtPOaR/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357540; c=relaxed/simple;
	bh=3eIMFMFPOzh5y0kYsh/P8MA0cDRHQeNlcvOWQyDuHBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxuZUji98ksCiW3P84LUAWE+waZoJCgGXl2QXeILLxQ2tJaKBlHz4XH144HhQdH+P0/uQPHXbICOhVYtcSeTAJhlXXzqAGvWmY8sS6mNjp1jVyT+JLqMH7Oozbpqt0y+44pidiDPFB2tpE7zwsBoscUNQeX3dtqBoJR8OPN2Wp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxGd8Uwo; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxGd8Uwo"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8801f4e308dso299716d6.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762357538; x=1762962338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=co3Ih/khDOwJvwvrea/KimKwIaXUk+j+WlxpZERx3vU=;
        b=TxGd8UwoqXd1/uvwF+IJR8kPul6vVCy0aOvfjK7QxSReAG1auyJWwCpPfg3aU3kl2O
         cPJARN8kv03cigOJ1GbuPmHx4OmQcpzwnUjkbBjg9VUDnJAhrf0J/nKTpcQa8TOAgoUJ
         01eNOEKTnQRktnAOwZqrcFOc67dKS+VGADv4FMiTk/ARtTstMFkBBh9yT7zX5ATKgyrr
         6ntiOYXuXPKsv3hTJVckcSt+9Q005rMTZwQIeT3bBPVa0V/aw3oTjXjKQzk9wnswEhT9
         Hbzyf/jmvYqHrtifups/ygxUMw1Q87qpnrKjQL3mxh862PXRTZ6zgR37KNWaCjZjZOPi
         fkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762357538; x=1762962338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=co3Ih/khDOwJvwvrea/KimKwIaXUk+j+WlxpZERx3vU=;
        b=LiWBrzv01qY5aKvUY2d0cAEnsfFwWBUW9BV7GV6eL3AQoWNHqg2MsEkovKTowHZ3HC
         jdMHy5AUhVXLO+PsLsGAn84nLhbgMwNxEnsiwIagabnq0ucQmCLeLvSBNCU69KQ5/Tno
         XNwwquj7U8JYWydZxkww3SSCUaUK+Kl1TLbOf6N6Yq62Jv5DMnrm545UFj84nlJUtK1V
         d08uEiP4CP/kOcged09a0ODfOewYo+o7FLdltw1aYcpmKlNzAus4K/ljkYQfRP5fjRWT
         MGoOIsNfE14ZuJfrETKuIgYia8rZy1f4lx9eKGPCHO92OLpLh+NSHnDpitXCb5BCPVFq
         3JnA==
X-Forwarded-Encrypted: i=1; AJvYcCUpP87HPAzAk7YgqRunt2k9K9R2uWzrSDFz0V5l430CvEoKIs/9embCbLAPSWqITO2HXWL2YuZIOzhKAfxuCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAaSkjCrxrn/TwDBnizcdsFfs/QiG2ywwp2otY+Qr2BzTWkYV7
	K6dNLRRQFPiHPMJKdxDShJ1BwyqDlRj+WYsAv37MjNnM8GbycLAsZUVl
X-Gm-Gg: ASbGncvbGuQAQBhtgFRGx8qyQj3vCHgYYjme9ds+hTHkFIAAlkAe04PHO88CLMd44Kb
	4QZvX07dlZP3cqLUUW7haxzy9XnIux3xP4cLdLlLnoQYIVLJDOXhP+0dveS678RR1hBQw8Yd0oS
	Gvz17Nm/HTL1ABlew8fSuRukurs5vw+Moqp2DNGBJ8g1EIrA37IblCGq9RudSncFdVm8Lbh+2A9
	SzobroqiRAFkRJ3bObz9a6rech45pfUkF4YjkGsnwxfjfRSppbhSFmePYzawxT2je3uJ+8CVuMd
	34ilmPcF8Jfh+dZEXpj32ttynnxkEgaoDDxRpzlQOwgrjuWzAn/9/U45azmjIPARl+SHm28rUdx
	XPEjlMzLHzlVtO+J729Z1kyHbBEtQRmOKUC8QcvjxDCu8PX4vP8F5Jzaf3CXklx/5s+7C0CqfAi
	Bx63Z7E1k=
X-Google-Smtp-Source: AGHT+IFIgpqZI5fF/EKLLTt1u6e9u7A2K2l/zF/mlCOpK1IK47RGjupL6vDQyRIAjwkB34AmJ1293Q==
X-Received: by 2002:ad4:5b89:0:b0:70f:a4b0:1eb8 with SMTP id 6a1803df08f44-88071093b70mr45248946d6.13.1762357537710;
        Wed, 05 Nov 2025 07:45:37 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8807a28000fsm9290676d6.47.2025.11.05.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:45:36 -0800 (PST)
Date: Wed, 5 Nov 2025 10:45:35 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: add BitInt integer wrapping type
Message-ID: <aQtxH_7oeuE5UbRv@yury>
References: <20251031-bounded_ints-v1-0-e2dbcd8fda71@nvidia.com>
 <20251031-bounded_ints-v1-1-e2dbcd8fda71@nvidia.com>
 <aQgQv6F0Ao4DH6U0@yury>
 <DDZ3QBBUM27H.MJS1S3WHWJO0@nvidia.com>
 <aQkEVqbhoVMUc-Km@yury>
 <DDZKZFCK27HZ.DY3QVXKFU3BI@nvidia.com>
 <aQpUSw49QptgxjFz@yury>
 <DE0TFMFV6D6W.CS9KM6FNM4K5@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DE0TFMFV6D6W.CS9KM6FNM4K5@nvidia.com>

On Wed, Nov 05, 2025 at 11:03:24PM +0900, Alexandre Courbot wrote:
> On Wed Nov 5, 2025 at 4:30 AM JST, Yury Norov wrote:
> > On Tue, Nov 04, 2025 at 12:13:26PM +0900, Alexandre Courbot wrote:
> >> On Tue Nov 4, 2025 at 4:36 AM JST, Yury Norov wrote:
> >> > On Mon, Nov 03, 2025 at 10:42:13PM +0900, Alexandre Courbot wrote:
> >> >> Hi Yury,
> >
> > ...
> >
> >>     let a = BitInt::<u8, 3>::new::<3>();
> >>     let b = BitInt::<u16, 10>::new::<123>() + a.cast::<u16>();
> >> 
> >>     let c = a.cast::<u32>() + u32::from(b);
> >> 
> >> Note that `b` and `c` are regular `u16` and `u32`. Arithmetic operations
> >> cannot guarantee that the BitInt invariant will be maintained, so the
> >> result needs to be converted back if that's what one wants.
> >
> > What C does and what I proposed is to make BitInt a 1st class type,
> > just like basic integers. What you implement is really a bounded int.
> >
> > Both have advantages. C-style BitInt() is a true type with all type
> > guarantees. And I like it more because it is a natural extension of
> > the existing integer scheme.
> 
> Yeah, it's definitely different from what we are doing here. IIUC C's
> _BitInt is implemented at the compiler level, here we are just a regular
> Rust project, not touching the compiler at all.
> 
> >
> > Your bounded ints are actually classical integers with some limitations.
> 
> That's a very accurate way to put it. It is not an unusual thing to do
> though, there are several types in the standard library (e.g. `NonZero`)
> that do exactly that. Putting limitations also means we get more
> guarantees, which can remove unnecessary error handling and help the
> compiler produce more optimized code.
> 
> > It's not a primitive type in sense of C - it's an object. It also works
> > fine. You can easily extend it to arbitrary min and max limits; you can
> > expand it to floating types, and do whatever you can do with the objects.
> >         
> >         BitInt(i32, -128, 255)
> >         BitFloat(f32, -1, 1)
> >
> > That's why you think that -1i32 fits into BitInt(i32, 4), and even
> > into BitInt(i8, 4), while I don't.
> >
> > I don't know which would work better for bitfields. Most likely both
> > would work reasonably well. And if bitfield will carefully hide
> > internals, I hope most users will not care much.
> >
> > You switched name to BitInt, but still think about it as an object,
> > and that brought all the confusion in my mind. Maybe switch back to
> > BoundedInt then to avoid this confusion? If you find it lengthy,
> > probably LimInt or simply Lint will be better for you.
> 
> It looks like we are going to settle with just `Bounded`, to follow the
> naming pattern of similar types in the Rust standard library.

Yes, Danilo mentioned that, and I agree it's the best choice.
 

> > Looking at how good rust macros work to implement bitfields, I thought
> > that they will be able to mimic native types just as well. But now it
> > seems like an arbitrary-length integer types requires support on
> > language side. Just like in C.
> 
> If only to be able to express arbitrary-length immediate values, yes -
> although I suspect macros could also help here.
> 
> But I believe the more fundamental question is: do we need
> arbitrary-length (as in, larger than primitive types) integers in the
> kernel, when Rust supports up to 128-bit primitives?

Bitmaps are actually the arbitrary length integers. They support all
the logical operations, shifts, bitsearch, bitcounts, prints and more.
The fact that nobody's proposed arithmetics for bitmaps answers to your
question.

> > With that in mind, I think that bounded integers are a bit out of
> > scope of basic bit operations, and probably I'm not a right person
> > to maintain them neither in Rust, nor in C.
> >
> > Please keep me in CC for next versions.
> 
> Will do.
> 
> Also jumping on Danilo's suggestion I will probably propose to add a
> MAINTAINERS entry for this in the next revision (up to the Rust core
> team to take it or not :)). Let me know if you want to be a reviewer,
> that would be a good way to keep up with what happens here.

Sure, if you find it useful.

Thanks,
Yury
