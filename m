Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7334913BC18
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 17:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721756124; cv=none; b=TTPvQPhdcOMgkWIh7MTho65Wyo40eJgHEwaqlJsFVsVtDoI6DBB5IErqpKRnJ1UZQQfPbNzxpV1ElPuB7TbaK3S/y04k2E6UsD8CTrCYeFX/vdk2yBLe1r6OdJwWuc+3j7QNgmFhPaJEoG1IYOBK2qwivpJSkUVIGcwXijfvINw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721756124; c=relaxed/simple;
	bh=3DvYARRXrNHCRE4+wCEBoFwuEi+ssduATf7ejjj3Ki4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEBUmNNLF36Ro8DP3faIJEDRPBuEUokW3fAwqP9koEQsv+SBHpq5in1ltyXCgZ7oLOmPs7ghDoQVqy4s6PboB8rY+WK5/OMmm1wgytdX7AV3xeQnV85yNwKLfwpr9QoEfnr3tQPxIMiGtfyWPNrpjVcGcuTE2aLfuvWi9ZgDE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO2o8u7G; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO2o8u7G"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7a1843b4cdbso699765a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721756123; x=1722360923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pQs24u7lXINpEUgCwSlMrNjSQW+RBH84lkSbZj66JI=;
        b=fO2o8u7G/0WzweaZtesXDkZ4H9VAkmz2OiF1nw8uaqSixBkFjECxAN1LVsZ8eZenyj
         WSzyAlzork+7qPoggI/fNvZZ9ur1RiJLI03QAAC5vOkd4Q34PbQd+GUGOJoFy2BYNlID
         eJXMEbNf2RHxL4QOu+tbFmDQNCvGcIOmOEPqhXO4DbiejXBEIGdUnjHWXi/RbLMvxvIu
         xB418hDEFU8A6FuQxnUd5VDrx+WjJ26QPmGunpo0Z9xxrWs4NVS7SXhytT1IxDfWFuPV
         T5fBAYDgcsgARZh379GsWIejdsMuI/I94ONyP4tp6chkArrVkj4ofylJi28B3XEoacVY
         XVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721756123; x=1722360923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pQs24u7lXINpEUgCwSlMrNjSQW+RBH84lkSbZj66JI=;
        b=Tn4nwK3kZQbUReUBGgj8mkGZ6lilfNjhIK1xkNSJURmpG/qNxOL/L2VfhzwjLbzFK0
         uChBIyG65ZQvo33re8sqX9KHC8Cbod/hDzSve6p6AlwtDyD+7zKSanON+xojNvxx5fDo
         NGx/YWi7ohzesVJxGyeK9vShPMUkq3YkvjbGCMwdaKq4Tl8W1+BUhiXH49Qg7q2QY3Cf
         Zli6kKULdapFX/wfGx+Qiajl3+zmSdbijyIxoMWPLrwIug2goflExl8E5d3yQ9zDVr1z
         ug2jJv6tphOYRZ+u1Mmw/MvXC8wZDTkGChn+rJJt61RohBuVSqqVqR7BEjIKVbCuqi7G
         8p7A==
X-Forwarded-Encrypted: i=1; AJvYcCVa5YmhVK8K7hImLM0ttBRHUtpJ3QcBX73yFBWnV2obpvxkX37kLtaumPo536vVs9562wg+JgNnuWb5U/AY6TupRWcBwtyHGvEmESMq5rc=
X-Gm-Message-State: AOJu0YyTzoCQSvH8WvbDQaoxpaMdRXwh2ts41qWk3kOjt3UI6uENIK1S
	vwwCZ6Tm6ogToh+34u73B6w/zwTxUcDKGbGxaY9wtA830D31M0oi01/Wg651xaiNLK6z8MEFUZT
	KUXZdN3HNpSv/42hhIIoCaJif8nM=
X-Google-Smtp-Source: AGHT+IEm9Z/muJ9sdjcMsX6xQ6EWBLyor2Xroq38WlkvPd5c8kCQnto3d4uS0qorxudecUSG34ykzGWrlXNbN/8IvZc=
X-Received: by 2002:a17:90b:4f88:b0:2c8:538d:95b7 with SMTP id
 98e67ed59e1d1-2cd274a8c48mr6856185a91.32.1721756122585; Tue, 23 Jul 2024
 10:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72keKdr7ZhufjdeM3g0tgDo80nk2NNBN5SBSepHry-LaQQ@mail.gmail.com>
 <20240723160128.3259768-1-sarthak.singh99@gmail.com>
In-Reply-To: <20240723160128.3259768-1-sarthak.singh99@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Jul 2024 19:35:10 +0200
Message-ID: <CANiq72n4CWe=sTMo5MU7boPtjO0oGcjffd0tD8OFXzzCvmJaMg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Support latest version of `rust-analyzer`
To: Sarthak Singh <sarthak.singh99@gmail.com>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dirk.behme@de.bosch.com, gary@garyguo.net, lukas.wirth@ferrous-systems.com, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, ss269@uw.edu, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 6:01=E2=80=AFPM Sarthak Singh <sarthak.singh99@gmai=
l.com> wrote:
>
> Thank you for reviewing. How do you send replies? To send this one I
> am writing a text file manually to look like the generated patch
> file that I emailed earlier. Is that the best way?

Unless I am sending patches, I typically just reply using the normal
Gmail web UI. :)

> I don't have access to the ss269@uw.edu email anymore.
>
> Should I resend the patch with the fixed email address? Afaik there is
> no way to update a patch, let me know if that is possible. I can also
> add the missing Tested-by tag in the new version of the patch.

You can just send a new version, no worries!

> In the PR [1] the ability to guess the sysroot based on the sysroot_src
> was removed. That is why every version of rust-analyzer after this PR
> fails with the current config generation system. rust-analyzer needs to
> know the sysroot so that it can find its proc-macro server.

That makes sense -- thanks for taking a look. It is indeed a hack what
they had there :)

Please add that information to the commit message (and possibly
include your link in a "Link: https://...... [1]" tag).

It would be nice if the rust-analyzer docs said what is the
intention/expectation here, even if the current implementation does X
or Y.

> sysroot need to point to the root location of the toolchain. This
> contains the rust core and std library the compiler will link against.
> It also contains the rustc and cargo for that toolchain.

For instance, for this one, from rust-analyzer's docs alone, it sounds
like it is required, but it is optional, and it does not say what
happens in that case.

> sysroot_src need to point to the root location of the rust library. It

I am not sure -- does it? i.e. the docs seem to claim it is not always need=
ed:

    /// By default, this is `lib/rustlib/src/rust/library`
    /// relative to the sysroot.

and:

    /// if you omit this path, you can specify sysroot
    /// dependencies yourself and, for example, have
    /// several different "sysroots" in one graph of
    /// crates.

So it sounds like one can just give the `sysroot`, like you do in your
patch. I guess you may have meant "if given, it needs to point to that
particular path"?

Anyway, in your patch, you are still passing both (which makes sense,
given `RUST_LIB_SRC`), but you are not setting `sysroot_src`.

So I assume things could break (or be confusing) if someone provides
(intentionally) a `RUST_LIB_SRC` that is different than the one in the
actual sysroot, no?

> our purposes it need to be a subset of the sysroot since we install rust
> using rustup. If someone installs it in a manner where the source code

Just to clarify: not everybody installs things via `rustup`, and we
also support Linux distributions' toolchains
(https://lore.kernel.org/rust-for-linux/20240709160615.998336-14-ojeda@kern=
el.org/),
kernel.org's LLVM+Rust combined toolchain tarballs
(https://mirrors.edge.kernel.org/pub/tools/llvm/rust/), as well as
Rust's standalone installers
(https://forge.rust-lang.org/infra/other-installation-methods.html#standalo=
ne-installers).

> Yes this should work with every setup. The `sysroot_src` that
> rust-analyzer is internally generating is the same. The `sysroot`
> that rust-analyzer was generating earlier is also defined to be
> the same in this version.

By internally generating, do you mean in e.g. the debug output of
rust-analyzer or similar?

We should double-check that it works for "common" setups.

Thanks for getting to the root of all this!

Cheers,
Miguel
