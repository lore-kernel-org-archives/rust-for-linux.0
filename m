Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152282E401
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097406; cv=none; b=hl0tXI+yto0PbXaLB9d0Z3XvYxC81ctmGvzOPtv+yFPB2x4462Q6pIG5crFGqJV8kogcjB3nTQOt76SVvPrgvO1bgbBdZwPZE57sJIusTYZL/2lV4lT+UZgR1NRBLhBHOsixCIRhuR2eMHpa9C17FlclFgOnoFDWsPF9mZjdfso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097406; c=relaxed/simple;
	bh=4AOt/YBzoH/stvqHjdr61xuvjz+JeH9y4RDsGEah2BQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sg8NqPN4iipqTIbiPGJUd/eZLyJELWsTtTTgn2pSH+3p1F3hTuiAyYF22DFVOiAxEr/q0jlQA7q3k1HGkYLxQb/WzjcUTcHSOU5u6eoJoSkS3b3eW2587yshsZNoI2raiMddLzyfMhBYKaIf4O6vei8LKfcliOutaFK4bQKk404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zIwREbyS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zIwREbyS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso4630825e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 May 2025 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746097403; x=1746702203; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cOOok7HoNGS7TjbGuOzduLpVMwhVDXmCuCUg22wx8to=;
        b=zIwREbyScoxsSxoCF0a6YOyeyZYSqRAfljrU2KmIQfQAuX+6QUgze4IsbqSaONj7vH
         UeyVfPlv5CDgLbobz2QZ7R7KH/X0n8ta9x1YhF9x605hceLzyePUFn6+MIAU6NxAhu/o
         yNh9ciZyeMfcy0XLYyU0ktAwGspByZX5ZOflQe9oPuFSU6OKd0qTxwD3D77+HWNCgGZX
         8TiNXMFbC+PGsCVU4OOlkSQEEIz7Sy3USn7kT1LRTWtpWxAnDT2KmH7Nc8Ro9bfXO2lO
         ZYbdDophjIMhBJ7lbv7xsS6Ecn0cnjtHo6umZfwfUfgbmrfQPJV/Six+NDnpy3VJxAwl
         Kczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746097403; x=1746702203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOOok7HoNGS7TjbGuOzduLpVMwhVDXmCuCUg22wx8to=;
        b=dUj302yZkUq63erQLT96g0bHNsQKV7rGJY30DMZ4rXiObTf+ce4l/B1hdMRjK+IPWt
         8Xr8i8obd9Dr1kqDrK/12H7/SI07ltw4Lu/A+rqBc4A2AFMaX5ESHK+5i/aJSE1S6YMD
         0lbitNUMnyxKAs/kF3T2tQk028Ac1lnWT7IugH7zYVt/WleXopa8hbdoSFNTIJ4FvsVb
         vky6LBjw6E/VqRWpwsXWocNAcctqc5ZYOUBOI5vS3QQufPT77ZZSVaVSnWxHZIImEHqg
         auOS34dyp8RHV8ovPZYOUHJT05lHLDptuj26p+oDHRLgOKoZH1mS2ZInUdrYB2nZ/ur3
         7Q5A==
X-Forwarded-Encrypted: i=1; AJvYcCUDSkGjrondgUablLFcCcXhboApZCK5lj+sDmgkR5/yGNsj+JlihXZCv21eRze/gb6O4bjrSMCO9sX+Cb4o2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNjgiQnZ11Z2q8iOo4OWbekNh+nbH3l406pSHecU96WO5rEQCl
	E/D1PS6eALFlPRTClcWIZk/72E+XXhpt6/rW5WpnWO0u13TaX05JrV7KQG+Fh1+RofCKZamzR3N
	ochwZjyJ84Qqgzg==
X-Google-Smtp-Source: AGHT+IG2OqgvvIg3X7FpxlD8OB5iJ0hMC7VH5uFV4b6y0zFgp/U8Db6poRecIO86D1QMy8tZoKiWwpmrBdB/WE8=
X-Received: from wmgi20.prod.google.com ([2002:a05:600c:2d94:b0:441:b363:76fa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1909:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-441b7044eddmr14852315e9.24.1746097403412;
 Thu, 01 May 2025 04:03:23 -0700 (PDT)
Date: Thu, 1 May 2025 11:03:21 +0000
In-Reply-To: <aBJC_Ef1lKHNx4dv@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-3-dad4436ff82d@google.com> <aBJC_Ef1lKHNx4dv@pollux>
Message-ID: <aBNU-XsWZLZtlmOo@google.com>
Subject: Re: [PATCH v4 3/7] rust: alloc: add Vec::push_within_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 30, 2025 at 05:34:20PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 29, 2025 at 02:44:23PM +0000, Alice Ryhl wrote:
> > 
> > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > +    ///
> > +    /// Fails if the vector does not have capacity for the new element.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
> > +    /// for i in 0..10 {
> > +    ///     v.push_within_capacity(i).unwrap();
> 
> I'd prefer to make this
> 
> 	v.push_within_capacity(i).map_err(|_| ENOMEM)?;
> 
> instead.

Perhaps we could make a new error type for `push_within_capacity`? That
way, you can use it with question mark directly, and you also get a
proper error message if you unwrap() it.

> > +    /// }
> > +    ///
> > +    /// assert!(v.push_within_capacity(10).is_err());
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
> > +        if self.len() < self.capacity() {
> > +            // SAFETY: The length is less than the capacity.
> > +            unsafe { self.push_within_capacity_unchecked(v) };
> > +            Ok(())
> > +        } else {
> > +            Err(v)
> > +        }
> > +    }
> >  
> > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The length must be less than the capacity.
> 
> NIT: Maybe be more specific and say:
> 
> "`self.len()` must be less than `self.capacity()`."

I try to avoid starting sentences with code, but I can do it if you
prefer that. But saying "the length" and "the capacity" does not seem
ambiguous to me.

Alice
