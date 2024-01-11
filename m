Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EEB58AC5
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 21:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="qyIoyl2F"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbed85ec5b5so4608036276.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 13:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705006950; x=1705611750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl6F22XllP9SEn/L1tPDM4k+2NrxFEvZRWNeHLtuVqo=;
        b=qyIoyl2F33Ami5Dk/vr3zjEDjtGIw2a14MC8XI2nRrLSRWBnNu0K3/8z36+7VKLQ7L
         NUjcko2JoTAYFZHsOBVBcQYgSzqY2v2QHYXSj0vHv/vZuTsS3vjfJr6Ty1N4ggVmjqp7
         8Nl29PnUQaLLyjK0+ILvfSc3UQeJNbh6bCpCw0tDlt7he4xz62HYo2DOJcRvT83KkFhG
         UnSVybr8e5nUvBJglvmA7LxWwufQ0DAv7bJdVBtol0YFhZmyOwFX2kKIIs3LC11F4+um
         8OMtUzVDROqtlE/uuR9/zxuoXXnmmOdwAaaom9yxYEpWiRM0YS8xFdLZmChr8hiKjQCG
         kEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705006950; x=1705611750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fl6F22XllP9SEn/L1tPDM4k+2NrxFEvZRWNeHLtuVqo=;
        b=AscI0AigX1oL67RSTdOo8sQxFmWklqiCMinxwRV9baM53hVjx/C2AZ7endX1zj+xU8
         PEyDUthfXwNwoyVic1jXLdhhKDDw3/auBcZHcYLflxWdvZ2MZFiZCC4gGJSg68SVLh8P
         BxAAmkI+euhAIuUpfgVkYuY/Ut6IRvisA8yUBJS/V7QVOmewEbetMX5DybDAP675QLbn
         i7pgG6/vLOXfEeC3yhu6d9iDjIt05Vjumz/O8a1G+xmilTuSc6ESxis0AAehZG9q+Vln
         xQiLaLKWp5ClcZWdTrhkSIgjFJWRS/JBPcgcFIMpQBdBNAbh0vLYLy0Jt+EWzwpiGoxd
         Ot9A==
X-Gm-Message-State: AOJu0Yx9Y6XAZQTXU6ZexZCA81QmkzGyQbs24rTRyCxcz5n92HM+e20t
	gKfSU/ZwAR5D4tjsUsQzrLHduK/CMuJL4XeIzum8upsgn8gCRIFsLYlPOHrc8ek+QA==
X-Google-Smtp-Source: AGHT+IGDJQ5DwSxKjPcaF29BJFfTBTbReXjwN4eTY+qrqkTuUK61cf/EbNKwLdaf7IY7dIjoH27EEPYKzKmsSBve6io=
X-Received: by 2002:a25:dbd4:0:b0:dbd:998:5fbb with SMTP id
 g203-20020a25dbd4000000b00dbd09985fbbmr226709ybf.99.1705006950628; Thu, 11
 Jan 2024 13:02:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2714841.mvXUDI8C0e@mythra>
In-Reply-To: <2714841.mvXUDI8C0e@mythra>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 11 Jan 2024 16:02:19 -0500
Message-ID: <CALNs47trYjnJz4pe5HfEx2G4WRrkMDq7zMhrRbTA=E50RLjJ1w@mail.gmail.com>
Subject: Re: New to the kernel, any easy tasks?
To: crange76@gmail.com
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 1:57=E2=80=AFPM <crange76@gmail.com> wrote:
>
> Hi, I just started with kernel development and rust is an area I have a n=
ice
> amount of experience with. But I don't know where to start, if there's
> anything I can do to jump in.
>

Hey there,

What sort of areas are you interested in?

A lot of Rust work in the kernel now relates to writing abstractions
for C interfaces, or new drivers (specifically for any hardware that
does not yet have any implementation, so as to avoid duplicates). If
you have something like that in mind already, we can get you pointed
in the right direction.

I recommend you drop by Zulip [1] where we can help get you started. Welcom=
e :)

- Trevor

[1]: https://rust-for-linux.zulipchat.com/
