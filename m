Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9353622332E
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786895; cv=none; b=L7+E8cX6q6l5uBNmhunkZZuYrFLqcMygEQVb9S58LuteuS0AlcUUuSpTvfEno/WEsOeAbFVn4ZbP6o/fBdQA7tKq+FdgGDzUSRIMgdhRXlwLiBytAv7w7cpDr0tLtJXM0ZBsV1mK/H1nI6uWNzrFpA8uIXf1tQ1Nx+LVADsXPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786895; c=relaxed/simple;
	bh=+vijiCULmkjBaCxsLHOToBL0ostUL0SnrDuVj8Nc/rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVxgPqz72ydLrwm1BlfmTLT65slR1MUFNZSaWJDGcNTfn2uePhmF9dHoufA1vi8569xeyM0pwbWmxXYRR4ydONo2Xyt9TVIMO7LKGKh6Jz3UUI3j/vvYkceEqvLLrkeUgX7fTUFiFRBQZhyhODOjDVNq+XWKbGqgp/IZt47sWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiXb/3KW; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiXb/3KW"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63fc6115d65so2950417d50.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 07:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762786892; x=1763391692; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dYsHp8OhHlSis1fUtc8a5OjTeCx9EkZ9TotPIFCDHU=;
        b=XiXb/3KWMGa84CCWj6gTXgHTIESnnADQNhBJwakoI1ZlQ58BFr1EKgulGCHW+VDXiO
         5xqr2ZgL1vdcnUxuNk/HeDnGkdu+k3LplRt+WO9qRtdXKms8cc5tuZuQ0Fn9/xCkTNHs
         EgpgEONuEbgGVzLA/yjvjXPTR7xLPPoXtMX5fiw/1B5UiYVPq4U0RVnPHbWJVwVFQEeI
         HqrLTtDUdki+ZO4AC4Hcr3/BNYV3cTS9zWzC8/yqsOtlseDnOEHimWJGasBdElhrRoKb
         BwTrYF/mgLp8sNkDSbJN7DpJUB3lWwpDWC9Gs1iHX4eq3uHfhXl/HmbTYZkf5fF+efSm
         ZTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786892; x=1763391692;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dYsHp8OhHlSis1fUtc8a5OjTeCx9EkZ9TotPIFCDHU=;
        b=budAtXn8pfNs/XCcgyhAf744pVW9fKRU8m4x2BD2SPhkHKiYFrHtVE9Q0Nb35kboix
         KiY2TWLEnEAqbCKtoXGUn7Rr1QdntYcjTVjamuoDv3Cl11M4EwAbRxmbtBMn0v398r/6
         B5b54a52/ZrHq8sdnBPnmjm3DwfH68Swfo7Yp599PXk8l9pK7Lt38jhRyau04va85iqd
         8dtmk6yZZrJbZ1lKFG6wggGupQxetiYwIsQaIH6mD4lL0v5cfSj/OLdDRX4TmnV4HdrA
         xTSCxvOJ47s7b/WNuyB+2zYk8wQsIS69iSqCjmIE4n4wNWghda8kgC1P5/XXR2lbktRL
         4DgA==
X-Forwarded-Encrypted: i=1; AJvYcCWs3SS/s0JWt+agnOQRSi9tgLfWGE96NtQAwPvQv9Bd3Okq48jpr8iZS0FfDRQ8dVKj1+xVHKYtOJVDK331zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKkPhAXyOcNtQaQHKNwUngWi3KKDcmGJjmqsZl2XpYqPTFJi0
	1x1lfD8Vmm8cYTREB/0MJMYS2rBDCwuixbcIkupjXfA8AB85l/bETzhI
X-Gm-Gg: ASbGncsssPZq3bdx+LWlwBsASs9kXIZ/kEYKlnpxF6E9YpJNV6G1o8/scC/SbNoDyqK
	eSNwoEmeuoSs0RAaVk0wf7+7lL0623jCzwTKP3pNbj8Sf7lfsVHoBYW9JxBAHShqg0PYgFPeuXG
	Zoj4+VpfnP8LlrV2kFpwxvK4ExNjmE1f6ZVpFcmsKRTZ3KoepPQkZrhk7FuFTiVbh8n7bNL1NwP
	uJdCqxf3Gpi1kkiIuU3TPVy5tXr03K69J1McrqrSOwsbiMwXkXbVengLkYv/Itl+48VuttBUcFZ
	4wtRbwC1BGOxV/QkHYJFLSiuQmZV2Uh6+FDIOfsi5GQFtCs+ZGt1JlYT3yZOhyYV0IVBlLzej+J
	hCnNaMnmBPfVsNajtPS1aPfePW5O/EF2er2atbK6dsulgvsT8ORgdq+gs0s1K/o33wpeZv8u0Bd
	EERp/zDllNMIeuBP5unp+CmSUx/JMN/kiTs+V6gLMa7CY=
X-Google-Smtp-Source: AGHT+IF5h8yGExJOpDLfor469h4TLiSH6Q4kHZk1Usy0pVIwZQ3k0Xwche+/JbCIgtnaAeVY/rGjyw==
X-Received: by 2002:a05:690e:4191:b0:63f:beb2:952b with SMTP id 956f58d0204a3-640d4522d5fmr6932790d50.9.1762786892212;
        Mon, 10 Nov 2025 07:01:32 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-640da6324f5sm2159170d50.27.2025.11.10.07.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:01:30 -0800 (PST)
Date: Mon, 10 Nov 2025 10:01:29 -0500
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
Message-ID: <aRH-ScufjvGYPx5W@yury>
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
 <20251110-binder-bitmap-v4-1-5ed8a7fab1b9@google.com>
 <CAJ-ks9kvMQ9tUMZyM07jRr8O+pJ6RRvCZodenB==tzDChhHT=A@mail.gmail.com>
 <aRH0oRU5JXKpAKpB@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRH0oRU5JXKpAKpB@google.com>

On Mon, Nov 10, 2025 at 02:20:17PM +0000, Alice Ryhl wrote:
> On Mon, Nov 10, 2025 at 08:59:36AM -0500, Tamir Duberstein wrote:
> > On Mon, Nov 10, 2025 at 8:06 AM Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > To avoid hard-coding these values in drivers, define constants for them
> > > that drivers can reference.
> > >
> > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > Reviewed-by: Burak Emir <bqe@google.com>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/bitmap.rs | 16 +++++++++++-----
> > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > > index aa8fc7bf06fc99865ae755d8694e4bec3dc8e7f0..15fa23b45054b9272415fcc000e3e3b52c74d7c1 100644
> > > --- a/rust/kernel/bitmap.rs
> > > +++ b/rust/kernel/bitmap.rs
> > > @@ -149,14 +149,14 @@ macro_rules! bitmap_assert_return {
> > >  ///
> > >  /// # Invariants
> > >  ///
> > > -/// * `nbits` is `<= i32::MAX` and never changes.
> > > +/// * `nbits` is `<= MAX_LEN`.
> > >  /// * if `nbits <= bindings::BITS_PER_LONG`, then `repr` is a `usize`.
> > 
> > Should this and other references to bindings::BITS_PER_LONG be
> > `NO_ALLOC_MAX_LEN` instead?
> 
> Ah yeah it probably makes sense to update this in a bunch of places.

Yes, please. 

NO_ALLOC sounds a bit weird in exported API. Maybe NBITS_INPLACE
or similar?

Also, at this point we're really close to:

   pub const NBITS_INPLACE: usize = CONFIG_NBITS_INPLACE;

   union BitmapRepr {
       bitmap: [usize, BITS_TO_LONGS(NBITS_INPLACE)]
       ptr: NonNull<usize>,
   }

That would be a very useful addition for some particular scenarios,
I believe. Even if you don't want to make it configurable, let's
keep this option in mind?

Thanks,
Yury
