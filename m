Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567FA11722
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="emXE/T20"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e7f0bf46a2so48591017b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 01:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1704966389; x=1705571189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtCXQYmLq9aTt9tvv+CBVHB91nSsF/jnix9IvOW3RwM=;
        b=emXE/T20abcjyiB5/wgqTjdD2KWdaDQkTWZH0y8uO9aU0TbwV360VXj+KflNLmN6XQ
         QJ02v4+cL9ArSysQUHuFR+i9IaGZ0N1x47wcwa89U6ROLAkZtd72yVJRtVgsEJVz9fuc
         TY5LHSEoLMvm8/M1tBvNENoYkIerkUKZpvFsq61EMStBBX1RNz4xHpM69VmMH3sIOnV7
         x0Eywir6AC/tEU6DW4vgLPZ9xs/nELhD56ybEZwjVT/l05/UQicnwRctamT3fPaW3LIn
         Rlp6EI1U4o6tVfOpE8xEYh7iiZ+YlQpU5GzNoSmGbI+3dPHXVzTK4XnFeGGGNzzxHiex
         Xraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704966389; x=1705571189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtCXQYmLq9aTt9tvv+CBVHB91nSsF/jnix9IvOW3RwM=;
        b=LXLYrS6gGy2eB9K+fHMCmwRc8059sDhJqDKmp8NlRU5LKO4/PPU29Qpr7LZClldMoe
         BhZHwLRwfnA5mPDBU0tcnPVRDg3QkeNZGyAnr4qC51LnGsACdozq40CGlPl1GYozVRWo
         y6DCI6GnPZbDUcSr5EgXOcDVeMgApg9hnLfM99Zk/8vHMnU98XhqrIyr5qNf+ahjWJVI
         Syqn77UF/pPtdYybAzhrFX8jQah25nKLAG/D4Yp4ETp5iyolASrjL+Sxd/dSdAw4ZtbA
         h+Nm7TvuvGZVzgHTLb+1kcBge5GwtAlzTy925zMezV7SCpOXpnYH2i3h1XPymXM4XeK6
         ixlQ==
X-Gm-Message-State: AOJu0Yyw3/TO73S4iTjJyd1uxzqGrtMgXiYP/KbKyELJye5kNdEbq2Sg
	ErajU5e4lobQ1r5CmyWmnRlNQ33ysmGvLmhj8HpNu4scsja7rA==
X-Google-Smtp-Source: AGHT+IH+cLL3fbstj5NDUOgBfXkBQdWW+PfrKEpvRRddMyBfnUlIXoixu+jsAHsUOGId0B/0N0XlC+8jpvUJ6rK6wKA=
X-Received: by 2002:a81:8d08:0:b0:5f5:a95:bb20 with SMTP id
 d8-20020a818d08000000b005f50a95bb20mr420685ywg.12.1704966389068; Thu, 11 Jan
 2024 01:46:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
 <2024011114-tartar-jimmy-9e0d@gregkh> <4b2265c7-3ef3-4bca-8237-3752d2915c0a@de.bosch.com>
 <2024011108-shortcake-underwent-e12d@gregkh> <36117a36-18e9-4961-8761-ed32f8cce02e@de.bosch.com>
In-Reply-To: <36117a36-18e9-4961-8761-ed32f8cce02e@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 11 Jan 2024 04:46:17 -0500
Message-ID: <CALNs47u6MSJRGyqx9mjQCF41j8fAnfTwNgYdrQozB48KLgOnpQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 3:14=E2=80=AFAM Behme Dirk (CM/ESO2)
<dirk.behme@de.bosch.com> wrote:
>>>> How would this be used?
>>>
>>> One (randomly selected) usage example:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/x86/kernel/cpu/mce/genpool.c#n107
>>>
>>> node =3D (void *)gen_pool_alloc(mce_evt_pool, sizeof(*node));
>>> if (!node) {
>>>     pr_warn_ratelimited("MCE records pool full!\n");
>>>     return -ENOMEM;
>>> }
>>>
>>>> 0 is normally not an error, why would you
>>>> need/want to turn that into an error value?
>>
>> So you are treating NULL as 0 in rust bindings somehow?
>
> gen_pool_alloc() returns an unsigned long. So we are talking about 0
> being the error case we need to catch via Result. Similar to the
> existing to_result():
>
> /// Converts an integer as returned by a C kernel function to an error
> if it's negative, and
> /// `Ok(())` otherwise.
> pub fn to_result(err: core::ffi::c_int) -> Result {
>     if err < 0 {
>         Err(Error::from_errno(err))
>     } else {
>         Ok(())
>     }
> }
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/r=
ust/kernel/error.rs#n241
>
> > I guess a usage of the new function would be good to see to clarify thi=
s
> > please.
> Something like
>
> let pool =3D to_result_zero(unsafe { bindings::gen_pool_alloc(pool_ptr,
> size) })?;

Are these cases mostly from where unsigned long is used as a pointer?
If so, maybe it would be convenient to return a `*mut u8` or
`NonNull<u8>`. It should probably take the error type as a parameter
so you can specify.

For what it's worth, you can also do this using NonZero* numbers or
NonNull pointer [1,2], with ok_or to provide the error type:

    let tmp =3D unsafe { bindings::gen_pool_alloc(pool_ptr, size) } as
*mut mce_evt_llist;
    let pool =3D NonNull::new(tmp).ok_or(ENOMEM)?;

- Trevor

> Best regards
>
> Dirk
>

[1]: https://doc.rust-lang.org/core/num/struct.NonZeroU64.html#method.new
[2]: https://doc.rust-lang.org/core/ptr/struct.NonNull.html#method.new
