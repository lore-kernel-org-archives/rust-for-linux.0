Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5163730BF60
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 09:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208742; cv=none; b=CYCEsCDLxrLoa6EwFUHTMC3z+HYkA3O731qaTWKVhPhZvSuTKAgG7rJqk+MPUdomqRP+bkMnE4lO0viMpV/FrXsH9zCJl3YiJEylW4x3wgqS29aYoEm909EHTk1TwrQ2xYzKSy/5h3Fzce6R7EUeMmk5MVMUSi/5NKZXKwAnI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208742; c=relaxed/simple;
	bh=y3ZqgF1sQAVQrh4PpD7bEcindq/cQQy+iaqc0sgx8c8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qVCufNlmJ6qFLZgtr9UTJdrzMuDW8UXrpMHVeXI6YiuAgo91Fh1wcYzY6SFW4il3W7BDNivRWOO4q3z95gqUHpAAU0vR4bsGwvdhIVy/TLEg+0aXKuT8Iz6H5m00HonH6nAxEjfS64E6L846U2pMzk0IAiKeH+zNJIYVn7sQ/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jZaDl4/x; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jZaDl4/x"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-430fcf10280so4461538f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 01:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768208739; x=1768813539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzORT/k3ipGubgBn9Q9n+ixZdkO5pikUavXtfHFdUSg=;
        b=jZaDl4/xvMm6G0Ce9l6z4GPyLLe74Bznr9twVo4gK4T/iMziR+9QZyAzsS9eGT+FZQ
         c2N3Gk1M6n8HyBnbgF5qGdkJImbZjymhAACIdzsO4oYWzNxqubiLtQZ8GJFpZ/28f9fN
         6+G/tvRLM4xIZsO12Rnulbgx7awwM2NkI8pg6FcLs7tZxpVlZRfHC5VQiBvuXl4WXeuY
         iE9iFGUwuB31j11hCBorr2s7ekfNhHWo0jcLNRWRHKU0bVcJScYb013oO3AUOnJg8vAR
         SNLhuMpRAYMHOPnIkHuVpCobPKpNdie6FgPc1Euw3Mi4lG7S/GEi7GJSENs2f6shlw4/
         lVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208739; x=1768813539;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SzORT/k3ipGubgBn9Q9n+ixZdkO5pikUavXtfHFdUSg=;
        b=Qfq1c2lO7h1JSNJnW8ZwAdp/wvxF2u3Y/caVfXUVtdkt8dL416G6poyp0eTS0KuIZH
         kWhWmXYo1dVIA39eWgiicX/b9iJLO9ZAFt0jSrxHsyrNI5TA+RufAVQj+0u+M3eg4K8d
         xZSZ83Dxnfc4TUToDz2gAWHizi8cygWGJ2AAw9Zf7BAQZcCMGGsz3U+oRRBquJKCvJL8
         j8cJ+asokl/fTbg1uMxKGJdIW4LhrHue/ShXawjOAyc13utY8s6cUGklAcxFVF/meNYY
         C9UyhEelKdpib/9Xd0nJ05t2QStDthyEY5iLZP+O1+euxqvzffJ8OIzp2+Jd9Fg8evEh
         MnWg==
X-Forwarded-Encrypted: i=1; AJvYcCX6MrHIWH306OeWQJx+roogUsWvOovvJwZEIBDgwEMz9yR8VcsETzf3y2ZV/AtMLSm9Swd/0phC04zmky2qUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCzEkQGF0dKWKnakc8iw+7AYjzij8M54pdBcNI73wsn0dZh/vG
	JFBYVggaiRNxjzuSdUVNrPrE7XCSAUm7mx53EslM9ZwgSXY9JTpGoLfOE46yJxxSJbC/SRXC7oX
	WP9vXPobMl8vk9Q0H3A==
X-Google-Smtp-Source: AGHT+IGOJRXfdn4em6HL0Onpde9GGteqaO9fJCUa27BqZN+63xCLbGxcAW9PUxWk98ipz5bhZqrhfl2AZc+TZmA=
X-Received: from wmcn3-n1.prod.google.com ([2002:a05:600c:c0c3:10b0:477:aa9e:db24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190e:b0:475:dd7f:f6cd with SMTP id 5b1f17b1804b1-47d84b3f21fmr206172495e9.35.1768208739714;
 Mon, 12 Jan 2026 01:05:39 -0800 (PST)
Date: Mon, 12 Jan 2026 09:05:38 +0000
In-Reply-To: <CAAofZF76TADGfF36gMV7qpZCHpXUYY+aOi_mFwrE6UrnkkQKXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com>
 <20251008151554.340806-3-marco.crivellari@suse.com> <aOaJlHEPzHcAdcUx@tardis-2.local>
 <aOeZ3ho6SHjmaw_2@google.com> <CAAofZF76TADGfF36gMV7qpZCHpXUYY+aOi_mFwrE6UrnkkQKXg@mail.gmail.com>
Message-ID: <aWS5Yg9xScOR51Q1@google.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
From: Alice Ryhl <aliceryhl@google.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 05:32:23PM +0100, Marco Crivellari wrote:
> On Thu, Oct 9, 2025 at 1:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > [...]
> > > If we were to expose the system_percpu_wq to Rust, then we should als=
o
> > > add queue_work_on() API to Rust, otherwise it's kinda pointless IMO.
> > >
> > > PS. We can use the CpuId abstraction:
> > >
> > >       http://rust.docs.kernel.org/kernel/cpu/struct.CpuId.html
> > >
> > > and have an API like:
> > >
> > >     ipml Queue {
> > >         pub fn queue_on(&self, cpu: CpuId, w: W) -> W::EqueueOutput
> > >     }
> > >
> > > or maybe a different new type `PerCpuQueue`?
> > >
> > > Regards,
> > > Boqun
> >
> > How is it ... can we cleanly separate queues into those where you must
> > specify the cpuid, and those where you shouldn't?
>=20
> Hi,
>=20
> Sorry to come back to you so late. I still had many other subsystems patc=
hes,
> now there are way less, many of them are accepted.
>=20
> Can I have some guidance about this? I am new to Rust.
> What's the best way in order to expose the workqueues?
>=20
> If I understand correctly, the Idea is extends the functionalities of:
>=20
> https://rust.docs.kernel.org/kernel/workqueue/struct.Queue.html
>=20
> adding the "queue_on" function.
>=20
> Creating a new type like "PerCpuQueue" I guess it means... wraps always
> the workqueue_struct structure and defines what's appropriate, like the
> new per-cpu workqueue.
>=20
> Many thanks in advance!

Yes, we can provide a new `struct PerCpuQueue` with same contents as
`Queue`, where the `enqueue` and `enqueue_delayed` methods take a cpu id
parameter.

Then, all of the functions for obtaining queues at the bottom of the
file are updated to return &PerCpuQueue instead of &Queue when a cpu id
sone option here is tohould be provided to spawn on that queue.

This way, you write:

	workqueue::system().enqueue(my_work_item)

or you write:

	workqueue::system_percpu().enqueue(my_work_item, cpu_id)

This way you must supply cpu id with system_percpu_wq() but not with
system().

--

Another approach is to add a new `enqueue_cpu` to the existing `Queue`
struct. In that case, all of these four combinations become legal:

	workqueue::system().enqueue(my_work_item)
	workqueue::system().enqueue_cpu(my_work_item, cpu_id)
	workqueue::system_percpu().enqueue(my_work_item)
	workqueue::system_percpu().enqueue_cpu(my_work_item, cpu_id)

which approach is best depends on whether you want all four combinations
to be legal or not.

Alice
