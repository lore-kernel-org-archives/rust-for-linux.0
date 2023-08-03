Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811F06FA2
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Aug 2023 15:35:25 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B864A3582
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Aug 2023 08:35:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b703a0453fso17363831fa.3
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Aug 2023 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1691076921; x=1691681721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oypXlWJh1usCB/TTGcantnU/B7Uqzl56Nf26cP4N8s=;
        b=OK1VuHd3EGGmJr0c72gzI4bUbGLQX/zaO7kzw0oeYvMGZjAYwVTDZxOpXEBAp3cT32
         XWXoAtkwgC1kAmdnvuxCfhsPzX+tc+Q0VDXmtMOe1iBbs/l+1u6dlILAMlmQ5NVQX+Yb
         u3Y+wb1SzLbptfcMbIh49YJkEXOu31DLnuIR+P4FycBrD387mzhqR0hmnVmQfsqaJZJ2
         BJV54K2VxJtvjjRuiidNUpUak3vlA5Suz5TytjSj5qoT3F2Ms1KhzvRIHHH72oSbl3G2
         pdpxzs4yN8SenTS6HqDMoqkBTZWYKa4cbiEflYsG5AeprWMUX2gOlKFI592WlPeFtuDm
         qd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691076921; x=1691681721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oypXlWJh1usCB/TTGcantnU/B7Uqzl56Nf26cP4N8s=;
        b=WYERpkyOEHjp9s1G4X2HZCJ3jQ6hFvoSsjUVGV4pRsttHfe+ZYuSYjC/616hgRzCe0
         GjGLvk8uDUFEJmZAB3baYMrKDjd2FXaPzzCNFIcHOuSP2RbqJ8ylKjjVwoypako0lc3y
         n2ECvlfxnYKZcD7/9mjSF3Q1Ur+miFAX4C4Um3u6vJCqEHE/coMRF2jQ2iBM5dIyTFqh
         q6333F8WWPClIWQ0nKRglpVSWeCPlGz/yWEFAZDxwAb/sKaE1fZJgGQDJzWWot4KNeLl
         QZFFSqE5ikv73D4NiEvsGgUoMDXy0CuTBYPGTqWng1ZGNRHkUdgpN2BXtbW0e9Fd1rVF
         zFCQ==
X-Gm-Message-State: ABy/qLZSy+TyJqLgt15WlqcnTg8ejYYjEV+mFQ9C3fUj9+bFWMR+wQ4K
	cr6IpPIaRNfD/H/No/uOpOXjrK0RuTO5YoR0lcw5jl8TSn9j7dE6AQgqG2Mu
X-Google-Smtp-Source: APBJJlFz7X3QQCzZ4sS5qgWNz0sG56PeYqCF3hekjBGrBXE+ulfD04T5qgJZYLBZ4lwtoyZuYBx1P7XFD4RLFwOz9JI=
X-Received: by 2002:a2e:b70e:0:b0:2b6:df71:cff1 with SMTP id
 j14-20020a2eb70e000000b002b6df71cff1mr7872137ljo.52.1691076920952; Thu, 03
 Aug 2023 08:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230803093418.51872-1-tmgross@umich.edu> <CANiq72nhsqWsxHKmyNWLtV8AwdA1hAq5ooyJ0WNVrnzRnpjAFA@mail.gmail.com>
In-Reply-To: <CANiq72nhsqWsxHKmyNWLtV8AwdA1hAq5ooyJ0WNVrnzRnpjAFA@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 3 Aug 2023 11:35:09 -0400
Message-ID: <CALNs47tYsLq8wo3aiqU5Kmi8OFJgf6cugiRLJNiXZGUYdaVojQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Generate API documentation for 'bindings' crate
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Aug 3, 2023 at 10:08=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> I think the first question to answer would be whether we want to
> expose `bindings`, i.e. what are the advantages/disadvantages?
>
> If `kernel` were a "normal library", then I would say we shouldn't,
> because users should not need to care; and, in addition, the goal is
> that leaf modules do not need to access them directly.
>
> But, as sometimes happen, it may still be quite useful for some
> developers nevertheless (the same way documenting the internal/private
> details could be).
>
> So, it would be nice to have an overview from your point of view on
> why it should be done (or not).

I do understand that dilemma, but am not sure what the happy medium is
between rendering them and hiding them. Where I see value is:

1. For anyone reading/writing abstractions, it's useful to quickly see
how exactly bindgen did the C -> Rust mapping
2. Abstractions may want to link to the C side somehow, linking the
bindings is an easier first step than linking to sphinx (in the future
we may be able to do a bindings -> sphinx link)

Maybe a stronger "prefer abstractions over bindings" message would
suffice to discourage use outside of reference?

In any case, I will put this behind a flag so it is not enabled by
default. While I'm at it - is there value in adding a config option to
pass `--document-private-items` to the kernel crate, or supporting
`RUSTDOCFLAGS` like Cargo does?

> > 1. Do we want to make this the default, or a separate target/
> >    configuration? I don't think there is much downside to always
> >    generating.
>
> One downside of doing it by default would be going against the "avoid
> `bindings`" guideline (ideally rule).
>
> Another one is render time (the C side is trying to reduce it), I
> guess, especially if we keep adding headers over time.

That makes sense, I will add the flag option.

> > 2. The entire '.config' file could be included in the doc output, to
> >    make it easy to tell what settings the documentation was generated
> >    with. Would this be desired? Maybe with a '--cfg
> >    include-dotcfg=3D".config"' flag so published docs would have the
> >    option (unsure whether it may ever have sensitive information).
>
> This may be useful orthogonally to rendering `bindings` or not.
>

I will add this in a separate patch.

> > Bindgen is currently invoked with '--no-doc-comments', I think this may
> > be because some blocks were mistakenly interpreted as doctests. Once we
> > upgrade our bindgen version we might be able to remove this.
>
> Yes, that is https://github.com/Rust-for-Linux/linux/issues/323 and
> https://github.com/rust-lang/rust-bindgen/issues/2057, which led to
> the addition of `process_comments` to `bindgen` in v0.63.0.

How would switching to the library work? Since that seems like a more
involved discussion, would postprocesing `generated_bindings.rs` be
acceptable instead? I have been playing around with a python script
that extracts the `#[doc ...]` blocks and (1) fixes the escaping and
(2) formats parameters and fixes their spacing, I could extract this
to a separate patch if it may be a while before we can use the
library.

> > Side note, 'rust/Makefile' seems to have a mix of tabs and spaces - is
> > this intentional?
>
> Yes, it is intentional. For instance, the command definitions use
> spaces like the vast majority of the kernel `Makefile`s.

Ah thanks, it just looks a bit weird in the diff.

> Cheers,
> Miguel

Thanks!
Trevor
