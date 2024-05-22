Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1FD824AC
	for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716381454; cv=none; b=pbOIzYWsNVVd6ZHw5r3Nk248Vygs88mkrJN4FtydSxwAkIHYMgvF4v3E7GRpmWyoU4MKir6MCCqqWs8XwIAnrQyNS2ldVkif1/bUvDccCa88oZC+3PyY9Vli7/LH/7dw6GIt6e+qT3OEwCMgODY+aY9Rwd3A8c4WUaVZHDWfFog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716381454; c=relaxed/simple;
	bh=EMnIYHaY7LLVlAqbN0Em3LajT8YCdusKQh/jH5I8FNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWVEwU/zqvfkizGTg7NcjT4Xto3v1gC1xcfWUrwxMfl+29Mv/K6fx0M19sSLyIaeyXr6QGM5FafhNHRePovA++JVaWzHQTrPk/i7e6Dc8gQWKpEknbant3oNNhyZZUdV9W4MbX4uZtxxEyxN8F1JS9EAuGsXOZU/BpvW8gScon8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kULq4VoT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kULq4VoT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-354dfe54738so335118f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716381451; x=1716986251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P25DPsLo0fuN2OKJTl/EGAh8Y3s1DSkqFIXVqeeCVVc=;
        b=kULq4VoToY2Vat7vm8GGjVA6foF0Uvp7NuZJAGIy/qwIu6TJdSrH8/rXgvsTlUUGtN
         E28mvwzI/Q4zWKdxGVhmPx7unW09xyPwoGQckbRGHR1TEzP2X3iODzruBUrlqnpnpTeF
         Zhwg1DGEKgJEGubaDnwoaGZByR8PTj8eA9ok4xPDLEFwl4pni8WOlxt+45TYFbUlP/1m
         jmau5/scArzcXYJECl+5QBuBvDq+zc8AfZ2gCc2gkDImjpPAT+Dxy8BeHyiziP7M3heA
         gSfi52+83PyN8AScEFHvFGd2wC5lqXkRUi9LeaWprrXKojuLjyVVWeMGd+/Vd4hZ+nGW
         LKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716381451; x=1716986251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P25DPsLo0fuN2OKJTl/EGAh8Y3s1DSkqFIXVqeeCVVc=;
        b=IMt2MMxZNe0SagqUWmNXpD31To59dDlZUE7l3NcYOaMNiE/mQE3DKIT9Uj2yZPwgrE
         f14mKVPxdVEo8meIrn0anKcA7VQy6jPw+qhb6tKTbweKLI5ZTnC0F8yHqdl2Csp1Pdym
         tF0/FN5J4WLUc0CpuByrMTMQL3GTC1tPZU7yzVtWwGVKakqCW2AjBXZBmQw8LBdYTtwM
         9Y+IQIPP0N7GGSLawiFOpUfV8pcjqyHoUEYMhexUjA1ig045Ns52CmntfzDg82fnBLXw
         ukshyHwjhmRQ5QXU044WmEkdxDa5DXCb4+CsWRIg0MPLdNzKU5KoKQfvLQn9rU9EXpwz
         WF4w==
X-Forwarded-Encrypted: i=1; AJvYcCUN2RmmNTgPOXEX5aWp8sWMWLTsFXHMpN956xWseoMnWRuQ2DFZI4kNDgmyJxADu0p9SMhpp21vcM/UgrnBTxXXXczTtqc77DenkwELbSE=
X-Gm-Message-State: AOJu0Yw4O1CqF7L0PKz/Te6AHdLWQaWce/0AMOvvug8OfGehaBakw3Z4
	WFKOBqaWqlT+4YYJeGIkOLOdrDJ0EWnZ96DuaNS/wfuaN564x3jJ4/mgHr/dIp29OU4pSs82O1U
	EzOGwCuzbytfSlV+Hziig88hPb0Y1J/K46+Ir
X-Google-Smtp-Source: AGHT+IHqXaamjnUmjvBxFPNiRV+xFMiG4l6hh3Y9Gjymq+7Usr/czLNVkJc84E+5l0e/SJVREuKfW8ugea4XTlNrNck=
X-Received: by 2002:a5d:4104:0:b0:354:f2a7:97dc with SMTP id
 ffacd0b85a97d-354f2a79916mr422094f8f.2.1716381451014; Wed, 22 May 2024
 05:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ME0P282MB48901A79E405F9CF615FF2F1CCEB2@ME0P282MB4890.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <ME0P282MB48901A79E405F9CF615FF2F1CCEB2@ME0P282MB4890.AUSP282.PROD.OUTLOOK.COM>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 May 2024 14:37:19 +0200
Message-ID: <CAH5fLgiL7EdnzRL79x4zX0pXrtb8OjVkRib+qkoi=TyzHzEc4A@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: make impl_has_work compatible with more
 complex generics
To: mu001999 <mu001999@outlook.com>
Cc: ojeda@kernel.org, boqun.feng@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 2:27=E2=80=AFPM mu001999 <mu001999@outlook.com> wro=
te:
>
> Signed-off-by: mu001999 <mu001999@outlook.com>

Please provide a more complete commit description. What user motivates
this change?

>  impl_has_work! {
> -    impl<T> HasWork<Self> for ClosureWork<T> { self.work }
> +    impl{T} HasWork<Self> for ClosureWork<T> { self.work }
>  }

I ended up doing something similar for the generics in some of the
linked list patches. Does anyone know if it's possible to support this
without giving up the <T> syntax?

Alice
