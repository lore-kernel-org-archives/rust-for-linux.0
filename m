Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E539ACD
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jan 2024 21:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706737543; cv=none; b=Xae3nRfCIKHGCylerRckb1lQfqExk/HpDu/Lr7xdQgAM2G+6vHwRO9zoShV1hfHxuRf7/ge4kt4BXnPqdAMIF42z8Cgn+OYF8d9ceEWRmVZekD/jAW5KfTx3aMpeOmMI12o2DSpvzkIJMoi1nHxW4smAKWRspfcS0w10Gb2L1I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706737543; c=relaxed/simple;
	bh=MqYdbGGmYJ/TG7dOij6KwrLaPnSRe6KEms8E935jiYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7H2N2q0dmMEPC1a73G++J7lXUDB8k4P6uVyG72bahQaJKezZq9uyXsnS9V/3w+Aqali2SejKseqH/+p6mh3AsRaS7ar10lSLoUlYhSI70ZpF02gEBBcYoVnKWVT7MTenWjctLozMy1le81DVYMhwCBrn4p/I1W5howh9O87mLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=iYPqex+0; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="iYPqex+0"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-604123a7499so2746397b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jan 2024 13:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706737540; x=1707342340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqYdbGGmYJ/TG7dOij6KwrLaPnSRe6KEms8E935jiYo=;
        b=iYPqex+0UmZL3uWxVTtKyRzFL3qe/uVJkNiyBCzPa4N+U5kt3J1WYOUXQAMxw7LuKy
         2xBc7yhO5XNmlUYglCYL3EsPSrichqEqCfJVofVt73eR0lTggZRSvKj1MI6qrXaWlQAw
         /oOtTSiHxiuXkK1KkOSwIDKHEWePCEZZ3eIxeDx5XRlnSwMqEJ83/ubDCs1iHSmRh6ic
         w5X5aQu0u/WTV55j6LyqjNxN7qSIg5h0DqzVVke90ZEAe8yhicijv4ylOJMszOAOWXBk
         79RJSzmZlQsjvI8AYk5LO6aule9WkB+fJ2kMm3zlaJyL1PPMHSxDceqmpvOZolruijqI
         lpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706737540; x=1707342340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqYdbGGmYJ/TG7dOij6KwrLaPnSRe6KEms8E935jiYo=;
        b=RFxNvaHjseLiX8BIKeBrL5voGRSLBWXEzi4qkZ5LIvlyVyTglqvifECvMTUdhz1IiK
         V4xqrphPmeqKUibYr49VdS/UYU7imn1GWhalc9m4dZ9G6uQSGxnjeR/YnD9QcNA6H4LF
         l+BXGFsBmIedGg7+ju0+jFoW2h09K1KbRBT5/th4gpQmgB+NYTdwzQzJlp3xrjGa7Quk
         nnQBpnxyTqjMs9KbntI0/cf+dfe8BqVQLYQ29vm8Tw3jTDttRl6+6wTJDno6ys5A+37t
         sl50zqjRwA/UFBsFFgkX87QEeI21+dtwuuqU6xfGkzOPQbn+bHdTlnLy8Sqwf7J8x4RQ
         MMVw==
X-Gm-Message-State: AOJu0YyF3ZdG3HbEZuy104HXn9qZscLu8rH0Tfwasf110SPa100yVuBR
	THrtyb1Yep9uXVvxEOUmy9HlDcjFaBr7QV+K9UU4gzk5dsD6S3uqxo/J6akxYYhJZEZANysgfgS
	gGfLWxAVPYr3JrAfyhZ/FzsU4fPgOw0xPPWLK3Q==
X-Google-Smtp-Source: AGHT+IEeSoqGaEV2K7YR4U1cMnEbUZUOwrtGLVPajPIxKhYWweVq83gKpZgUuwZuna/wBZDMlGALXxu1jlOIUlw6pFw=
X-Received: by 2002:a05:690c:711:b0:5ff:9319:840e with SMTP id
 bs17-20020a05690c071100b005ff9319840emr2868836ywb.31.1706737540509; Wed, 31
 Jan 2024 13:45:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129145837.1419880-1-aliceryhl@google.com>
In-Reply-To: <20240129145837.1419880-1-aliceryhl@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 31 Jan 2024 16:45:29 -0500
Message-ID: <CALNs47vihohNCzDuB8d0G1Y3EF1HUipMrL186DtrMRu41Rrr0A@mail.gmail.com>
Subject: Re: [PATCH v1] rust: add reexports for macros
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 9:58=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Currently, all macros are reexported with #[macro_export] only, which
> means that to access `new_work!` from the workqueue, you need to import
> it from the path `kernel::new_work` instead of importing it from the
> workqueue module like all other items in the workqueue. By adding
> reexports of the macros, it becomes possible to import the macros from
> the correct modules.
>
> It's still possible to import the macros from the root, but I don't
> think we can do anything about that.
>
> There is no functional change. This is merely a code cleanliness
> improvement.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Reviewed-by: Trevor Gross <tmgross@umich.edu>
