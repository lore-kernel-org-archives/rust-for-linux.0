Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D8248F5C
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916728; cv=none; b=k2Vb/QLd3K5EUMfNFeuHO8NnkZ8+ZWWBcORUlFxDSIMKL8CAvaTV2L3evYKPGOr/1old1uAwEN/57NScb1xin+R+iJOPGuJpYpIF9MdFvHv46D6e3a0nWSNTcbZHsva9wgwDunKwVg3va4WRqDPmOoGYyTh/xO8AVRsb+J33GVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916728; c=relaxed/simple;
	bh=hwPwg21PUNDY7bWS1a5ZPuPQ7556dJiTKUQ/Cmgyxw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmQzefWFnXdGPEtSGawuFkTiWhOcE0bD68ZC72J3jEQLNBT15XPOUajc3SGdY2TSMHTDK6oByNM87UmBz0w6jvrOpMT6HQgmO2x4RGDkTT+Qjj2f5WUFahuId8khCpEWbWs+fUfNwmUtd2vSNIYLvn1lMQ07tMQ/LvUyhhIH2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/emK1o9; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/emK1o9"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b62e55af64aso113362a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761916726; x=1762521526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwPwg21PUNDY7bWS1a5ZPuPQ7556dJiTKUQ/Cmgyxw0=;
        b=Q/emK1o9WweUKP/TM0qnDGBni2rJZHQZAp0oWvw1UfE1vFfICbOMC7CNzNuj2OPwXf
         eDc7fXGb0fUGWFWhr+qY1PvacuFs8uAmaqVaFztMiJwKaCOO71Gew+NJKrocVJ42YwL0
         k8iAMw3VSMxt0qsULEAmRrjraycqOUHZX+k/7CjOad2SH+HH3p6rUfScc/Hsl+QALrBL
         dbcV5kFINAPQ0lk6Gz95M01d1NHyCbjZuWXvu8d6gRtjIjPqiuNXzOz+Xqw3jTKBpL+V
         pQjcPzQZl1haXGQ9SGNvC0+zUYy3jrJojqPuPZLm1RLQcCN6caBqcDwlE0RZb2RNw618
         X8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761916726; x=1762521526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwPwg21PUNDY7bWS1a5ZPuPQ7556dJiTKUQ/Cmgyxw0=;
        b=OMMx1spyxRUHFKuCLqvD/scZSOxJtmXV6l3IwXYazmBKsvjL1XIR3w12pzLfeSjS0q
         m8L9p/B1faRspzOriibJQAOgI2n0qXet1kVhGsGWSKr5MV2cYs3tQ5nuxL8BYQoXh1KV
         Gb2pXQ+wBK3mSX2qaWFNUUcIfvz6GiNJGnl+ZGuewWwNl1R+Kn2TgeDHSxkslXxPOlhQ
         wsq8teF4N6WYzGsctYS1e3Lrbwr48n5JbnoUzh/P2E4WdhWlghJaG3B/mZeciBr1QjVv
         D31HbQXsjjFuWENl9JX4jd6k0qK8JojGAb5b/ALqIDFm5RcXXLCkF1Yfx3P/rYjEYkFj
         3ZhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7soIt7jvnizswEeffaTC6RQJRpVzbgw9WNq/HI9yBSd7zqNM0wbYO9lg8upL8mAbjQQJIRTRcLx/+NyrQjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuqhkhYVW5r8N4f4mvj6OJoPdEhvNUpUvX+5iEc5sGhWa9c54
	1rK7xgX7mgvsNoZ0ThV66DWaujNTya8BGZ9JyMa/m3u0sXWqfdY6VQkLvgDo9ox4TWJoINA8+NZ
	x/zE2rX8WkvMno9kdDpoiyQ7WdXhwO8s=
X-Gm-Gg: ASbGnctaFB6xyM5AsCMnIDC8ZfALtAgxqsogZIt1Kuqoh4D2JlQxch1ZW6ysSmz7xvo
	zdb9wyrNIOaEMxpetVe4JC9+YJxJYGun0TJ+JMC5oLbPX86ZznWFYvkVCWeNsVDBIE2t4mZzHwy
	Y06M87jWd14tjzA3TABiGvyVecKwmgcJYT4fOEgsaXTUKIzR0aP4q5kbJGuwOI6GphgHkWhGYXo
	g4lfc67X3wn2VQlgIb77AHMcDcfPpVVhKjoEnhjOkf/Vl3WiaNqxe15/hPJNYOq2ktKDDB+kmHh
	TecwDniN/tRykMEUc3Xe7d+8OlIfz4Uohk19n89NCz4SXIGdomXFCFKBnrkoHcZRmPEeTbKpTsh
	GX6+qCK1kcSz+pg==
X-Google-Smtp-Source: AGHT+IEJ49gwJ5mRxtZtv0b41URKbZUBJLIt2VoQe30SlwO+FAYpwSB5aWCZX5jYTBZ0NgbiTYvlaN89VXh+FK/gXxA=
X-Received: by 2002:a17:902:f684:b0:294:ec58:1d23 with SMTP id
 d9443c01a7336-2951a3a3eecmr24614175ad.3.1761916725522; Fri, 31 Oct 2025
 06:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027200547.1038967-1-markus.probst@posteo.de>
 <DDVLMBC40199.2BVFYHDGQP4Q4@kernel.org> <cf50c6db2106a900f2b9b3e11e477617d8cbb04a.camel@posteo.de>
In-Reply-To: <cf50c6db2106a900f2b9b3e11e477617d8cbb04a.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Oct 2025 14:18:33 +0100
X-Gm-Features: AWmQ_bmiIa3swbTRNRoyyzvdTz1VncSekR2-DDUNMdwP2E3BLG71zRyd1NoCFP4
Message-ID: <CANiq72nhhji-cz2T2Cg9y5AwUwcc9q1Hd=-6J=6TafaxcHZHeA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] rust: leds: add led classdev abstractions
To: Markus Probst <markus.probst@posteo.de>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 7:09=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> No there is no MAINTAINERS entry for it, therefore it will covered by
> the "RUST" entry in the file. I have added the led maintainers and the
> "linux-leds" mailing list to every patch sent regarding the led
> bindings and none of the maintainers have commented on it so far.

The global "RUST" entry is generally meant for core abstractions and
infrastructure. The best way forward is to get the C side maintainers
involved, since they are the experts on the subsystem.

Depending on what they want to do (e.g. they may want to maintain the
Rust side themselves, or they may be looking for a co-maintainer, or
they may not want Rust code for the time being, or they may prefer to
leave this to another entry, etc.), we can see what to do.

The first version was posted, I think, earlier this month (please
correct me if I am wrong), so let's give them one kernel cycle at
least to think about it.

Of course, it also depends on what you want to do. For instance, would
you be willing to maintain this code if the maintainers want to have a
"LED SUBSYSTEM [RUST]" subentry?

Thanks!

Cheers,
Miguel
