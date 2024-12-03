Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE68257D
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215522; cv=none; b=i6fsfQcf2Q73E/cpQ5MKHPamQ41l9xdrWHC4dfyuZSJJhgUm6/dsyBNR7dC/6+7v6xPyLHw9iT645QrRIly4U6EzOpr19JVT44R/nMcQ+mKCllHKlVCAxOQ/LrEYoSH68zncLvk0CnxdAbZxZmgkPTkKHTorTfARQ6COgTsVKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215522; c=relaxed/simple;
	bh=c8C1kWuh7VkBhdWKkriq2k0sxE9Lb0RWjs3iwzivT2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtPjihgszqXkLsRtJzBFWWBalwnWYp3jroSELdBMwVwROt4Zt/M6XsMUL5+bQ6dq0Tnznn20GFR3RldVV7ESSjitKKpZAYfntyh3YUUC4vxGfxrFER+6R66xzI4eQRz/AAikrUYubbAHI0THIoczHydTs50XUBnOANz4xsOqKmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B7hFpk8C; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B7hFpk8C"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1517918f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 00:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733215518; x=1733820318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8C1kWuh7VkBhdWKkriq2k0sxE9Lb0RWjs3iwzivT2k=;
        b=B7hFpk8C4oNPj2bItM0IKj6m84V+i57ywPnhhwDvqZVN6WcGUkmcWkEDH1l3vFffCc
         OQZ97HGseg29C7jyLHLyQ1X1BVSCO7J24f85Psh7QoiOjM5KexmSbwU5nW/s7+eWAQ4R
         BHKypD7AJhfEnYT5xv7j3HR2ft1cacAPALcy3g8d0dbCPnnuJmExjt7GILJEIK8sD/g+
         Kg0VCA6XeX1888aBFJv9cYGDs+i89en2w8lE2szWunrZTpBnx4GLgEU2OptAZrq1jFxI
         1z7SmpjnNaaBMVJzkGyRm5zDWspdsaBVs0W+VYEJJUds0ipwM18wTf3I1AgJqZ+4y3OS
         7zZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733215518; x=1733820318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8C1kWuh7VkBhdWKkriq2k0sxE9Lb0RWjs3iwzivT2k=;
        b=b6ZWExzH44yqcKK/gZNbOXf3OAT+RuRQr/y51LCof3iGg6f4D/NQBgH6wUYMiQWn9E
         FcNeA9AC0tf1HuzDvONnOGL/5f2JCBD2tvvQc+NeWcaKx5/6AwQ7Gfyf9gPKJ5rttk6m
         Xl2AIdOPYoH5fcrLIoZwHSKm/B8mjFjlYHbin4sfSg/tL2OPqHuEZOhjNnug5WTgJaF9
         3wDj1F9zM2Wsmqc+YNdmdzHMG86OJ6tBIgwpfLHdnpHdwZZLtvRQZoCJoXs2gu0CmCpK
         ZWA3KLwj894GeaMKE28PzicMc706cUj5mV5qLNu5YcTZoSvTgmWxwuKFzDw6nYmZnW1h
         rOBA==
X-Gm-Message-State: AOJu0Yz8mY9XaGeZGpHHf6bzHU/nvSym9kXy+bl/dsLPxvmBunv6Q72J
	r92lR8jzr+U3VbFTTjzdYKJEuKLud0sGe7ROkflMosj1SXxO/jYH0nMcaMZkFGeeDNyVBQSTdbM
	6w2R+R2XNThkpwwvvkQ6z0EnVxYk8H/L2jkd0
X-Gm-Gg: ASbGnctkPntlxbE7jdGvLbzaR1DLnvc+pDeos6cz+vVM5KGDOuez5B8ykowo9+Ui1k2
	TkA2dNse3gE1bl2d59mUwYENh/OAgxQNLstGDUlumWTA/bWLaZCgTPLLc3YT7eQ==
X-Google-Smtp-Source: AGHT+IF6yStXBLD3p19LEE2ZQjni98XkTH/QBEkCeadPljOkee8Y9siVjogxGpd9BRZznQbSTuRdRTzA/fguIZD3SOU=
X-Received: by 2002:a05:6000:1847:b0:385:fb40:e571 with SMTP id
 ffacd0b85a97d-385fd969a13mr1157850f8f.6.1733215517878; Tue, 03 Dec 2024
 00:45:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202100948.2416372-1-dingxiangfei2009@gmail.com>
In-Reply-To: <20241202100948.2416372-1-dingxiangfei2009@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Dec 2024 09:45:05 +0100
Message-ID: <CAH5fLggS+3K8WHV7mrgTJQhGZMNni5gj9=huQtezc4GK8bk4HA@mail.gmail.com>
Subject: Re: [PATCH] rust: use derive(CoercePointee) on rustc >= 1.83.0
To: Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	dingxiangfei2009@protonmail.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 11:10=E2=80=AFAM Xiangfei Ding
<dingxiangfei2009@gmail.com> wrote:
>
> The kernel crate relies on both *coerce_unsized*
> and *dispatch_from_dyn* unstable features.
> Alice Ryhl has proposed [1] the introduction of
> the unstable macro `SmartPointer` to reduce such
> dependence, along with a RFC patch [2].
> Since Rust 1.81.0 this macro, later renamed to
> `CoercePointee` at Rust 1.83.0, has been fully
> implemented with the naming discussion resolved.
>
> This feature is now on track to stabilization
> in the language. In order to do so, we shall start
> using this macro in the kernel crate to prove the
> functionality and utility of the macro as
> the justification of its stabilization.

Commit messages are normally wrapped at 72 chars, but this seems to
wrap at 50 chars.

> This patch makes this switch in such a way that
> the crate remains backward compatible with older
> Rust compiler versions, via the flag
> *RUST_COERCE_POINTEE*.
>
> A minimal demostration code is added to
> the *samples/rust/rust_print_main.rs* module.
>
> Link: https://rust-lang.github.io/rfcs/3621-derive-smart-pointer.html [1]
> Link: https://lore.kernel.org/all/20240823-derive-smart-pointer-v1-1-5376=
9cd37239@google.com/ [2]
> Signed-off-by: Xiangfei Ding <dingxiangfei2009@gmail.com>

Overall looks good.

There's a mention of derive(SmartPointer) in the file
rust/kernel/alloc.rs. It should probably be updated to say
derive(CoercePointee) instead.

Alice
