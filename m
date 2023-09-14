Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45807F
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 04:10:54 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE840E6
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 21:10:53 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ada609bb62so62985666b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 21:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694664652; x=1695269452; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nw+zwnZA916O/jEbPtb7RK7oZL22Rl0Hcj/Va04l1qg=;
        b=ja85IxppvugDSIgqLXSJq02aRtXiN6oxeXfdDXegZyVtey3bRHE3BfFFJw0Ge/KYBl
         qc/sjPLXypo4pT9w2FAXQD/9FVOzDbEaoPgKoKb4yQBeWroiBJgU7L/JI1PduzJSKLdJ
         N6lJn/o+W5W9X4VH4n2EYduWFTVKoWfCdQomc+w4L+NGxuFM7snGk5Hnag4OlM9nj4YC
         kh9Vl3gtJK/NryyQ2OELd058/PlSU05az90uO1LDkhDAyB6rnR/xdiHvUcrjc+QEIdxX
         PaM1TBcXWGBB1EZyb9gIsg1wUyTIomfDLm/2N5dacj5inWkY1J3MV6XIq0fp+fZnsZtJ
         RsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694664652; x=1695269452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw+zwnZA916O/jEbPtb7RK7oZL22Rl0Hcj/Va04l1qg=;
        b=S4u7c9KqSB6bK5zB4yjPBxpOrRdfxYRqGhG25n7KMY8Mpzofvica2nQuMmgjrufUMJ
         Vh5DaKVPTfOw8NKV8hfwNTcGpiwIJ5BRuzepuFRL77UfdTane0t0x45h06mW7XTI9m6J
         0/Y5y5AxYwzZh020Z8OueIa8RXbkZtH1t9tcUNDpOHcD3ogeHl816qFSsE4SqqhK7zbs
         bk1VMBxRXgthNbiiaV4h1deuXxWv6BCgQxSIEhEdNZSXM2fp+/82vFXJ8O4+tZlTCrTu
         wZepyH8LkxAGH58FMpnUOaZxI/k99qTPXVmtdtDSQKR00jIw5J+qaNCLp085jQjODQDE
         1zgw==
X-Gm-Message-State: AOJu0YwKIawlj7gUnXSKvhR0Y81bVyfd4x4aylWBr5TUF1+hEPaC5UQL
	FQ5pqai1Yy2Byr2TT7r5XHJrEmMiSBgWlBYmDiZcOVb1lpjilZ2g5m8=
X-Google-Smtp-Source: AGHT+IEKDCIkxUP9ouVn+A+WfIATsYucMiQcwcOWi6cJK64OGVvVyGjdbi/3EE7PjoetMiquuLU0pXd06i41XQBskgM=
X-Received: by 2002:a17:906:3152:b0:9a1:e66e:b69a with SMTP id
 e18-20020a170906315200b009a1e66eb69amr3446178eje.21.1694664652069; Wed, 13
 Sep 2023 21:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <ZQIgbA2J46+B37ar@boqun-archlinux> <0a986803-e02d-4f7a-8938-fab89af6a655@lunn.ch>
 <ZQIqgEHPQCfVfjDd@boqun-archlinux>
In-Reply-To: <ZQIqgEHPQCfVfjDd@boqun-archlinux>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 14 Sep 2023 00:10:40 -0400
Message-ID: <CALNs47vsMBDKm0Be4VbNo+agrorgmwymqU3Am+TxyTvW34g5Ow@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2023 at 11:05:31PM +0200, Andrew Lunn wrote:
> > [...]
> >
> > So by lifetime, it means while it is inside this function?
> >

Boqun covered this example quite well, here are some more general
crash course notes if it helps -

Lifetime is just rust lingo for compiler-tracked metadata on a
pointer, pointer + lifetime = reference (`&`). An example

    struct Foo<'a> {
        bar: &'a u32
    }

Read that as:
- a `Foo` will exist and be valid for some amount of time (of course)
- call the time it exists for `'a` [^1]
- `bar` is a pointer to something
- `bar` has lifetime `'a`. Which means, whatever `bar` points to must
  be valid for at least `'a`, i.e, at least as long as `Foo` is valid

Same rules you have to follow in any language, having these
annotations just tells the compiler about it. Then it keeps track and
makes sure they get followed. Functions give similar information:

    /// Return the first substring of `haystack` that starts with `needle`
    fn strstr<'a, 'b>(haystack: &'a str, needle: &'b str) -> &'a str;

The return value and `haystack` have the same lifetime, so you know
you can't `destroy` haystack as long as the return value is in use.
`needle` has a different lifetime so it's clear that it is unrelated.
In the original function

>> +    /// # Safety
>> +    ///
>> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>> +    /// may read or write to the `phy_device` object.
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self

A compiler-tracked lifetime is conjured from nothing, so the caller
gets to decide what that is (usually implicitly but can be specified).
This could be anything, hence "unsafe" and instructions on how to make
it correct. Once created, the compiler will track the above rules.

The other part of the picture is that rust strictly enforces one
`&mut` reference XOR any number `&` (const) references to a piece of
data at a time [^2]. The exception to this is of course things that
safely allow access behind a non-exclusive reference -

> In theory, the core will protect the phy_device structure
> using the phydev->lock mutex, although we might be missing a few [...]

- such as mutexes :). [^3] The original comment could probably add
something like "with the exception of mutex-protected fields" or a
mention about the callbacks.

Bit awkward at first, but it winds up being very nice to kick the
mental pointer-validity-chasing load to the compiler.

[^1]: could be called `'foo` `'buffer` or anything else,
      `'a' `'b` ... are common for simple things
[^2]: at a lower level `&mut` is basically C's `restrict`. Easier
      to use when the compiler checks it.
[^3]: these types use `UnsafeCell` to tell the compiler
      they allow this and not to emit `restrict`. `Opaque`
      in bindings also does this.
