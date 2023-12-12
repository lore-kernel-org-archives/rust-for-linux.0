Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uPD90YCX"
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F1BA6
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:51:34 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4b4eb46cb05so305904e0c.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702374694; x=1702979494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko5c0vwQVCFkqxt5MmDEPN+O3PpUovqfwlzC3CsXMJQ=;
        b=uPD90YCXVz5exp9+Z2ehj6Ua2ncGLn+AXtor6zp0CgItEgQMlAO27YWxlwXdwaDBfq
         SGyV66zrp3atzyH8GhaPxD7azUlbJqrnaACm+Xmz/O/VDWOegE1LDRW72H3NZV5GfExu
         B2BU/o5InxGdLPGw+y2MJPYJDjmNFfpcaCnAcwvySk3Qge5xGYR00d1l7TN0ssTRwepU
         4NfM4I2fpZak4b+wbIihuVODPvyehjZhBja2aGciEVeHFWx42GaAgVF1MYND68ugdPKn
         SOKPZtt2YfgLls+LpsOFzhxlKUVcPzi0xB+AksdeBzcPTMQ2LS8SVDLg0HJ2LesO+Z+d
         eBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374694; x=1702979494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko5c0vwQVCFkqxt5MmDEPN+O3PpUovqfwlzC3CsXMJQ=;
        b=tTmnU74PIDWyMoxhWYsaWaCZza48hNTCEA7xwOvX1Az5pA67IA9zrVTsGGMA72djos
         41eWDPfCb/mJ3cj1Syvdu92JppexMyr1eXisLa8e91dC/gbEEBlpz9CqPBJvRKhPUuiH
         9tI5oV+Odn4ygzxsXNaVfEyUwtD/hjriXdZU9jw+glBWx1kVHSzCJKDAWPUK5xWUbUq4
         PLBXlwKlNekGfGs3LtNeEwaBm+mm0+CWgLXqZzfXs/dIvdssN15Zheoe/p/3u/mz75GR
         C3r4RkbDwl15ct4SiPEepFzYLdFO+9NIW4ins04zHOfKGGHxbQxYdu9NF0ljzwKqVf5S
         4Pcg==
X-Gm-Message-State: AOJu0YyED4VfpuNrF2boSqVL55FUvbmdB6hWDH0TACvPzlXkqrBpcXTf
	kmcnnDIuY93RHKsgfWinnGe+wxJ60ukwYd45a0vNDQ==
X-Google-Smtp-Source: AGHT+IGE5ZK3L8voecVZVOpEdeTnGnVvTrlGpwhyiCTJSHRmzpYl+U8K2pOtq4nbdphmjr3yd56t/MlKa+EmsxXKESM=
X-Received: by 2002:a05:6122:a08:b0:4b2:deeb:d9c5 with SMTP id
 8-20020a0561220a0800b004b2deebd9c5mr4247201vkn.15.1702374693492; Tue, 12 Dec
 2023 01:51:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com>
 <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com> <nAEg-6vbtX72ZY3oirDhrSEf06TBWmMiTt73EklMzEAzN4FD4mF3TPEyAOxBZgZtjzoiaBYtYr3s8sa9wp1uYH9vEWRf2M-Lf4I0BY9rAgk=@proton.me>
In-Reply-To: <nAEg-6vbtX72ZY3oirDhrSEf06TBWmMiTt73EklMzEAzN4FD4mF3TPEyAOxBZgZtjzoiaBYtYr3s8sa9wp1uYH9vEWRf2M-Lf4I0BY9rAgk=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 12 Dec 2023 10:51:22 +0100
Message-ID: <CAH5fLghkyk7yuLvt+pPfQnB2j=-ehQLb4rf4b50sOgm33t-YkA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 8:04=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 12/6/23 11:09, Alice Ryhl wrote:
> > +    /// Atomically releases the given lock (whose ownership is proven =
by the guard) and puts the
> > +    /// thread to sleep. It wakes up when notified by [`CondVar::notif=
y_one`] or
> > +    /// [`CondVar::notify_all`], or when the thread receives a signal.
> > +    ///
> > +    /// Returns whether there is a signal pending.
> > +    fn wait_internal_timeout<T, B>(
> > +        &self,
> > +        wait_state: u32,
> > +        guard: &mut Guard<'_, T, B>,
> > +        timeout: u64,
> > +    ) -> u64
> > +    where
> > +        T: ?Sized,
> > +        B: Backend,
> > +    {
> > +        let wait =3D Opaque::<bindings::wait_queue_entry>::uninit();
> > +
> > +        // SAFETY: `wait` points to valid memory.
> > +        unsafe { bindings::init_wait(wait.get()) };
> > +
> > +        // SAFETY: Both `wait` and `wait_list` point to valid memory.
> > +        unsafe {
> > +            bindings::prepare_to_wait_exclusive(self.wait_list.get(), =
wait.get(), wait_state as _)
>
> Does `.into()` work here? If for some reason the type here changes, we
> probably want to know about it.

I think we may be able to eliminate this cast by using c_int for the
integer type.

> > +        };
> > +
> > +        // SAFETY: Switches to another thread.
> > +        let timeout =3D
> > +            guard.do_unlocked(|| unsafe { bindings::schedule_timeout(t=
imeout as _) as _ });
>
> Ditto.

Here, we're casting u64->long and then long->u64. How about this?

u64->long - Use timeout.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT),
since MAX_SCHEDULE_TIMEOUT is LONG_MAX.

long->u64 - This value is guaranteed to be less than the argument
passed to schedule_timeout. Use .into() for infallible cast.

Alice
