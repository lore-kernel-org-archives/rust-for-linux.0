Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B01A154BE8
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Aug 2024 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722854702; cv=none; b=JxkHMegEwbwfElnsSXMXNF242PAYedQQYjnF7M7yyKsp5HUHdAdzjeoo0W1376lxAktlcJU3gtHyuF3/n/QVnHLhLO+vnzjL38kNUWmuQ2QZPPMb0nImT4Q3JsQttf4dMHFMvFeMtGVXXfPFLPKvYXLENqD0Q9tP22mWQ5f59jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722854702; c=relaxed/simple;
	bh=v/INaiO6j6n1cBHhtkukKtVzT/0YMv8yM+gJgwKS29c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulNGJaoTLbtWB2y07VuZA91+4xlo9kk1GbH13TLsTAxtc7Q0SXpSv3CCs8U/rjmaUKhyLZMNdZPGFMJRaomJ0/B2EDjBiwyVilaamQUc8TNKF/CksMdsHLGFqlxsPnY0PhasiY39ZQQJxE1u4iSwEsyG/cIWN4tRJA7NBupyCms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOoUwXfM; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOoUwXfM"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7a115c427f1so6287247a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Aug 2024 03:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722854701; x=1723459501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIUbPOVj//FP3m4sbSzQkApcENG8xJSkqZH+p74RNCg=;
        b=SOoUwXfMT4LfdUGeJF7982JRq/6MMHdL8YoVyvT4AdtG3eYMDA/T+c7EUBJjQ5TSYu
         mPuK5QOsABkmPsEkJ31VV8K19SZQjvMAWm5NOAziSgG/BEe780rPwEE1EST77Kp9BCyW
         4p+Q2Rlj3f9Nw0jcf0q/GsI/YKhaMkQA8kuoe3NfL22rrermbz0Q8nTxdFYr8PrbeuYM
         5AuF4FZfeq3Jc205E8cirWwXPGCtn4ktSV3Zgq6N5ecoCMkXeuh+JHAM+MjSOxBN9HiH
         FvIJbZv2Ro5tghI4kVZNLwJ+fywaav+9dVTuxuQdWe4h4UdhzmAQqjPTz7KhDucr/0MG
         +XZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722854701; x=1723459501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIUbPOVj//FP3m4sbSzQkApcENG8xJSkqZH+p74RNCg=;
        b=aSI170F2WraBIDPCTDMA/1g/6NUk3UoEJ424kbmarP0U6dKyYqn3LamzV99p2iDOL6
         hAbVJP228UqWFzPHVoFkjJo9L3X79SnMpyAjKzkZUr4024Yf8W9U2LCgSSiV0kqP55EB
         EYpHRdBnfA9vSHHM0MDIWgcdNx14fCWqh1Kx9gWuUEl56bU6xD/1xSEilTZW4POxT/1F
         fkYqnEj5uTX/atD3mfOahwot6nmP4rLnXQJfbJKTfEi8/LhBBzbaWR2aGm6qzeOWYeTJ
         IJyrxWbJL2AEP3wDJI2WK8e0H09BykYqXUnPeIK5Z6GHupvTCdLWBe5FImQLePm32TnR
         OVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4VwsIhIBuVkGLSufcmQiLq2eEybK/YDr5+pcw675udRnmeoHOZYIICcTnwnzdiJzlEPTXG64yGwbh8qrWmcRuhXLU9fNVNWy3BmyZEL4=
X-Gm-Message-State: AOJu0YzmVC9Vv+l1MP1SMoHej8o9gENGhwJARL/fR1jvD0P9uxYqMn20
	ZN++dm3CnWKaGly0gVhYLSfM8yng5KPjIF9IZpuq2EHUc78H6dD5kul7yHGx+YzUeQq5luKOvq7
	ULQZCtMSnI/bP6MkezgrEJ+OiyKw=
X-Google-Smtp-Source: AGHT+IG6xc14ifxqd/baPccljvKs5rksJY5z32qrFxzcPasQLi+0tz6yklad0zrokuO8P65MwKc6kCkwHHaiW/bFaEk=
X-Received: by 2002:a05:6a21:7896:b0:1c2:8c32:1392 with SMTP id
 adf61e73a8af0-1c69955f4bamr12272834637.22.1722854700852; Mon, 05 Aug 2024
 03:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724172713.899399-1-sarthak.singh99@gmail.com> <CAH_eo809VXLGVf2vs9gVGr9r_9y0pP+4ku=zoZv05U_ZWbnaHA@mail.gmail.com>
In-Reply-To: <CAH_eo809VXLGVf2vs9gVGr9r_9y0pP+4ku=zoZv05U_ZWbnaHA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 Aug 2024 12:44:48 +0200
Message-ID: <CANiq72nHyuQ9+59qDQw9PbRf-Tm299JNrP_WjsDBrahM3g-HiA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
To: Sarthak Singh <sarthak.singh99@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>, Lukas Wirth <lukastw97@gmail.com>, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 9:53=E2=80=AFAM Sarthak Singh <sarthak.singh99@gmai=
l.com> wrote:
>
> A polite reminder to please take a look at this patch.

It is not forgotten :)

I think you didn't reply to my v2 message? The changelog does not
really explain what changed, so to understand what is going on one
needs to recall all the details, diff your patch messages and try to
understand if there is still something missing from the v2 discussion,
e.g.

    So I assume things could break (or be confusing) if someone provides
    (intentionally) a `RUST_LIB_SRC` that is different than the one in the
    actual sysroot, no?

Please do not get me wrong, the patch contents are probably good, I am
just saying this because it helps others keep up so that you get
feedback sooner.

In this commit message, you say:

    Now `sysroot` is a required parameter for a `rust-project.json` file.

But that does not seem to be true given their  docs. I guess you mean
for combination in particular, so I guess it it is fine.

(Cc'd Lukas)

Cheers,
Miguel
