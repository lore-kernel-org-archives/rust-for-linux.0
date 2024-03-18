Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7556756
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Mar 2024 19:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710789161; cv=none; b=jJRREF4Gljboklp4XUd0Lbetsa6eU5xQ5+NuhihP9ta1ozeDypo9JYZ9yPb0C4GeNsPMUERWlnUIGgrIa81/4jH13sGYECH+TjnE0uLPBApNuU11hZChBCub3y3w5ydSJQUBI8dCA5qkU+DK0DqUNNzZSBGoj3ZtsCe01OIo7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710789161; c=relaxed/simple;
	bh=azAsnPQAVK2iBIAnXaor0VpPHFvaPYrmjfryKMkNBHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWNqjZy0uPs6TAiNfexZ3d4hyBFrLDY2kw6Q6OZjWJdl2adsfTkNqgVr+3n61ieABvmsmi/ZPYiMoryu4cY/MLC/UMnqIk3TI/mqOuBcs9BiHx3GZRGeIShK6EjgYMiD/RvYIKi3MtSCiUUejgdaj4UwqEQ2C0LVPiqeAm5y/qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ohlCySQn; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ohlCySQn"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4765792fc76so990730137.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Mar 2024 12:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710789159; x=1711393959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIPYiS6AqT1tNRa+kXH/qxTnijO9SB6Y3hbgkaDiv84=;
        b=ohlCySQnxier1SqXYCtxavbjBcoJEYaDwqDVXsUoUJG1wJdx6ISW0U2gvkfk9tMaIB
         f4p/JadXVx4vOcdKuHMGR/I0GBhx4H5JcLF6ULxAidWtajKTyQwOMXmr+LocMSDVmGIY
         JNqXky4pXo5vxp5l91VKsRBJSBcOONM1VNcow3VX8evSDhrWiYl0jjYrGlS/Pr+dQBt4
         ef+gfk+6e4DX8R6Hi3Ggk8sxZnCSpftwBYZik3L2HiWvomExYOEliTTi+IYtBq0YR5Ih
         3gt2C/jwJ4cMx9yqHe5LF+tLJa6qoz9XF33tnN8GRjGAu3QQ0/swcOCtUY3W2ER6lN8J
         fT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710789159; x=1711393959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIPYiS6AqT1tNRa+kXH/qxTnijO9SB6Y3hbgkaDiv84=;
        b=RC+1OGo4BsivYVlKofUZtYzJsHGOUNNdl0cjSn8vFVYYcBO5bMAoe+zxYREAoeIydV
         24sxftAsFiz4dK0trxiowJ7BSRMDeyFqTIcnuW9bnbGOK8dYc5rS55JCJ6LMgsw4QHAJ
         gN0N9I4Bs7IB61CaPH8PrpK5cP56ILKOC/3r69LkKX9KnBw5mHTSFQRQpS+CRewau12S
         ybzXjJ6OUWxk/FJzs9WbqIasNnVW2uYQBsG1Ua0PAEyKjr3zSN3nqX6fXCCzPTMnKnMD
         gLEzCah7LixVaqad48sAnjDK7g2hZTmC+YJfl+f1iKH3k3nvC6SV3/I7jWk5H870XWiR
         v6mw==
X-Forwarded-Encrypted: i=1; AJvYcCWQmcA8G63Y9iGdxMzMQd4Bufy7nL8yZrAqoMf0S2EfcKJJTVZ0yJu38AnXy2C2WuF6R6qahenb9I8SzsyxcVexWhkcIrT8DhVve1Qem7s=
X-Gm-Message-State: AOJu0Yy16LHKXutc3kr+ZmqA8jy6RNBbjC2yBFPtrDZHtilQQLp+v2YW
	SuIt2j9xqSGdOr/TzDzpAqlTo2mbEAB+HLuwZpWbY6sr6glKFU6R6+m4SV4S6EqFGt9W7ZnlzCO
	lU8T3qwzRiBW82Q8GVfJQX19n98k0upyQzRgW
X-Google-Smtp-Source: AGHT+IFEDnXmFC0T46g4e3RXdTra2OHUDn/F9pxl9qas27NyWz4W8MEV58eyTz1wBY4vhIQxnax9RfgFyGEFnEXlN/4=
X-Received: by 2002:a05:6102:a54:b0:473:ac82:27dd with SMTP id
 i20-20020a0561020a5400b00473ac8227ddmr329639vss.6.1710789158712; Mon, 18 Mar
 2024 12:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-alice-mm-v3-0-cdf7b3a2049c@google.com>
 <20240311-alice-mm-v3-1-cdf7b3a2049c@google.com> <ZfiPB_iavHr8hNbm@boqun-archlinux>
In-Reply-To: <ZfiPB_iavHr8hNbm@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Mar 2024 20:12:27 +0100
Message-ID: <CAH5fLghs7=V2hHYBnQE-h=xpQYKX5ZxrV1iVdB4ybt7pAXFMWQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: uaccess: add userspace pointers
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 7:59=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Mon, Mar 11, 2024 at 10:47:13AM +0000, Alice Ryhl wrote:
> > +
> > +    /// Reads raw data from the user slice into a raw kernel buffer.
> > +    ///
> > +    /// Fails with `EFAULT` if the read encounters a page fault.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The `out` pointer must be valid for writing `len` bytes.
> > +    pub unsafe fn read_raw(&mut self, out: *mut u8, len: usize) -> Res=
ult {
>
> I don't think we want to promote the pub usage of this unsafe function,
> right? We can provide a safe version:
>
>         pub fn read_slice(&mut self, to: &[u8]) -> Result
>
> and all users can just use the safe version (with the help of
> slice::from_raw_parts_mut() if necessary).

Personally, I think having the function be unsafe is plenty discouragement.

Also, this method would need an &mut [u8], which opens the can of
worms related to uninitialized memory. The _raw version of this method
is strictly more powerful.

I don't think I actually use it directly in Binder, so I can make it
private if you think that's important. It needs to be pub(crate),
though, since it is used in `Page`.

Alice
