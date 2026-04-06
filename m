Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7B14369A
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478719; cv=pass; b=JRJzOaSiTdJAfYP21EbP8+68E1iugF5/2I3PdUnNem7QW889XSQ/c/to3FGFnZZ3/ZhUnrXmVxnoTbyCyc6BLTBzpKkEPT7JuHTsYc+IEY+cE+kPKAMrw80kkIjBWL+lI9DyViT2ajZCLv+M8gPefucDiUyi3SEeeV1pCPYeQjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478719; c=relaxed/simple;
	bh=+Bzg5VWfPYAtEx5wcVW1azw8Ywqre2VHJYLj5rcD5+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaAayY2JOqdBtdTgCP4YUcQyR5cmT+aQogjy4SgZeNxBFdYNAKMD5ahxnqMSJh7RCebwPgnXD3UCxhWRazEQMYTrN1J4ZAXA4vnDReZEbeAat6UMv+QxTj5gJ5WKOpCVPWvbtLhOOb4Hr07m/xIuX46MO8hdPGkollQ34tHIY2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R83YD/nh; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R83YD/nh"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b8095668ebso289374eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 05:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775478718; cv=none;
        d=google.com; s=arc-20240605;
        b=WGBXVG+f8aytslenDu4TJNrdekHS7CZ7opALwRIt7DiaF/vv3gow8BVqrEMs3jv68Y
         q8Qk7LXCpd5PaD9rR+SjLGaodaXmgAJ87064Cj9m869vc20RQKlxXklhdEkCZiowZCvY
         5P/w4mEfNgHqtPurfegy9aiIknaVvir3sH1lho+zFgTL7iOMIdiMTbLquN+dGtQ4KR1g
         WxoPYjLICgQJx893yemdsyeEsnu5ChU7iKSClJNmIrbA58VLRgprqQERwZ+QKsfyW7ux
         60dCgwjdgZ62q+gDNeeY75E/kQE833esL7NOwV2VDoRV36YXyTyR+s0fzDVyCgBhzBnp
         Uyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Bzg5VWfPYAtEx5wcVW1azw8Ywqre2VHJYLj5rcD5+0=;
        fh=3AercfPzgPBcTqQkoZrNXQjZ41poTNHBztIDb+FBJG8=;
        b=PqqUG/jaA8nIF8q7YTC4VWN7VlzppJdLfDcZhBAsseif6UAM2TxvHhqxO6NbE4xAvc
         mE1FKRp4/u0mHYW+gxBV9NAPgX1TVuinvkpRHmKLpKbPnwOkITtX2wOD7PASWg4s10qr
         jiEJITl6/Ux2Vii/CF84EK4QhBVwsj7iSfO5W9hf5QuF5x6DwYkUBlJq4wgvicUxd6/t
         svjJDucVxiQwVQL9dhIfNyKeFUMOR4QEmccuIl7kfcFdV71xSYDYkwoXWYvIKwZT/2Ko
         FykWsk3b1WLe80N5CNCqttSwPUiSwPh7Z+QFm3Za/zRw8668VCbHqdTsk1vROxIbdMDN
         uIRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478718; x=1776083518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bzg5VWfPYAtEx5wcVW1azw8Ywqre2VHJYLj5rcD5+0=;
        b=R83YD/nhsF0JLuHEOter4HnFAbujIjT3IO7C3vPiFzAL0yeri4n5PdGXAihyX8DGXv
         klOny2AJCA3NvNHQC2NJKloZMeAWKJQHqwlMZFJMtt4/RbXLOhLrVc+pdRjUsXDjfVel
         2vzg0L8TsdDWn0158WoMUBXDxlcP6rPeF4f3osCuH64T56z3rjJbj6EB11NwTaVb/6Aq
         ciU0onDXuCVv8+GAc3ymNySJxW90+qvY7uqsEKXrGo1KvX+8J7SPxmmLbPDl28SWgDnS
         LsAx1iHMAghB4+Q4bvjaVFd5h1EO6DQ7S7zfbUzsvdz/EpR+Hx5ui4BcQ1cRhFv8a2h+
         DqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478718; x=1776083518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Bzg5VWfPYAtEx5wcVW1azw8Ywqre2VHJYLj5rcD5+0=;
        b=HPS3l3O+nT520yXTRLSMjDCYyVZCNk/J8jw170TfzmDiV8YsUMT0ay/mGU2vZ9febU
         slbiL8eJHbOa4ittsFFBvc/1iBZR3lQzUeweZRHrvrC6Zeh54P4xOMEXPEc71YwLvrmH
         XUfhsNyRPkBpkjfpnH/9HPYaXZFmyQpbatEi2W6MUrOOzYy9+xBUmS5noeG8j+BWTYnR
         lENKKs+dk2Uv4fYFjqHF3dWWN9rQbH8NiUTVlVIM2sNcYT/uq9GUCZbE1ee1iLpHjGyo
         /wFkcmYKpLwKkVgz1kTNjfiVUHMpVL58XrQ0M7syVlleMRBXxaB3nsohb3H4xjrKhKjg
         JbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKWLBM4biAYEhUV0oerq3Pnhww72KlIKt0iHPlDIGUmzRHqe7uwnoyfzBJ0TDw3siXCsXB63wJgCShrtYx9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZqr1Q+VzJKIx0ABT2PLsN9eFhx3ia8jR+A93X5cimTuzmnffd
	FyGP10spKp2zgZyBhPwIeJRRXS5BONdL8cNDrj06MInlkyvk3FwtI2RKmvDNFxfLeukyK9WMVBk
	9K7D6nribXuvLQI9Nn/HfWioM05epc6U=
X-Gm-Gg: AeBDievSWjyvSTA/XwIvoXqNMqp5/iG6vivrnWhUoR7IQFER7Cd1s1SoS5aX4Q+uumy
	CKZ4916h5w95pnOISdgt4SqNtxex21vqRZpw5xEt2y9jC8Yq53z7002NYFvrXTHcbyaQM0XNTLt
	078l6BGESPs5x5MFapM7SPG2s571PFO46kiJLj1suTPYVRnm3Gqb6QZPO5HbDbMk2flomwXAfXd
	nus3B6ru4krO+PL+0Xi82fq1ov4CxSKWcatoGMy9NLoqhssXCIVzNhumQGBy462Mq01Ce77V+r7
	qdBcBArOdmciScFyNO7kYE3jddJbNKKmAS4//DcIsOSduQMogrUy+ZwR58Ftew6hXWdl9yb6vUY
	4RSaKvyXDQoQcKYGE/dUSEFE=
X-Received: by 2002:a05:7301:129a:b0:2c6:2bac:8af with SMTP id
 5a478bee46e88-2cbfc958fbdmr2329567eec.6.1775478717782; Mon, 06 Apr 2026
 05:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226120848.82891-1-adarshdas950@gmail.com>
 <20260226120848.82891-5-adarshdas950@gmail.com> <20260226.215923.1020202093931415612.fujita@bee>
 <2026022602-audition-utopia-f7b9@gregkh> <CANiq72=tKVD13GD2Bzmt_LnC4SiOX1nkHQPcz2BS=P=b23e0Yw@mail.gmail.com>
 <2026040601-unmasked-tattling-67a2@gregkh> <CANiq72nT6gN4ftRigRrisYkrxpfpZ6p5g6KSUCfdsHVLRF1iug@mail.gmail.com>
In-Reply-To: <CANiq72nT6gN4ftRigRrisYkrxpfpZ6p5g6KSUCfdsHVLRF1iug@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 14:31:45 +0200
X-Gm-Features: AQROBzDTDZgt0vApIxLVvLKX96Pz0Vz0MNgxmAhO4CNfIMBRMt22k8_zmLVzy4U
Message-ID: <CANiq72=W8wCH1Egetj7-wnS1i1MyniJy4Kg86JG4mOxq_hi6xg@mail.gmail.com>
Subject: Re: [PATCH 4/4] rust: time: add `pr_warn_once!` for clamped delta in `fsleep`
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <tomo@aliasing.net>, adarshdas950@gmail.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 2:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I hope that clarifies (and thanks for discussing this, I think it is impo=
rtant).

A couple more notes...

Some of these things should be done if possible in the type system
directly, i.e. we generally try to avoid invalid inputs in general,
i.e. making the caller prove they have a good value by asking for a
particular type that already has that invariant. For instance, the
Rust `udelay` perhaps could take something more narrow than a `Delta`
(which is already an improvement over C taking a primitive integer).
But sometimes this may be inconvenient (e.g. if a maintainer wants to
match a C definition), or not a simple input parameter, etc.

And regarding the debug asserts, one may see them as "inline" KUnit
tests that check things for you. Just like KUnit tests, they are not
supported in production kernels, and they are not expected to be run
by users, and (I think) we do not assign CVEs for failing KUnit tests
etc. But they make development (and maintenance!) easier. The
difference is that they can check things "on the fly", constantly, and
that the failure mode is louder [*].

[*] I guess we could have the debug assets not panic but just print a
special string and then capture those in the log with a tool etc.
etc., but that is another discussion.

Cheers,
Miguel
