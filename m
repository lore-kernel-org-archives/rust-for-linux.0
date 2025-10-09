Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318A738D
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Oct 2025 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760034494; cv=none; b=NZ7h6bJqh4AQjPCLRhPls+9WtW3N3dhY4k3Fd8e3CqCDMOideXXEEZdTlxW/zXYmZySucxvUZko76F6B2NZhbqe0IDn5jw3tClBHvfd6mQ6agSI/4fceRYTKrXgyPi0AL/1Kz48AgWSOCLSIMs67ka6vtyV3pzMR4tlg6QLW1Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760034494; c=relaxed/simple;
	bh=Jm+Pvp7IGU0rRjl/vbRGRN6axsBYqg1WFn7zJ0a9kaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VakOeNJNwrfSHK4R9laGwIJOtFpX1I+7eiTNInhAtDW3ARvCHhHY4UoM7Tf/BmbynF2vtyy0dQOEl1yr1VtJGSAXr8Ty0qV1ymwUUyEuYqFHOs7kJELkC7z+akji3iCW1G4kgOIVwCMINe0UDVeDL93YfSLPiV+zXf8xb5HfePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaatG0VG; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaatG0VG"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4da7a3d0402so18313171cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Oct 2025 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760034492; x=1760639292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m5CEm/k2cKSkdb8l0Unz1Qn9/RiaqPf8uIpBe3eDtIE=;
        b=WaatG0VGIHMqVHvg0ZLjDjfZ1m7anQ8Owbt4T2K8cHTus/MYr2Uinj6ku3bMv6cb67
         Q0okGFSMPLk84J+4RGGFGhRPCMRxpxZR1/w2vBPOPWuSW/dQs/WbDk3jJJLraSuV/mUI
         4vAybVrvPA3sK0Z0jLjKpqi2VkTsbXqC6b70vbg5YubV5V87gRG1p7bkEMIb4zkVGJ40
         SJvAkJJz5hArKvQZcnY92ZosSKgKgT57Nip9e73M+qDTPrZeH7CoeRh9LI1rtIUbhHL+
         fb0hu3/5mymiFZApZB6gBBD9Hz6Ezcu5xMrSeC7kn5Dm0hurN4cnKGrrokHZgvQUzKP0
         aHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760034492; x=1760639292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5CEm/k2cKSkdb8l0Unz1Qn9/RiaqPf8uIpBe3eDtIE=;
        b=I0wnhkmSTSn4dAwt5JeNgmn/nawo631t75T2OwtT/t7jcYxRzGKy59N7QWKaHY++Uo
         wAyr8rPkbtyo3zq+gWkxuVHO0eIT0nYiMphZg8SLGa8BohN/waXzwYxoz+zAXLc4doDw
         OZfeVpjUV0k5QNsxE5CJs5kcFNmHdoKXAoO1/FqdSomrZMWZuOPpgzmuERYHxCspk0Cu
         LmvTUGCGMDslWCJRBIVMBNVdY6e6JcFjym8PTwt+pgdVJUB973ogVqSxA0XF/miawYGg
         VlgsjKumDqBHEnCeCGgg3g1lwYWnKVWFoo+zzmeg8ZOpky6XleoOz3C2wtJkIXmw/+0T
         lzHg==
X-Forwarded-Encrypted: i=1; AJvYcCXmwZDc/VcYpBwhrZuYILzkuAO/ofPilqGj1ivl2XgsTv4ZedkdZhu0IeIguWsgCNwqkHXALg0kOwXlfRciPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ6D/CiSv+DZJe2lgyEN63jyHQz2avyQp5CWJDCPmNCpeFs0I8
	MEmCyTrQ7FpZ456yi869MISKQ9x7EP9pTorvuHc3Wl7d1mlDEctoQFni
X-Gm-Gg: ASbGncsN04Rcgep6papg4DwvPT+8CHtM3zyNda9EJl6AEsh9PPnXNVZh24lYP6fxJxM
	idVXqX12Akg0C8wc6dDQ6QtWH8MESCvsSAPtVTMbCkSKSYbnHLTvQIDTML9YA9mdcIAK67aOElP
	R9zbOtCFmy9YwnhC/e+xRPSG67apzN3H0Y8LfYGmnN43dP7QmzJpGxEocN5f28jn8nxUhG7GUJG
	V7pP7B18V1+/ol28GyhIpcLBIebe86wz0+1cFYcOgCPh0Yqxxd7QcbcS9fn0Finy4LTcncQsX/A
	LidJaXnJ+XUJdS37kSKdd/YcSRrWDVQHDcU/t0AAhB9JsrovRCz6/1kWQlg5w1Xbl1bi9hQyWqX
	msEJxsZsAZ9cnZmDPKDuJngr9aRSjaoZg1EA2sTYX9KxGFMESCj3VuQ==
X-Google-Smtp-Source: AGHT+IF00kjXS/Ks4W3W0yL60FVuYiaJ0yikXglyJUl4wFsoNXCdTMygWhDLSE1zqjZH94GRSgJ02Q==
X-Received: by 2002:ac8:5d4d:0:b0:4d2:ba6f:28fa with SMTP id d75a77b69052e-4e6de8b5d39mr194435231cf.34.1760034491694;
        Thu, 09 Oct 2025 11:28:11 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706b96a97sm2841951cf.5.2025.10.09.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:28:11 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:28:09 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feong@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
Message-ID: <aOf-s-XuhbN7MUlx@yury>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
 <aOflmmHe8O6Nx9Hp@yury>
 <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org>

On Thu, Oct 09, 2025 at 07:18:33PM +0200, Danilo Krummrich wrote:
> On Thu Oct 9, 2025 at 6:40 PM CEST, Yury Norov wrote:
> > On Thu, Oct 09, 2025 at 09:37:10PM +0900, Alexandre Courbot wrote:
> >> Use BoundedInt with the register!() macro and adapt the nova-core code
> >> accordingly. This makes it impossible to trim values when setting a
> >> register field, because either the value of the field has been inferred
> >> at compile-time to fit within the bounds of the field, or the user has
> >> been forced to check at runtime that it does indeed fit.
> >
> > In C23 we've got _BitInt(), which works like:
> >
> >         unsigned _BitInt(2) a = 5; // compile-time error
> >
> > Can you consider a similar name and syntax in rust?
> 
> Rust is a different language and has its own syntax, I think we should not try
> to use C syntax instead.

Up to you guys. But having in mind that C is the only language that
really works for system engineering, I would rather consider to stay
in line with it on semantic level.

If your goal is to make rust adopted by system engineers, you may
want to make your language somewhat familiar to what people already
know.
 
> >>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> >> -            .set_base((dma_start >> 40) as u16)
> >> +            .try_set_base(dma_start >> 40)?
> >>              .write(bar, &E::ID);
> >
> > Does it mean that something like the following syntax is possible?
> >
> >         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
> >             .try_set_base1(base1 >> 40)?        // fail here
> 
> Note that try_set_base1() returns a Result [1], which is handled immediately by
> the question mark operator [2]. I.e. if try_set_base1() returns an error it is
> propagated to the caller right away without executing any of the code below.

Thanks for the links. I am definitely the very beginning on the
learning curve for this.
 
> >             .try_set_base2(base2 >> 40)?        // skip
> >             .write(bar, &E::ID) else { pr_err!(); return -EINVAL };
> >
> > This is my main concern: Rust is advertised a as runtime-safe language
> > (at lease safer than C), but current design isn't safe against one of
> > the most common errors: type overflow.
> 
> Where do you see a potential runtime overflows in the register!() code?

Assuming base is 10-bit,
        
        let ret = some_c_wrapper()      // 0..1024 or -EINVAL
        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
             .try_set_base1(ret)

Or maybe I misunderstood the question, because if there's no possibility
to overflow a field, what for the .try_set_xxx() is needed at all?

> [1] https://rust.docs.kernel.org/kernel/error/type.Result.html
> [2] https://doc.rust-lang.org/reference/expressions/operator-expr.html?highlight=question%20mark#the-question-mark-operator
