Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2AE329C47
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787397; cv=none; b=ODG4vdiaQQXCOEBQ9Y9n242Zr866vvIipOlXPd8xSVX7TpxM6173FBWXpwYu/yrp6VvTZotNnZMMoWf0KzUI+ARL6utvprFT8o1d8m8BLNAlqLNudPIu9SgUoc4T1MMnYch7rNnbpaFt5aJgiemx528iIdXIErz0dP/SmRIyC50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787397; c=relaxed/simple;
	bh=Rj9G8IFEjlzisLHEn/O9WORrl+0cZLi6zlkht4lv9Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuypqxMhMkqHeFuQKbYM6unouHKXeh0EvFvI/egyFT3cCX7vjYQxiE14tvLlWMS5Rff9+fE/96LEIyAlNiF6ml5Un8CQtUxSQS5NiSHQfBt2iJ8soatv+oxrAue0W2XxFDulRbJF3y1vGv7OXY4EDda4qpohrvMx3hVdlk5/PSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+3I4qJu; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+3I4qJu"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63f9beb27b9so2686545d50.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762787395; x=1763392195; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KbWyUnaltl9mde3lXFQpujvquSvJb+LnnWGVBKXm7v0=;
        b=d+3I4qJuPpBCju+7Ga5lk1Mav2ICwuVB+UMEIssiIsD+SOCMAESN+JpjQQ1AxUi2Xc
         H2viDCx6fMXUb8WGaKsUzHqto4/S9yMLpR1VKWWjEw6bbyxbe9W1P7s0vipwzk1ua291
         Q8y+i1mxx1Y4bHuphNYNtUfDZ9SqbIaZjGw/gAWWQAd3Cl3ioLoLfwhNun8u08ZYGQjN
         iJelm/oXPQGDUYw8K4wy8jjayaKlNzJmQ6r95H75BjIV6yxaiV42iPTqvd/pdhQ5Ujpc
         qRIK+SYlVLkKPVFC1UCWUmh0neq+3x7gm36OE6SO3wJKCIiAgXwZReX6xNhgfNj6p7If
         /0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787395; x=1763392195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbWyUnaltl9mde3lXFQpujvquSvJb+LnnWGVBKXm7v0=;
        b=izwwv9juDIBHPP/qaEdMmvf2ujk2+lw++8PK737L/xF23m34I8zGRvsaoPvI4M0Yk1
         nQiSjVEYvNRmje0ZUMbcU9n0jDz8V41s9lg3VMr0FnnmNzWMNTxxLAWHaoka471bBEvA
         jiy5O5vjYsyIfvHwu5xGJrDD5aA9AB7YpHM3eK9GUbXZ2vAigEQzykhsivL5zl41tK4j
         Or2UKAsjt3fJg8bB7A8JM2oBTZkmhkOe99fjB/8rfIr1xvJVBcwjHEXKIZI4E21zbo7A
         eWx/VeMUk1jYPCeCi0LR/Ij/90frouuQXpeAqqpYrLh4ghfRTKWq387qSlt0Gkf9u3Y1
         45GA==
X-Forwarded-Encrypted: i=1; AJvYcCVo/kt7CUxrYdQzIAmjZPsLhZ3az8/5ky3IGh/JbcSMhNusyJ01TjT37W4aVuN9vEPG8gygfzAYTf/tuRtgng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXBu+ECq//qasMYkirdUon5qz9Q6oP07uGJKMqCu0yv4dTsmY4
	TFAPeU4fHG4u2+yxQF+L20Fut+knsI//IqNUuECYHCsYZLfP0jKyUGc2
X-Gm-Gg: ASbGncub4D9sfpM+GYE9UPA31GQInniYSOVN+zEAH0zKnVJezw11iRQQEdD3fUsIFjc
	4g+tNw+PggyhlPmVOXAUOmD/kt9vMwfL0wk3cf+txmVnqOaI9YEX5PCe7C2/NDbm/m9So0yRXmQ
	YGIg+nXkWjdjLAJPywa0ws5zRUL/OTkmh58/ge8nPkBsPa9U20S/8ZLh/skOVMW81OpGqIFLtbB
	uTARLIVjcC0S+nlvAv/nMG59Nhty0R1582v0uKrxKNQyvE+SdYAHvSpvmhHSpDHDIlLcy6Su+e3
	gNPuYupuo5StyTKnL11TK4156pVQI64gI4s15pEq/OQVrAq/dISKK3l5AzL47CDK650AEydX56s
	kGXyiV3G+rcaYJ8mBkYMfhCWTEHSBd6kW9KGW+CBz3NCfRjhhsPbjCCl76i2Bjc5LhPpeTSNgbq
	Qvr4LdQL24nM7ojFtmwh915pMyJYyn7Hso
X-Google-Smtp-Source: AGHT+IFrAjrniG9BqJ1S9xPDXhNH4sZLvzscceoEFbHM4PmfHq9Xxx41lhZiVBUQ/FUix83x+tNDww==
X-Received: by 2002:a05:690e:d47:b0:640:e6aa:b2bf with SMTP id 956f58d0204a3-640e6aab4e1mr3921691d50.43.1762787395046;
        Mon, 10 Nov 2025 07:09:55 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787d69ba646sm23716177b3.30.2025.11.10.07.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:09:54 -0800 (PST)
Date: Mon, 10 Nov 2025 10:09:53 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] rust: bitmap: add MAX_LEN and NO_ALLOC_MAX_LEN
 constants
Message-ID: <aRIAQVjLiM1UKzXT@yury>
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
 <20251110-binder-bitmap-v4-1-5ed8a7fab1b9@google.com>
 <CAJ-ks9kvMQ9tUMZyM07jRr8O+pJ6RRvCZodenB==tzDChhHT=A@mail.gmail.com>
 <aRH0oRU5JXKpAKpB@google.com>
 <aRH-ScufjvGYPx5W@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRH-ScufjvGYPx5W@yury>

On Mon, Nov 10, 2025 at 10:01:32AM -0500, Yury Norov wrote:
> On Mon, Nov 10, 2025 at 02:20:17PM +0000, Alice Ryhl wrote:
> > On Mon, Nov 10, 2025 at 08:59:36AM -0500, Tamir Duberstein wrote:
> > > On Mon, Nov 10, 2025 at 8:06 AM Alice Ryhl <aliceryhl@google.com> wrote:
> > > >
> > > > To avoid hard-coding these values in drivers, define constants for them
> > > > that drivers can reference.
> > > >
> > > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > > Reviewed-by: Burak Emir <bqe@google.com>
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > >  rust/kernel/bitmap.rs | 16 +++++++++++-----
> > > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > > > index aa8fc7bf06fc99865ae755d8694e4bec3dc8e7f0..15fa23b45054b9272415fcc000e3e3b52c74d7c1 100644
> > > > --- a/rust/kernel/bitmap.rs
> > > > +++ b/rust/kernel/bitmap.rs
> > > > @@ -149,14 +149,14 @@ macro_rules! bitmap_assert_return {
> > > >  ///
> > > >  /// # Invariants
> > > >  ///
> > > > -/// * `nbits` is `<= i32::MAX` and never changes.
> > > > +/// * `nbits` is `<= MAX_LEN`.
> > > >  /// * if `nbits <= bindings::BITS_PER_LONG`, then `repr` is a `usize`.
> > > 
> > > Should this and other references to bindings::BITS_PER_LONG be
> > > `NO_ALLOC_MAX_LEN` instead?
> > 
> > Ah yeah it probably makes sense to update this in a bunch of places.
> 
> Yes, please. 
> 
> NO_ALLOC sounds a bit weird in exported API. Maybe NBITS_INPLACE
> or similar?

You add a 'new_inline()' constructor in this series, so this parameter
should be LEN_INLINE or NBITS_INLINE, like that.
 
> Also, at this point we're really close to:
> 
>    pub const NBITS_INPLACE: usize = CONFIG_NBITS_INPLACE;
> 
>    union BitmapRepr {
>        bitmap: [usize, BITS_TO_LONGS(NBITS_INPLACE)]
>        ptr: NonNull<usize>,
>    }
> 
> That would be a very useful addition for some particular scenarios,
> I believe. Even if you don't want to make it configurable, let's
> keep this option in mind?
> 
> Thanks,
> Yury
