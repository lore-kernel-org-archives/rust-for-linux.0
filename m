Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71E374C6
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNKyeTFO"
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95990AF
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 09:17:00 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59bf1dde73fso57382757b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 09:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696868220; x=1697473020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAAqb07yP9y6Sos6Y2XIsXdBkYBCGv2t2PWzwtfTWfw=;
        b=lNKyeTFOvKF6BVfdcjgN/ZIcnirHqQrpvxmsoMbUwSXbWTX4qE+P7H7DQawUvydITo
         A+eVWghCTyRgL7kgWmHbpGoa0kwrRlS3pSIknk1IKsT0a1Iueta1P8NYHiv5+FZvyOt+
         Hij4O/+RXFBOUzsBI54JAxtAqx+5hK+YvLH5MGh2ryFdzU7aQY6coxEeo672DDO8VxAU
         kCQwESmLmM68aWpMdVtOc2ap0j6F+wpnvyBGybgISXXId0kQotwzE32JHAi67QbYWPrC
         dIccS9NkgfchPprxplNtXdGEFC48lQi/l905PwfPVWp3ctK4RBxJARCujl1IG8KGvndW
         Ooxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696868220; x=1697473020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAAqb07yP9y6Sos6Y2XIsXdBkYBCGv2t2PWzwtfTWfw=;
        b=kugsLFL5H2Bz2OzfEJ6JAxPcNQpfq4gWsLK8AY3dh/7t5mj192R1vVUtLZILpkVb9r
         hM5kw6RhrqiWu3C/giogUeP1pTbtcyP7LZyinQiLyMQWreGPVZt+OeIeUSI2IFKdVqmc
         hQt4+TMAPK0zIlelm+JLkYF3dbPb6qIBmPP3bOub2uYSDMfuzBIMRnwvTwrmNcVgjJl8
         nBqOXZ9T4vWy2dK+oN/CKAvLQWdZ/Pbzb1nrhg4AeETkEyddzqHzbmpNqbonAaB4z1Ag
         YECJO3uwYJJsarcm6A+t5XrwhzbSMGL3nFxyvL9u1lH9XUUj7X1CyjwwVjpt5L2n4Ibx
         PZXA==
X-Gm-Message-State: AOJu0YziuTPwYuiZ+7TYqEAX25fUS3PQa3dwS39+iLhcHZH7IVsBcNV1
	snVjyBvzq3dQBaqrkpW2Q3eFIQA4bEXhDdjTDcY=
X-Google-Smtp-Source: AGHT+IEeaE4TzRsfL/GgoSyGsYRpJHVSsBrbmaJIqunhu9ybSNXhQwH3ndbvkWpdaenMhSHQ86BCmAi1rmDWqWqQPPw=
X-Received: by 2002:a81:6902:0:b0:59f:4dcd:227e with SMTP id
 e2-20020a816902000000b0059f4dcd227emr16212616ywc.37.1696868219680; Mon, 09
 Oct 2023 09:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
 <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch> <CANiq72n-w2Oknzn-yqa2F7NOWkSOv3AHPcmxw8OtpjFTKeJ5_Q@mail.gmail.com>
 <78da96fc-cf66-4645-a98f-80e404800d3e@lunn.ch> <CANiq72n3kHrJKXApx2eZ6MFisdoh==4KQi2qHYkxmDi=TYaHew@mail.gmail.com>
 <69ec5900-1baa-4a62-b0a4-ee75b12db5c6@lunn.ch>
In-Reply-To: <69ec5900-1baa-4a62-b0a4-ee75b12db5c6@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Oct 2023 18:16:48 +0200
Message-ID: <CANiq72niJtQ285+wKbYdtgWCv7PnKhvRm_AtM+94SHSTu2aoCg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org, 
	benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 5:50=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> For PHY drivers, not is not going to be true. Rust PHY drivers are
> always going to be calling in C code to do most of the work, because a

Calling C code from the Rust abstractions is fine, of course. I
suspect you mean this.

Calling C code from the Rust driver is not allowed. The Rust driver
should call the Rust abstractions only.

That is why Rust drivers do not directly see the C APIs, and why we
try to make the Rust documentation self-contained as much as possible.

Hopefully that clarifies a bit my other answer.

This is documented at [1], but it looks better in the slide that we
usually put in talks, e.g. please see the second-to-last slide of [1]
in the backup slides (we should probably add this as a figure to the
kernel docs).

[1] https://docs.kernel.org/rust/general-information.html#abstractions-vs-b=
indings
[2] https://kangrejos.com/2023/The%20Rust%20for%20Linux%20Kernel%20Report.p=
df

> So having the documentation here:
>
> https://elixir.bootlin.com/linux/latest/source/Documentation/networking/k=
api.rst#L107
>
> would be great. I don't really care if it has a different look and
> feel, its the content which is important.

If you are OK with links to the Rust docs, that is doable, e.g. we
have already such a link in `Documentation/rust/index.rst` from commit
48fadf440075 ("docs: Move rustdoc output, cross-reference it").

We could perhaps also get `rustdoc` to output JSON output [3] and
generate the links automatically.

But integrating the actual features/functionality of `rustdoc` into
Sphinx or similar seems way harder, and I am not sure what we would be
gaining, apart from having to maintain a custom documentation system
for Rust code.

[3] https://github.com/rust-lang/rust/issues/76578

Cheers,
Miguel
