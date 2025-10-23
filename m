Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9A71DE4CA
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761240788; cv=none; b=NSA7et0HRWsYc2ApU2NK3q61wR/7GIM+aeoep7rBjwU0Jq/jY/UErzouEUFCCXFWcH26eHaz0DW2InB0egawTy072y6CS9XR2e2rZca8pEx9RCj9E02ljh0qgoNUSux278eNw4uzD4fO8HPfV2IyJTUgx2VdErZ2syd0/7+ieb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761240788; c=relaxed/simple;
	bh=cpJw1OTejKmslWFrWwUMdhq1fDUlcga/3sUJOW+TusQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZO1SDVTb2H2SCnfU110d0hk8MsjpknW64ySXqYgam/9EdgUKV2g1RZ+B4Nhb/BtrrJ1bmsJFdUQpM1slTS91q5vokyfLgW31LuzKgmF2UsURdUYRnRo4uYGuZvCwmFr9KBTK4E2TtxdKHXFkhHgd4suAdg7xAJT9FvW+KhySduw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFt3W8CW; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFt3W8CW"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-87c20106cbeso14922476d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 10:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761240785; x=1761845585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp4a9eCi2a7gc094Itg0UZRLr0/XIELDNFAexyvEGk0=;
        b=GFt3W8CWGyplFkojZQPFcCSUSeeoJISe/JKwWC/3dgg09+fajCuHZo7jmKZIywK7yc
         ObeRKCtlnPYX94g6BfmL40PZg/DcouwM9pO7oRhnxUCcHB3Ds7OMetES1daoScL9lIk4
         9MXnOvnIKJZr87JXgV9n1tbhCiu78FNO8slyzp0i/RJIaJKs35fDdeONZ08die65g4Cu
         u5Tw465ZMWX7tn5AzXSHP7UzJiQEp9VLHmtzw3tWhF/xScwW5j7SssH6PKuzt+An5A+9
         DDPe/rfhzSSUoNutMwpAJqVTdSdTcnjxiurN2FWfqot+UnzpYAc+rlptYKI+6aFh98Pj
         9YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761240785; x=1761845585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp4a9eCi2a7gc094Itg0UZRLr0/XIELDNFAexyvEGk0=;
        b=Ms+B6qujzuo6EKDGgoPjomgPU9JQd9ZrzwOwOr5VBJd7f0EMT+uy5ubf5VdwZlBFLy
         Lc8h/7ZfdrJUwKJE/R+1/miHOZ9zro/fIEL5uFq50vSavGVXDggP67n0ERwe8CKFpZq8
         LOKpo/ekBJKXodxWTyunVd3C1m6uzPkdqtap67G4KXyQPCLMZBaKZJeaTMYu9DPdpXxc
         SFnZCuWQUMQU4uk0ODl/Rj/e0NygOcIBJ4R8dUkEVD+0HnIxd7JVPKIG77MTrdrKk8dp
         jqQbahQe3B9CjVIE5EWwvb625Eso4eblxPGYGGZhbRnG0vDYTCMF2cxGdKYbhI438O32
         nc2A==
X-Forwarded-Encrypted: i=1; AJvYcCW27N3Or9T3Mc97qMxm9GSUNG9oQvbD/rRxQfacDhz6w/Bh+Z6EZfXdoYVT+CPCVWcfrtMD5CwPvC8aQNgRrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzkl3aPq74q33/N+rYFWkRu/MJE30Xuq5IwjgmhyHUfRINgm9Y
	QJVzT5z5AR4GbkjYx7q4fJyAvgY9F8bLBkQr4J2FtXDhn7UDBYXcX7s6
X-Gm-Gg: ASbGncuxtBqfB1y5xjHcILPmPMCmwbXRxHOaKNcIRTdxAznP19v/13wqR+BOGuwi7zV
	OnqsBn2Y9Fmxq9OW8bkZQZMYF4Cp3UKZODBLmHsXdWGbyKUWs8F9DaRGnebI2+fzT2NpV9bupkp
	tF+Cpdq6/LRiRt2h7bv3EdzBFwt5ZOBl39UW9hUryPxUDzl1BVPi+TrLyOfS6qYiGlOq5ugN7Ek
	Iog9tKilUxm3MoCXgfRUgcCz/gwR20qlIZ0g4GZgLUsHe5Coiy+OUJUmzEJ8igqg8VdCitJ6rka
	GSbTWNN9ycE1nneUzcNIfZjANsyip6nsK1Xu1KiUaJVJ8hWoi09O3Nm8hcQs/QacLfhc6a5LJZz
	Lfq9u6edFnVQhznuBrojJv6lVg8W07Lg2AUQ7cRYN9mNUyby6cIWNYT1jPf1cN+s1inK02fkOks
	fo9xqyQQhzi8HWiuGQiA==
X-Google-Smtp-Source: AGHT+IGHYqbeAL8vbTPvgY90m2GDo8z8aBpxsit+v6Rm+Fgk3PNH7z2lbMi924Eefb4cUQvvhl8tbw==
X-Received: by 2002:a05:6214:31a1:b0:87c:21d8:1243 with SMTP id 6a1803df08f44-87c21d8180amr257680096d6.40.1761240785312;
        Thu, 23 Oct 2025 10:33:05 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f8fb6b1c1sm19113796d6.6.2025.10.23.10.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:33:04 -0700 (PDT)
Date: Thu, 23 Oct 2025 13:33:03 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v2 2/5] rust: bitmap: add BitmapVec::new_small()
Message-ID: <aPpmxy_oYoJeeqfr@yury>
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com>
 <20251021-binder-bitmap-v2-2-e652d172c62b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-binder-bitmap-v2-2-e652d172c62b@google.com>

On Tue, Oct 21, 2025 at 01:32:44PM +0000, Alice Ryhl wrote:
> This constructor is useful when you just want to create a BitmapVec
> without allocating but don't care how large it is.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/bitmap.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index 15fa23b45054b9272415fcc000e3e3b52c74d7c1..4ffe9eb0f208a3d62016e00297f5a0800aa33336 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -232,6 +232,16 @@ impl BitmapVec {
>      /// The maximum length that avoids allocating.
>      pub const NO_ALLOC_MAX_LEN: usize = BITS_PER_LONG;
>  
> +    /// Constructs a new [`BitmapVec`] without allocating.
> +    #[inline]
> +    pub fn new_small() -> Self {

Nit: maybe:

        /// Construct a longest possible inline [`BitmapVec`].
        #[inline]
        pub fn new_inline() ...

This 'small vs large' lingo is internal to bitmaps. I don't think it
is worth to expose it in the interfaces. 'Inline' or 'inplace' sounds
better to me.

With that,

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

> +        // INVARIANT: `nbits <= NO_ALLOC_MAX_LEN`, so an inline bitmap is the right repr.
> +        BitmapVec {
> +            repr: BitmapRepr { bitmap: 0 },
> +            nbits: BitmapVec::NO_ALLOC_MAX_LEN,

A side note: after merging bitfields, we may switch inline bitmaps to to

        bitfield!() {
                0:31    nbits;
                32:64   bitmap;
        }

Thanks,
Yury

> +        }
> +    }
> +
>      /// Constructs a new [`BitmapVec`].
>      ///
>      /// Fails with [`AllocError`] when the [`BitmapVec`] could not be allocated. This
> 
> -- 
> 2.51.0.869.ge66316f041-goog
