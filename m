Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B570B1D5175
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jan 2025 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736150436; cv=none; b=OWXrdZm+rcthbWuZozVx+haq5abBnwTvakb7SjhAr85Vr0YhcEI74Wvm/Lunzhplc8z7HwGz+YZ5KO808VV+z6+GTotFzR4lw+BvUf3Db4K7u0UEVboG4YhTsSUpbBzuhyExFG147xII3xFmvSL6PgrmTebUm3L9KOhvDJ0d1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736150436; c=relaxed/simple;
	bh=gAeGZSMYLcfFd5eqUoBDFOPuKLVGcg+e5EHxtXnZZu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mr/0xYGA7gqlyD79A0zOIOXZzKYFNk6/6I76cEm9jKo/W943TSE2R7jLwwfkJPTGvrZHkLjB3zZKOCXwBZjJsiFVosWYas06dK4YRJG6sWJHkt/kPaBaokpiVZ+mCsVZlTr3AKNh94XIv5FJ3t7KEceb9rJkqD+hkew4FSmS60E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kOdvWxdy; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kOdvWxdy"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c4cd95885so2192225241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jan 2025 00:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736150433; x=1736755233; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gAeGZSMYLcfFd5eqUoBDFOPuKLVGcg+e5EHxtXnZZu8=;
        b=kOdvWxdy1Z6Um6zLeFxoNh/LjC6mjoOMHzR/VsaJFDSVn+mV7yV7V8t7emP1y5duVJ
         871ns+v3Fm/8RnDAJeWJwZP5jg7mCSJGTId1MWQJtDIT4cSqRLNoNBlWlJ/GijuejYqE
         OaW3335Tf7L/kDHXJCuoEBMd3eynC2RwQbYLRPQ0umLPMlzklbE9gHsyv2TLVZi2mqid
         bjWX/CZCYL2QOm1+6C4uqHU1PkjyU/+kIk7TabxheythgE7VAp3YHcP2MTQ+VDoUoYj+
         DccltpbCqZf6i4eFavvNlD1AZQRMCcTwL1vXzSMp+HpuvuNj9dH+IjM+NVn8IZ1koqOh
         Oa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736150433; x=1736755233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAeGZSMYLcfFd5eqUoBDFOPuKLVGcg+e5EHxtXnZZu8=;
        b=ZcocKiy3fmca0sh785aFkVN0q5NablnCXP4qODt+mYo6iIpk5CRhoeNrBRmad5fA4I
         CTNhl7Iv5kvhomU9pjKfQ0dDd+bPS7jvGD2fqmd+9mMNNcEwTYXU8FQtpsG9I1pY0HNV
         RWO9RNb4zdip32TP98ZIIyzuZQtmXup9dbzd6WZKzsUIzdla/rf6XNTttU3pVKX92fam
         T73E+71g2C08M1Hn2kK1gYbiht84zGnz+qC3BNn8d3WDbMdL5QfeHdwEy+6xsBSzCaU9
         a0CWlketN4msdG0kQAOmO0bv6tJUP4pmku4u8of4UXDBcVQTqsPVCvfQ1yrd8rjh5f/8
         HHug==
X-Forwarded-Encrypted: i=1; AJvYcCWdRN7U//001UoXwk+rtZIoChZx4jN7fGLFZW2J657fW600iRbSoN3dht9AmSs4nlUH5zJV3hYA/wkFHSuZaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWvLe3eZbwhOKJKIHnJL2DHNBaJzhFiCsfA93ubxSOMDVOeXS
	TT3g0PtAAxg+cScIveIJyWeL6HNz0iC/64KOgpdKV0nwfIZc9UhECwf4oUXxDou93JBgpZsFIU6
	T+3TKk7BNDvdYSwIg3HcwDWZUgE1PcPN+N8mSuA==
X-Gm-Gg: ASbGnct2A4qj5L33/U79ru+jzkcq2kp37xwAyEiH3hsz253cNftuTa1r3rkQVb+ZB0g
	vxWRJbVdjvvHPfYRF13soE/MRnbx0Am9BnBR2cy3kSfwkXzMSB6cVV07fiY08Oj3QC9wLoGs=
X-Google-Smtp-Source: AGHT+IF5t6laefY9FyQIJEGUL/QYXkcea0huSM4/6LBPfIz34f6n9nzyrb6muxxEy23kpCDaKLmwJ/A/+aq0k6O/iLM=
X-Received: by 2002:a05:6102:548a:b0:4b1:1a9d:ecbc with SMTP id
 ada2fe7eead31-4b2cc45723emr46810675137.20.1736150433281; Mon, 06 Jan 2025
 00:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvM96LS63Wa1+5Md9w0V0JZgBW+f50kzx9RjRCYj3aDkA@mail.gmail.com>
 <Z3qVp1m8zKiMrtnd@lappy>
In-Reply-To: <Z3qVp1m8zKiMrtnd@lappy>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Jan 2025 13:30:20 +0530
Message-ID: <CA+G9fYs=_-GD74k8pGCnA0uA0b1w3Ahxr+r7Bx75gYF2h13qow@mail.gmail.com>
Subject: Re: rust/kernel/lib.rs:17:12 : warning: the feature `new_uninit` has
 been stable since 1.82.0 and no longer requires an attribute to enable
To: Sasha Levin <sashal@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Jan 2025 at 19:52, Sasha Levin <sashal@kernel.org> wrote:
>
> I'm sorry, this is my bad: I haven't realized anyone else will be
> looking at these results...
>
> Naresh, I'm cheating and using this tree to bisect the issue you've
> originally reported in
> https://lore.kernel.org/all/CA+G9fYvcBvbabg+m7brKfpGCGZUcK+KHHTFX7hFvW6GmN2XF0g@mail.gmail.com/
> .

Thanks for providing the details of the issue that you are bisecting.

> It seems we can't get traction to get it fixes, so I'm trying to make
> forward progress.
>
> Please ignore linus-next for the next day or two :)

Alright !

- Naresh
