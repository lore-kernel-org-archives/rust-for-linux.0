Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55919B678
	for <rust-for-linux@vger.kernel.org>; Sat, 30 Sep 2023 18:22:30 +0000 (UTC)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4BDE3;
	Sat, 30 Sep 2023 11:22:26 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59e88a28b98so26070357b3.1;
        Sat, 30 Sep 2023 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696098146; x=1696702946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cfk+kAIkYmF1E1ZqhKZzYdSWCH0DhBj9gaPb0BECOXU=;
        b=WL84G1DI8mesKKFAJveYhma7HWdts81Usm6pkp6IlM+TVKh3bCvDK41hDSi1CRnXBg
         374+cboZ5gEGYwjTR7ow+XSGujBlwkapa3c1HTSAV9O65kAnHfzwy74224jPJ8IHLCDC
         K9WgHtkGnWbpYx/rYwAVhsR7Te6D8bHd6rXmF39O+n6LQxbdEWLhNhB3Jd4FO9iMf/pd
         iMcGNvfLNdx/R7CLqT3Lwkbupr3ssngCi7Fxsub9uYvN7UX1BD02kCAV/DwL6wsrS/in
         J9e+vaUqHVE1l47NQ1cLzNwA2SMYYHCRwJq+ayYOzKO+qBtPAA5tpV8spWvtEig0L5VF
         vr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696098146; x=1696702946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cfk+kAIkYmF1E1ZqhKZzYdSWCH0DhBj9gaPb0BECOXU=;
        b=k3qHuNRE4stidbKLyxojUGrfwjsndAasPCWedXRF/+ZiPHlNO3wMKhAaTcvlgxIhli
         4b8DKIJAChajC+S9u5YGuBJUJJW7CfigNy/eTzr6bd4a47Dr6f2S9il4hUJ5oxESlbGf
         St+yAXDShoZg4Ufvxd1ncUI7C4vw8jl2tPGrRC2aX89Ij4UtOEB22SUMF7jkPGiAhDTZ
         ic0jqSy+aS3HINp8NRTIyBJywj5kU8HrlQmEq3jmqurS78GP/dk3/Inch9Q9bRNhJKK7
         ST/7NtTf3+eHuB7HWxXDOmfO1BX1dFAC+eJFYRE9ecEQbB7NR/qAAuJeqn8oENEBvw5n
         Uh9Q==
X-Gm-Message-State: AOJu0YwQ1us+m02xY7ktqCIhGwpDkz53//nZHzQ4Hb+u97/+2boBemRc
	krhWJhZzn44MAdf7BOd8JNitFqFuJ7VMwXLxtUo=
X-Google-Smtp-Source: AGHT+IGUDWQoToowUPLFmKQ3hhUmZu70ON3P0B5xXTXZjO886NCuvZ9XxU6OpyeXoaUmL14L4RdF/94Glu6JT+d0zG8=
X-Received: by 2002:a0d:ebca:0:b0:589:f9c3:8b2e with SMTP id
 u193-20020a0debca000000b00589f9c38b2emr8915242ywe.20.1696098145893; Sat, 30
 Sep 2023 11:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230930161443.58812-1-xubo3006@163.com>
In-Reply-To: <20230930161443.58812-1-xubo3006@163.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 Sep 2023 20:22:14 +0200
Message-ID: <CANiq72k6YR_T9cni+eGVFLzXcym2tifb7eRQW0TV6DwWSXvH7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: add Soft-RoCE driver basic structure
To: AllenX <xubo3006@163.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 30, 2023 at 6:16=E2=80=AFPM AllenX <xubo3006@163.com> wrote:
>
> add soft-Roce rxe device net driver basic structure and Rust security abs=
tration interface
>
> This patch add Rust abstration for rdma Soft-RoCE drrivers.
> The basic architecture is completed, initialization is implemented and in=
terfaces are set aside. Network driver-related support is currently not per=
fect, and the specific functions of data frame parsing need to be further i=
mplemented.
> [PATCH 2/2] is the driver of rdma infiniband mlx4 and also completes a si=
milar basic architecture.

Thanks for the patches! It is nice to see people interested in Rust
for more use cases.

On top of what Trevor said, please see:

    https://rust-for-linux.com/contributing

There is some extra information there that is important, such as
Cc'ing the relevant C side maintainers and lists, since they are the
ones that will have to agree to take these abstractions. In this case,
I would imagine that would be, at least, the InfiniBand maintainers
and the rdma list.

Moreover, please note that these patches seem to be on top of the
`rust` branch. Patches sent to the mailing list should generally be
based on top of one of the latest Linus' tags or `rust-next`. If your
abstractions require dependencies that have not arrived yet into
mainline, those will need to be upstreamed too. Please see the website
above for more details on this, e.g.

    https://rust-for-linux.com/branches

Cheers,
Miguel
