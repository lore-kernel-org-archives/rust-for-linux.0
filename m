Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3D13ADF
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Aug 2023 15:22:39 +0000 (UTC)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF6E49CC;
	Fri,  4 Aug 2023 08:22:38 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d0b597e7ac1so2507743276.1;
        Fri, 04 Aug 2023 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691162558; x=1691767358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHCF9fKDds1FJUzMr1VGs/NaEo+emI+wbuPv25TLjM0=;
        b=MuR2SN4aYLm1GiLgd5/KilEg7EL+2slAUiEErfzFvhBiuRCeNgpTwbFy5KDTHawMxu
         CoV1hiJ6rp117BeTruF8jpAtu0mmWPF5qcXy2a5uS05Bgii2kK5W6Xq3BQ9A90ogEMjc
         I6EQ6pWSPOgmM6nT6ohJ03bfwDKsZwL+NtbLwToHjorxsM4xLQ+c7SEhG5OZpA0ykH6y
         XvNcbCuCygnnMuKLoU5wJZ/5F43L7gQbvn7GYrGhuO0nFzjCl6qAb7i39HFwkBb2eA3a
         wy3LpzNF9JfNhbwRFxiW1Y+0Btlg/0uuOQULrYCRfHghYCxPKK1j6VsaKzDZDE6mJB21
         a4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691162558; x=1691767358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHCF9fKDds1FJUzMr1VGs/NaEo+emI+wbuPv25TLjM0=;
        b=KWk/c4EJPeZydkWvB1oSVmvFBrq3rVF0opetHrPAQ7wJNCKq5Ri6SJjG4FQDeoL7uj
         hR3unNHtQMAC58HQPAIXtYQqFIbsGjLICmY6QbLv0YZFlpxiG/pqMjybC2WfC4iIyeX0
         58TUzQxU6LVNYCKVJd1BxWqn16gnBlwv9ryZJYlYPQ0l2D4/UC+k2dqJyFii7qJzVAJ7
         5SIKoPo5jQJLR+5PHkAR0L9ZEwlFY7102+buWak3OprlqE7JCWvIolGjeE9n3MgW8bZd
         2nUW2DIdavTEnt+9/uxEdnyrTy+jncxBCEJ4y3PgSkZIzsJERVI24Lr7Fg5DhSAK1JI3
         Yorw==
X-Gm-Message-State: AOJu0Yw3GNWFOZFP/yxF8ssgG0n6IPBLq8Yr8n3G7WrMbvTVqge77GcF
	cqf2BGHguWYkX+bsQ+lepJ84i8i5uE3ewuNWGFI=
X-Google-Smtp-Source: AGHT+IHSW6KSyVijXTnHLVhmSKfARRFqrCNhdB9A+IPeVKDWWkxJJl5HK6FI2+xM1ORovZnaC2mV8iYnIXcrNPq3Soo=
X-Received: by 2002:a25:74c6:0:b0:d43:34a5:fbe7 with SMTP id
 p189-20020a2574c6000000b00d4334a5fbe7mr1829727ybc.26.1691162557951; Fri, 04
 Aug 2023 08:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230729220317.416771-1-ojeda@kernel.org>
In-Reply-To: <20230729220317.416771-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Aug 2023 17:22:26 +0200
Message-ID: <CANiq72n0ivS9huBQfkPhEANbco3V46KhKRgWAw4Oj6uAMJj0rA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: upgrade to Rust 1.71.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Jul 30, 2023 at 12:04=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> This is the second upgrade to the Rust toolchain, from 1.68.2 to 1.71.0
> (i.e. the latest).

When I apply it, I will update to 1.71.1 instead, which got released
yesterday, since I assume that is what most people would want to use.
There should be no difference for this patch apart from the version
number, since `alloc` did not change upstream.

Cheers,
Miguel
