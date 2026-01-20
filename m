Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B783AA1A3
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768941090; cv=pass; b=vEoml5psO7Ga6zxzplVJ4CWssrhqDiyroXpBo84hvYBpYPQZGzyHd5jn1KpqJ5n1Gr/KevV3YxOnZNCE6P/itw488n7mL9w8ywTKys665khRFpx0hfORmkXMwfJZ9uSf1b1srtO+a7FMQbRi5z8IAqR9Kll7nryzUsCREMDI/eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768941090; c=relaxed/simple;
	bh=Dl8YZlGxncnbFfeTOV2bPbDnz+x5aAs7POVdQoPQgFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0AOu2Oh1XP/BDPVnJiq01C+BwYzDoLrnu60ZB84uJ8lbTcReSJhd+PCgcPDepbXDzIWnAYiTLD29+ZuKXezbPV5gp0RIKoeBWtj3Q3vO4IAGLh9VvAJZnPs7DQ0ZBOgCPoKA5LN5IlAEHVMldqxXxdVPJqO1oiDdof1Ok1Mf1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8vCLj+w; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8vCLj+w"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b6a868ad45so481102eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 12:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768941088; cv=none;
        d=google.com; s=arc-20240605;
        b=CRRFg8dOxLaJGp/mbVm6j2TX06WGWBxdWzL1TPq+mQ3gEe42ym2XYtweEQ6Q9oldvP
         LT94fUhKyjJ8rOL6eD0xj0D4dHflPE0gqzoV9ToCdrm1IIGtyr/cO+vOazxx3Pi4P9rH
         uRi81DTYg6VEWUwjK7yej0MwBn3mlV8ZEjrh55CyCYczJfuKXK98/K0xpTbwFua/MLH1
         bClp/ulgQGN2clWaVwclXw8LYTS+zGJKxR90uLMfn1lzTQ/4WArgwbQxggYD3EBpZCgj
         9m6m5VlYppCw/wOvRdcRI6RO0DBKIrFpOJqjRJZ32y7WJSDQ+k6Rb1OMyV3FOTPQfz0/
         7hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dl8YZlGxncnbFfeTOV2bPbDnz+x5aAs7POVdQoPQgFE=;
        fh=aq65QJYhllzlFB6c23GS6mrEih7cYphdDVUpwk3dnpw=;
        b=fs4nmyYzGUtaa3qkM6QubY5U6wv/CH1S2aiKNwyKo44cKW9+qeXuBhZUDLYoDPlXfz
         BTvRXqRs5F7hvTFgEOwaw2jvxpflw19iuW7xpq8NfdQ+YsMA/VoT7V/9DTOIoJKW2LTt
         tRVuATzBh5pEaWVuspwVo6EvFIzawxGPE/xHpOn5kIgYS7KdiI1TBOrRmSa09AFMouMR
         YDAM7l2oV0FXsqJUhh3PlQSQss2ErhO3KW9l8fQk53TZp3KNgmXdfzkrXWseV5VQAKHo
         XgyjPBgE/D8DZJ+4vt/6+dATXFRH8qwpNp7j9Ava3uH+xlq6jT+KdvTY18Tw+/jY0/RV
         gpbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941088; x=1769545888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl8YZlGxncnbFfeTOV2bPbDnz+x5aAs7POVdQoPQgFE=;
        b=i8vCLj+wx4nF+E8Sc+cyF1lxmgEdCOKMloCYNhuZ1ncpTBWzj0vag8T/5Wolaqeckd
         ndWYIjLZbZvqxtQA+phwhEmwUlJUAcWOsOsSXwOvV2yrDIpsBxEdalfHBmCBrhP6YkxT
         bLIW3kfWI+ckd3X4NBvtXF8X5RCJPutxcumGnkn9OyRObZ/R2rZNoyA+I+pcUBYX4/9p
         NctLtpTWzBX7XW8xkYigfU0FuomURBnxOHw0kwZikY8jURt7l2vpMHk4d1i+ypGn9ZWf
         52LKT0tu8/B5EJn6CdOGAfakWd9RmiHtbVRcuqdyG64vmRstRtOCv54ifuORsdTnhyac
         OYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941088; x=1769545888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dl8YZlGxncnbFfeTOV2bPbDnz+x5aAs7POVdQoPQgFE=;
        b=r7Td1t6yzVBSZxtj7V0qTUV0guU3C/Nq41T/VcAK1CeM350c4zW0xTv+YtQK5ZrAqA
         VD2xknR1z1iNSY7nbLNZSaqzE0wnEbQKJq0C0OLWi60fq1lrDJlg0DLrxDABu0JB4JmM
         JM9yCnabRyuw+N3OV4rIZzGI3tZNNCq/q1r/mz7ZrELjr6VjxkNpBISi53JCyeLRR3ry
         v7IHOrkRaXmmdz/e+zNIx9BGYJZebiRInByIxHY4XFlRFZc4x3fF5yAsbJKSHwU/Tf2Z
         1BK41uNJ/YzyaICnw5PfTRLDqdec2eCPw5NX68ZIGxvqeaPbabzofUb+D6N4oFiY9glZ
         G5Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVQZ/3iVCA8fpKLDYjhLQ0MRdke6Chz9z8/OE6QzHYhanzrfuqw3vcu0ElmakhHI1/EmksaZbcxI/Jt7d1PZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcsZ7Lcz3QkwD6W7hfyGy3BL+5msj9bACL39ORBLSBuxHDA9am
	2XDSyt5GiC3/sXrKHB2HSeIQphEhyTJu78bBzb0eW0M45Up50k7jQWJgEZXtfaI5waSAnvq5keM
	lcD5y7ivBCqBAIOOOesCiAdtvdYbmsY0=
X-Gm-Gg: AZuq6aJb89dmFgd0hVkZAgxoLZhh5vDIbDUWPEHfe9wpPMvDepJk5TDOZKFI6J336Qh
	lDLdjDEYp4NONPfq4WIKwvGHDYp9iwcZcmSCz1bGkPENcTpAwboJe3WwDBs1f6mN7abWvnV1XiV
	3Np4sWHm5FSIGnpgPz6LzdameZFkofJ9WyxF1rq/jmHJoJgmWlUhbYFsEx/QyGYjXZOeMYy3J8c
	pMSMAa+WQG9XSCZxs9gMIrwxn+NV2m+jIZEms0fHvqz+EHsAg5fkd73CCzcS6DQcDGyNwN0OF+Q
	8ldDJLbt9afBdf+rQvUki3zmfmMewKvrACzpoXgYlWhUfgiSkDtYBSPD7xpbIx1sSu+sV23jP3k
	oiPChB9+Ta6SA
X-Received: by 2002:a05:7301:3f19:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b6b380ec55mr6404382eec.0.1768941087783; Tue, 20 Jan 2026
 12:31:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
 <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org> <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
 <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org> <CANiq72m2tU-Zuv_MjLdjfK0qjE45YnuMmTTtrbzmrQ3=84ei=Q@mail.gmail.com>
 <DFTITPLFU1HB.3VCKBVLW2VCPI@kernel.org> <CANiq72ny=huNUmM7_1XjFyXZ_zvTFiAGwx4UB_dOxSaUx5VwOg@mail.gmail.com>
 <DFTOMX7KEFXK.3A9467KZ5GGAG@kernel.org>
In-Reply-To: <DFTOMX7KEFXK.3A9467KZ5GGAG@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 21:31:14 +0100
X-Gm-Features: AZwV_QhNuiTwfxdRsTwQmK8EhiFnpVozhW9yqMxuhDg3cMWb6HmO3r6U9Cd2CtA
Message-ID: <CANiq72nRJzBm0KuGwoUV2kOk_t3VLy7FP+H2m16VAQVKAp1j1w@mail.gmail.com>
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I think it's rather unlikely to land bitfields this cycle. I think Yury
> explicitly requested more discussion on bitfields and also encouraged the=
 "two
> stage" approach [1] moving register!() first and then extract bitfields
> subsequently.

Does Yury want to maintain it? From his messages back then I am not
sure if he does or not (he suggested "some non-rust person from a
related kernel subsystem", not sure if that meant himself in this case
too).

At least, he suggested adding a `MAINTAINERS` entry, which I agreed it
was a good idea (by the way, this patch series should add it, or at
least the eventual one that adds `bitfield!`).

In any case, it has been a while since those discussions. It would be
nice to know what people think nowadays about the macro here etc.

But yeah, from my side, no rush. And if Alexandre wants to maintain
the new file and he wants a tree, I am happy to set it one more up.

Thanks!

Cheers,
Miguel
