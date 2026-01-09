Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92635C180
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976358; cv=none; b=LgxQtozASV12ujV+NYZmCKNJUIDIoZNF2R+qs6PPrQ56yJticSsMbkgzIP0/Oy0EdRvKMsngoqKZ3FzBamNk6FZprE/p03fVCEZGTFTC2Gbp4Z9KRbL1e/2tt+PYMQThSWvmdBN9tYM76uQD6LR31T7WxC3YvFHpR6w8nqsv5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976358; c=relaxed/simple;
	bh=mBM77ElaCw1c59Rik979SGALeGmrcBRpXTTQH02UHWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdphKYkgYJQ9o0Y/3RfCeShhCYs+L8b8t258YMs8ahAJt929xfAbgB32NAYmhHLQoL8zSHDxz8N28iFxWKKfQgDS3X8dehUWM5gYWIshkwhPf+Bb7JVYYt1sQucU+NZDU2nJvutbOoZAtLUEy45IE8y8VwkHtySzMRq/J7wJ/bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=deaMfxZc; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="deaMfxZc"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382f9211cbfso41880281fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 08:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767976355; x=1768581155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO802JtVxlBikj/CyNBa6zuERK0iteWeDBc4R9CqjCo=;
        b=deaMfxZcWlcISyd59Fzmhc9ypXZGbY9g8Wv0JRXlbJ4BcJUpBf6t5Zy7S1RPu6Dxr5
         H2xetH4rD1FDwoFaOSKHP7qvRaxWsQTuBX5Akn3W7za9lV3siqQwr6qzDxEBGNA04D/H
         eUkOAPlRXA+vzDSneirUTtL/Ojbs7PBWwPzPh2zdhJmwaIdufPUxd7u+0MlSDxme0/ad
         NsjLlCbO1J0tKxfRTzYjbazHqvS/cNrg6oRrcDmuGKzkFJoQqrrpXxArY6l9iH4aCGU2
         8fsbjxMzBjXphkZ3cJJaRpgOXRWz2xiphmv+zzoiAKQSvNkJjezwnsYJFYxyU2PwZIza
         swrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976355; x=1768581155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IO802JtVxlBikj/CyNBa6zuERK0iteWeDBc4R9CqjCo=;
        b=UzAg5AT2KgRHw0Qlj34dWGVV44We8bHdYPb3BuYeqo+jxYaDq/BV8wZgqMJpuqa3of
         ZLM8P+kM2y6z/SP1KCdyDZcF2J3WTsJAsYk5fjaKaJquou3AN+3JUnEFzbANoEduGTBo
         7SMjZXAjUBE/KGfwcFVl2J0K9ypuFyfvRQZDq0AiOpXC2uI5wOs/Rf2PVJP98OClFmMe
         ttIKcFshwWUCO3ftbFDobux/3KenNUC3UgV6ifGoHiPfbdvN2L/2qzQzY/0fXe/IPQfA
         tmGMYbpQAxbWRocILyMNB9iih1FB+eROmfIUFs8K2TuXrm129iUx5rtxM0v6F3wTQtBr
         oavw==
X-Forwarded-Encrypted: i=1; AJvYcCU1jzKQZVitgZd2unPAA4HVzEuTjkok+us0Scb5oXERRybl+YKASiPYS11dDldrww9EJqneCGNsETibEbrRbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUnM/ntTDVIEysT8Tr59v92KzxB21JucZOcv8nR10kH1FIAF9w
	wCEvbvkrZKOaSaSr1VzKU3OsJh3WXIJ8mS+FfyjiGs/afAAVe8nzsUarMiKeZXJsQeVIYDx6SAf
	HoC3w/icZESXvWst/fdL5uGEip5M1tYr5iAEg5PgWsQ==
X-Gm-Gg: AY/fxX5XvU2rbij36U3LUlwrBYeEKMC0h+icJ4xLLszg7qsUX5SFCVTsh7xw4sAV41N
	d+hbO0L6Es2otjRimFmRs02FB4AzBRjA1WffBOt5cAiaqDVAGbcdrU7DVdYUHGYlbNDTEqzMote
	JLyNKt3Mwb1MGu7t9lYYP6wf/vwXT1R/8Gb5Luwf4WU6KDqt+SO4kls5JQ99gPzq/YH1Xsywcuh
	46rC+T6QAqxQ5LMEeDMpIRjmFCKzDnl2kduy+IP1Qod7f9d0pPf/5L+KQ/PRGuAURnhqHEnFfVn
	FEpeVuTVw0/8utESjZzLi5P6kAGB
X-Google-Smtp-Source: AGHT+IGYVm6ICDYwv+xm6omc/pxEUKxFcOrBUkJo1AtSOvqgZRKJ3q1hdRaH3AYtCnm1hDIpAF0rGE1sB1VPNE3mG3c=
X-Received: by 2002:a05:6512:3f08:b0:598:edd4:d4a with SMTP id
 2adb3069b0e04-59b6f04e75fmr3596656e87.44.1767976355347; Fri, 09 Jan 2026
 08:32:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com>
 <20251008151554.340806-3-marco.crivellari@suse.com> <aOaJlHEPzHcAdcUx@tardis-2.local>
 <aOeZ3ho6SHjmaw_2@google.com>
In-Reply-To: <aOeZ3ho6SHjmaw_2@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 9 Jan 2026 17:32:23 +0100
X-Gm-Features: AZwV_QhK1lY82eqtzww9Qb-tX8GSUybUSCzsvBfai6mOLTDoQJ8D3G6FD7RTN9Y
Message-ID: <CAAofZF76TADGfF36gMV7qpZCHpXUYY+aOi_mFwrE6UrnkkQKXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 1:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> [...]
> > If we were to expose the system_percpu_wq to Rust, then we should also
> > add queue_work_on() API to Rust, otherwise it's kinda pointless IMO.
> >
> > PS. We can use the CpuId abstraction:
> >
> >       http://rust.docs.kernel.org/kernel/cpu/struct.CpuId.html
> >
> > and have an API like:
> >
> >     ipml Queue {
> >         pub fn queue_on(&self, cpu: CpuId, w: W) -> W::EqueueOutput
> >     }
> >
> > or maybe a different new type `PerCpuQueue`?
> >
> > Regards,
> > Boqun
>
> How is it ... can we cleanly separate queues into those where you must
> specify the cpuid, and those where you shouldn't?

Hi,

Sorry to come back to you so late. I still had many other subsystems patche=
s,
now there are way less, many of them are accepted.

Can I have some guidance about this? I am new to Rust.
What's the best way in order to expose the workqueues?

If I understand correctly, the Idea is extends the functionalities of:

https://rust.docs.kernel.org/kernel/workqueue/struct.Queue.html

adding the "queue_on" function.

Creating a new type like "PerCpuQueue" I guess it means... wraps always
the workqueue_struct structure and defines what's appropriate, like the
new per-cpu workqueue.

Many thanks in advance!

--=20

Marco Crivellari

L3 Support Engineer
