Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367A7083D;
	Sat, 25 Jan 2025 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737831285; cv=none; b=ORTInFV4wRMEeWxgPexs5OAjDBs5NkuMhDKPd5tXn1sj3DjLwwvGtCiva/kXSdYCc0+CNSGMBIdvQi1rNYlOnRe0nH7v3f55YawVeJJ6Tx5shjgYcivSL58+tqQBA5zjYSqTZJwtKeWJuK1U/bSKO+t2uSXWRMEo1R5MHaUXnhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737831285; c=relaxed/simple;
	bh=0ykXA6Qa/AGdkfpvyAeQ787kLn+4Ka0ByuGStj1h+Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsR7HsnhnagvDEwPFfpRL1500sCxGaGRkq8QKG/gH4TkelVHKXfezrKzWB58BSwqX9i3UVeB+EQmimir5PwDNmpXRD8cXhy+CnJzoDFlIoOu7j/H4xszp1XML/6RoeyRkD9wLIXBt7BCYjJPKByCjVy52HLD9a8aHW/IytazJ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3Z+8Etp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3Z+8Etp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f7d35de32dso731225a91.3;
        Sat, 25 Jan 2025 10:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737831283; x=1738436083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUzhIuRIpvrS5NJ07FJzvR5D5wBdBH3Y3EVJ/e4ZEUM=;
        b=h3Z+8EtpQRM63VPSzpYVQYk0NrjJp7AFh65pEB3UpuPfKIqnt/WgVaF11I4Y8Wdqh/
         WVJF3Jidh0AAwIVqwqT4mrITJvUOIdaTV3pfwexRxp9tpyQiNsnE0nwnCgeA+z4ZX9ep
         zWOPNbLUE+trSzD0huPFX9NjhpgFwyjUZFrbnzuvd9Xbk+zpYrDdg3hwZxGJkieT0UzA
         OdvAhOUaBK7E7SBsq66NcbNDWVez6qfoGQ0fQbWGbBmP9xz7czj3I9bWNMj1clZLVqtt
         4kVNQL7w09Z04xX23EMXKKmRVYnH/U/SZm/eGlgNGNZq+DcnUJKQrd0fZcYf/PsaVt44
         Z+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737831283; x=1738436083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUzhIuRIpvrS5NJ07FJzvR5D5wBdBH3Y3EVJ/e4ZEUM=;
        b=jS9JX4TrC9NYG10f0XIXl4SsNfP2ffCeJVNi8jcbQ092rnNk1zns9L93AXbCXGgOK4
         TVfBpclZUD1l6CdVR4/0CrPmAT15xsGsU/Z01yj5NDg58NGIQD1Vo/MeHNMouL4TgGl7
         2agDkm0rqVLiCpjz/enTQqus81OgXQvEtFetVHzOh3PJJpnqpATYcJuWcpgQIygIdrVH
         uslx4AKD3YFSwJ/yLrVhKZdkarmaZTtf0KjgVPqiiprsvOdFJGMAwvd51jlL0JXUWRd4
         GmnCENgcjWtltVo7bhEMxesP3c0sfTAUPtVSudhjHW4RlvIlhcHv6hZ135oiwXtrpiCI
         o9sA==
X-Forwarded-Encrypted: i=1; AJvYcCWa9PFg8i+yHeM3Dtb7QQGo19mCMm5RDzTcpy7yZ5HLvH9UccIq48CFoApL68zEtOkbvLDSQ7PdgCHAqRU=@vger.kernel.org, AJvYcCXeydZORG+cENbmwrjPYR4Pd7aIbyShr7b+pH0HxfGc/V5aZYULb4kOsz3TirVkMTHwvmuhuu5eFDaPC5TB7uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8JO969Qq26zMawafD0agrDfKoh93gmHO67K6+lHVCBT+Jupvy
	tiaXCx6/UrqpozSuq67PiqAQWhOj/qulEF+tdlIsOlZ2mILJyMjxVa4fZ+Ez3pN7WeQyKAZToQ8
	MJOXKYbd03oij7KecT+yqfHwz7BIfHiBNSptlXw==
X-Gm-Gg: ASbGncs0FNI0LxeXr8pD7ogpo3C1aYJvtmaf7rFAMn1JV8i8kZRqTPCJoiBb0YAgUP8
	cnQF2e8mxXImmcGGbGLz+HbaIDFIvxCnjrkevaBvXk0u6sxm/Ypl2ekuKLUUjCbL7fZ6xIkmV
X-Google-Smtp-Source: AGHT+IEFPM08WZv9WUEiZYDUNpw904hunElevnasTvERIoJpk8e0LBfAKlfm9e7DuXnmuMxjoWIcTXUu+aoDYOS0jKo=
X-Received: by 2002:a17:902:c945:b0:215:5926:2db2 with SMTP id
 d9443c01a7336-21c35539e65mr192582715ad.7.1737831283287; Sat, 25 Jan 2025
 10:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125-add-bitfield-options-macro-v1-1-af6ae93686cb@protonmail.com>
In-Reply-To: <20250125-add-bitfield-options-macro-v1-1-af6ae93686cb@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Jan 2025 19:54:31 +0100
X-Gm-Features: AWEUYZlGragvbBH_UstfWtGiHvt8enlVV_7wX-2n56hFX3tq16T7wjzJmVtUhxE
Message-ID: <CANiq72=zMKKBTXmePj69=fq8qUSOFRNknW=teAdE9M1GxYuAVg@mail.gmail.com>
Subject: Re: [PATCH RFC WIP] bitflag_options macro_rules implementation
To: gtimothy-dev@protonmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Timothy,

Thanks for the patch! A few quick notes below.

On Sat, Jan 25, 2025 at 7:09=E2=80=AFPM GTimothy via B4 Relay
<devnull+gtimothy-dev.protonmail.com@kernel.org> wrote:
>
> Signed-off-by: GTimothy <gtimothy-dev@protonmail.com>

The kernel requires a "known identity" for signatures. For instance,
the name you use to sign documents in real life. Please let us know if
that is a problem -- see:

    https://docs.kernel.org/process/submitting-patches.html#developer-s-cer=
tificate-of-origin-1-1

>  - would this better be placed in rust/macro/ or rust/kernel/?

`rust/macros` is meant for proc macros. So this is fine in the
`kernel` crate. :)

> Thanks in advance for any feedback,

The docs/examples you wrote are very nice, but typically you also want
to showcase an actual use case within the kernel. You can do that, for
instance, in a separate patch that does it for hrtimer or something
else (even if it may not be intended for merge).

This can also allow reviewers and potential users to give suggestions
and to guide the design.

> +    /// The bitfield type, usually [u8] or [u32]

There are some nits with formatting which are non-important at this
stage, but please try to follow a consistent style with other files.
For instance, we try to use intra-doc links and code spans where
possible, avoid double blank lines, etc.

I also noticed a couple typos -- I usually recommend using at least
`--codespell` in `scripts/checkpatch.pl`.

> +/// The `SizeAndColor` type is now available in this scope.

For macros, it can be a good idea to showcase how the generated code
for a simple case would look like. It is painful sometimes to maintain
that over time, but it can really help others understand what the
macro does from another perspective.

This one can also help reviewers and to guide the design, similar to
the doc suggestion above.

Cheers,
Miguel
