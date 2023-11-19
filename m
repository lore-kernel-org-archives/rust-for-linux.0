Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Z21brXlv"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C1AC4
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Nov 2023 03:06:36 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5c9d850a0dbso4063947b3.2
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Nov 2023 03:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1700391995; x=1700996795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lC35LlGRba1t1btXoCyTf6ZENkuDHIsafoyDM0W8s8=;
        b=Z21brXlvAV3lh2J4HOustIYoXcslA/3MAnnJe8oNDynWXVZYK/f6HNTV7LBFMYFUb/
         Vz0xFIiyVrgQMSsRUt7CwLfjc9syR5LTDfbgWn3Lg6W/MgoMzZCYizZU4/ZYyEVhxTQj
         s3rp/EJCfK1R80kUaGTEUph1nZmsv7TefY/cb2WVT0BH/STBlxj00ejp+eOqlaY0/dKA
         W2eL4zn9saDyqEuJjjnl3iDPkUr3l8PUt9DnZ18/8Ou2/EywgET9FVpS+86flfdCxTsd
         jy6mu4BLa4cY7eYfeUNe+bt23RB4bnkgTb9FISf6yl4CV4/5/gAsHl1KP0iXc9zbgEbY
         5rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700391995; x=1700996795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lC35LlGRba1t1btXoCyTf6ZENkuDHIsafoyDM0W8s8=;
        b=T76uA+YmRyGK78gflCjpqyyiqaBLzRpDDg4czNO68Jz2e4Dz0gTKTuxHXGMX/ujwUR
         wkkNZEEjpJun55mqbKP+vMOriMcTVhg9BjxBXt2Lzl3lmh08XIqathagTIFNdSflpscA
         YWFF/sgfdjCO2PQDbWHIHGwHwA8A8Nbu8fy1ZmiNkh8ySOIt+oFsbtaIeqSyrAr5y0A3
         QHj+4bt5ClGtj4Q0HNke0frER7rxXUM2KVY5vecVxXXzCk72ZHKAjTjYqBOjuzMH79nO
         lkvP8QdPxRcGCb1cj2mYVvufH9shRvGoygGssy8WUJaHOqUkE6t2L/0AIK6cNH2hitl8
         e2LA==
X-Gm-Message-State: AOJu0YyL337Gv7AlTxXYfUaL2ki4skJw95b+Mq0buvjfw6KOvPfQp8rg
	kCTZ6kUhDC5YNEIsck2/Ypa/xcN/5f1iLsEfwagcSA==
X-Google-Smtp-Source: AGHT+IH7Ex4dzK4QRBl1LU/4u0gminffm9iHvNZFZsoAKsez6q3T1ZkOcxtJ22VoqJz+4q6ceVpAPFuJv12Z2xYooa0=
X-Received: by 2002:a0d:f284:0:b0:59b:de0f:c23b with SMTP id
 b126-20020a0df284000000b0059bde0fc23bmr4611830ywf.46.1700391995387; Sun, 19
 Nov 2023 03:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231026001050.1720612-2-fujita.tomonori@gmail.com>
 <20231117093906.2514808-1-aliceryhl@google.com> <b69b2ac0-752b-42ea-a729-9efdee503602@lunn.ch>
 <2023111709-amiable-everybody-befb@gregkh> <ZVf3LvoZ7npy3WxI@boqun-archlinux>
 <e7d0226a-9a38-4ce9-a9b5-7bb80a19bff6@lunn.ch> <ZVjePqyic7pvcb24@Boquns-Mac-mini.home>
In-Reply-To: <ZVjePqyic7pvcb24@Boquns-Mac-mini.home>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 19 Nov 2023 05:06:23 -0600
Message-ID: <CALNs47tt94DBPvz47rssBTZ86jbHwaa7XaNnT3UbdxwY6nLg1g@mail.gmail.com>
Subject: Re: [PATCH net-next v7 1/5] rust: core abstractions for network PHY drivers
To: Boqun Feng <boqun.feng@gmail.com>, fujita.tomonori@gmail.com
Cc: Andrew Lunn <andrew@lunn.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	Alice Ryhl <aliceryhl@google.com>, benno.lossin@proton.me, 
	miguel.ojeda.sandonis@gmail.com, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 9:54=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
> In Rust doc [1], `Send` means:
>
>         Types that can be transferred across thread boundaries.
>
> but of course, we have more "thread-like" things in kernel, so I think
> "execution context" may be a better term?

The docs are pretty OS-focused here (I intend to update them at some point)=
.

`Sync` means that if you have a >1 pointer/reference to a struct you
can access any of the fields, as allowed by the API, from any of the
references at any time (i.e. switching between any two instructions)
without causing data races. Atomic accesses or mutexes can add this
property to things that do not have it. It really doesn't matter
whether you're going between different user threads, kthreads,
interrupt/preemption contexts, or nothing at all. It's a bit more
intrinsic to the data type and it says how you _could_ use it rather
than how you do use it.

And then `Send` basically means that any pointers in your struct are
either exclusive or point to `Sync` things. Mutexes cannot add this
property to anything that does not have it.

Note that this still never lets you have more than one `&mut`
(`restrict`) reference to a piece of data at once, this mostly relates
to interior mutability (when things are allowed to be changed behind
shared `&` references - such as atomics).

The consumers of these markers are (1) the compiler knowing what can
live in statics, (2) APIs that make things potentially concurrent, and
(3) the compiler automatically marking new structs `Send`/`Sync` if
all member types follow these rules.

When trying to figure this out for C types, the question is just
whether usage of the type follows those rules. Or at least whether it
follows them whenever Rust has access to it.

---

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> +pub struct Registration {
> +    drivers: Pin<&'static mut [DriverVTable]>,
> +}
>
> [...]
>
> +// SAFETY: `Registration` does not expose any of its state across thread=
s.
> +unsafe impl Send for Registration {}
>
> +// SAFETY: `Registration` does not expose any of its state across thread=
s.
> +unsafe impl Sync for Registration {}

I don't think the impl here actually makes sense. `Registration` is a
buffer of references to `DriverVTable`. That type isn't marked Sync so
by the above rules, its references should not be either.

Tomo, does this need to be Sync at all? Probably easiest to drop the
impls if not, otherwise I think it is more correct to move them to
`DriverVTable`.  You may have had this before, I'm not sure if
discussion made you change it at some point...

---

> [1]: https://doc.rust-lang.org/core/marker/trait.Send.html
>
> Regards,
> Boqun

Sorry Boqun, the lengthy explanation is just for context and not aimed
at you in particular :)

- Trevor
