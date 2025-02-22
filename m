Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965B1D7E42
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 21:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740259378; cv=none; b=d3bdnWo8JwdgeuQ2I0dfYrijCa7cOXqX6CZMjvTrF1p5jp1Npr5av7lnxgMg5ZCsCylrse64jZKnh/zMasTvfXDqYlPW0FW+vOa2Aak7FVkeaYzuQw52vKUSwim+CTpMMsO0WEjZUzr6tOMdoqkBUsPvJS/y6iLiXKRuQKXQmko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740259378; c=relaxed/simple;
	bh=wksg7Ssp0B5fCpUThY7XyozB7dKQo0DeSRiYBXMj6os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQZpxqYikzxpXrPqHSzgZf62puVuLId3zXMTtyEM6PrQyTgTixsqn+13WknQKDcBm2hQ5beGc4zsZqmzSBHVnOOj4Wmnw4mxN4H4NslXZS7aiEbWIpn5uxbFB13F78clVYYy0X2AEb/G0nYrNOSVS6MHDy96zwCOtXTqA4OtGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GsH69NUl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GsH69NUl"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbda4349e9so465725066b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 13:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740259374; x=1740864174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iEhhaz8KH8wSaw5vdKbNXgznw8OSlCEKiD6GpJBrEE=;
        b=GsH69NUla+wP9NzwNU0EsvI+AmHaoSYIgdalpFVd8BehgMAxyy7HbOUmz71AoXG4v3
         EFKd8u/P2sBQv7wTaE9I61u96uM2OfC9TAqRO1EyRRbotq1OXl6UOY/M8jfwOD5aKxc2
         HLvHE1FlbgP0ucLgd6e6mRO0/BDp1HTDMEdCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740259374; x=1740864174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iEhhaz8KH8wSaw5vdKbNXgznw8OSlCEKiD6GpJBrEE=;
        b=tmKi6k+RkH5ZF/1XwUKaajysQcD3gl0Vt5oKaVW3E92Ss8HjoayWWutHGXOC8H69GZ
         POX2gkkIqQCp5Jn3kruAi2Rf1tBKDyf9EZ5GF+pTYQUdIzYraeD7BbcOo3Wu39+SP0C6
         XFT+CvGd3Q0EmEfXFLtFOzMPXn8gWQLwwTdsAQD1+bQ35ImcSYMy7RSPNkHV2ZPkFFha
         0n7KNZpi8PwkefPoKZpX+rKPCkhdSqxjRZj6F9YFuIbzA2UaWjsRhDEduWhyAubR51WO
         0vF5r/4y11e905FtUhappH/PY5QDOiqhCsiygXYwNlZuv3rGYu9bD6MlFZlDqzoZ/SM7
         tR4w==
X-Forwarded-Encrypted: i=1; AJvYcCWMKzNgU5rtaDFkv/qAg2qUkjUfirEb9tYf6QQn1eB7j1uVAXJDoPZJh0/ATGikt9XcdfimkOidlrAkJSFRhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaLky9lwBp3QIH342wM4qQ9B8W11SqppiTdNumZ5QjOTFWc9U5
	2KmIndVRdalSeskZCPbBLwI6UjkmG9TEH1utONrXhDvVFj9G3t6rGvjvOUJgMSLZFY0+LoS/NtJ
	4FdU=
X-Gm-Gg: ASbGncv9mE8l59/U/bXDQJ2wuuv0e4Gis7V84SiS0uADkVFYw6M4lIqRqf4cNHMaQs5
	lgUq5PrJTlt/z+ZbqDWPFX0ppede+2/7mu4NpcHFo6uOcZRdxtHbV2zHu5sA6GA4dVMzEMpuWAl
	CuRmIs7kh78sLYAe1UIDY407sgKZGRuOi6g49wXeZAGbBRN45r6KOS0Qw0pkw1lnse/Tkf9b++a
	/tOzD9W04Y4MymyaVSdYXn1rpuk1Oa/q8vZt/ztdDCQlmLHPZfkWdfpL2QTfCKahmY6Muav2x1S
	E3xc8MNEo4YOBhxU0OywVEcC3qLBmOchO878qCNRwzd3JbZ0XHnfyEW3YiaXQbyMjAm+8PSpk/o
	e
X-Google-Smtp-Source: AGHT+IFoadBgicWuBygVslpNlBPCrkN2pznKUGAtA6KWCsGxINPZDyaJgswKQxfKQ/SyCnsY5w9QUQ==
X-Received: by 2002:a17:907:94c8:b0:aa6:6c46:7ca1 with SMTP id a640c23a62f3a-abc0d97e4eemr705255366b.10.1740259373190;
        Sat, 22 Feb 2025 13:22:53 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc3d4bed6sm923603266b.116.2025.02.22.13.22.51
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 13:22:51 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abbda4349e9so465718066b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 13:22:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUliRWLjdkNExAiacsYNV/lntulqaxZ00iiiiFF2ZX8oyZ+ja9eGWvlaSvmJrOpppWksMhGUc7X/NwIIIgU5g==@vger.kernel.org
X-Received: by 2002:a17:906:6a02:b0:ab7:b9b5:60e7 with SMTP id
 a640c23a62f3a-abc0de0dfbfmr702171766b.40.1740259371241; Sat, 22 Feb 2025
 13:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <yuwkqfbunlymofpd4kpqmzpiwbxxxupyj57tl5hblf7vsvebhm@ljz6u26eg5ft> <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
In-Reply-To: <6EFFB41B-9145-496E-8217-07AF404BE695@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 13:22:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjS8hzLyOEAxhHR3miajBHdXXSpyhq54iCb6dKuJxP4Yw@mail.gmail.com>
X-Gm-Features: AWEUYZn2q7vlrnil44LrRbnQ_gYsOI4ICZfisQzq90rI5rzF1ykDwwh3NLl2oAo
Message-ID: <CAHk-=wjS8hzLyOEAxhHR3miajBHdXXSpyhq54iCb6dKuJxP4Yw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2025 at 12:54, H. Peter Anvin <hpa@zytor.com> wrote:
>
> VLIW and OoO might seem orthogonal, but they aren't =E2=80=93 because the=
y are
> trying to solve the same problem, combining them either means the OoO
> engine can't do a very good job because of false dependencies (if you
> are scheduling molecules) or you have to break them instructions down
> into atoms, at which point it is just a (often quite inefficient) RISC
> encoding.

Exactly. Either you end up tracking things at bundle boundaries - and
screwing up your OoO - or you end up tracking things as individual
ops, and then all the VLIW advantages go away (but the disadvantages
remain).

The only reason to combine OoO and VLIW is because you started out
with a bad VLIW design (*cough*itanium*cough*) and it turned into a
huge commercial success (oh, not itanium after all, lol), and now you
need to improve performance while keeping backwards compatibility.

So at that point you make it OoO to make it viable, and the VLIW side
remains as a bad historical encoding / semantic footnote.

> In short, VLIW *might* make sense when you are statically
> scheduling a known pipeline, but it is basically a dead end for
> evolution =E2=80=93 so unless you can JIT your code for each new chip
> generation...

.. which is how GPUs do it, of course. So in specialized environments,
VLIW works fine.

          Linus
