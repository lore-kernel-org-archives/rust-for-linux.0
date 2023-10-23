Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4704A107B3
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="pTodA+lI"
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B73A9
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 01:58:54 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9b95622c620so459984666b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1698051532; x=1698656332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aw6U7TSKeW1ZDPhLb0d72vcB7WMjWqVvf3Fa01OVl9A=;
        b=pTodA+lIIxugRbaevmUMoOkXkMh+DT2Wr6J1gtb/3ZHHw4kUGbReLI4rmt8MoxgojQ
         LK73k6mPNSersD128+GhMMQ8rVX1viXjCKSck9Daj3wAGdLx3aYxJVP/FxjgieK4Ok1z
         UpMHJnwOAVKCgkNIMSprqMJhtDB9UfzCHsbHYmkLAh2wWHo+MTlP/0/vqgWdMhwjmmNj
         6zK7FLcamWDyt27W4gj3aT9DEHY5LWm4vGk012UMlcUZDZhjoh/cZldKhHNRvPjH4M3R
         N0rb2P1sgvphunnWaQM6eWh9Ai+bV8Ts1xu1F4Reey5NOgfFQNaBQq7f6Xdx3NYZSlnR
         tV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698051532; x=1698656332;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aw6U7TSKeW1ZDPhLb0d72vcB7WMjWqVvf3Fa01OVl9A=;
        b=G/g7Akx1oKNxxGgrtd7ieoOWj64ewN7vozb0vkNECC5yqILhCnDmXnvIt05r7FVGt4
         8R7/8SU9ZSm4c8XI0xiAi30Qd2nD6OQS5il2NsTlIErnObU6GcACKHQ+o1tq4a6dlPQQ
         x/b8t23L65CLy3No2VeO7VlCxTQvhai2Ss15MFmOerr5avYQACsgv52aHAcjGRhzO7Zb
         b0QSerdDA0ihpvxC8siYQS9f7lXAtfhC4wbIgjP8+CxCIyfQlk8j+RMiavVtyQ5SqtdB
         e60e/NJO+dp0pv8FhdOo8mDhw61ckQeg7ad0i6hqW6YGZTYZ0xVSLda3BwVE9OS2Y6fW
         SGcQ==
X-Gm-Message-State: AOJu0YxR1zzm4ACkNiiIZ8ByX0zTmNjmn0Roxja5s8PbVbdYB158eb0k
	IZgTk0yuth+KOu21m0iVdjnzypvruh5INGSjGKk=
X-Google-Smtp-Source: AGHT+IEi0Hg0C6VjKs6WWViafUQqTLuwnJJcMJXOPe0a2ek38YfHb65TizCjHW0edUDNa9VlP4gVeA==
X-Received: by 2002:a17:907:9306:b0:9b9:4509:d575 with SMTP id bu6-20020a170907930600b009b94509d575mr7079827ejc.2.1698051532580;
        Mon, 23 Oct 2023 01:58:52 -0700 (PDT)
Received: from localhost ([194.62.217.3])
        by smtp.gmail.com with ESMTPSA id kb3-20020a1709070f8300b009adcb6c0f0esm6244966ejc.193.2023.10.23.01.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 01:58:52 -0700 (PDT)
References: <20231017113014.3492773-1-fujita.tomonori@gmail.com>
 <20231017113014.3492773-4-fujita.tomonori@gmail.com>
 <871qdpikq9.fsf@metaspace.dk>
 <20231021.125125.1778736907764380293.fujita.tomonori@gmail.com>
 <CANiq72nc+pZ2fsNzNkaB01im92X1F4mhESZonyvD2G1rd9dNDA@mail.gmail.com>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu,
 boqun.feng@gmail.com, wedsonaf@gmail.com, benno.lossin@proton.me,
 greg@kroah.com, ojeda@kernel.org
Subject: Re: [PATCH net-next v5 3/5] WIP rust: add second `bindgen` pass for
 enum exhaustiveness checking
Date: Mon, 23 Oct 2023 10:58:17 +0200
In-reply-to: <CANiq72nc+pZ2fsNzNkaB01im92X1F4mhESZonyvD2G1rd9dNDA@mail.gmail.com>
Message-ID: <87zg09g1f8.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Sat, Oct 21, 2023 at 5:51=E2=80=AFAM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
>>
>> Hmm, this works for me.
>
> Andreas was probably using `O=3D`, but you were not.
>
> At least that is what I guessed yesterday and what the suggestion I gave =
fixes.

Yes, out of tree build =F0=9F=91=8D


