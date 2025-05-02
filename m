Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE1B255F41
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195919; cv=none; b=EwEMSGOpihAeEu20AMCtkXQpvY//IHi2jjqJMtZJxDn2p3B5gYveOdngFbBnCbHlHNw8O6XOCc6zI3NZ7zoW6pvoW/9OS/88vHHlnk9tad9Bffd8OZmtzi9SycQNqyfKRW8qCmA3bejRnt7gIZSrOrUqzojrUC+gqBWxfMcQyUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195919; c=relaxed/simple;
	bh=pZiBNnXScMp3E9/IldgcA1G8EwAbt2ClXdhVjdh0vsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHX6CKHFu7OBjpVTClvNSLYykEIQPMuHYcInHuYGC/pcI8jJgEyHWxk5RDuL0TJo2G3sq79soE5fh/KDOypPqqSvlzdQ8PNPEYKZeWv6oGRauIGRu32U2EDn5S8r6LQ4wLd7zqDTa77V9kGNikSTjL6y33cWKUpPjHEyWnBFVrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F+KQfspf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F+KQfspf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so12342735e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746195914; x=1746800714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu59r6iefeoLBHCzuL/MfPfrNdxjLabvpRWZs+2IYlc=;
        b=F+KQfspf7u77e10lwO/NfAFvUsj8l1OpuHolzF2Vwr9j02YUuJ9MI7iVImyWjfjkqw
         m8pitfCnge2w9jKm+sL/35NqmSPik51PNG9Vm6GgjlTvmsOZWCN2LEFauIFgLlE9hgkt
         Q12S10YGpqoJa3b+me1DWr8zxSet1t/iHlYGzUXKk4S0KCz4KnI/KouM07rwhq73mlYy
         PiE0Eu890l9/FcX1zSGtbeEiKiyTC6p/JGwlqvHn6KFPrYDI4/8RjrTi656tkoEbV+zV
         qTWMf/LOAZa5Tl1kqF+DMLFNNpgtLuUl4WdJROXsDi3z96zpqG5c6Bd4kEaCFnWJh+41
         1Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746195914; x=1746800714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mu59r6iefeoLBHCzuL/MfPfrNdxjLabvpRWZs+2IYlc=;
        b=gX3kwkUYPcQnhNoU6qpY5B+4yYpL523TSL/QzVEd7CCQQnJkAdCWq2SIPirBYza85Z
         sFIXIdfxv1buiXOF5ht3xUMW40zYlm+fRXdjpXbXgcdYtkT5R6jVVFxJK0G7gvqlLghI
         QZNPaeFO9IlCdc8wIdjxVaDlvatsJMe6va8M8eu8mSR+z7I/CXoH3P3DtmJexiBcQDzG
         4Su2R4x9YkSLgEyx3pMraSa/lJTe6R90G7NKH9qPAB7BBifJRpXlR9qYNUgE2beQMBOv
         3tUa4wi1d3M1Z5AALEadM9VVhzfJnBh34+qnEio9AK5rOEd72rn75Mud9m03TxMVyrsm
         yvTg==
X-Forwarded-Encrypted: i=1; AJvYcCU0WUGOUMjeBzZIDMEB3c6rzk3kqS19wIydUjo0+IkM7etln6Yrf+ToSz2vv/QWw1gxLjWfCWnj+879R8T7Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVLQtOwwwryoy8LV+UCf3IuaN0lhUXrfAdHBR3mLo5GhC+fO9k
	HLM9YwBYND2bz28lrnBpjzXdjsQdYYvftGJ6lqhX38hDCzDamyGLrCKhGc/E8f+yRlNstjiernP
	tVapWuZ6IoyM+Vqih1wCvm/N3Zm30dQmlBm3d
X-Gm-Gg: ASbGnctMZKl/91EeblQdJZFxXmYxLWC8PaEqZBw19kyzX8z+51EI/otug2kue3kpjZd
	Y/ws8QtO1M4MVnKpfiDkjPdUFoJ3FnS/zZj0jAOE87++zdO/cd6T+eCc90v2leL5Hr1hruC8MjZ
	yck5BL8xeqfbNanvZWTvXz9e6TKglU0qG86WpbgeQ8McQFgik3CDz3
X-Google-Smtp-Source: AGHT+IFTjZNIP6o7h/dZQijToI2run4ejVfB90Ph5WJVLHThqb5+e9AlNbdGW6bwMuuKoIFPpuw9QOIrNCZ/k2f/Z+o=
X-Received: by 2002:a05:600c:4e94:b0:43b:ce3c:19d0 with SMTP id
 5b1f17b1804b1-441bbf37ee3mr19188215e9.29.1746195913687; Fri, 02 May 2025
 07:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-3-06d20ad9366f@google.com> <2025050215-affluent-repair-3bb2@gregkh>
In-Reply-To: <2025050215-affluent-repair-3bb2@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 May 2025 16:25:01 +0200
X-Gm-Features: ATxdqUHXTqzj3xFcMLp4GpQyeiGgIcTa4-2q6U_k0okz3GEC0avAjIuy-4AVioA
Message-ID: <CAH5fLggG7Af0ZBjhMLuSOX8FNGepeo8eEO77dcN3JSohog0XtA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] rust: alloc: add Vec::push_within_capacity
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 4:07=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, May 02, 2025 at 01:19:31PM +0000, Alice Ryhl wrote:
> > This introduces a new method called `push_within_capacity` for appendin=
g
> > to a vector without attempting to allocate if the capacity is full. Rus=
t
> > Binder will use this in various places to safely push to a vector while
> > holding a spinlock.
> >
> > The implementation is moved to a push_within_capacity_unchecked method.
> > This is preferred over having push() call push_within_capacity()
> > followed by an unwrap_unchecked() for simpler unsafe.
> >
> > Panics in the kernel are best avoided when possible, so an error is
> > returned if the vector does not have sufficient capacity. An error type
> > is used rather than just returning Result<(),T> to make it more
> > convenient for callers (i.e. they can use ? or unwrap).
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > +    /// Appends an element to the back of the [`Vec`] instance without=
 reallocating.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The length must be less than the capacity.
> > +    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
>
> Why does this have to be public?  Does binder need to call this instead
> of just push_within_capacity()?

It does not need to be public.

Alice
