Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E3E571
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990334; cv=pass; b=meivvdYT0ncV3yyiwGIf7bOeMB3rP8znAYD0bedqn2JZ4Mj2DvM/+K0lNTi0sn/k6986iMMJK6zIFHiWN3o8wetvoEQILmRijHKQg6ziUR1gvh1wVp+kxJue2gWBl8cMWTq/Xk+/P/TxoYNLBbLkXiUbaGiXPykiX2i30yK6o6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990334; c=relaxed/simple;
	bh=59PHy+Nx0VO6S4Os0KySXJ/VUf6U+FhNGUNCtsIA6ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+dEn4rmMzoVGzZutJ7E1cfFiqggeSIN/rMoTCFMn92nqllzJD9a3YRwRaBcsAE7GZ7uEfleSsQ64bZjggzRZx2YLJ5bNqC7YvGE9h9JPEyyRGvX23xUZ5lVw1+n3G3G+P8/5olnsjIYcTkA73ZV2RCeErOZ5M1UWQUABc/RzjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AFyW6Jia; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AFyW6Jia"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso7518a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 05:45:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770990332; cv=none;
        d=google.com; s=arc-20240605;
        b=VoOItFinqxFzklvO2CpMxOZoqrzCnV7yBh5+CLfv8fD7rlMZn6sWKPjtLl1vj5c7ET
         fiaDT9dhfb4iQP6NFfO+pnmnd28wu4yU4ie04/r8sac5dAGYqSxlhY6D8xlZE/PsWX/l
         Y90q25BJqOtUP2YP7hlaMYQQMQ5zBW/YIcsceLnBAB8rXmkKZUxwa/BZybuGu3GWyx8k
         nXcwfTQ0D1I24xqeWGiUqkLLWjid138BdEu8h7JwEQVNosVZMNBwLk8IIUF6su4g2z0F
         wC0bDo1utN7wIqBJgEy14uQhf0Zt4fxRoH4P0Bv1V/VhEKH5xvzYFaBC/iCTld1Lv4sL
         jVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WVzVuExzL1pzvDmwyC0vQpupNp4qC8ELjQQuhGrwWFg=;
        fh=+ltEMUhq7clhceYPDnpWiBxEfl9ubLXDHkZZb4LzFDo=;
        b=VigXNaJUggIls1wSVmtaasbCKDctPx9wYimPmwxIJAdqy68joYf5btheSk3bygFkFN
         29bA49tN+WikHVkvEL9KNkpLBMilQUgHeV01jdPlKgtboHoU/ucLAdX/PIe1BkRMkl91
         qBDod1cPO/R/iSW0m2Quh5zORisc3BNJTwtZEVIt0TMvvVsm98sXT4UZ73wATazl7gBT
         OnXssdtPAoW26JDs/x0U4Xnthm6sPy2bi6lkTGyIhvRL/45pxtvDuFDL5GDxe2OpEaNS
         q/ThcAUdb/afMJbQmDnff9xNpOF4yewXQpRv5ZL74rBpslm2Vx6Av+1IUJ2iZurIlXd3
         jSrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770990332; x=1771595132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVzVuExzL1pzvDmwyC0vQpupNp4qC8ELjQQuhGrwWFg=;
        b=AFyW6Jia21VMWi9aVS++dkDva1PzMcFQMeALdTTQ1b/HzzejmY+iPOm4kkhWzdyrgA
         THPeM2Vn0cYyk8k+XagS14SmobaHeTp4Jq3/CDzrCcvX5Y+F+UP3Z0YtfRkubNQ4M3A/
         irPzLJo6SihZ1n82piB41FVywXXSQEBYgtsb166pQvW12EdKVczIyN8dq66LqyZslA7u
         x8pFr/iHN9qBYyTtB1xbzlCXRXay+gOruJDI7DQjLYADaSc0+rR7au3KNDn4swpW0E6S
         D/Av1FzGaMGJ+L/vQMsTNy5P/77H7fORefpvbOYmXW6vRji0zldwKqyEWM5pbIxI3oZO
         eM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770990332; x=1771595132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WVzVuExzL1pzvDmwyC0vQpupNp4qC8ELjQQuhGrwWFg=;
        b=AVX9sO1WaA0sAVq303/lc9tyWfDbXWo9O1M22zVPwTP8MJCoLSp1Oufe8p22Fb381t
         efqVe+tAv7APXdg+O0YBFf8e6Ck6EhvSmQx0dJId5EH4dAo8uJyYZRH1vRrCj1XLzT5M
         9Z+Zgzzewr89FaQFZCI7hNcuRMmSqpk8jgsFsNPIISw46Wd9h5wh6MGBXpFXLP7aAlRP
         PQeUt5ddPmbiQXEwUsI8OUvH6Ysxqzw0BjAbncMcucX4f9vFBBt91tITxxaRuBd/BGHM
         5l12QhTSX53XYMteMi3IZL/dCv6wMydYnkmACONZ8a4mzL/SxTnvjYexWj5LeBKLJgk4
         r+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7Q4wGo27bbftno/QJf4Hud1Szkv8D/cXfYSqGjPFAqigdD+4BFacaEgRhTWPwVBsimhwQ63igWUqhmyQArA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6LSbmPKZviXAdD9S5FAvOnIfJeut+cnG1UxixFF8QfN0VuNE
	WCiw+6VBvn+tVyNPYI0eHsQKDzZYB5pa4jHIEwZm3N9mLPF0iyFmAh8PRcd0ygm8nxdRBRiXFt+
	YSZa5Fr/HiEgE9jhshuqUAgmFt/2I3XbA7H0maygv
X-Gm-Gg: AZuq6aJVAQvZWRnDqcZgKOgfoOPtIhunGViRcBN4uwfx5x0iCoLGByrFGC6XNerQCzc
	lF6gZSsgkgPvL1s+/nqckwlG2eDMHVRtX33CXmEQ3zvQ2BPl2R+adYQEsYadln/drE+eSsom0ad
	H0xLPAtA6AOHel0hrrqUQM2ArV1UHK+dtSeuyvzkl9dpATXiLA87SyIgRIDy38V55nKfAlhHwPe
	La9c8y9J/h6tTYoVz4EqZeuZoga+oTXd2YclrrvQMcFHrmImcdfSDD5lv4K8FfsPVffl49jZpEb
	Hgpibo/pg5yZvMZpP5612KIIjSJjq4OU15wZiQPZP+iiM2vR
X-Received: by 2002:aa7:c148:0:b0:658:eee:f21a with SMTP id
 4fb4d7f45d1cf-65bb077c786mr21732a12.10.1770990331566; Fri, 13 Feb 2026
 05:45:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-rust-uid-v1-1-deff4214c766@google.com> <aY7e0g-6-x1XPSjC@google.com>
In-Reply-To: <aY7e0g-6-x1XPSjC@google.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Feb 2026 14:44:55 +0100
X-Gm-Features: AZwV_QiDbnk0qDAfeTr16SVGt__P5Wcjop2H4vXNlSV57x8YFs5x_9yze5GmFoA
Message-ID: <CAG48ez1rpUt0MTTYjVYKKL5VtaxTA1-VRQSPAKP3-NThXvwNgA@mail.gmail.com>
Subject: Re: [PATCH] rust: task: clarify comments on task UID accessors
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@google.com>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 9:20=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Thu, Feb 12, 2026 at 07:00:49PM +0100, Jann Horn wrote:
> > -    /// Returns the effective UID of the given task.
> > +    /// Returns the objective effective UID of the given task.
> > +    ///
> > +    /// You should probably not be using this; the effective UID is no=
rmally
> > +    /// only relevant in subjective credentials.
> >      #[inline]
> >      pub fn euid(&self) -> Kuid {
>
> Should this be renamed if it's a weird operation?

Hm, maybe? I have no opinion on that.
