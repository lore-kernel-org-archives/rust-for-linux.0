Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D1183CC1
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525470; cv=none; b=B5SB8syxvJf7fY3IwdduRxWYMSyfWGZhrqLIuiZbsFHWPhyOclz4PbAI600a323zn2yHONZ3PAoqD2tCko/OcyORH9MctsrSQAAcwmMg3KrGaIhYAF3Mr3Z4J0g0Eqye8c3VQEWpdhOygxUNwmM9XF4Vi4E9odK3WNDrNVjZjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525470; c=relaxed/simple;
	bh=0/xx/Ra6XGJFUtY450U7GZA/GQm8HMYQVcfHUwCFJpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALJvxyONwpfWHdjZ+cy5aL24aPWIH3sIKcP0PopVSb4qqnmjSgjf+jcgzPgE/cHAltvfRXYslcg18G/EsVZPEHlb9dnIHy9f7asWwduv+Y+Tbd7/AwH4JGTaZ7I/Ho/zGgjGp9IWE1gpH5r6cX+rEa/2bRVERmCbzoZ0GWkLZ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zKLQwEAL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zKLQwEAL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3823cae4be1so2572484f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732525467; x=1733130267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/xx/Ra6XGJFUtY450U7GZA/GQm8HMYQVcfHUwCFJpE=;
        b=zKLQwEALttaFTfRaiL6EUm+P+zZ4DxJ74g5eSRewnhWZrLe4Thk0ZgOBnYc0HxQ+4s
         BT6uHBCzKu0sciBVGP5gLc33AlSNVwGirfzTfGYwNIMupMFLpwa/zj0+DKhpWX3KAvpn
         Y/CUOcegVy5tdBI2tXQ3hg3AfEsEZpFRAdql+iIi8F4MPjYk45u13+vbbHYQG1IsYxAw
         eSBZuGiIEe1q9W0X6dia7D/+bM/kJ87gf/x2VNAwdRI/LK1VKgQhrGm144tJa52ij4Sn
         VNLtbPbOzsflgcxjsPi5dUmK/pJGtmxWTGKsonSIEdDErHZwoqqEqemgLa2yD/Kcow47
         /KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525467; x=1733130267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/xx/Ra6XGJFUtY450U7GZA/GQm8HMYQVcfHUwCFJpE=;
        b=c7D0V2/K0KRYcABBGdnJ/v6nlx7yjR5GqBTyef+rFzh2Q7SsHAeweSsIxHC5Ua/hAC
         XlOfhJ7I6eu2StN3BxXO8sIV0dgi9GfZs8EA8KPoIOxm/FXF96JMvGOnJcceCOoCeH9W
         3M7qbvXjzI56PWImkcqDtx/l8OOG6b16iMuWqZZ9VjiPtDQpDJUCvkjHOdKzeUTtsCAl
         lFjJD54G0n/fOKENJPEBC/gLPLLiq8CrpkOP25Ecu3ZNQ/e8zokVYMfUcIwQraHTpGgu
         2Rtno/7JSnlQGqQzu10PIRHiaWljBi4at5K0NQBxhN3IcxMyWKkdFUYOIPWm+VlysjRI
         VXeA==
X-Forwarded-Encrypted: i=1; AJvYcCWgKZdoR1C/hmg/Ld9FaNSnpRUx5XoKwJoCErSOr6+H6LDKpqDsYnEyr4AWfEYhGCfv/6PgVLDQwyn5RidFHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDODtbB8kjONZ+qJLDVmpviUFDx55hyfeg/4VQyUQGOnx1J2vu
	v8xzhzj2vc7S6w1Xop4H3LvJuIZfoF3xRHyto1LY/9aGoGlS3jL6PxW+p8QtZGFn/ENoWSrHPJO
	IBM6d50suNj9JMjtfaIuMqoxn9CtwDOOqt6tx
X-Gm-Gg: ASbGncseiiIRygupzfZ0Jhec2YAeBUOCZD3ikwaMmDT/rbiLzBqwj53RGE7CqQU60CZ
	pIiOP4FRJS0BM/iTJYuyma5lcuiMCiYh7l1sJxnB4hk5tkisdlXsQvvk4MKpeVw==
X-Google-Smtp-Source: AGHT+IG+Mf1mJCWWUi5pmwxMqZ4MgVpkQc0Bc7b9kUgio3+7e1wG4aBz5o3KeOo50mKKBPXt//P/6GXvoMq/WzS7Cmw=
X-Received: by 2002:a05:6000:154c:b0:382:420e:5cc0 with SMTP id
 ffacd0b85a97d-38260b81b94mr8657304f8f.30.1732525466613; Mon, 25 Nov 2024
 01:04:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123095033.41240-1-daniel@sedlak.dev> <20241123095033.41240-2-daniel@sedlak.dev>
In-Reply-To: <20241123095033.41240-2-daniel@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:04:14 +0100
Message-ID: <CAH5fLghTBh+=tXiTTvSmmmpQ0AOsnwjK0pdCCqEvMp3CTWxpGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: kernel: init: replace unwraps with the
 question mark operators
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 10:50=E2=80=AFAM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
> Use `?` operator in the doctest. Since it is in the examples,
> using unwraps can convey a wrong impression that unwrapping is
> safe behavior, thus this patch removes this unwrapping.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYjXk=
qQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
