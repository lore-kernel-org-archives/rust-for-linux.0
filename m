Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915A12E1E6
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707215359; cv=none; b=fvFXiasRxHe0vuq6i6CNOPm1Cp/0KiOlaHO4IbBsaMMwHMhthBSWg0gTW4wv2wNo5GYC721k4wOPwMpfAxon12x+5aBR+i8GZzcrBfqpHU2cZg4xXnRbP5bkMo1eVH9UB8bHLmOR4CMcQgpOCQM3AdzwQIVbT8AmSx+caPrUiYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707215359; c=relaxed/simple;
	bh=e9yENi25hkKUUFaeJRATTgu/uL+tZH+UqZp+y6AN1Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVxXHo4e+9J/t72k+jD8q5EgDUCXsIM37hd5rRchNaeFfp4kLnO0y7DUbpqoPkXeeB1UE4WtoAnUjs5QLAle1Wuyt8U+4zZJ5MUjjetxq+aruvFoFfmNIvJy8yQ5YtCkqgzDi6uX2yJ8cCoixe/2aXQCkku+Aq40T0bBgc7TTEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gCl74Gi6; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gCl74Gi6"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-46d331e3fd2so270327137.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 02:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707215357; x=1707820157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsBkijkQd0e0rwPe6VfUQ9XLIY7yhsc6sDS4zgyBSoA=;
        b=gCl74Gi6apw+UrdG2WlT/g4pHCf8hx8OMIPe1dowodYePVghIxt1nQxs5GU0jxo/eP
         1KNjmIw3DcvodNRbNBrxhYpaouoV+8dtY9qeSYLqrJ7lJeACtOALL0iIgK84icGRcs8k
         RACkDCpn7kvjkJRlzaaHLlYG8e701ZqirqxT1ZGv02rwMiHYO9W0wsOeGiERLzNt0YGu
         KGFsxC7J1WnDA3nV+CJZasWjaflNN8mj5AzpFLwlB/RUCbCuntcXHLz7ZIdKfL1UpF24
         S8pfKPTjYfCjRCjyoJSaLdc6vzCB6lgd1yVIJOALI59PD4cYsZSatofPLQRu2hG1E249
         oS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707215357; x=1707820157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsBkijkQd0e0rwPe6VfUQ9XLIY7yhsc6sDS4zgyBSoA=;
        b=oSDkIx8lMAfH0r2neuxL1xCSjAccIsb6MN2ALMRe72nMPBhy5oRXUGZnl2N8VovAqy
         1eI1fLAKr9HM9ep2T5I+ZvnO7/LPeX44krM95O/+yui1sqlMpj3SiIgexU24NYoRstqv
         PhXS7UxM8EnqJD7OJsx9/mxvBI5DDQWml4NBRXaAYg9uW1Uoapx4yYiPrD9bPYkUtNXy
         Z6h5m/r67ayAqnWouKfg9URRt+PdOcRvnLSo0VaDGJW4QTxTLJNRQ+Cdlrr7+hJt7Bfz
         eRLfdhanHvgySlVYMl2IaXDlyXHRleKU6elOFmtPDLllG3hYGTIs04ggV67Wykt7EftP
         +4hQ==
X-Gm-Message-State: AOJu0Yw3Xe5lm9DvqConc3+vlsJ3BYzbHO4PpBfyAg5CNbrlgveUSxmv
	rF73kHqI6FY/VHQOnxxAEZWCLfVwZ9HrGdd18kWGDz2DVZZICifjQTqOQGN//YNiu2EG7wgQNba
	owL/9g6ofrgLcM16mCZxNBdPyfNa3KM9CLLVt
X-Google-Smtp-Source: AGHT+IFsmi+A0hBlbPYQQvyqpIZ+5RPK1Jvmti7fNg5aK2tWXsCqt9IY6r/iUk+VY9+d83iIeJSKbLp5x1i0nR3macY=
X-Received: by 2002:a67:ee0c:0:b0:46d:313e:f0af with SMTP id
 f12-20020a67ee0c000000b0046d313ef0afmr1749600vsp.10.1707215356623; Tue, 06
 Feb 2024 02:29:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com> <2024020617-edition-underpaid-4873@gregkh>
In-Reply-To: <2024020617-edition-underpaid-4873@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 6 Feb 2024 11:29:05 +0100
Message-ID: <CAH5fLgjYCg+m7+Q63gFr425NiMkhTPWkDufB82pPHCZNhYAk9g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Greg KH <greg@kroah.com>
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 11:01=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Mon, Feb 05, 2024 at 06:25:35PM -0700, Thomas Bertschinger wrote:
> >              // Loadable modules need to export the `{{init,cleanup}}_m=
odule` identifiers.
> > +            /// # Safety
> > +            /// This function must only be called once, during module =
initialization, because it
> > +            /// may be freed after it returns.
>
> Oh, and the compiler will catch this if you get it wrong, correct?
>
> If not, you all should work on that, as it is caught in C code :)

Based on the commit message, it sounds like the warning that C uses to
catch this happens a link-time, which means that it is also triggered
on Rust code:

> If a Rust `init_module()` function (that lives in `.text`) calls a C
> function annotated with `__init`, then a warning is generated because
> the C function lives in `.init.text`.

I suggested that we make this function unsafe too, to make it even
harder to call incorrectly. But I think for the more general case of
this problem, it makes sense to rely on the existing warning for this.

Alice
