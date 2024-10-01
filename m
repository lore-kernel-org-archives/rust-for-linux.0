Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40601C0DC4
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782789; cv=none; b=JEoPVFNF19CoUAQQ228xjdsl6Vgtg4wMQxRRvTgVOK3UygN3L4PuKMIzG3byIOypNvnjpUgGWudn3EZe28fPc89mQcg6VnBEYte9m08AyrBl+lZ5iQdiGY2RgHMlvQDtNPICHJlCqZVJemYzecWK3DnSkhKv+Qr910v5TWyEnpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782789; c=relaxed/simple;
	bh=iv/JyJ2uWFb2Z7Z7uMY0jvzmnyHI2iVYs5qeNY90hlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3lymEu9s6NOSq6b7b3qmlLEt2YLwmzbTWiccKlWBc93s5sUyCK0weqVhzVjFU17MVrADfnIT1RUiza/2OYI1WqlExS/lkfZoN2XRZzOp+1QklCjtRSMRWgyfepoqMLg17zMWj7XJ+l0ptdIiTuyZy84MDyGUxCtvqzB4byC8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xRIuoiqS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xRIuoiqS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37cd0b5515fso2747452f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727782786; x=1728387586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv/JyJ2uWFb2Z7Z7uMY0jvzmnyHI2iVYs5qeNY90hlo=;
        b=xRIuoiqSVzrA5I0LCJluFJSQqTcu6Gony1Ig9bVkDiWg2qRR/FSn9kU4ZOat5zuLa6
         3gCNEJQd9ZQAKyxkoH4t1QrmVGPDYfeKbyhaaxkGzz1aycNWeV9BQioRYyuvUM1fxVQq
         zajVf1sVQ2QC3oSL8++F/0pkueZyf4mC7lEeGpCXzLG2euzGq2WGk6IqZMOq0MhPXWqy
         y3XXOADhMAh7xRANhAgAzaNGKUQ5/ZQiTy3qNOeldVmjur98nUkehMv4nKgbOisYE9xx
         Q7ZBX+IwoBLc1djjGTfQe990fxIUAXINvjUV3isBEaWtq4t1vm3vgvF4nP95icl6vIZY
         /ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782786; x=1728387586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv/JyJ2uWFb2Z7Z7uMY0jvzmnyHI2iVYs5qeNY90hlo=;
        b=XuwwihFBuxIZWwxE5yB5wCpQjRV9eJmfNuvDvqAZAkOm9ac5aE/CQqZuNEXOFP8qC2
         S4vK7/utr5ZuZJXm1uBKJS/4TP6EbiPCxrKuLgcnIJlgia/wEov3YBkenX3ZRPRjdY4w
         6CfjxJgAC4gajTfFTye/X33mJ48TThTA+O9d4cG8jyJXHnw2bespnuPywSn+9zhMzIKw
         Azusc2lFLBCupibhDwZpPAqlmjWS3lTvcWFYk2344scfnG3rACMz5oZszthShBEJrG5R
         40kNMpFGoR8Mp2MdXEhL351vccOdycF2C+vZ3EmprcP836c3leOByOBRXmbQc+lTEBNI
         QlnA==
X-Forwarded-Encrypted: i=1; AJvYcCWqujSOP22p/QsklkhMeyTll0ZHNWwLydsyeaJz6S7Z+k6GH9wyHQGJVgj7nWEvVulOxp8Xl5mBB7kJ44cjnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4syf6orVcBsVi8qBkWTRpiBei9zBYRlh3h8t+B9MAHpdksh6k
	eHC6BOfTLyvyX3QMnsxCuN7GlwsoWvBnIupIeywioBenYzhl8okY3yvjkvXCtuTyFiTmE7zcjiH
	/anUen03xMMKpNxDhppdTEphzK2rrttQAwnzP
X-Google-Smtp-Source: AGHT+IFUqvB+F9sWInLD7ZIcsIQSS4pcTgsJ8WhMnLcH1tiSzLtlulYAsCmWiw34B1gcTM9nNGxCcRlVnnwgX1xoXVE=
X-Received: by 2002:a5d:6846:0:b0:37c:cc8f:9620 with SMTP id
 ffacd0b85a97d-37cd5b282a5mr9432548f8f.55.1727782786047; Tue, 01 Oct 2024
 04:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001112512.4861-1-fujita.tomonori@gmail.com>
In-Reply-To: <20241001112512.4861-1-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 13:39:34 +0200
Message-ID: <CAH5fLgiCaAdHOd-7oqdg1e+Pk1M8Bk9o182x0gkjR-_msY3jVA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/2] add delay abstraction (sleep functions)
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 1:27=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add an abstraction for sleep functions in `include/linux/delay.h` for
> dealing with hardware delays. `delay.h` supports sleep and delay (busy
> wait). This adds support for sleep functions used by QT2025 PHY driver
> to sleep until a PHY becomes ready.
>
> The old rust branch has the delay abstraction which supports msleep()
> with a helper function which rounds a `Duration` up to the nearest
> milliseconds.
>
> This adds fsleep() support instead of msleep(). fsleep() can handle
> various lengths of delay by internally calling an appropriate sleep
> function including msleep().

Add time keeping maintainers to CC.
