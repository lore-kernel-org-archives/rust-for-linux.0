Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629612;
	b=LY9NJYKmS2JK2P1yuXAHP7xv0/4XwjEtH320o2XyyNmQCUjDVvClkGQkeYlHaBT7J1mH
	 YfIe+DN8849/bwsPBgoyGou0qRGlLDgkhlefr4clhuTvmMs6OHQ+JGPUcw4ZW9F+XpBPO
	 d1u8tXwglvXJFwiggtD24HjGN87K4XS5OFglCl1/3NCrqtBgOwXB5RZb6OT8nM7bNCyOr
	 ZpHK9ZAHYZqkYXkj9EgrtIdlGU+HzV0zxmABFs49nRjLlKgIA5EhUAGxvRc/rIH5Jy2/h
	 UvMyVGmd1w2iIQb4lYDdK9+2jB+7PYGmTzanesf8aO8ff9se+9fWTBP2FPeESEj9+UQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
	b=viOktBNmZjKJM7JP/3MTP4Fj8PaSg4zy63x7cQLBqySdf2pRK+VO+usA6KMd1u7jvqkO
	 8ZefKiNfZCcR3P7cvNhN8LMUqkvg9fdcxQiG02L2JSlaCEvqYvYYmNCkefeSYEIrK3hPs
	 7bhERmhrJCmWjurOFPsfMz9aU/OVr/TcTfy3gWzpBTFAmFNrIMPxt0BKkMmLAg6R7cwCZ
	 /pXa2e9oM8qQFTk7rBK/TWz7h2A5uv1KfRHf4z50aCXAoUnEbZ+9WyCkqjsqToFZKXpGf
	 knMG83d4RNTb/rkza5SKs0LxYNIPaSXgLYFJjva9B/JipjBVc46mmeAsr2JjCUqToFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DE0606B1D9
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 14:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8DE0606B1D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bb7ad2de6bso308065e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 06:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629605; cv=none;
        d=google.com; s=arc-20260327;
        b=EhrIWe/xpSY7JpmKpGWiAOD42AMYKU3gHeFwfhu6Zmn2Kjfb4h+me3tS1mPLzdni/3
         sooSthwTzX8JfnzUN9QyWICU7kc3CL7qeAL7Hec+XxcoF3LbrmxWrIW3giVVL58oBbX2
         kAYXwTpU2zRKX8ecOrOMuXPolXwJisW6JLuW2qJZeWOXvwOM4D+Az+fa+yiopPCpcCp2
         RaGtBs05UDX/Z3iG0klVoGo9uHYBxATc3tZxvNUCGQwOLKYxpMruIwzZn2oxvF7ADdmn
         4+Vv3V9jcnoOZM5V1bBlzODVtYmb6mHtDTXYWy+hvqtC7bte7eUxu31TMx+HTN/eezi9
         pc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        fh=EePR8/jNIsop/nqyy45/XRbr5ir+vT48TYUugReJBUA=;
        b=WbFw1v5yJKDjeQGUV2ivvyG7jAWodNN/wAktrFbZdnV51epPA4MWkflnvbxU/WfLqi
         Pi4q8aXagAwz29RKQcWjA9yAa37V26HNzWdcve1CfN4SpWQzBjqodrV4WpwDZ65zTWuC
         iRPF3rOqIoHq0EW8EqGP7pEQw9n31jbLvwROTRaGHVG9+om0v6IapfSHBqJyEFeKyU5v
         vpoyP7egfIod9eg/cUyXg3AnAP7PfH0zkFGOtFFxDhiT0eiRd/lFzINmFk9HtTixnhX9
         M2sAFLzp+Gt1AFPvW9vRdOgZUTm8rqr7l4fGvA2FYPTqeEQTBiGBRv/S8LuDyWiolr1N
         NInA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629605; x=1794234405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        b=g4lf3Q7C/ECvl0ewWE3h3lYQ8L1Zui7aD54BIDr3V1N3Km5Sr1f/fn854t/MRGZjNN
         sNdMgMCrxMB0zDoeI7bUQuQPvpQd0wbj3RB3BTXjJKa7hhMGfN+WR3OLNZUZImJLGLa+
         zXEsOz2KXsBMVaSrf/+3I5XGZQbaGRbqVxMXTxgxr2irqEkeVO0F+7BOc0obkHOLakHp
         beEiMidfsTQxxwA+hGc0URvyhVngIC1sLwx7Q32KfWvNQ+TnIWF23cgnETDj02w7aoF4
         +KOkgN853eF1nlGnjs5J2yQAN195pT/tZTYytbeSLLp7PZBPKBzVUze+umlqlXRhaALu
         HqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629605; x=1794234405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        b=oiQgZr5MHlUPfhBynbj62osHcqZtlWUdJgH4jMFcvn/5h0nT7+tf2sq2zXDlPXZPGw
         PsYhdGNQ5p5EgFUCfYGaTekUI9GomNHFs/UzMg2cWxr9OCqf7C/ZfU/rL/hdX3OP1nEe
         AjHouk0XySwFPNVoDDUJjTVJfFdlCPq90NImK0meVPe80WE1howqyNUzXCaNUm4LjfAO
         S43Z6WOixSTr9VHwJaeyl5flflQQNgEVie2P2lwTyv8u3ugCkWEcBUda23zj4wrHxQ1l
         JN89dNoEJI2n4z4XP6dfdDNMh/Efv/LQ2thfNRcRhJCb6y4HrIClLBAEfMSdJ2gFnRPD
         H+pg==
X-Forwarded-Encrypted: i=1; AKwUvBx5qTAdcwJxikqVKQgKEcd2VIh/UCVmg+zRO4qwZqUMWiRbq6h7Y2Q6gncD7rCyfeDQ3990QAlPLgyrI+TxCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ti6XBYvt34XwYU7GLAoUsnjulLWzE/1pbbhxk2NbWzugLTami
	jF/MofaBxZzLvx6m4Btq0ypOm7tMrI80YRa/aBWI+KZnD3qSgNrCnuPNxRHwoEeZe0tavNDBI1Z
	3vjbkp8QZzvJx9VhYQ6NPiX/rNUHgezzpRivD
X-Gm-Gg: AYBFou3UToHbkR9a7VF5CBidSzY7ks8u4vlY7cmcXnWBkrFgvUoulsxhL/mTH8tMlzH
	fm6cAckxXX3E2RVUb1p7s8MjEQ+8iiRkSU4aqtooQ0bvGfquUhrStruAfGFTyD9GT/351vDfH7c
	jVlMofHNKrdIYC+3+vpFy1Ef/dBHOhg/wYAp+rFq1MCCXsAQor8ralFhSU8lTNnV95yDbEZRHrx
	/N12nixJd5JevXtWL397KXBX4D4YmUK5eyL4iW9aonazDXmoY1dMdOItQ+hQ46g/BKKFfMDYhEs
	6aT8HoILuT9hUNuTBPYrsK2ZVISDrM9I+uIA6rnqrnvdHlBlDxx7DfQsA3ZcKG/7GcJxj69R3ci
	shvjcXQlNlslCXLOUBMkx4Xfp4tuDO3QE+KnFTBGB+7b4g54qGt5Eu1n6fS/0bCIcn9qClOyt6w
	MUp9wux/o5Eh1FzaV18HXGXX+8aBVhmFW1Uhky+9c/yqr7DYlDADSEKH/6+tuPbBLlgWzQOUIVw
	yO9f88sSsPH8ehXItI4LCtBWG47PcQ7wFzH
X-Received: by 2002:a05:6512:ac2:b0:5bf:e32c:526 with SMTP id
 2adb3069b0e04-5bfe32c075emr2457375e87.3.1793629604846; Mon, 02 Nov 2026
 06:26:44 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
 <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com> <kw-1793624159.027890950-307523-1@younes.io>
In-Reply-To: <kw-1793624159.027890950-307523-1@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 15:26:29 +0100
X-Gm-Features: AclHuK_BjZvgCearm3rbmVV9O5UMJr8vcWg-8C7BUiu_MBE5WEN3h5cW65l1BlY
Message-ID: <CANiq72k=Ru3QsiUjrXOtFqVuA-D+w8fJ2fUOTAL2cKFS0EhLDQ@mail.gmail.com>
Subject: Re: [PATCH] rust: doctest: fix line numbers after crate-level attributes
To: Younes <git@younes.io>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:56=E2=80=AFPM Younes <git@younes.io> wrote:
>
> It can only underflow if rustdoc stops emitting its own
> `#![allow(unused)]`, e.g. in a future version. A related case is a
> crate setting `#![doc(test(attr(...)))]`: rustdoc then emits those
> attributes instead, so the `- 1` can silently become wrong and
> doctests without any attributes get shifted. Either way we'd want to
> notice, so in v2 I'll check that the first line is `#![allow(unused)]`
> and panic otherwise, instead of clamping. What do you think?

If what we want is for people to simply notice, then I was thinking of
just `unwrap()`ping like others we have around there.

Having said that, it can be annoying and confusing if someone writes a
doctest and has to figure out what to change in these scripts (scripts
that they may not even know they exist...).

Ideally, I think we would have a "warning" somehow, i.e. something
that doesn't stop people from working but that will get noticed.

Cheers,
Miguel
