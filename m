Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7280326B764
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229783; cv=none; b=tG1HcwlLT/i4f2WT18cKc8ttjSws4JOJbzg73ILi7yXwPTWhcNv4xuOtPbFUMg6G3gocgnNRwtEqWjCFGMJ71hoyytC1fq08/iDuFx6z/X0b+TOmYRwPODzeNueQDaEXYW5Esl3oNL+g0PPB0BOPq/O484iPR1BlbjXTeToNG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229783; c=relaxed/simple;
	bh=RLe03g5IODLK4IzDkcRPK7nXLwK2t6EFa5xkEsyCzkI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C3VT5OgTQSM3OYvlhXegyRISyPkod+CumQKIfQ4sPJs8/J2z4JeSMf2UWqbXVhnIY0OuPyeARKd2vshssnvrG76CgC7z2txJF9A6ai4kiQwhQtfCuX352SQhhrABcEuOUZ3cm0lxekiRbbWOP9MJ+ji9EbEwK4c9ih0rfSf4WEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gJEnwLgG; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gJEnwLgG"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-483101623e9so25813375e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771229781; x=1771834581; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WJFwtIYDPpyYAic8Tq5zd53QVaubaTDsTtZ8vT+Ar0g=;
        b=gJEnwLgGOxD1V6ayusOd5r1H0P9A9eneZ+xSU3UWUVGbCEY/y/kXHV8E0QOAbG7GPL
         +2kVF1GxwlKlI52hNi4mXL4PnH744fznBjwY4Ut02PwoqGqDb7E0Y2fozZaWTdb3q7VE
         SVK1rG4lAuhguME3L4OHgEX/YEqj/ujgn2FCI73uMykwD1gwYuDTrvcd+paRWHUp5k/G
         eOLBNMKkGFI/S6ArDSIhRhDz+rqdJzILJHMUThWQy3N9qU8dadfprCow2ODUjprf8GuS
         ySOkq96d+aLImGER2QFbqZrSzbH7AKsb7i07H8fm5GBSvrZ4liOYLG8lcTbkbam6tfL1
         M/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771229781; x=1771834581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJFwtIYDPpyYAic8Tq5zd53QVaubaTDsTtZ8vT+Ar0g=;
        b=k3bUgp1HOu7HNXWskFw2MwAkzuB89FGBWp0e8GmAwBvV2dsa6M1hJGyahN1dBTmky8
         7sAuofy6L0emz/mLZZn4WMhmD1aGtBZx35glcJ8UVNYfisIrNGHr0LxGy6rOKkwX1nfG
         ahEsq65vKjdgzoBtF6JGUjl0TSMAx6R0A78fizd2bSjfnyKGC0CSNMC4b+3F8aiDY2bm
         s61lZ4gRD1CDOtg3I8yRWHOxcAsMvPebTn1DH5WzhsS9SjtzLVmF2YasaWQoIQcuay4m
         doS5qaHXPpUsvf/GCr265zHElhrXOoMVXQ5cQALXqZHRMkPdp3sIC/HcvRgbCynGN7AR
         fZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwHsXnH3TuMHIY3x69UBVkLIC4qTSmmqmEDZe1nh+mhCMG1/H8umbgU4716MQUf+mtkQvPle/uVb8RQ4T73A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBreu2Yo2HYUWKdOAqRjGObv/eSVfIhL95k3AScS1Wq5wphFLa
	wX4lb2hVA0sneFyA7WC+yKrlz4EwMWDfX0a4x89Wd6aU5kFjiwNiNJ5lbX9xCXhS1/TgDl1OMUh
	NkBhWYXQNgJIS+c04qQ==
X-Received: from wmgp1.prod.google.com ([2002:a05:600c:2041:b0:477:76c6:3a81])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f8a:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-48373a7592cmr142323505e9.32.1771229780525;
 Mon, 16 Feb 2026 00:16:20 -0800 (PST)
Date: Mon, 16 Feb 2026 08:16:19 +0000
In-Reply-To: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
Message-ID: <aZLSU5hgKfQQs7DD@google.com>
Subject: Re: [PATCH 0/2] binder+rust_binder: use current_euid() for
 transaction sender identity
From: Alice Ryhl <aliceryhl@google.com>
To: Jann Horn <jannh@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 13, 2026 at 10:37:29PM +0100, Jann Horn wrote:
> Based on the discussion on
> <https://lore.kernel.org/all/20260212-rust-uid-v1-1-deff4214c766@google.com/>,
> here's a proposed change to binder to stop looking at objective EUIDs.
> 
> This removes the last remaining users of Task::euid() (in Rust), and the
> only remaining caller to task_euid() is the now-unused Rust wrapper.

Any chance you could include a patch to remove the now-unused method?

> (Sidenote: It might be worth considering whether it really makes sense
> to have functions like current_euid(), task_euid(), and so on in Rust -
> it might be less messy to just expose current_cred() and (if necessary)
> get_task_cred(), and then use the `Credential` abstraction around
> `struct cred` to access the various UID/GID/... fields.)

We could add a cred() method to CurrentTask and do this:

	current!().cred().euid()

> Signed-off-by: Jann Horn <jannh@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
