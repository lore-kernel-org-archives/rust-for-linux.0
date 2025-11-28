Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5361A9FB4
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764296134; cv=none; b=i2MPCqjYYJa+E3K7k4CY3QpVsouAuyuLcegTmtoYvqmdsiXWTfyJyXKebIv3SiF+9g4RL203tJAQ8Xgf05PybsJ9DgYwcQSuIWZvzjwGDEldsNA9WCqrQVHyH5DCrtMfrElQbHoMahd/90WIAtFepNuqaEMMI/GVDOfye/IPtLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764296134; c=relaxed/simple;
	bh=P0GotVY454jdlemJ9Mif9MFDl5LNzfmtxmyVX17ZbmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzntNuqWm4wajMAPyMWozplhHmpulp3igBDlTIo7MvfODUAL7/1sf0Sv+vKG+wZL/oBY3upfLHaTG5w8hKAABVJXbbTGbhKr+/x1ES37gsIV4CBUraHon+5pZZTBeKgfN6GtiOso6S+9N4Ck99Nl0mbJGeqrCIN1OLHagWG2Tv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZLwdBLB; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZLwdBLB"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-642fcb38f35so1013095d50.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 18:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764296132; x=1764900932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2CHLdpUp4Ssl7HkxIQWteLCgVD8+JnAniR+pC5eUNQ=;
        b=cZLwdBLBq3yis+4rvfEiMmDdPV8OB0ZHf6AGiRrLpe9alK8P6tRVtjNy1a1Lx9Z5lS
         doJMqfQ5gWqgM+endjafOaVCzGQDE03mANn45L47thCaIE+kG0qrASoEpv8N5/S2C/bW
         wxWI32FXiMYVftyHYdwzXnmBwt1P2mJndupoGc4kWDzHmV70fFjmJWysDQJ8caf0zrWn
         VDJEZu7weETzbarAGykpqwe+R+JkVVn8UneL+MDvLeK4NMpyaJ4ecJQ5DUlvXfVtHDlz
         C2FckdgPsAML0kCVhhfElnsYWX843SFaVo5jNNM97B9b79x5Zkkeu+nIqOMLfsumtrHH
         qxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764296132; x=1764900932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2CHLdpUp4Ssl7HkxIQWteLCgVD8+JnAniR+pC5eUNQ=;
        b=Sfme647V5ZVjhquTsVgzm05/ZZcV9CbYFa14dP06Ug6LdGVo2GlcssxEVBhRhlqQ6o
         H/iM7T1duTnNbbJfPzNHsVtrM4ryQpZG6bsQqFpB2jOrCN4rdCPMC/YOuwK3cHTlFowB
         NnfC1UFK+9XKYY5e3jUnH/JXmjBijzy8njvf5o72AE+zQJx/UoPd9XJAMpvSRasa5T7K
         bGbgHWLZhVNGVDt4Lp1waMfDxrgUxmQIE64EGex4lAkFwxbN4UTq4XJDVe0P5gEFivnf
         DnK0/RrwpK8WU5tynM1/hmltEIxfzcW4yzc+c7Yei2nJK/8lKYvwptEWsY5a5/ysbAtp
         J/sg==
X-Forwarded-Encrypted: i=1; AJvYcCWXULOnSpMShEmWx8zEymtwxJARVqtLAM4sNzBoywVu4uxhh1bgpIXH3hmvk/SkYp2/omDl6TfB/NcZvacapg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8WFcAGE1uN06UWYCCdyx5httA4rpyDgnpYca7agY5Mk61nWb
	wr0MQX2xajaCknEsX1kj2dn0V9JA6vdbDS/QB3zuunBbJ/RVeSrDao0i
X-Gm-Gg: ASbGnctOI1VxCBuJ7bsj63hRVtoz3k1Z4KYtZxL/IFHREgu/drTvR7bZApVHLI0aqmM
	qK+paNrHV9T9vOdxfBmT0pfxsDf5q/LEpo4FXqTistUjPv7oB4Wmu5vZ4z9Ww52MAmPfiFwEzSv
	UogtqEx2imvTL+bHD8aIYQWUHleaTHo5YxzfpPQTWwyL/bwNqq5gampkA+iPym8JpW21M3HM8Kg
	TBHCxGdD+lDlLdYyBy/eDjCttIvMiYfEkh/mChYbH4fk0pyo1Bu026TfkjG0NIJDfGN8ChD+dFN
	b8seKH0xBEKXz+jR2iSELcNo+ITO2BLVQ2HHr6BuunwHt1RpxfAN3ndqYn5GfPeNw48odFKkhfC
	R4C0ZzPJbWMLsYeqIMy6y1vXoGGKBFmlo2VnHMmbdW+SEBAKGKkEy+l8GlylG1iyQmqDSAtresI
	i0gHlGXwc=
X-Google-Smtp-Source: AGHT+IHnP7VicG6waOOzhu6TiR+B+K/9sG+saFcAMNFcFN/ea7k1BLVt9YbC7IMgWMjWFguUL7v5Qw==
X-Received: by 2002:a53:d68d:0:b0:641:f5bc:6980 with SMTP id 956f58d0204a3-64302ae4ef2mr14870221d50.76.1764296131954;
        Thu, 27 Nov 2025 18:15:31 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:59d3:fad0:b7e5:396a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6433c050814sm1065368d50.5.2025.11.27.18.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 18:15:31 -0800 (PST)
Date: Thu, 27 Nov 2025 21:15:30 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <bqe@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: id_pool: fix broken intra-doc link
Message-ID: <aSkFwsx-6Gu5Eu2a@yury>
References: <20251127213340.180090-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127213340.180090-1-ojeda@kernel.org>

On Thu, Nov 27, 2025 at 10:33:40PM +0100, Miguel Ojeda wrote:
> `rustdoc` detects a broken intra-doc link:
> 
>     error: unresolved link to `BitmapVec::NO_ALLOC_MAX_LEN`
>        --> rust/kernel/id_pool.rs:100:31
>         |
>     100 |     /// [`NO_ALLOC_MAX_LEN`]: BitmapVec::NO_ALLOC_MAX_LEN
>         |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^ the struct `BitmapVec` has no field or associated item named `NO_ALLOC_MAX_LEN`
>         |
>         = note: `-D rustdoc::broken-intra-doc-links` implied by `-D warnings`
>         = help: to override `-D warnings` add `#[allow(rustdoc::broken_intra_doc_links)]`
> 
> Thus fix it.
> 
> It was a missed rename in v5 of the patch series adding this [1].
> 
> Fixes: feb3fdf1239a ("rust: id_pool: do not supply starting capacity")
> Link: https://lore.kernel.org/all/20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> I saw this in next-20251127.
> 
> I think using [`BitmapVec::MAX_INLINE_LEN`] is clearer in general,
> especially for things in other modules, but I kept the same style as
> other links in the file.
 
Thanks, added it on top of Alice's series. 

>  rust/kernel/id_pool.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index a4c37d6a0971..73a952d7dd83 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -95,9 +95,9 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
>  impl IdPool {
>      /// Constructs a new [`IdPool`].
>      ///
> -    /// The pool will have a capacity of [`NO_ALLOC_MAX_LEN`].
> +    /// The pool will have a capacity of [`MAX_INLINE_LEN`].
>      ///
> -    /// [`NO_ALLOC_MAX_LEN`]: BitmapVec::NO_ALLOC_MAX_LEN
> +    /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
>      #[inline]
>      pub fn new() -> Self {
>          Self {
> 
> base-commit: a322638c15a678168aeb8dc11c8760f8a053124d
> --
> 2.52.0
