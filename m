Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y5LVhpZP"
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A04FD9
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:45:53 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-464a3734e49so1185533137.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702374352; x=1702979152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDJfKvrg0IZT8RtTcsIPiv+6i6KEEJtTvRyYtSZWV3Y=;
        b=Y5LVhpZPNqHDEoEg3Rc/HE3Ti4N2gEKxUuiXm1gIveu69J6pTcKD74TmybLBCaDFnH
         jyWXuh/zKMDVINNzq05sh1uYlb3pCtMwJA6UeiwJg3IRukbP2yb/K/WLTDTmHlVwN8Yq
         jVr4gq4cvJjI8EkEh964aQxlckZ6xZqdpuv4kDI1ZyI0NkP5wPY4Bq3qPFf2SOuywriX
         j9QRdUlYihfSfJM0i3uVvIttrkLX69wsNwfk0BlzrjBp2QRuM7vp/Qf+s/yMWvMCyzQi
         TsdhLYqTGAx0J3dUheXnjPtA3fnpzEi5MODY/8OcvialziFWl8jK0OzckuFE8f/YJxhZ
         uYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374352; x=1702979152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDJfKvrg0IZT8RtTcsIPiv+6i6KEEJtTvRyYtSZWV3Y=;
        b=rFD8HrQlqQg3knoHFU9BX+SIOKiibiKzJ+LdT31zxu7a/dV281cZPvow9K9WCo9/rU
         TaEUdNYu0BHrLkh/qWQAbAuzhotaE+gFc2fBmPx9QKLrK1z8xaz9U0AgTElppYb9Xnwv
         gYYBXjysejYWELEmxhmhKziUXWJZ8CWeFsg5FY1k1g+e5fvY9qASiXFKqjLBgMzFw6XN
         aXfTmBRKIHOlXaU6onTMpbB+sVAVG0VIS0uS3BlzCI+bh9UTnftYAZZ0PgWU8YDMzcdq
         vkNnVJ/ssR6MOqYkuRY1hsKTx8qN7sB0Scu4KVj1PV3w3Bw5kes2Rf+CLvhcMqXs0vEf
         0lkA==
X-Gm-Message-State: AOJu0YyNQdi81du9o6iqiWsqJJGXeo0lyLO9zHzZeFfwrMK5cytU/do5
	OoTxaGvdKMaDkCydLBWbQPDMGWs3b/xlzwvRnB8ifQ==
X-Google-Smtp-Source: AGHT+IHiKuijr8iqBN16VsK9zHqoh6460srecd+j4cqTS+gkJWAR3e2/4Y0uK11x73YJv0iQFDsxK/FGEG9VkLJQiKg=
X-Received: by 2002:a05:6102:32c9:b0:464:4eef:b9a9 with SMTP id
 o9-20020a05610232c900b004644eefb9a9mr4066516vss.0.1702374352425; Tue, 12 Dec
 2023 01:45:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com>
 <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com>
 <1dd1a3e8-ef9a-4e89-891f-b49d82acc5f8@gmail.com> <CAH5fLgijsRK3funsGuG6nbK26C+s6m0nO0i83RYD2cO3z7L22Q@mail.gmail.com>
 <F8K3EZWwaRdB3qwYwk7P9GGQUc83MNW4XLeqRHj6QsA6WtCtpweykXLuM5sj2RbpRu3y3OoFy6gmCtaV2tBA1sxGFeieUnTdaY2yGVSCXQ4=@proton.me>
In-Reply-To: <F8K3EZWwaRdB3qwYwk7P9GGQUc83MNW4XLeqRHj6QsA6WtCtpweykXLuM5sj2RbpRu3y3OoFy6gmCtaV2tBA1sxGFeieUnTdaY2yGVSCXQ4=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 12 Dec 2023 10:45:41 +0100
Message-ID: <CAH5fLghuRjZHg3BgowvDiAez3ukhm7PEegRB5G9ZbwSCXfAHVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Tiago Lam <tiagolam@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 10:27=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 12/8/23 08:37, Alice Ryhl wrote:
> > On Wed, Dec 6, 2023 at 6:05=E2=80=AFPM Tiago Lam <tiagolam@gmail.com> w=
rote:
> >> On 06/12/2023 10:09, Alice Ryhl wrote:
> >>> +/// The return type of `wait_timeout`.
> >>> +pub enum CondVarTimeoutResult {
> >>> +    /// The timeout was reached.
> >>> +    Timeout,
> >>> +    /// Somebody woke us up.
> >>> +    Woken {
> >>> +        /// Remaining sleep duration.
> >>> +        jiffies: u64,
> >>> +    },
> >>> +    /// A signal occurred.
> >>> +    Signal {
> >>> +        /// Remaining sleep duration.
> >>> +        jiffies: u64,
> >>> +    },
> >>> +}
> >>
> >> Is `Signal` and `Woken` only going to hold a single value? Would it be
> >> best represented as a tuple struct instead, like so?
> >>
> >>      pub enum CondVarTimeoutResult {
> >>          /// The timeout was reached.
> >>          Timeout,
> >>          /// Somebody woke us up.
> >>          Woken (u64),
> >>          /// A signal occurred.
> >>          Signal (u64),
> >>      }
> >
> > I could do that, but I like the explicitly named version as it makes
> > it clear that the unit is jiffies.
>
> Why not use `type Jiffies =3D u64;` until we have proper bindings for
> them? That way we can have both.

I do not mind adding and using a type alias, but I still think the
named fields are better.

Alice
