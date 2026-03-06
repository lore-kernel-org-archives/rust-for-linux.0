Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A774E311C01
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772825287; cv=none; b=nGHnklcDspr3VSWi7LAKrB6eK2Ygt2AcGiSnPJmGiM2n2Jjv6xK7uner3SX7LJK6PxRbkZfausnFPAQ4McfrjeIEIYLBFQpjA1o/QOZQ6DRsfw27ei2fAiREFTIbB+EmsKuFK77U2cWvHN9JIBNihzwlJXBEUjWnmdlKc8T3b2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772825287; c=relaxed/simple;
	bh=1wSzry9qXgOGT6an8EaEVFIb7De7cskzidp6Q/iEeZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APfpAUwowbWXGla58NhlLOFtrm3TPg6SuQw6kw7S8lxVEMzykH9T5/phKXZYm18QvUbLxQx4MKT9+ETUdXpzVWOu0M5mBGYyTCYqrKgwvtSLQV17ZtU2Mt/tWBck7oB1ng6Rv3rsy35gjLRtAQP3vRAagsF+j0Xe2Sq5UUroPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RrSPeJQn; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RrSPeJQn"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae49120e97so10235ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Mar 2026 11:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772825286; x=1773430086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PvXYP23IhuFH1eZo6K/xzmMOw61rGrmSbBCOFimt1yM=;
        b=RrSPeJQnLdLtKC0ennxeJvxxlxVOcRVe2l/C8vOk2RHhFqhvRnGb01aNx6vA2Vpz2L
         xOyfFl/WVz2E14hgaOoutMZQY/he1ZBVTjPLZ3z43NzUTazwZ+iqky+T4kfo6aUyqFIN
         dgafzgrhlP3CI0L8A5CiGgTqAAmR/7wt3H5a7iQskbBfIIP19A1A4yZxzNIcufVKl6jk
         jGmAVEISb76IhMdDrH/mVz8eksJmJmRwhmnLKlyGXMRA2KA493eAFMAo/Sfpfsu4/T16
         fyJNU6G2ladry1Zof/+tmT7VMBO2uvBV4QW7RPrxy8s6/fYQwOSH4wThf2OGS0v1k12p
         vFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772825286; x=1773430086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvXYP23IhuFH1eZo6K/xzmMOw61rGrmSbBCOFimt1yM=;
        b=mD7Q0d2vcEoRJOe50bEfvWNOe54XmvL9xwnSsGr7Gtsmd1n4vMXmahp+ZZ9Y0V7Eh4
         jqfkg/dijPKWKlvq7jpehEkOB+SOQyPRfv1N09gNyYXKQgKclj/2rMf2haVYxgiLfE1q
         5ZpDEtn0wDLH/bW0oKmqSqD6vEIsRuzXs47vCgkvBVWqSY0zY8HKb00+0zhMVIltVwDl
         DG/zrulkJt5aQPw2uTknypy+doV/+aRBza/d1WqOsigHhlE2m2zYQkC4km4dizJV8VCa
         uwA181zP4Y5O8UAokGW9XzjfV4L77+YXHFKdLDuoCvtdUWQ4TzlzcNeWtXDfNYiY8Bcr
         dV4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK39iC2OvsCgjRqvNmpEN1cEunN29cyH4ccWjLdWqTRbl8/3tb785qJIlCw0yxUud7jPRBZnruapWh7GeUmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrX8WCOYwmZ///24X1gOlnw0Gg6y1HgWOLUJHcBh7woTD0WZzv
	cpemiY0IjBaU21LC7Qqfqyi49JXPdfKJGcdm/a8bSYpjcryzRxtqvF27fmiLRG2xVw==
X-Gm-Gg: ATEYQzyOcGDtw9T0hbwr0MNORI3ofXo66XuORobBHiWBVBnoHVtMbomxU6PxXIipECT
	c2i4KWBzSWI+OWKd9Yex7xzBx0Zq+wN0PSs18mcmBhp8eLFaqqAgG2Ixgopb+O9YEeDv8ySo1qS
	sxEhJey90oGXHj0KA0SQyeHGMXhizSwY7Rm9Jk1BwgBZne4gTTEYeuroGGxkbREcsS23Ute5dyI
	otQCu3TqIqyPejO0KlD3mWpqVeUbcyywq8tVrucX47sk7pNAPLG4D3ok1pBSmDb2/lCxlqg6NxG
	gRdJPCOl9qh4O+OroL3eAxXy+0JJB7oztmBMLD5a0gsv6q82MYtjFUIPlhJ5XmW/vBYDNBDjghI
	X7z1SaCr2lPVMR/C1YEoeRTxl6BUNP9BY4P7BoL1DD2agaZeOQkXbiZo5Ia9mig1C95TizhYmeX
	gHPkZMIHxJ8jqSU3Xrtd0A9Efn2LntOwqV6tvDcRwvSj1AQdUqbUrf7WUQwWAVpE56NrE=
X-Received: by 2002:a17:902:d487:b0:2a7:4151:2c74 with SMTP id d9443c01a7336-2ae8ad895d7mr224085ad.16.1772825285389;
        Fri, 06 Mar 2026 11:28:05 -0800 (PST)
Received: from google.com (197.23.125.34.bc.googleusercontent.com. [34.125.23.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0cb598sm2259382a12.13.2026.03.06.11.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:28:04 -0800 (PST)
Date: Fri, 6 Mar 2026 19:27:59 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	David Gow <davidgow@google.com>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] rust: module_param: wire StringParam into the
 module! macro
Message-ID: <20260306192759.GA1369418@google.com>
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
 <20260226234736.428341-3-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226234736.428341-3-thepacketgeek@gmail.com>

On Thu, Feb 26, 2026 at 03:47:28PM -0800, Matthew Wood wrote:
> +/// Set a string module parameter from a string.
> +///
> +/// Similar to [`set_param`] but for [`StringParam`].
> +///
> +/// # Safety
> +///
> +/// Same requirements as [`set_param`].
> +unsafe extern "C" fn set_string_param(
> +    val: *const c_char,
> +    param: *const bindings::kernel_param,
> +) -> c_int {
> +    if val.is_null() {
> +        crate::pr_warn!("Null pointer passed to `module_param::set_string_param`");
> +        return EINVAL.to_errno();
> +    }
> +
> +    crate::error::from_result(|| {
> +        // SAFETY: val points to a valid C string from the kernel.
> +        let cstr_param = unsafe { StringParam::from_ptr(val) };
> +
> +        // SAFETY: By function safety requirements, param.arg points to our SetOnce<StringParam>.
> +        let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<StringParam>>()) };

I do realize this matches set_param, and there's a good chance I
missed something when reading the macros, but doesn't arg actually
point to ModuleParamAccess<T> here? Since the struct is not repr(C),
isn't the compiler technically speaking allowed to reorder the
fields, which means SetOnce<T> might not actually be at offset 0?

> +
> +        container
> +            .populate(cstr_param)
> +            .then_some(0)
> +            .ok_or(kernel::error::code::EEXIST)

Does this mean the behavior for Rust modules differs from C modules if
the user specifies multiple instances of the same parameter? I believe
we just use the last value of the parameter instead of failing in C.

Sami
