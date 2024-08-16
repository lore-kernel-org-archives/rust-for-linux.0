Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE4382863
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Aug 2024 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797632; cv=none; b=U3luVoPl9mk/oWGevMwa55eqfQlwiE6fEuiErO2ZOxkr/FZDzm/ItjEGGUmJNMo88sHeBGRJOo3h6jj9YBY3bOHffWFVcjBpfbSh+EE997S+Rr20dCpWCd6CrhvFThkm5WIJYDwMcmu3H39G9/XbtQsWL8YIEGYlRAUnm/Gp0HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797632; c=relaxed/simple;
	bh=iW79sM3hHo+mFnCCGnCj7nr83XhiO9hlT6whJOECIRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJ8am1Ij95kp1t3T35CU/7PTdu1Ta7YjiiRhRqN09l/Y+wVSneW1UNMK2/Two3ov+te96M13JmPt69jc0Yo5pl6cyg7J7rFAphDC8NJOlSwvY8nhOfQRwS8u7NSlu5ohmgztVawBEqrSpC0Dw2dmD71MFRSmcT/ssm+tbgMI7wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jp7sFJaa; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jp7sFJaa"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so2433148e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Aug 2024 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723797629; x=1724402429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW79sM3hHo+mFnCCGnCj7nr83XhiO9hlT6whJOECIRc=;
        b=jp7sFJaa26Ez35yu9bTICY46dr5Gm5oJQ1lw5DSF6SnfhEcBYOMkGahNPbnR0rg//e
         FtJwiZ/aw/XnBjW8QaIjt54jnfLMttfIzXNcB7152mRTzHDiPWArjXzQ2Iv+fCr7O1dc
         8pU7UY5N9SNgxkYfr9nuZhVSYIO7gvoBCpvp9K/hF3kXiG7YGBklib6oxfX3vBVpLoTt
         3MrQ4cNMj9mz0SG7YyszmJP+7h8mgOwOyK1giiwwSq3lkVMwwTGpUHZCSM+DIGkZlree
         4FHXn9z3839/h/8aU5XoQhWfDCe73MUTEf7izRdGOlYv0tx/CWkBUT2If2EBMnPV83H8
         Jg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723797629; x=1724402429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iW79sM3hHo+mFnCCGnCj7nr83XhiO9hlT6whJOECIRc=;
        b=MioEQfucvy/nkMYejWRE4YYJlUoldIoY63ivLzt8JG6oC2vpPQp2/vU0o5C8TrMZfw
         eKJiMFCrW4d85QCskEnc10fnXHWMi7xU/psutRfZlX5k4EUj31PBz5TV9BydiBB1CeiH
         KuaZ5XoeznROdUB73ijJVpEn6PvY2bHONYpnm9yfnYzvp8WU344CAhOQtpJl2W/EnLCl
         iJ/n0y5u1UYriMvcJsnGc7Dlc2Fj5a5cY4PfHeR63NSylG+7RGIJqF3onLTgqNsfX8+i
         etkGXng8dIeAleg90sDq/uYbkFfcwlI19zV+AqcDvbcHZuJ/7YturGUs/Pm4lrCQMbMP
         nbFg==
X-Forwarded-Encrypted: i=1; AJvYcCVbpQAsTkE/HjBZESb9/TzkfTOuhdfOKxWk+IvBksBfWAyrUOgM75tp2ppQjnUMQBPY0xP5ovV1tX3ZwXQLmmaiJbTHOVTKKQmBBHO3CX8=
X-Gm-Message-State: AOJu0Yx2OOsowI8MndF6sf44fa/EskV0GR0+asAbldIV5quDmerdy7J0
	rtRorfFppKXr+Zwu+o9xRh3XRke1ProlUKG1YFAJUxAROzAf08K0o9lADR39ohnWnBY6uDk3bj5
	fM45DAM7OlGkylQl3FJo8X9Bc7CFQcdGnurEx
X-Google-Smtp-Source: AGHT+IEK8j4hjMmZi4qGx/qKmnXlqNbCTjDDytBa54fmrI2TvjtsIb0RoEBYPjaEmcSo3NgCpHBPsW90ABxFXliAnbk=
X-Received: by 2002:a05:6512:6c6:b0:52f:228:cf80 with SMTP id
 2adb3069b0e04-5331c6dc7b4mr1255122e87.40.1723797628284; Fri, 16 Aug 2024
 01:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815103016.2771842-1-nmi@metaspace.dk>
In-Reply-To: <20240815103016.2771842-1-nmi@metaspace.dk>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 16 Aug 2024 10:40:16 +0200
Message-ID: <CAH5fLghAMrKjCuJPEv6P8gTd7x0q=F2L+avfJC=XFA2QgGQBCw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: split up helpers.c
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 12:30=E2=80=AFPM Andreas Hindborg <nmi@metaspace.dk=
> wrote:
>
> From: Andreas Hindborg <a.hindborg@samsung.com>
>
> This patch splits up the rust helpers C file. When rebasing patch sets on
> upstream linux, merge conflicts in helpers.c is common and time consuming
> [1]. Thus, split the file so that each kernel component can live in a
> separate file.
>
> This patch lists helper files explicitly and thus conflicts in the file
> list is still likely. However, they should be more simple to resolve than
> the conflicts usually seen in helpers.c.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/=
topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

Looks good to me. Obviously this will cause some conflicts with other
stuff, but that's okay. Better to get it over with.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
