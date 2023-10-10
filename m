Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5757D2136B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1cGeVpG"
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F59D93
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 10:31:34 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a7d9d357faso1713007b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696959093; x=1697563893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcPP2iHEdSybfsS/sdOYRUVQfgdEBjll09vNc/1kaiQ=;
        b=m1cGeVpG5/3rYXX1Kd+2s68LDiM/BSTD7EUif59tk4tqsJOJLyvQA/UTiqKT5k5YOH
         Sp7m332fTQm9V1aS2/6MZjHC5tgTgxVMSRg2gQSe6ycGpMpuMvplHMgLyXi1EtUmQ/i/
         BDcYKzsK5Z4PQLpXrv6xJyFB6XFKWT6BNkSMFbcUQQTEImXCRITBaO7ZaJQFwS0PHaqZ
         AVWdRSLsBpJ8u8SJeQCgI3MVgiFgHBvMbHyth2urwE8O2FeOSSRRJMIdyHbYCjZwUxTP
         aHD2jCM7P1HAHtXjnlJF0hYi45xmivNkV5ECa6Rk3zkT1XfPrO9IhI1ZO3+nqRjNWegs
         CN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696959093; x=1697563893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcPP2iHEdSybfsS/sdOYRUVQfgdEBjll09vNc/1kaiQ=;
        b=v9GNrC5K+84KGtJcPdeIrHnyW4FzuSHs7tQqZK0HFEfc0F/sESKuxjMUkCKIIcv4D+
         Vle9Dz25YRQ2eJVWF29isc2G3v0dptWJQtHDg901rn58wCMbfg6yi460XQ1gHgmawMqK
         ChfnlxRJx95mT3JQr0Sv5BPR8Hlm53HD2qXGNGFVPKFI7P6y2Fv5Zef4PaOuji8wIg0W
         BT8c1qAxWgOv0Cjv5sVHOCupuO5FHe9Bqye1Gs1Kn839aEI9Ds2Cqtf5XeuWMDAuooQb
         8msAG3cZNARY704idXk+G17WUXLbqz+AAvKxxFNeCmoARoQjAwfNoH6UzQ0gjpVIRtgU
         vW3A==
X-Gm-Message-State: AOJu0YyzAE1bMqOmqIUhj5bYv36BrWE1xbSMjU7T0R+v7ef13PRrzFuN
	1iFrtO2+zMwRDxE3Ohh0VaLLuqkt+MSnw1Hzv0Q=
X-Google-Smtp-Source: AGHT+IEk2iKb684tqK0ondSrjOokX+inXcLn2h5Myfrt6WHsdg6ykmS1gqhS4P5mKfNaHzGJXxFT72t/y2cykcxsCmQ=
X-Received: by 2002:a0d:d611:0:b0:577:1560:9e17 with SMTP id
 y17-20020a0dd611000000b0057715609e17mr20312252ywd.35.1696959093491; Tue, 10
 Oct 2023 10:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-2-fujita.tomonori@gmail.com>
 <2023092900-manpower-runaround-859a@gregkh> <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
 <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch> <CANiq72n-w2Oknzn-yqa2F7NOWkSOv3AHPcmxw8OtpjFTKeJ5_Q@mail.gmail.com>
 <78da96fc-cf66-4645-a98f-80e404800d3e@lunn.ch> <CANiq72n3kHrJKXApx2eZ6MFisdoh==4KQi2qHYkxmDi=TYaHew@mail.gmail.com>
 <69ec5900-1baa-4a62-b0a4-ee75b12db5c6@lunn.ch> <CANiq72niJtQ285+wKbYdtgWCv7PnKhvRm_AtM+94SHSTu2aoCg@mail.gmail.com>
 <fa747eaa-d52b-4d8c-a44f-00395b035202@lunn.ch>
In-Reply-To: <fa747eaa-d52b-4d8c-a44f-00395b035202@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Oct 2023 19:31:21 +0200
Message-ID: <CANiq72n+DQ_Z86B-LUPhnvv0PmS5gcwv=_nJpRGQDXSeEoGyeQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org, 
	benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 6:29=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> We have around 50 helpers, which PHY drivers are expected to use. I'm
> not sure they are all documented, but are you going to duplicate the
> documentation for them all? How is the Rust documentation kept in sync
> with the C documentation?

Regarding this, please see the part about the docs in my reply at [1]
-- I think it should make more sense now.

In summary, we want to avoid duplication (and there are several
alternatives for that I mentioned there), but we do not want to break
the Rust driver isolation from the C APIs.

[1] https://lore.kernel.org/rust-for-linux/CANiq72n6XuRdhzOYPQ=3DRRSYVEN4Lq=
wxScoD-hYuovPhAp_16nw@mail.gmail.com/

> Could bindgen read the kerneldoc and generate the Rust documentation?
> That would solve the synchronisation problem?

That is one possibility, but we would still need to somehow be able to
"forward" particular docs into the abstractions, because the bindings
generated by `bindgen` are not what Rust drivers call.

And even then, the abstractions may anyway need extra documentation
[*], or the abstractions may not be a direct translation to particular
C functions (even if internally they call those).

The alternative we had in mind is starting with the ability to link to
C items (functions, types...) from the Rust ones. By link I mean an
easy-to-write "intra-doc link" in `rustdoc`, e.g. it could potentially
look as simple as:

    /// Returns ...
    ///
    /// See [`my_c_function`] for details.

After all, the C drivers do not care about the Rust APIs, but the Rust
ones may need to link to the C ones for one reason or another. So it
still allows to take advantage of already written C docs yet is also
flexible to adapt to whatever the Rust layer needed.

This approach requires landing changes to Rust tooling (in this case
`rustdoc`), but the maintainers seemed open to the idea back when I
consulted them.

[*] Another aspect is that sometimes the C may not have docs to being
with, and in the Rust side we wanted to take the chance to improve
things by forcing documentation to be present for all public items
(checked by the compiler), and e.g. forcing that `# Safety` sections
are written for `unsafe` functions, and so on.

Moreover, the goal is that more documentation is written in the source
code itself, rather than in `Documentation/`. That enforces structure,
and keeps things closer to the relevant code. For instance, Rust
modules (i.e. not kernel modules, but `mod`) can be a very nice place
to put documentation, similar to what the Rust standard library does.
The fact that there are no headers in Rust also helps to keep things
in a single place too.

Of course, none of that guarantees that docs will be magically good or
useful, but since we start fresh, it is a good time to enforce these
things and give them a try. So far, we have had a nice experience with
this.

On top of that, we think providing extra value to docs  to make it as
easy as possible and to provide extra value, e.g. we have (already
upstream) the ability to compile and run the example code in the docs
as KUnit tests, automatically.

Cheers,
Miguel
