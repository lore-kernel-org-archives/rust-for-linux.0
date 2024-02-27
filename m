Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B213AA35
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Feb 2024 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709039566; cv=none; b=VdviOYE4lQejcYGFBjCN/C6TVGZmW0AgCX6kM7/eJdHhU3nF2IoBya5soEkWJRZujT02mwpqe+gQfJ1ECa46Vw1Ngpec+YqaL3Va3m6/Q1b5GLzHI59VTsm9KzvXx8abRyyWMkBtKDsVnV/8sWaCBIeN+mlKayH7tcv73zlhXSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709039566; c=relaxed/simple;
	bh=y6dpxMerbedpocP5qX8Fk424TWfiwib+4y7gPQ6TzzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4vmh3z8j09QVPtdv+sAz3e5jreJoHMRvshS77IZ7lcjS43U3ABtZ79MbWXV6h+M8/n9vGtEr6Gpf6YkyghMPCaPb+a8Wxd8eVBQYQ3Ze/70+IzZFsa/H2U/65/Ns/T/dOa6EzFMx+4SVDD4HYwgQSTM+feg76vqCDXgk54Gw1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f7yw8rlX; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f7yw8rlX"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7da728b0597so1204310241.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Feb 2024 05:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709039563; x=1709644363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3oWv3i2/XO5b533cdNomwEvxjqpP18WAK9tbqODocY=;
        b=f7yw8rlXRFO8RCB5v/Wh9ZIpMBjLKECCg/hhQ9SYuAh4yC+sGfh43eLbKYdaJTaMK7
         lSZeqTOBl9YKInmXxtqAauIL3q7CIqtX7HN8UN21fUJyQOUSoRRoGDz0HPXdrhNYzh2Y
         ijdAVYjjfzqVsDCqB8lP9uNWhn0AHI48GB94aFPKRmx6kuIn0jhI10t/CXBNHD4zR1UW
         I5+ylCrYZk8qP9UgAysQOTorU3T5bgGPtZ0zmrueJtPB5f+x+WQMjyTozatTIOKW5qo/
         1DYpML4uLlpHy5GTbj3bxUkaxdfBvSpUElHiq/ig2cgI8k+Gz7yfce7nFIoeK0aanOvr
         o3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039563; x=1709644363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3oWv3i2/XO5b533cdNomwEvxjqpP18WAK9tbqODocY=;
        b=PPPj+GPI4tT+qHNaKLEGN4TAvxbjSwfRJkUNvktF5rHSgEQn6r8dTvHiHrPi29tbhd
         vK1R0E6aZnddIXKcbzxPkUGR8b8z8jixGvq2RNdAC28IYI5fbIXlkSiBkZbDYbTVLMvl
         55u0wV0AyiYw3hX2NmcUoYwbksxcvIGWN4qCL8WUFfYNtwtLwf0CTpIABB7moRp9uac8
         nM6EHdtfG0qxrZFm7fWSC5aozCZIFN4HrDrE3ZyCzeHHY2NA5CG+u6U1kj3vMtklJXhk
         6rhY3pE1qixzoLw6a29XSpgnsbiQjPEfZWDbnqcGTnSoacAbqRjiWO/ImJz2w5d9NLC5
         j5nA==
X-Forwarded-Encrypted: i=1; AJvYcCX7eHsQFYUFT3RM5cjnBEUMjC47h6e5DBHNIFsEYsJtATLt/UFNCcmhhRIL9+Uh2C4X0GwLhSerddDrjS7KKLcOK1lkVi4io/+q1YdFUcQ=
X-Gm-Message-State: AOJu0YxHJB2DPf1IXmyUfwQ7uD+Ec5wgAVp5mXc4gxwWBm3yNn59qfwf
	8tiKK9KKCp5cUH//Yh7KV5PhKJjE7EMr1zmZAx/Th5jrrYQdQpHg07fu7NwVZ3gQ9DTeblIgaoD
	Nt0HMs5m934sVGNTvcPCQvs+Zq9d/2UDifnNI
X-Google-Smtp-Source: AGHT+IGb8+w7aoyXh4uQz6QeOsCbek+YflIJRyj5WX4xYPWLOz1pYVSvGdKR7Ib1S98g5iKsdAqah8qeTHVRcJgTseA=
X-Received: by 2002:a1f:da81:0:b0:4c0:3116:e909 with SMTP id
 r123-20020a1fda81000000b004c03116e909mr6754352vkg.7.1709039563535; Tue, 27
 Feb 2024 05:12:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-alice-mm-v2-0-d821250204a6@google.com>
 <20240208-alice-mm-v2-1-d821250204a6@google.com> <a7f91ee5-ecd4-4446-9de7-3902763c0058@suse.de>
In-Reply-To: <a7f91ee5-ecd4-4446-9de7-3902763c0058@suse.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 Feb 2024 14:12:32 +0100
Message-ID: <CAH5fLgh9xuYs97SDn61yEm08Tx9PDPMWw40BsFeMPuHASq_s2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: uaccess: add userspace pointers
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:05=E2=80=AFAM Carlos L=C3=B3pez <clopez@suse.de>=
 wrote:
>
>
> On 8/2/24 16:47, Alice Ryhl wrote:
> > +    /// Create a reader that can access the same range of data.
> > +    ///
> > +    /// Reading from the clone does not advance the current reader.
> > +    ///
> > +    /// The caller should take care to not introduce TOCTOU issues, as=
 described
> > +    /// in the documentation for [`UserSlice`].
> > +    pub fn clone_reader(&self) -> UserSliceReader {
> > +        UserSliceReader {
> > +            ptr: self.ptr,
> > +            length: self.length,
> > +        }
> > +    }
>
> Just out of curiosity, is there any reason why this is not implemented
> in terms of the Clone trait?

I think people find a non-Clone-trait method higher friction than just
calling .clone(), so this nudges people towards not using it if they
don't really need it.

But really, it could go either way. It would be okay to use the Clone trait=
.

Alice
