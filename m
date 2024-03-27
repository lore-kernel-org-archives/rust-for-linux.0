Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32495200C7
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 00:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711500500; cv=none; b=rVW0uhTTbVPyU8Dh47BxquB2xO7QIkODqMIzE0Y0VRHa7cIP7fBEadFq2eVOhnjj56zmSyOKaHzVoXQmud8y3ph97EgCHiD/K/2BiRIMPmD7E8v+LN9/BIAQkkX4n99Gckw5wzqWZ8V4EJ3pTYTxE8j16Q81eLAWSZA8QPYreBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711500500; c=relaxed/simple;
	bh=pFZ1RLiVLVjIJ5itPnQIz9NLZ2gn5kj4hwtxDSltzEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IW93623POFTd+Fz8KRr0PSMOzPzunk0Z1YsOzsyl1KPddp01rDz+/a+CsBRxvAwjRwGgqx4UTDzAeMLOqTBe9j4eCNiNQ2yOynwaPtJBeF8mHLXW0H23gtbACgI0KwqIfqfVkIzmAxl82f6mXYc6nzvtr/xRczJ+QVy+yb0vbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoqfXvuH; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoqfXvuH"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc236729a2bso5967107276.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 17:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711500498; x=1712105298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zRLY69SRnu4+VG6Z0wklGbi0WnQerUGv/ayJWEr5KZ8=;
        b=WoqfXvuHmFC5Y89iy/mP5j8LIrid5JJNXQBpMv2iHCMlmLF97dPon5pUDz3tmhVare
         ot9FWQuzVNMtf12TPhaktOUCUDUqedgNgb0Er8cH4BxANBW0cSHbPh86gbNLx6ymMUxc
         MJO9JITWlUesEmHT+6VkDpyClGOyDz/Pa2wGAw3Blag2CgkOW7MA052ll+08U9Xu6KFf
         Iw9HwqCnw9Fj3k2SR0QZum637QMkJVl0Py3O1T5Y0dz7ToYVXYaQBWK6vi5e+E+aDdYi
         erupZv80fym0+mULSTA/Ziwo+3Mq6+p/0tG6cJbRCoxzyqkoSlmYrBz5C8hQvdj+FmhE
         Ug9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711500498; x=1712105298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRLY69SRnu4+VG6Z0wklGbi0WnQerUGv/ayJWEr5KZ8=;
        b=D/G8WRcVxesDM8/umLJC0yMqpt0UKbqwg4oAznpmPoW0S4ndkQIyiql+nEOzvX2K5w
         0IBe78eI3mb22FmRlentWMIzF6i0LqVkH6K2zcKVAj+oBwQcfbj4j6INsIojRvUAWGCL
         2bdrKmpdZTj/iRJxXqgCAQzIzVudVFCduNEqik9988xp9+QRO2mHC4IcDByOqoZ1XQXC
         G+5ZeJ3lcnpJnGaB9VqpQ8Ayk/ccgoDSXqPrHMrqKiaZGkfaTBZNOjFH2oW5nzZ80pn+
         QDKfkN4d6faAUTpRrxicbVG0oV8DKWBnu2G6w3t0ABjDtJqkHjnAsHuABFM6wYVmdYPD
         G0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU+3hxnO58v3UjtFfdgnKB0jHKVI2eU2p/1mSlZAvispxEmOCOYksDpRJ+MRkgHmdXrRzeuTvgYmJR9M4gzUoU9OX4bpTAKIulZqSFHLfY=
X-Gm-Message-State: AOJu0YwVy7RtmW8ZfLceOpSiqJGxPq4142aNxTZBNys+t18F/ygcRHMS
	LxN0USfnzBfQCK1c/UrnR6/eKzh4kszLIJJRNujtcp4U5zPGBX8ikzHsG78cbE3hxxAgUaJf6XQ
	mjLfN5wlqvC6zuVt2r55ECEnqS24=
X-Google-Smtp-Source: AGHT+IHwDO+GbMZSfjxGztvJ4iLD6XlU03AyYpDgq7BjMVHcs1yY+3jYgv8GDlzp2XPTI+USIPtGywqD+0qtgPjlK+s=
X-Received: by 2002:a25:d3c7:0:b0:dd1:48c9:53f3 with SMTP id
 e190-20020a25d3c7000000b00dd148c953f3mr2721130ybf.60.1711500498072; Tue, 26
 Mar 2024 17:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174743.95542-1-dakr@redhat.com>
In-Reply-To: <20240325174743.95542-1-dakr@redhat.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 26 Mar 2024 21:48:07 -0300
Message-ID: <CANeycqq=qETyG5ZwmKo0-iLehWeGVf_WqLf=OK3D1LN2yzYbCg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] [RFC] Rust device / driver abstractions
To: Danilo Krummrich <dakr@redhat.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, rust-for-linux@vger.kernel.org, x86@kernel.org, 
	lyude@redhat.com, pstanner@redhat.com, ajanulgu@redhat.com, 
	airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 14:47, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Hi,
>
> This patch series provides some initial Rust abstractions around the device /
> driver model, including an abstraction for device private data.
>
> This patch series is sent in the context of [1] and is also available at [2].
>
> - Danilo
>
> [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
> [2] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device
>
> Danilo Krummrich (1):
>   arch: x86: tools: increase symbol name size
>
> Wedson Almeida Filho (7):
>   rust: device: Add a minimal RawDevice trait
>   rust: device: Add a stub abstraction for devices
>   rust: add driver abstraction
>   rust: add rcu abstraction
>   rust: add revocable mutex
>   rust: add revocable objects
>   rust: add device::Data

Danilo,

It seems like I'm the original author of the vast majority of the code
in this RFC series, yet I wasn't contacted by you for coordination
before you sent this.

A bunch (all?) of these patches were already submitted upstream with a
lot of discussion and decisions made to modify things. Why are you
resubmitting them basically ignoring all previous discussions? Take
patches 2 & 3 as examples (I don't bother to look for others now):

https://lore.kernel.org/lkml/20230224-rust-iopt-rtkit-v1-2-49ced3391295@asahilina.net/
https://lore.kernel.org/lkml/20230224-rust-iopt-rtkit-v1-5-49ced3391295@asahilina.net/

Also, these patches were written in the rust branch. Before we
upstream them, we have to revisit them to check if changes are needed
given the changes/improvements we have made; for example, pin init now
allows us to initialise pinned objects safely -- we need to follow the
new way now and I see that you don't in `RevocableMutex`. PinInit also
 enables us to have pinned modules, which simplifies how we do
registrations (so they also need to be updated), locks have been
redone with a common `Lock` type, etc.

In summary, we can't just copy code, we need to revisit some of it and
at least check suitability before submitting them.

>  arch/x86/tools/insn_decoder_test.c |   2 +-
>  rust/bindings/bindings_helper.h    |   1 +
>  rust/helpers.c                     |  28 ++
>  rust/kernel/device.rs              | 215 +++++++++++++
>  rust/kernel/driver.rs              | 493 +++++++++++++++++++++++++++++
>  rust/kernel/lib.rs                 |   6 +-
>  rust/kernel/revocable.rs           | 438 +++++++++++++++++++++++++
>  rust/kernel/sync.rs                |   3 +
>  rust/kernel/sync/rcu.rs            |  52 +++
>  rust/kernel/sync/revocable.rs      |  98 ++++++
>  rust/macros/module.rs              |   2 +-
>  samples/rust/rust_minimal.rs       |   2 +-
>  samples/rust/rust_print.rs         |   2 +-
>  13 files changed, 1337 insertions(+), 5 deletions(-)
>  create mode 100644 rust/kernel/device.rs
>  create mode 100644 rust/kernel/driver.rs
>  create mode 100644 rust/kernel/revocable.rs
>  create mode 100644 rust/kernel/sync/rcu.rs
>  create mode 100644 rust/kernel/sync/revocable.rs
>
>
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> --
> 2.44.0
>
