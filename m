Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B1285418
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761081788; cv=none; b=MEls+Frao3+B6+RuXccjMhp83Q0Gzoe/a8b73MLku81zjOM1QUnuFiEqTRaJso+49kzkw2iOfrFdJCBTWlist88hiLumuXLVf5WQPoA1pV6ajOkRYEVQlDAXHle35wwGpu2hops/tIVlelBCcRuiIM0kEx1k7Pfh3SxcqWPzGGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761081788; c=relaxed/simple;
	bh=6sbV9/XpJvbBGLOwudZer6dO4izmcXo/K+Q90zcODo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKUFmyIeQKh/CPOBQ1HQX79TfyCTCbKKNWXsOxDy2r4jinFdxab5/u0WIo9fLBWQptSniA57K2q2ApTwKqugE9DccKbH11yljNXN/rENrVHwpLryiMwktHHW4lnYBBX2SXLispOq/nBCG7NtQM78lp5EnYRpKoF5EKMTg4GUL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJXURHev; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJXURHev"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-35ba7c71bfdso2085869fac.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761081783; x=1761686583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sbV9/XpJvbBGLOwudZer6dO4izmcXo/K+Q90zcODo4=;
        b=mJXURHevDvLM52OAszuDO9PnopJHA+y6RU2YxteXxsbAbsaciJ7F/yXdQJPEp+F2Eo
         Axr8/e/5BG8XHd56ZvoYOIrtFJD6oOf2POarunfsSrB0QgCgb9VglAQuu9ggftSUTWcp
         I4sx8cVv9rft+q1iDZvtdG+Vayb4t0ifL8qnV9JACZcVGsiCfadpFcnS2iVgco00bTmA
         L+cIhG81At/PWXZvKJdi8z7qkVxMwb78lcL5imOGn5FpkLiTG5tbuwYGEW8aLHy9DXwO
         2b72N8ZdGP8byR+qW4ejYhFGx2jfDTq2kuVBdPUz4Ov9iS1A3fc3baJHxuQH3jsrghv0
         fTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761081783; x=1761686583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sbV9/XpJvbBGLOwudZer6dO4izmcXo/K+Q90zcODo4=;
        b=dMRo/yIRN1a1fQTO4BR2HPmhJEOOY0QvcPK5dOz1XwKcVtT74uELok/I4vlXp03EF2
         V68BdJbeOX8N1eECG9/D7QLYuiSx3vI+N2l7i5ccQK2VHvBuOHhcQ/7ld2vIQoePpw5D
         rP+Oksy6L9tyAsg9NoyEHCKdKTxgKid4C6fMV7D14DwDOZOX362wTuDtsXdT45Ehvo4i
         2Yx6Mz+fFGipRWUJq2GpZPVxbmkmwUWZ9V7br4mEYxqeryssmtcUEwLB5I9DRNMeDPRw
         hsUZZo0jApxJcVwYxPLVwcw9vq5sK/2/1qpWF9ZMCjSD5mL0oXJuLrSkF5VVVTHcvkjQ
         Mqzg==
X-Forwarded-Encrypted: i=1; AJvYcCW+ka2CtPQ55tAf10UEz02ot5roCH6Yw5MhSy25drTGKDBuDSc1Z71DVNIie6SMyWV24XWvHJfbAI5PAYUKGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCLH215JFwuvL8D1wCBZ68ypKjBkfqUOk9Buypu9Vlknr4XGG
	Ef99NOntbPxeA89EuxWUoabm9iYzVNIjK+VYlpmVKHr8v+Xqe0kZx+JrIoNrxop1LJbLnPZfK2c
	CeRLR/TeGa6fl4SgYFrAIR+wWaAtlzWs=
X-Gm-Gg: ASbGnctadKviFBRvXczbUNnn+aMj6QS8xMJGAKrWVARDcE15Yknn36bQrTJLG/Ckbq7
	4uBRRBO23UtSHXzdHSYxalEFBf/W6qjxmh6lU4+Gf7s4I5yfxfQd5s60XXclHsOgf3amBmCF0BZ
	2CPhE+9gkc587jtTrTFXJFEFct2eoFZarmciD9BKxK72UnXU9lYiN83NA2exiFHiqH8Vq122XKI
	5MfvrQeEPW0ZH9PIwUySWt5iffdKF9dTbNMko+4svXpNisNkeg6kdqz2o5jD4/7zzzxDZk28vfC
	U1BtWXWaDIFn03OMKwFsN3jm4V2TOCh8iJXZjiP090DuMKU=
X-Google-Smtp-Source: AGHT+IGrFMcxsEBMC1+cZHqPVMERtUNh0AgA0ux/VSHoiF3yQL27fKNA5xFCo+lM8nbxI6JXdnRVvyYtCCOqvRljsQY=
X-Received: by 2002:a05:6870:a1a9:b0:345:b0cb:d097 with SMTP id
 586e51a60fabf-3c98cf3f775mr8490270fac.4.1761081783250; Tue, 21 Oct 2025
 14:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <af7a8880-e166-4e1a-851d-31b731c2d2fa@gmail.com>
In-Reply-To: <af7a8880-e166-4e1a-851d-31b731c2d2fa@gmail.com>
From: Matthew Maurer <matthew.r.maurer@gmail.com>
Date: Tue, 21 Oct 2025 14:22:52 -0700
X-Gm-Features: AS18NWAe92xBPEbXA2vu2qIKbC1NnCBzxmcvhr2p94XoKdU80z2cE0Eyg6rEwv8
Message-ID: <CAM22NNBbQ2w1GDT5ep-ccwV1zWP-OpfRiM=CvzbPoYdpie6rmw@mail.gmail.com>
Subject: Re: Rust: Manual reimplementation of C unions and layout testing
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Andreas Hindborg <a.hindborg@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 2:04=E2=80=AFPM Igor Korotin
<igor.korotin.linux@gmail.com> wrote:
>
> Hello all,
>
> As you might know, I'm working on the Rust side of the I2C subsystem,
> and currently looking into representing `struct i2c_algorithm`.
>
> In C, this struct contains two anonymous unions for callbacks.

In the specific case of `struct i2c_algorithm`, all the unions are
solely for the sake of supporting both a deprecated name and a new
name, e.g.`master_xfer` (deprecated) vs `xfer` (current). Since the
Rust bindings should never need to reference the deprecated name, you
could consider proposing an `#ifdef __BINDGEN__` which removes the
`union` and *only* includes the new name.

> bindgen generates rather awkward names for them, which makes the Rust
> bindings less readable and less stable.

You should only need to reference the bindings name in exactly one
location, when translating from your Rust representation to the
bindings C representation or vice versa. You could also apply a
wrapper struct and create accessors if you really don't want to be
proxying between two types.

>
> I'm considering declaring this structure manually in i2c.rs, effectively
> copying the layout that bindgen would generate but renaming the union
> fields for clarity. To avoid accidental ABI drift, I could add
> compile-time assertions to ensure the Rust and C layouts remain compatibl=
e.

The problem is that those compile-time assertions will require to to
reference the bindgen struct, or invoke some kind of C parser on the
header or debug information, which is much more complex than just
referencing the field.

>
> Would that be an acceptable approach?
> Any thoughts or preferences on how such layout checks should be done
> in-tree?

tl;dr: Such layout checks should be done by bindgen, and I don't think
that unions where you only ever need to reference one arm ought to be
considered complex enough that we try to implement custom layout
checks.

>
> Best regards,
> Igor Korotin
>
