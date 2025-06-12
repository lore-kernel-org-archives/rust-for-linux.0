Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BC01E5205
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 07:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712670; cv=none; b=ndGEGWIJukuUmwDJQZ230jtm63CQ+Maxady9w7/FfuJFr6EPI7GpVYfdazK6/S4kFMM/aMnH5BPArUrZnvIV5mmecZOmSmqzCrdw/BgqdeFJFQQkRW0RkFqgyA3IPnhCJ0UeOaZViN/w3gzgN1gSRPFasFqbtLM1OSPWHvUqu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712670; c=relaxed/simple;
	bh=0cq9mrwmkIbFH/Sf763+E636r+EXIIG1dxvu0r08V8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftIhTPP/4JTcJRLd+NKc8GWUtX233CRdfUJiDhlEQuiF3/UMZ1kkxjGPriGIc9hR76461jcT7fvdmJrggidvXx530a0EJCqUaRW3iBKJwWJ4dzi2+nn/gQTcyjkjyu/UmVE7t0q7xwMTWMAdsnBOHcAps5XoXHsgt9zArGDEBek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=muoDKCML; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="muoDKCML"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so545069f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 00:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749712667; x=1750317467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4lZ5Xc8Sgg7JMLktm3sQpaBOvvIah6ZDu5CLELnwgk=;
        b=muoDKCMLXk6ZyKlCupUAenHOP0sM+LJs+Z0iH1LPWhxvwVBkkZv1tIWkuMrJ0lX8tS
         51TIilKJycJ7iWvLLFS8yM00oMsXMn8EJQ09WA11fcGKgO0V4lhsXIPu1amlrwh6GDq5
         JYEwhilU1vEyf534sCh206eBT/gyzPbjuzLZZThMmXfkDjcMMQI30NzzeR+3jvgJBrgv
         /ujKmjQ0ChwjIgIJmHuGnE6RDqTKR+IUllaiyJRIlQe+mSPyGd6jmcBz+1yh7wZ9GQLW
         t74glk++MfMaskUBtBNu64CAfDaA3hS2GUl0rk7lkGhmEfauLop4iXMIMNwJgslkm4zX
         ujGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712667; x=1750317467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4lZ5Xc8Sgg7JMLktm3sQpaBOvvIah6ZDu5CLELnwgk=;
        b=fWy+fLU95s08ZIswEHI/IT/RGAK3+Je072GIxGpUio0Li+GNzNJuFkAtANF5s07Zgj
         efFtRx6xgdJr8dWhBQEto+w1sOxVwptkOR/b3lecIlrJHJoq00kErzU4xfSIa6oN5YoG
         N6oWZXDvBcmj8cCXCD7jyx2MD4cNjIIihGVQnsTLCEZepvEmKLKazh2NiZ6eyaow0V7M
         /5muOwH5aSI/FMBia4ICRlWROnqmByEqYm06IJ7wL58M6xdwXiltMT3WBwHsPoI4tp7O
         gz+10swxxHp1u/+X6XXyv9tHzEyGNO8stq9j3pYTfga/JLReh6XWMiHwc4YZzIgh3pHm
         C3fw==
X-Forwarded-Encrypted: i=1; AJvYcCUIkT3R4FRWWmXHhRA0sj8BtVlvKpkSdhJuvdGrJitKuVXAoUlHGsvBo4Z6vBb/em0NHnA7TLjv6JJjcqnvwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTq6/wSazrwAByO5X9BJuEYAObmjrvzSSc7vVLStblmeR2PSRg
	/AOV3P0JdZSuPJc4k9VwMdAPnR4Cpn726EZpRQUfSCMEbNqSTLY9dF0BqaR/BySBeurksiY97Tb
	25thsX5IsCZEl1Cuxc1WLQeKjSVHHZGwVNm7VHjeA
X-Gm-Gg: ASbGncvadNm2Rk95QXpxXSldHC95GZXCYlmxU+YYniCiloMqColtlfK/o8XmlEHpJz0
	E/ae3ZmYqatqYh8rtNcf3tDp4dM70dFvokNpyoJE3mn6YfaBO92f+FlE7j5gcgQtL93hq0fBgll
	w6z8wtlWR+9knVLWc2Z2oJe4CmoKWJBNsKJQRVO6me1an1
X-Google-Smtp-Source: AGHT+IFVENwlpiB0FhUnWMwAZdG8OY0Z7vmEVrUNOxOJYjjMDkrtwYYWbU8xqV2MqAXxaPTmcqM6TG/1TjCO12OW0JE=
X-Received: by 2002:a05:6000:3110:b0:3a5:1222:ac64 with SMTP id
 ffacd0b85a97d-3a558a276femr5207432f8f.38.1749712666929; Thu, 12 Jun 2025
 00:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611202952.1670168-1-andrewjballance@gmail.com>
 <20250611202952.1670168-3-andrewjballance@gmail.com> <CAH5fLggTL9Ej8rcakd-gDz+h0dZhA1PRzxf+76EjxotOBJW7fg@mail.gmail.com>
 <2c9504c3-2498-4b59-8e26-0911a8be8e96@gmail.com>
In-Reply-To: <2c9504c3-2498-4b59-8e26-0911a8be8e96@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Jun 2025 09:17:31 +0200
X-Gm-Features: AX0GCFtF8HBeO-AUYMJzrwzUxhIuik0SYdjvdl3lqMZsCfol0tGJgWl8D0Rl048
Message-ID: <CAH5fLghsH=JUm0+t=pj-MnTGGejwxaYiqYT-E-OQ=hZ=aX4oSw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] rust: device add support for dynamic debug to pr_debug!
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: jbaron@akamai.com, jim.cromie@gmail.com, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, rostedt@goodmis.org, 
	viresh.kumar@linaro.org, lina+kernel@asahilina.net, tamird@gmail.com, 
	jubalh@iodoru.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 6:02=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> On 6/11/25 4:38 PM, Alice Ryhl wrote:
> > Please define a STATIC_KEY_INIT_FALSE constant in
> > rust/kernel/jump_label.rs and refer to it. You can use mem::zeroed()
> > in the definition of the constant.
>
> Will do for the v2.
>
> > No, we can't use mutable references like this. In Rust, the real
> > meaning of &mut is exclusive, not mutable. (And the real meaning of &
> > is shared.) We don't have exclusive access to the DEBUG_INFO static
> > here - the access is shared, so we must use &_ references instead of
> > &mut _ references here.
> >
> > Note that by using Opaque, it's possible to mutate the value even if
> > it's behind a &_ reference.
> > #[repr(transparent)]
> > pub struct _Ddebug {
> >      pub inner: Opaque<bindings::_ddebug>,
> > }
> > and then you can do DEBUG_INFO.inner.get() to obtain a mutable raw
> > pointer to the contents.
> >
>
> Unfortunately, static_branch_unlikely does not work with keys contained
> within a Opaque, because it uses offset_of and sym. I can create a macro
> specifically for dealing with Opaque::<type_that_contains_a_static_key>
> because I imagine that many uses of static branch will end up wrapped
> in an Opaque.

Ah, fair enough. In that case, you can also do this:

                    $crate::print::dynamic_debug::dynamic_pr_debug(
                        &raw mut DEBUG_INFO,
                        format_args!($($f)*)
                    );

using &raw mut creates a raw pointer directly without creating a
reference, so that also solves my concern.

Alice
