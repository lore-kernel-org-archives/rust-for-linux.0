Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ujodJ7JU"
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D4DFA
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Dec 2023 08:42:43 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4b2cef60577so1207755e0c.3
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Dec 2023 08:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701880963; x=1702485763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8vjKdo8RtK9sF2zFHnjxxHr37Mkrh0m1wUp2s63Svc=;
        b=ujodJ7JU9IgtG962SsMEjXzR6OBrYNqON6p9GLOidwYPR2d3bQZoJAT3qX9T11QyCN
         qvMnHK7zP7Rw/BaTJcv5HELGDiawKkraqP0MTtFmrP5G/TEFIwNcrVCbnEdt6JHj97rY
         xIMpyMk1zqECXDyB183vn3KCQgrgC8Ci9vyOjVR8yI6Ky6LO2tu+gQp3PTXS4X/9/MrU
         9as3bBiJKI3eXeSYhNhINee9f7Kxz+azk08tuEZ9EVPbdavGjFRQpSreUkTu4fCEtDDn
         +PUQBzftUS/2cdKbVN1DPI96y/puz4DTTORMNBbe4D4XDuW95nJo0nyMJHf5T3I4SZVC
         i/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701880963; x=1702485763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8vjKdo8RtK9sF2zFHnjxxHr37Mkrh0m1wUp2s63Svc=;
        b=mrYjcrJ0ubwaMbgcLW6qtDDvE302spkKAfO8UasfSLD0aY/lybQ8yUS28UvBfb6337
         B92pkVBDpnAQhQkRizNvIAI3Fg72OvSmcm0ALjiW1RbiM6l1Kdimh9Tbh415BI1ijsay
         4vXnY2qcQkjekg8qJCxubJQcLWMK79Y025pdr0//WrS7NKWaKoztv36160Z7pmXk67V6
         RW0tx9+Jd5SUyNs8gpM6UUqxr/cIjnvoWYfcIca101dOLu16Y/ufzbQiNc8cAH5W2iHN
         W9HZpnuPeTIRxEZTvAoaVDwkFQW1rP7zH2QzMI0kO/DlQ4KeX+IE6BzB1msFcucA4dxB
         Jx/g==
X-Gm-Message-State: AOJu0YyK4Mw/fRLxaYdi7LCKJjboUF3QJzqNXIwQsX40NRr+J2JXWdzF
	JtXj9Py4Pnrafs06MVnvzGXiXJLAReDfO014ZNPjxw==
X-Google-Smtp-Source: AGHT+IFmX95hKsT+x9B1U9JgLud4gOx76wZ9d0sOYGnTy01xJB/RnRNZ08pYM4rj0hN9VQAvFzXxLZTCMqBtU1eTpHQ=
X-Received: by 2002:a05:6122:3c54:b0:4b2:dbb5:bc58 with SMTP id
 fv20-20020a0561223c5400b004b2dbb5bc58mr1380918vkb.29.1701880962567; Wed, 06
 Dec 2023 08:42:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com>
 <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com>
 <ZXChjmoKPj3XnJgG@Boquns-Mac-mini.home> <20231206163945.GC36423@noisy.programming.kicks-ass.net>
In-Reply-To: <20231206163945.GC36423@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 6 Dec 2023 17:42:29 +0100
Message-ID: <CAH5fLgi56i70MaFaoLcWVw+nf-ZvOLpmA8bHNVX=VXTBkcSa4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 5:39=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, Dec 06, 2023 at 08:30:06AM -0800, Boqun Feng wrote:
> > On Wed, Dec 06, 2023 at 10:09:24AM +0000, Alice Ryhl wrote:
> > [...]
> > > +
> > > +/// The return type of `wait_timeout`.
> > > +pub enum CondVarTimeoutResult {
> > > +    /// The timeout was reached.
> > > +    Timeout,
> > > +    /// Somebody woke us up.
> > > +    Woken {
> > > +        /// Remaining sleep duration.
> > > +        jiffies: u64,
> >
> > I have a Jiffies definition in the my upcoming timer patchset:
> >
> > /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
> > pub type Jiffies =3D core::ffi::c_ulong;
> >
> > Maybe you can add that (in a separate patch) in kernel::time?
>
> Urgh, why are we using jiffies in 2023?

I assumed that the correct thing here would be to accept the same unit
as what schedule_timeout takes. Should I be doing something else?

Alice
