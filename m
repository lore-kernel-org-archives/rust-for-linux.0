Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF512BD580
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769555577; cv=pass; b=pUwxZ/il0GUABskufqr83uLNBiVRC2mmOgZSn3sji46xDknmos43/aT67PQdjEBwSKLM6mA1N+R9FKpzzWtwKvxsDP7No/9oD9Mlfib4maKgrfLcBkLKtNj7spqfiXAXjVhRAQZHijJqagkEN/30i/G8Q+AtdX85KPFYQxakxN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769555577; c=relaxed/simple;
	bh=HthKMYjEmoTgAxQ42X81lehERqNzy/n4B5fMDfQ6XN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcGag3C20jZZOvROBrNLBwmhKk5eY3NfODVSisyZK/0ulYza0nlSklQpoLgUAn+LEeBoW/cuAdT8qjNfaQfMObN7+39S2d59ot7KwP+wbVBF+8SUqKb5XJ8LINz8dOc7XyywSYX76pWA26AfEEc+YYB7OuaQQn6Ud8gOAH/BdyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uxj43UCh; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uxj43UCh"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b700c7d3c2so218854eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 15:12:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769555574; cv=none;
        d=google.com; s=arc-20240605;
        b=DpEqmm6DMQWhNIoTYf7gEhcNH1v9gl85OLlxEGeRPD5noMtYIKmn6v6ikJViZsNry3
         ZbiimU9r4Pu1+Gl333si5nKQSpQtsywqN4PTsz+LjIV0VlDqJuwiLh4FA+VWmaGG+skA
         7tj3/KSsL2tVt5egmLPw7br6uxOLWq7SuUS/3WTo4cDqclKLlDRUo5YWh8GXJxZm3oKn
         sjpchW7/uGZqfzQB14p/RAaax/t8iCWH9XMMLUtpSffHpc/xmLr2chgCM3wL71brYYIY
         +xGcBI7hDVCcEaQb0Di672chwgmqtk0MTQyrIydwlFXJ4uF8COgPrD+3ZAsYE+Q3VAbN
         xpgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HthKMYjEmoTgAxQ42X81lehERqNzy/n4B5fMDfQ6XN8=;
        fh=hHUZjSpentBbgESPckq5U2TvxwGgZDZRVHNlKE2And8=;
        b=QCFlizqeFXHn0L5Cjexj85Yh3Vci0aHeK2BEO2j9hLVBWRiBoY5IJRgHJtTCLp8EJi
         YyqnZnO0NmCnvy4aocMvBrjiNFggbTdC5/IVZmUSLgr31tjWZwU4P5kOf5c6prMEoaO2
         L/zAOURZEbVsiee0jSFMR2e0THLbBqB++XeIt7v+hB0RqI31gDYoHimyxfKG/s8KtruZ
         NOmSEpf3Nl6PnrCxoKVKt3sZCyI+um5i5DJoJyDB4IBUCnEfFbSLKVXX8dLXCZv3iiC3
         JY4soXPQirlwlMcK0EpSOsQ1H+gJzwqRGaKSm4boMqPxPsFLze8nSfSJYK0DxHjGopC4
         /4qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769555574; x=1770160374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HthKMYjEmoTgAxQ42X81lehERqNzy/n4B5fMDfQ6XN8=;
        b=Uxj43UCh5MTkPmoKbU6MJPcekp/Kt8q2HXDA3ivmSr5672k5snxUzpz2YkdfxeNXZP
         teFWlEkPV7DQLYCzyUQU8YeAVwnzBNGNMf/dSKnOilw/BjYbZ6hmxvm1o5BXISCxZHqR
         3UwtaYQJ0mCARjF/+13FC5StKub7r54kxwp5vOpBkIdy96Imvoz1eozew3B+0s+PNHEQ
         60RBOsNHwRheGd7nZtlPL2OEOOLv68t16eL4hThji1SZfcM0l3zETQDraFTECl498ELq
         FwGh8NXbh0iU6F6QtqP4BFc8TeAt3wmuxC1zcB7srzA/TU4WDHOa5ozIYpM6jU73P4NR
         pHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769555574; x=1770160374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HthKMYjEmoTgAxQ42X81lehERqNzy/n4B5fMDfQ6XN8=;
        b=VwEpUDNUK1a3WXuWe20vFZM4ymJMLtbIHFnPQq4ONAQrEJhfrkwn1sjzDEwNhlsSHS
         Pu70CAyKhI5k9/ZfoHde6PE2rMhhGxBdCr3KCHTGhg86BOeWIeX79p8kB4EKGGDrAYdQ
         nDBu4jGsq7u4X4WyEoUxjhctapZiqkRdftkwS3JR5X5zaLpZXofxK2XDxviOMZ/AhoE+
         NneHCIsmbU0jQiDX+tNHx43KTAppgcD1JszEty2nfr3fJOraPC3uTfd7AOMzECdNwtAb
         Xj+8H7hCRatnzv8tQPmzj5ErlfAFl/XzYipMUUM87zzvFV8zPiUpat2Vh29XZrs7y4/s
         eItw==
X-Forwarded-Encrypted: i=1; AJvYcCXTBrmRGg0K1kDtpLAavWyLzB7D7D9Gx7MQ4DFmQGe8InxfJPqUp+REc7QDr1gi/f7Hzeb8qWBK0joKfKW8HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwS7MUovZcMPPV9KBYw14l9iPQweiscJa8IrTUD3R1L9QUMX9
	O2I9t+8U0Qqsfc3v4QIETa21yYwo7cIxG2ZO9Jh96rStRkfsMhrAkWiV9PzHulI/TVTqK7g2LI5
	bbejVlOKSB5njN44e4pIpZwB8iK0kVvQ=
X-Gm-Gg: AZuq6aJS2fN7vxHILepyDSUeFKvUpVpoIoSOVDVXWlnOvgfKdnDCUEf3rwwRsvIcQOB
	NOgzERIgXfTf5WV0+Su5+da2R0+OQr40FSxnuqftit/UBXGHYznx1iO+u+UG1VUFayOhNUSYbXi
	1neVyjulN4CkTcu54iQlyYRPGHNMlKKv54a06e8GWWrP+3mgO1+gf3KtIGcl5B95+2oOFrVLunG
	j8xxSabNx2ydWgRdmhUjnmz984yH0keTZ5+PRUH2BCFe4f0hS/X3NJveIUHRvLdBxj67BenopHz
	zerGJqX80VxZjotFE1weArvaDmk9BUePT5kmksoK14E7hmDj7/H7M1eDWe87HElc+mL5wwB9z0z
	A/l+6erYoUZA2KtfJMyO0KCY=
X-Received: by 2002:a05:693c:3116:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b7a13d0870mr92023eec.3.1769555573758; Tue, 27 Jan 2026
 15:12:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127172330.1492107-1-gary@kernel.org> <20260127172330.1492107-3-gary@kernel.org>
 <20260127221531.GC3382807@ax162> <DFZQMVAWC7IS.7MTK7QGQLDB8@garyguo.net>
In-Reply-To: <DFZQMVAWC7IS.7MTK7QGQLDB8@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Jan 2026 00:12:41 +0100
X-Gm-Features: AZwV_QiQyGfc1KRtBDat9MzNxqUgcPnaQBIC9cGWTvm_0m1vAuibj1sujx4f_Oc
Message-ID: <CANiq72nK2K4mZNnpJSWP+Z1h3hkwSLtN+FOWKzUYdEJD92sU7A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide CONFIG_FRAME_WARN
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 11:51=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Lints in Rust do not take arguments, so there's no way to represent somet=
hing
> similar to `-Wframe-larger-than=3Dfoo`. However, I've made klint search [=
1] for
> `CONFIG_FRAME_WARN` and use whatever value is there.
>
> Link: https://github.com/Rust-for-Linux/klint/blob/168031d93c3aa538c8ef71=
d1e448ae77c2cef7a7/src/binary_analysis/stack_size.rs#L70-L82 [1]

I would have suggested a `.klint.toml` like Clippy, but with Clippy we
also want to eventually have a flag-based configuration instead of a
static file (or attributes in the source code which means probably
using conditional compilation in some cases).

So, even if the lint is toggled with `-[AWDF]` style flags, could the
limit be configured in a separate non-`-W` Klint-only flag? Or doesn't
`register_tool` allow for that?

Thanks!

Cheers,
Miguel
