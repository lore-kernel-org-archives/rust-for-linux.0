Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0911725
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jck7KQVN"
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A537B9;
	Sun,  8 Oct 2023 13:02:05 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59bf1dde73fso46938167b3.3;
        Sun, 08 Oct 2023 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696795324; x=1697400124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7MakII0J3LdOeWbIPVLK76PGw3TSV1zmjMhcJXII88=;
        b=jck7KQVNC60xaO8db10pfb2z4S5uuldDSvbkO070MFd+CY+/G9O1mJpu37pmGFZ9om
         uabX72VisPoIoc+avAyO/ifVH4sKjnQStS+x9qgnQbVYrAz/IBDBtqIDQY/GzOMnvx2N
         Ya0XmMSqJV/Ii13W8jeSH3uGAwnnfq4iVlo30cjM8Hb0Jiph2t6CILwGlBdkws66wE77
         0iOmIA+BNNrFEkEpVK0s2NGA6TtP4QD3fe05JZiZmr1Oyz3Qqcg0rhdqnjgbjTnrBqnt
         K5LvrDMOH59ptXhKUUmXDomcRAmOvaG0KoY6TSJoIbfJFb0lWPNHZe9TBaM6LzQSZGpE
         BH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696795324; x=1697400124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7MakII0J3LdOeWbIPVLK76PGw3TSV1zmjMhcJXII88=;
        b=oX6UMiLVPF+z24AbS7Noa+dW+8StzXdSB3QYp5GUSMGh7gXF51LM10CSjVHgKHae8R
         A+jlu+X0YW28iNBj5KctckHI/pVx+L8n3yCFwkxqxvcPzxHRc3Pm2L14Zv4aeULA9suN
         eVqB8ZoDCu3glZj7uJrDYXqHXBkebGiEU/T7UCwX7tZ8iZ6WOCDXNqCDQLpRpiycCE48
         QFf+6Fj3NLofLisI3jUkbXuvKbqv2K9v7qX2kwKBXm8HhWP4KDt51qLdBokZDZms/V3Z
         Nnv8RZn7WgQXiUu/mAitsCVwHyFUde8J3ovzLRjmYoDwJflFiMln3Q275E89OCT7s67k
         VV2g==
X-Gm-Message-State: AOJu0Yzrq44/zWa4jbJ3S/0/zwCzawExjm4UixUA6xKo/9MkKXBiVZnD
	UmQVtjeJGLegic3hGZNydw7QhpUKBj+xDo0H9Zo=
X-Google-Smtp-Source: AGHT+IHVLIyOA1fIExYWMQ6r9WeLhL3Iob47+k3qGpLb8MQUpbwN7ouaXj+xvngsIgQBqrU0HawrefvNHaLKYNXzxMo=
X-Received: by 2002:a0d:f8c6:0:b0:59b:5696:c33 with SMTP id
 i189-20020a0df8c6000000b0059b56960c33mr13162735ywf.46.1696795324575; Sun, 08
 Oct 2023 13:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230930144958.46051-1-wedsonaf@gmail.com>
In-Reply-To: <20230930144958.46051-1-wedsonaf@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Oct 2023 22:01:53 +0200
Message-ID: <CANiq72mmba7=WJydSo-S_BjAOUrGO_2G6Yhb8bY7an2Q+CnVUg@mail.gmail.com>
Subject: Re: [PATCH] rust: error: fix the description for `ECHILD`
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 30, 2023 at 4:50=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> A mistake was made and the description of `ECHILD` is wrong (it reuses
> the description of `ENOEXEC`). This fixes it to reflect what's in
> `errno-base.h`.
>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>

Applied to `rust-fixes`, thanks everyone!

Cheers,
Miguel
