Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5406719DFA2
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763902273; cv=none; b=ln0RkUmeR+TddsRGwyYux+Kli6RewWctPuNhk5MAaSmlumRxiUhtU4wBEvP5CfUZ+3arKBpvanMxHaqlln1kURZpx2qPLo1WueDGlYtp/hEf4r01VrTB8KRN6t0hr/O6236LqD6YP4fT7iA00774039WXrTHdtxuM4T0Pf0wrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763902273; c=relaxed/simple;
	bh=hh3f/KSBNY/MI9DUyZk2g+MRS3pxrt5gBaQH02mgQPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uyt7ZPDikfz/SjS4kH+VSY5XAyhWwnXq2r8g27QZ9XOUd+xZG3AuFe8OoqYh/dU4V+RUo+NAe5wf2fP4keLmvGyoMaf0+gV1YTaPnnieg9XhrQRt1W+oYcNmrnPlSym+2H1dpEVcIkTkTdQuhIVxnK9fg3OTZa4ubJS49CEduAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daJsGNOW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daJsGNOW"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b8b33cdf470so89519a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 04:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763902269; x=1764507069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh3f/KSBNY/MI9DUyZk2g+MRS3pxrt5gBaQH02mgQPg=;
        b=daJsGNOWavMyoIti9jpAg9octrSbHnIio8x7CHfCCHiBuSHqxiRvzfz0nCRp3bo6Sc
         xOs0Nhfj4Tnz189h4pNGu4YspCMlsc6Xpl9aUVhW1Q5+Z7RfqbKrcQpTi9RAIeKfs1iT
         sTWi8gkHVtythSohdNpPo5QUlvMqFMFnZzevbakfwLJyYvUOJwVT+ETDiw4jVQuWpmDd
         kb9vyOb4yJyLzcpn8Gp7K/sVrHJ7RMgnnz/oTW5Hr3NVRSg+xFMHFBEkeEfFUYSIlLYe
         1Wag9Q2IOv15pOab3oV25TjTJ2bk2TTADIf1A4XB3w9oOx2VcDTd+3+IUX6rq7R3ZhFX
         /WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763902269; x=1764507069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hh3f/KSBNY/MI9DUyZk2g+MRS3pxrt5gBaQH02mgQPg=;
        b=aJo/9JQFHgvpc1yQa9uMroC56yzWhSSvcVgyiRZfM6xZSyTk9ors+J8a+1hrsDWv14
         /AO1ALSGre6krC4Uqj5leyZMqWlpJxWBuVSxWYycITC6Njunl9nIGvED9xUaonTCtm6e
         tEp0sJuA9Lu3MCbc9/NDJyltYoPe7G28J0RDqKP63QtwfnZc8ySRGiFt3MbCRGkZ6K5+
         Pi4B9WQEF/RDF6KycusvE+w0Ggi3ILQfOhNacooRD53mUXEWlzOK2PMC2E2lEYrYBuzq
         hS9vBd5YfG1NUwGO+pFO1VEcxln/3uF8xh0cZVP4nORXSZasopEd45NXPuX7xDNBAKnb
         t24w==
X-Forwarded-Encrypted: i=1; AJvYcCVjXA/rE9EBrV+ZXXG53Lx+1gC1N1iIrO63r3ipynNHpNr5saqyu+OgIcyycSJ//BQNgvahDCCDMJKr5S+WGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAO8QjzPs6KbiAoC+hxXiSiEU5JrSxZXsX5zOzyfmUbHmCMn17
	LyqraIbb8pE7Eq1p4sAEYJXSrsbp/rzx8z92OxPOS/5k7TXVv1mFlUqxvLztcmhV8yu8bYMXnA2
	tjSzt9QhnGjJEmvAq9CprFjNR1WWp8NZA4WPh
X-Gm-Gg: ASbGncuXxYkxXo9y4X4bjTkVPfyqRCgxNU7q4V/HeMQgtWXGSMRlx4rsYdS0/CZZlQj
	052uM1Ug6Cbr1McsemioCqEhvCazZbJvlhvEanMc8cF8Pa1I52TP0tyQkOUcwUHNnPgAlgM2eVd
	BCGqpULOSYycvQht47tlHW6XATz9CU6r2UpH1lJMox9A5tYgUerErShdFacYP3AaIXxeLIsV0iC
	lcWhvcnIYkhGyNIwWc3+/rC92Sp/shtHnc8Nz7qPBfRVgxgVO3tXZtU5PpKWgmcQ4hMnYIi7j6y
	1zyXV+G62XH4OjWTUK1Cnfr93ARAoJj4CbbbxXJ07odY6dUi6aIOPmsifU3t1kif+UTm1qJA2tt
	lcKvhffR6qchJ5Q==
X-Google-Smtp-Source: AGHT+IFzGpHkwEeZtyBB1sA8C0zv73zZE61XXExuoWlx0JAyvU8o9HZNqUld4AqnEj4edoaKWnUZ2M8aAmsP3pGEL+M=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr4369303eec.2.1763902269389; Sun, 23 Nov 2025
 04:51:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121043750.298843-1-y.j3ms.n@gmail.com> <20251121053633.1594703-1-ojeda@kernel.org>
 <CA+tqQ4LX2ihwY11VJk3LNNE-STsONJWF0rdDa0Pq09oA7YRXEw@mail.gmail.com>
In-Reply-To: <CA+tqQ4LX2ihwY11VJk3LNNE-STsONJWF0rdDa0Pq09oA7YRXEw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Nov 2025 13:50:57 +0100
X-Gm-Features: AWmQ_bnvRqwTLU4C-A_sFwJUrt_-BRRzQMSF1pa9UGMsSEMrNHTXTBWcIgdzbNE
Message-ID: <CANiq72=Yo6-yLzQ6f047vXk1e-mm8=EH5t3dZRpLaZN1iuRNMg@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu, patches@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 10:08=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> Now everything compiles. Thanks!

Great and thanks for testing! Do you mind if I add a:

Tested-by: Jesung Yang <y.j3ms.n@gmail.com>

?

> By the way, I needed to make a small change to
> `generate_rust_analyzer.py` for rust-analyzer to correctly reference
> symbols from the vendored crates:
>
> This might already be covered somewhere else, but I'm bringing it up
> just in case.

Definitely, it should be included.

Cheers,
Miguel
