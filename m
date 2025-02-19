Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569341EB5D0
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976686; cv=none; b=RkjJPVFERMKUKfdAyk32qsEQxOkEiqRrOvxzADxCqgKpmZLQDi80Ghfum6GpzTa+f/xkXGUQj7tvo0EGCEwHLe99C36Uzh1JwJaa2fi08oFBN06ZABhMyzIMUiihsd5xXupJvL9roBANZoRoOEAEV9VNEdMIPrpz504AB9xgYeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976686; c=relaxed/simple;
	bh=oS+yu/QgRYhKSZl4yDfF0LhoNp/PyaQ+d1uaBefYcqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEHjTaOKw8K+OdfK8/udeOh/aOYap6yiJc3XX99jqJLfbwpD53ZZXZRtDtYyETb9m1VSRTsqBstZhigmenflSeak6B5NnsH0EeqV2/7ZLm3wpUyTp8uEa8mUlarVCPMweIlCr4Ldu11+8Ip1sif1v17uQ5eziEkTvpIiy8vjBTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eIGjm9SQ; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eIGjm9SQ"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e5dab3f37b1so5298736276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739976683; x=1740581483; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYcZPixSU09FvTt2cU2XznLhSpH8HftilN3r6wgw4wk=;
        b=eIGjm9SQrXb3EK2iPgzFO4H3nP8A72EgHHHlelCBOgpb2dhHH8kUwtTgbaJkgGIAk9
         /EBvJjdLcKRjtHi9IMGVsOtpsLTzYPoB6xMFB1h1P+XoDDUNCWlHGJ/gfEN3fVZfTx70
         KczebrUNci9hXP+XKnIfIqgQKOI0D5MHfE/EJGcuSHt+6ym5GGMHzfLvNambUB8UVh+v
         W322XedVnIxSJ42R6Ryu8yeBiItc2zfkWFaK5x793lnkvsDvmM0SyzQ+3nqp5QcXW0RI
         7PrrQefj+XMfyz2rNiN9hmPiJkW8fGDTV25ct9w9/uUNyJYv1xdTu0xtd/eYLGRtvnmX
         I+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976683; x=1740581483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYcZPixSU09FvTt2cU2XznLhSpH8HftilN3r6wgw4wk=;
        b=JvLJbPaOUgeGG2Lr18UWoKDsrEaiaJtD8zV97jNdkf2tyn2DEF/jf67co0TMb1RP+W
         Cit7FtHZHenf5NyYz2abPJ7VGFfCYI8TEk/TnOE7Jk9tj3tasnTYsR+pjcrJduVXU3+b
         qfjyqfr3SpHnl0sfJaulW9CiVtpo8bWkEG+HdiW295QsDDo33UjJgaJEFJnpvQJTdPlk
         upuJwB21ia9Nj7HRxv0ljJ7GMfpPpB/F22FKZYXOPYQ6lxcrqNlcZPKamOsgzvg3KzQK
         is8f/3rvWM0R9FP2VrRiD30PFTv4+Ia5i07AMw0Zi4BWdWXbZv6YWmW+SfAeTZdVQLsb
         lbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKlRxmvZpioUwr3JKFi39Q2mcqwmRD8vmW5grvCzVTWRUJkFIoJ7fdAjBMOqB7w2cL+GE0oGAPVnbNUTBZzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvHbh8zqZPGxkkQexlrIVlTsP8xoiX/PcA+d57wxUPZhWQ0JE
	fiNYtGQS1wvAjOjFNhScbsn+Sa/rFPUqHJMrkDtzsgM0qFQnoCwQtaOv2Q0t60aspbyeP6FoqwE
	K1Tnrtvd0f84wGfZcae357M+QCsvTiWrfUCYZpw==
X-Gm-Gg: ASbGncsnnAbG77+JJ+EX+lWFO5NNIIIAx9BZwwguw9J1Lx7Wtf4rCchBmorlP5eWcyh
	fzvKEjXSUtMYA6AvXMDgElUTD4xgo8DHbqRJyxjFIlJ0SZnrVf4bDk+Qm8bkrld5Qb4BRwfw9VT
	ArhBfHmv4G/ckdMoulHt3rs+ofrwo=
X-Google-Smtp-Source: AGHT+IFDRnRjjoBS/EtzzR/rm4w30wJi1RY0H6xdR4FvTj6621K9TBsfPk05+xPr/Ay6d44n/69mJWQak4reieBYPok=
X-Received: by 2002:a05:6902:dc7:b0:e5d:cdc6:7ad2 with SMTP id
 3f1490d57ef6-e5dcdc68210mr9659126276.46.1739976683113; Wed, 19 Feb 2025
 06:51:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
 <2bcf7cb500403cb26ad04934e664f34b0beafd18.camel@HansenPartnership.com> <yq1mseim24a.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1mseim24a.fsf@ca-mkp.ca.oracle.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 19 Feb 2025 15:51:12 +0100
X-Gm-Features: AWEUYZmLPvlXBp47lLPgCcdKQupT0djJypa3PTSZUXuiz24ub3UWxBzENa0nPX8
Message-ID: <CACMJSevfxqdwOTAhV9CLautgoEur9G+9HWmQY18h38vNE4Vv3w@mail.gmail.com>
Subject: Re: Rust kernel policy
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Christoph Hellwig <hch@infradead.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 15:47, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> James,
>
> > Could we possibly fix a lot of this by adopting the _cleanup_
> > annotations[1]? I've been working in systemd code recently and they
> > seem to make great use of this for error leg simplification.
>
> We already have this:
>
>   include/linux/cleanup.h
>
> I like using cleanup attributes for some error handling. However, I'm
> finding that in many cases I want to do a bit more than a simple
> kfree(). And at that point things get syntactically messy in the
> variable declarations and harder to read than just doing a classic goto
> style unwind.
>

The same header also introduced infrastructure for creating "classes"
which are useful if your "destructor" (or "constructor" and structure
definition for that matter) is more complex.

I find the lock guards from the same include very helpful in
simplifying error paths in critical sections.

Bartosz
