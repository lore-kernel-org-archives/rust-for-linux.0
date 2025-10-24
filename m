Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C835504C
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761332733; cv=none; b=cW7mZI+RaaYB0vNQiXIO7MhTvroCU4gEuaUn7fsM+K2E5FAU6DuXsjyM+Z5Rr0AKihLDfEH9vo2TC5XEfwPfFN3qy6avSIbxqWqaMHgcJRXPu+z0xtudmUnobTvo3hfVmdPHLxo0FiLvc77WCv+JhlVMDcLmAhoyqCP60NyH6ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761332733; c=relaxed/simple;
	bh=rHL4FE/dtNnPtIVflrQewItkPhmWUwSP3OT4qUFqjkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxKzYOCBiibimqBUFthMC/Ldu8af5fS61wldtCZoYLoZPA3/uTnydXgeyqtZB/9FE+YElaBHgpQSicRVDORPYNlre8+3vTbEwGIGXSHZ9OJA3cEuKxpuel1DeBOX6oa7uBbBTpOq9R5qIiWbKjehDDPwGjHOvTjdfr3zFkQySbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6LLnX63; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6LLnX63"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-339a0b9ed6cso510628a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 12:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761332731; x=1761937531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHL4FE/dtNnPtIVflrQewItkPhmWUwSP3OT4qUFqjkI=;
        b=F6LLnX63jlcyljaJsB1Tn0I2FLbDyxACVpEEVK7kaMnqfJDOljIH0Jio9QhHUgvS5n
         ODXtl+XsnuHbagiQWN2FWip6xfwmWSbvcMbOgs9yxlqwZmRCJHYzEAA32BjMVCNJBIi3
         2B7TrufK3+rRYZSDhlVUVTC0tQ38DPYIKEvnjyrf0OcZL+jWrrUGkfCEDBirY6RDTN3g
         0T0F2I62NXYO07YEnBChvLUfpHAjaIGiTsRZzwYGVwzG3DK3msM613QJNFe++BNYIPZi
         ceeomhyhJFrV9ZcUC6E7yUXpdeCg7iXYWMY1Urk2Qu0rjJmGL6fUrFmwGHGAvuXVaxTe
         7Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761332731; x=1761937531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHL4FE/dtNnPtIVflrQewItkPhmWUwSP3OT4qUFqjkI=;
        b=aXvIddPSmeqaUquVYSgQO6g95jmdbZgC4si3mSOd3xLQ9KfEOkFNf7T167bDHCOKfZ
         P8wZwu/IP9ATEKBNInx+clBcG4org5CaEEMPHZZwCnehcY9e7Q/VeZQ4BShnBjl5vVW/
         pUFNQcG3kr5kkG0JolIjV/lt4lEXxbycbRH/aWANHaV5kBnkKJHWY8YYWy9vh31dRvpu
         mpYp573Abyv94IGDMT4w4TNwrF5LqIFlx+Ckk4CpO0beXiRGXBVV954tSwrIFKAK3TGR
         7ndG7atvY3qmMeRfnHj+rfPdk/u32X1PYc8t7xEeOS8CZWHVe5Z3+BV+wk6QAdqGJmZj
         2MVg==
X-Forwarded-Encrypted: i=1; AJvYcCX5XB0Utd4bnledNCmi68LxREg2BGLm9AHgDZXQeCGlWM+1OOZ1cYoJv8CIO9cvB1SaVMPmJ4TKcxtbFt+W9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WvV0ktEzU3a081mPqf/8u1vWtLdlGs4OCDmgr8T12VXGIy6b
	h92OKLjztxj43Mt3/WDdDuPUP5kCt0VaiFthWIwSEgeMY/ixG5qA4c4w2HQzvoD9wqhmxr7Efa/
	1UXyOixHUGE5pZ2Qir6RNrZoJzI9f6SE=
X-Gm-Gg: ASbGncsJfzL62TuXbmtRw5lMKnKw3zNzyD76FboFJSU9JKcIh5aM7tInVKC1iMwNHn7
	+/j56YqpKF5uzQFNDf2bjH+j1nbHSXrEUodkAHHjJbHuh4aedUnk2RJsCExElkHu/c949rgvpdf
	usM7jsPOOmiqmPP2+VdySBXbkPfhv+0qbWzecfIeq3z88TAtpOuefU/CT2/zmlYNsbFbjtuIKOW
	Ts/rJxQtmwtHpFdlNteYQSDmh0cW00/ZwYyt6Z0MlirHxd9yTHcFnqnYR9noB6sMSX59E8plT8Y
	O4N93IFqm/JorwlYQMAJEtousE94QU19KosiWSRwuFX3vYJjjXLGiWN37L4c/R7gO0JSDL6QH0k
	PwuY=
X-Google-Smtp-Source: AGHT+IHC/LmSx7U8/fIkf7hqohtOWqKh9LKWk6SPDoT/grppijaYwSmTjW7vhEVsjW8KHUqY21yzGxrgOXjCeBQtfAs=
X-Received: by 2002:a17:902:f787:b0:290:aaff:344e with SMTP id
 d9443c01a7336-292d3e447f2mr110350145ad.2.1761332731541; Fri, 24 Oct 2025
 12:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DDO3G26SIZTK.1KV7Q0PQXHWTA@kernel.org> <CANiq72nUiizxo3YFgxUZ1jiczRNbY2ATao2YUBiCEC7k5hbv6Q@mail.gmail.com>
 <DDO3OMBHS8TB.2LDODR1AFRCU3@kernel.org> <20251022.193230.585171330619599845.fujita.tomonori@gmail.com>
 <vTqqW7yepc41IJ7rUH2GAcWAJ1HHAUQ2_NeQ_os6L5MKNZ-acMHFwH9u3m0oRDumL2YQPnZ6Qu58-iLlAv0Tew==@protonmail.internalid>
 <aPjmKSrETqrchW_e@google.com> <877bwkhfrr.fsf@t14s.mail-host-address-is-not-set>
 <aPtGgNajcXKWpji0@google.com>
In-Reply-To: <aPtGgNajcXKWpji0@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Oct 2025 21:05:19 +0200
X-Gm-Features: AWmQ_bl0Z3bZ7APKg36k88fOBuFGdgN0OinvXHmiYOi28xOnOj8ytbzou7iQKEs
Message-ID: <CANiq72=wkL_tfmStR1HYOBsyV5_o41YXTtUsCM5t+i80+urxxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: add udelay() function
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, dakr@kernel.org, 
	daniel.almeida@collabora.com, alex.gaynor@gmail.com, ojeda@kernel.org, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 11:27=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> For range checks, seemingly unrelated code changes turn out to affect
> these optimizations and break the code.

Most of these calls use constants, so in those cases it would be fine
(and otherwise it is really an issue on the optimizer).

But, yes, using `build_assert!` on the "normal" version of `udelay()`
will eventually surprise someone, because someone out there will start
using it with runtime values that happen to work and that later may
not when code gets shuffled around, especially given it shares the
name with C.

So for functions that do `build_assert!` on parameters we may want at
least a suffix with a particular word (e.g. `_const`) or similar, so
that it is clear calling them may have issues if not "obviously
constant for the optimizer", leaving the "normal" name for the runtime
one or the const generics one etc.

Here, I would suggest we do what we did for `fsleep()` and likely move
both to `debug_assert!` plus `pr_warn!` (and likely `pr_warn_once!`
when supported).

Hopefully we will get soon enough const generics that are flexible
enough -- but passing primitives seems bad here, we want the `Delta`.
So we may want the `udelay_const()` here still.

It pains me a bit that the common case would have the longer name, but
such is life.

Cheers,
Miguel
