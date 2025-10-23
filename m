Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72E30AAC2
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 17:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761241029; cv=none; b=Y5N6UF2ANfxx2gVmInqHMbt6k6/72FxOopHkYw5VqDNLGDYDlYwEA/u64B1cTCvnBwZqD9Lnq6s/BSCttiost5Few6cslbibmWMEocI+8JSSERCSPU5YwBXN89EYOYa8EvCDdDZkWqTSt6mfVUIp2Ov7Plti3pdscylqzXcbUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761241029; c=relaxed/simple;
	bh=06HirvpsHA5H88Oq8EDHNR5z5ZUq/iRoinMQ2IvxnIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcROqkm8WZASkpxBiulaAzHsq/N9JpLTHzwSqgHhWQwa8LCN21YQ0tH117lQLioBbs3kQ/36hkBsGpvVBjurh2G34WeslDOgGeh72GPOhBO9fj2ucUCXT/k3Q79KDl30v4hleXDE5VKmv33usOiKWgf9otDdit7M46FTx6efNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoq81g00; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoq81g00"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-87d8fa51993so12925746d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761241027; x=1761845827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JjYGgrMz5T0b5VMHHukppf7f8eh1tUQ0s02E0HEP3gQ=;
        b=hoq81g00yPo/qkg8hcNs4fqB7icCRXh+JMft1ovNKc5W0iK4zEUw746giIUkLOPk+i
         JhD9JZepO7qWzPtNyjX8kUPVvThfM/sp129R/yhTesQW6Ihq3MKF5xg20avTjWK/8gtU
         D5Fa65TBBq8+Qx70DochSrbCI6fNF5ebXSJ2uPMY3ZcEn4IYNaUnWuzMF7SS4uyUBzlG
         2hUWf4zAPi4+LISPlr8QWbsD/ruSKx4dpxdxj1/Gi2F2n3Z+bVnKoaD9HJz1hB6nFiiC
         ChtjjlywiWlnvsAU/L+J1hsia2t7hqS/gO82v6ugVTzUgGnVXtzUkFxCUvYy9VBpVOI2
         wWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761241027; x=1761845827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjYGgrMz5T0b5VMHHukppf7f8eh1tUQ0s02E0HEP3gQ=;
        b=wSFbU5qSk50hDMhUsQa50GkhImVjSxodr7n928yptowQpfyd9NpK9dydFhTNbrEXrn
         oOnWcCyC3ttj39Nxu6es5AICkvD86bp8ciTux+C5QpWD1eqrB0yYP3KALEY9jZK+u6Jj
         0hEqzJN04xU8Yg246Oy4OwM65SqQorDNn+aOR6VN2v3dv5/1EJxh8TZxsJhHkcESFs1T
         sjXMGMgtSIJnByeNH7a0pXnOu+ArtOTP1QiqZafIj0Rfb6Q7dC+/HIkdRwg1TaZLBw2t
         gTN/0QQzqDK0z+VudTgNDdNwjR2gHG0cYypSMfnQ3355v53sQdf0SJkU6izimg+i9sQg
         JrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW40w7KhvuFebEqinjGzlwnDetWZxKtFnrnJ+AQ1gY4jzxjG3hS7k0HQagggoOHxv3AeFf8aypWvPbonMAHCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiWJyYvtyeLBrLMsrrN8FvXruN69wj5CovT1Woj+NOhWFfVs6N
	MKe+ffSXF5OMb5+R4t7JtYofpGE/mW1KV0cRMR603cj8hNn6PB7euO4o
X-Gm-Gg: ASbGncssMI+35iF1oCmjW5MxIx1lsUlK+Xv+bth9t+mwwcCPOAR91WdY7OLx05QkJvo
	DB4EVaiL9bnQNB+VdPxq1DMtZskdtntpVbEyOCCyN08UqXpbVb8PK/cr20ytOhuZYhVneEW1qtU
	pu2oU3IXkpT4Nb0N6XzrKFJn9i2oY4gJYVOEDBJKKyJZmCfN+in7ewzIsNnwvWnuBdA8lLd8XWJ
	eJdTEoQyEnOriVLPkHBr2P/gngxjIOH+PVXZ62XnqfbmLur3LZSzwQqU+yQBsv2m9yFg9dHF+4L
	kKMf+MhL38NZpoaLx2cTqgkp6v6dCOK4FgcXtLfw7LDUdkxfri/3HU+M1/0Zf6HCbYMc3P2JzTp
	ijj/oxcBfwgk2NQ4cKFxEcdp4eAgmjPP5kPNM9YdETJHtuZJ3h7AGXrMBmzHTgp7jxdfZlnz0
X-Google-Smtp-Source: AGHT+IFAGIHHoYhhCFsRnrO4Ko8G5PM5fRjatDHknRXVMiCASWYuq5FB5OcIT9AF7oflvkgJXcABAg==
X-Received: by 2002:a05:6214:4e01:b0:87c:21db:cbbe with SMTP id 6a1803df08f44-87c21dbcdfamr282156576d6.26.1761241027082;
        Thu, 23 Oct 2025 10:37:07 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9e7d254csm19085796d6.32.2025.10.23.10.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:37:06 -0700 (PDT)
Date: Thu, 23 Oct 2025 13:37:05 -0400
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
Subject: Re: [PATCH v2 3/5] rust: id_pool: do not supply starting capacity
Message-ID: <aPpnwXGo4P4-WI6v@yury>
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com>
 <20251021-binder-bitmap-v2-3-e652d172c62b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-binder-bitmap-v2-3-e652d172c62b@google.com>

On Tue, Oct 21, 2025 at 01:32:45PM +0000, Alice Ryhl wrote:
> When creating the initial IdPool, Rust Binder simply wants the largest
> value that does not allocate. Having to handle allocating error failures

That "value that does not allocate" wording is pretty confusing.
Maybe:
        Rust binder is initially created with an arbitrary capacity
        such that the underlying bitmap is held inplace.

Regardless:

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

> that cannot happen is inconvenient, so make the constructor infallible
> by removing the size argument.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/id_pool.rs | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index a41a3404213ca92d53b14c80101afff6ac8c416e..126e57f34c3407cb1dab3169417f01917e172dee 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -96,16 +96,11 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
>  
>  impl IdPool {
>      /// Constructs a new [`IdPool`].
> -    ///
> -    /// A capacity below [`BITS_PER_LONG`] is adjusted to
> -    /// [`BITS_PER_LONG`].
> -    ///
> -    /// [`BITS_PER_LONG`]: srctree/include/asm-generic/bitsperlong.h
>      #[inline]
> -    pub fn new(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
> -        let num_ids = core::cmp::max(num_ids, BITS_PER_LONG);
> -        let map = BitmapVec::new(num_ids, flags)?;
> -        Ok(Self { map })
> +    pub fn new() -> Self {
> +        Self {
> +            map: BitmapVec::new_small(),
> +        }
>      }
>  
>      /// Returns how many IDs this pool can currently have.
> @@ -224,3 +219,10 @@ pub fn release_id(&mut self, id: usize) {
>          self.map.clear_bit(id);
>      }
>  }
> +
> +impl Default for IdPool {
> +    #[inline]
> +    fn default() -> Self {
> +        Self::new()
> +    }
> +}
> 
> -- 
> 2.51.0.869.ge66316f041-goog
