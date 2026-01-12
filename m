Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62951364055
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234986; cv=none; b=FhYpO4ihQFhA/pFmNo6GQdVTwbv1Tkp9aqeU86rDoJf8TrbvYUQhk3+FxcAXhFEco5xSlYcG6/pA9TvBS/C7wwT4CzpB8sq4f7FheHBmYeRXfsI2jP7T/zgoGzKOf16/VPog8RB6wNNnbM5cydPMRVhwkMEVF3WWb4yHs+xE0Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234986; c=relaxed/simple;
	bh=wblgs8FzcCL2ml0/U+PomgzkvnkQNDzhpuLKz5GfcOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RasuOKhozksdKW78zBvjKj4kQThSabfmXz9bCo1iAocMMUFV7xMyLkS1X8nHw9jV/znXfoYQILwrmY3dQrJvM/O7TFT3F75URy685/Uk1LuockSM4zCTo2t6orEQEQo8yiTBdP4JTnqCvfWBlSJ/pQ8X6a3BrXryJnT2mAFja00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tvi82Z08; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tvi82Z08"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so3040397f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768234983; x=1768839783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBcK+SOJ1FGiLUPYQdWR0WLYKvTskSn2/FYw3fmRbr0=;
        b=tvi82Z08+mRIO5iiCdsNcRb+zWOkUAyS6GMaqOHwN8oirLwYgSjnpNyxtjW7rlD9oQ
         FMGYVZ8SFdxvPTrRwQq7qGmx2kdIR3sWi7H9HJl06vHZmXetWYAuCWePgRVSZ8c63jmT
         /I0JjjGLs5IqS9vH0/IOlxRuQ/bgR1AaCyObRIw97ulmt9uyyXECR8hwUelDSqeB0Xq0
         MueCxETpdmHk9zFEVRHRKz/ooCVK3HmKBBPkQcS2/QnPkodU7mrb9ywsPFlUSOjlSZEv
         D/eBKANT+/dUmPjQ5e2jOu1SaLGSExz+8u2PKGE5bpb0XsnxZRmsqAkrBlJHcbTOwXrb
         CJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234983; x=1768839783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBcK+SOJ1FGiLUPYQdWR0WLYKvTskSn2/FYw3fmRbr0=;
        b=Jiyr/CbyOPuWE1HgTyBJC4zCQR4tLidHECGimEsduuvFvv3Wx+IyVO48hEq+d6Ek1O
         Swv+cgJ6S/ZiKeHXokjC24gdrsBtVme/ghZFAnmoTUjsUdvdaEzo2cbcQWOWlGw0HTwP
         rtv/hVA3vGDya9gQT3wg/alVCcmirm7/uXvX7KtkRsZ4CeiZr8fYkmzrU56uBRhG+GFj
         xMlHu3mRtNu/LpWRYFsvKMeRDBYALFPZFU6egaSm/F6HwJ2DsFQpN9xV4Mx5DrgxIgcw
         W22LvLrXcKK9cFOmWkGDeYGt/yi1Nr+ihvOIE8CzVonsiP1cAC3WEPC/RSa1NZS8k0oh
         wnlg==
X-Forwarded-Encrypted: i=1; AJvYcCXpoKrhqalzobOewj54UWxjA+bJYf12kGkpQ752n/vK4p8A/JSKjz0dyK3cG1+DXNR68+uEwwizsx4kq4FH+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgdf4uzaA+irF9XehjwYvtFxSDSaxcnFdEpODxmrz3I+kkVIh0
	VQKv73DO1QNYwzCNa8//ZhNQdcN8DB9SRrI1KtPMExjdkSVe65BoPv60lrLFCD5WF93r1HDv0u7
	OiuGVBvqJjBD490yHcpnKG15CdZMqHAQ4BaMHkk7W
X-Gm-Gg: AY/fxX4ROWNUXuoBAjNSJxExp4ECLofZMS65px76zNH6LXGcguIZ9SBnVQ99TTK57I2
	JlZ71/tGa9ktOSwwy7LDoS43A71xgv6RQObPS26CkwS140JK7bbwtORnqq/qiVGC/Eo5iWpNTLw
	haV/qvXBtd8e5dz14N7DiWZFzNOAOzcVMLP2XfeY4PAl/6nKAQyTOQ7h+pzkNysptNvKEJHu7rv
	rzu0KlaPFtMRgk5WIqRBCiSZs4S3T/vsOQkqsnhNcN6jQ4PgmBz1v77eQKf9x5zKy9QHd0UAsel
	olz9QYjyZ/UOkrR4cxsI9KYkOoSkBuz0iD7m
X-Google-Smtp-Source: AGHT+IH6BTgLb0edpxc2QFJrkUk6gcMXvjx9D8zEC6mYHt3wa5ngHylM+GEXzuPoeMQPvSmCdfRGNtyE2aUxHzdMUtE=
X-Received: by 2002:a05:6000:1844:b0:429:b751:7935 with SMTP id
 ffacd0b85a97d-432c37742bamr23726045f8f.56.1768234982540; Mon, 12 Jan 2026
 08:23:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com>
 <20251008151554.340806-3-marco.crivellari@suse.com> <aOaJlHEPzHcAdcUx@tardis-2.local>
 <aOeZ3ho6SHjmaw_2@google.com> <CAAofZF76TADGfF36gMV7qpZCHpXUYY+aOi_mFwrE6UrnkkQKXg@mail.gmail.com>
 <aWS5Yg9xScOR51Q1@google.com> <CAAofZF58s-q4WxOFYk1K29x+ceiX7rjFuNo498VVqL5AZckkNw@mail.gmail.com>
In-Reply-To: <CAAofZF58s-q4WxOFYk1K29x+ceiX7rjFuNo498VVqL5AZckkNw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 12 Jan 2026 17:22:50 +0100
X-Gm-Features: AZwV_Qh1YVz6PxVUHMIP04FuNCuQLF5u2sv-Rxl7sL_N9OOx36_8TFOLM61CRhs
Message-ID: <CAH5fLggwRc51eVHAtKO-nUNKJt98PpMOGq2Nrnivh047AGPMaQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>, Tejun Heo <tj@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 5:10=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> On Mon, Jan 12, 2026 at 10:05=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > [...]
> > Yes, we can provide a new `struct PerCpuQueue` with same contents as
> > `Queue`, where the `enqueue` and `enqueue_delayed` methods take a cpu i=
d
> > parameter.
> >
> > Then, all of the functions for obtaining queues at the bottom of the
> > file are updated to return &PerCpuQueue instead of &Queue when a cpu id
> > sone option here is tohould be provided to spawn on that queue.
> >
> > This way, you write:
> >
> >         workqueue::system().enqueue(my_work_item)
> >
> > or you write:
> >
> >         workqueue::system_percpu().enqueue(my_work_item, cpu_id)
> >
> > This way you must supply cpu id with system_percpu_wq() but not with
> > system().
> >
> > --
> >
> > Another approach is to add a new `enqueue_cpu` to the existing `Queue`
> > struct. In that case, all of these four combinations become legal:
> >
> >         workqueue::system().enqueue(my_work_item)
> >         workqueue::system().enqueue_cpu(my_work_item, cpu_id)
> >         workqueue::system_percpu().enqueue(my_work_item)
> >         workqueue::system_percpu().enqueue_cpu(my_work_item, cpu_id)
> >
> > which approach is best depends on whether you want all four combination=
s
> > to be legal or not.
> >
> > Alice
>
> Thank you Alice.
>
> Personally I'm more oriented to the 1st version you mentioned. Seems a
> cleaner interface for the user.

It's fine with me, thanks!

Tejun, any concerns?

> Should I start with a new v1 about this, or better increment the actual v=
ersion?

As long as you keep the history in the cover letter, either is fine.

Alice
