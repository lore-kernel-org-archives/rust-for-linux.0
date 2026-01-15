Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2B39449C
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483195; cv=pass; b=YeKDqj9/fuCNXri5JqRteLGaBVn/dbomUxJqoT1cuqHAMyLrsWhWegYbSQH1oOpKrGV04sE3ZerZr/1fhJdoBFcL4R89GPP4ItUi9WOc4+Qj/dq77qaVovQQuHhj4JvzLT4bEl2G6Bu/eGrAS3dHXMXRwVs67dSRuPTRn0cyONc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483195; c=relaxed/simple;
	bh=Pp6ZcF3f4DjMf7Y7AIOuE8L8MAG5Qu4CaK5S73TTG5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfb3rZacaBxnh4qswmC2eDt7BKO6Uf7lWTf6BiHJ9SkxssaVFgxrvzDqRDNz7JejO02fhXNBzFHC6S+mef1YJ3Rb/T+1Yv2zMyEh7u+TK5El8f4RIY7lTdIzXH3peV1ReknCdRncIIXXdOOjKhZHMxJVVtj5UsFnhNI9r+YvMiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jlg9aAQx; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jlg9aAQx"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b1769fda0eso111100eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 05:19:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768483193; cv=none;
        d=google.com; s=arc-20240605;
        b=KrR6wb8OAd/la2ZO/XkKx2ZLDqlA7lJtiJZ4c/FSkmgdXHX2VHu6oZrWhgdGgENaLA
         yAejFD43l3e068a75JCmG16Rl/tScMYi4fXBtTa2b7/2ROJ7ocU/iJF+p759TSIsFjjM
         nDlRqKYX0zmAwf/mLQ94N8ptw8uruRnkR90PIATtwDE9ZSvnT1OG0OuKUYA04bdW4pO2
         842h0bMPrzVGISyCt8TFIXhapdWOqv4/+JI6BWA2ry0048emjNpVRYfHrWcsq/7llkl4
         0RMRJhQIuHQNRJ24PO1JyJvrwVfRFB8pR+Kg6wfNAU66b32PGo8iyDfKdHMbgSDDCs5m
         1RsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UxZizmj/jGyfA1kfXYVDkZ1yF+Sqqz3fEnN7Im7eVZY=;
        fh=GgyL+UqkXKKdJNIb7oFBGWrDjsLvgP8hOj5JaguElhA=;
        b=KVNobNG5dcmaCqCrEPdwRgW5EV1X9KrcNC/fBnRe0iX3NG1e1ku+F5giH+hUf9uFJ2
         bSZn0g1kRAQjBTJUdltSccNns8/cVolpYyKvL4OTJt8QJyh0C/kF7uGHOFARGxQU4JqN
         YquXtXDHF8Ihv8f3kpj/OakLZBgL94qbuAc8zTBSdISyubpR1JRlPWwespaI3ON5k6Yi
         hSAzIgbh5QlPa6fXPuoGmsHHSCmubLqBM9l4xC0TwPNdnuFCZs6frBRtyTBn/NkfA2hD
         hgVk9N5CoAAk9V9wUtfz2Hlhe+yuptJw5Zc5MEe37/S3BfMjTdeDFuqdFZModLUQhd3T
         Uflg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768483193; x=1769087993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxZizmj/jGyfA1kfXYVDkZ1yF+Sqqz3fEnN7Im7eVZY=;
        b=Jlg9aAQxhFemeqm93aN56qS1pAtzoLvWMUgcRqQdTXGlbDqUuWKPKWyNvYKfnDttip
         6x8bIL5ozETvsrVJ2LUqn0ktFrU6XBJg524toO/kHd/u4Qje2oW5GJZnKPTePx4oTcd8
         IoXnn/StlKUmOXMK+xSJXFSMoyAtyT1CpE1LG7E+HWmbsTK4QRATef9XcK4L8iNv0iqI
         AtMrP+wD3CCg+wqSKe1fSaDFUu1qi0IGhPRHpk/0Sp2cx45uHKgmAc9UOYA4RND27O7l
         cYS3DDkUZqOeK39GFaWiQRpEZ6f93jKezg/n+GNLOREbm8tBOKjir+4QH9kUHKADTr2Q
         YAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483193; x=1769087993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxZizmj/jGyfA1kfXYVDkZ1yF+Sqqz3fEnN7Im7eVZY=;
        b=NBfn6jdOBPveguPA/fLEypXrTU+VZeFluV8uc35MxwFD+5zctmt93TEIKQJpFCy06y
         srEIV5UnRiLwaPv3k0DDBZOK8wlVsSsLs+YG8ykps2IVpp9x2DApQaw8IUBM6D9jjG1g
         Pnj9Fk04abZK/ECZY4piFn3pEI1oZd3iGrPdnRMx4sI3thXnW2xzY9LQt8I+rmAK3wy6
         2Vo0cKEbzrY3M0LHkEfU4+2kPOCzVVHhD9oDtcl+HkU+cinO3Bt/SLNKcMg4vR+bKz0K
         BwDYlFQ48N221eBy0feiFxCr9mbQqJAsCcF0rY0NGnFS14oWvvYIYpqwq7HUDKLWD6zC
         COxA==
X-Forwarded-Encrypted: i=1; AJvYcCWbuALGaq0Ot100co08L1ygqLG/4VL+nEwY43QYqiF4BG0cJXd8P6RXZ1ylOH90cKjnDbnkvjtbngihvoTbVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlffl0s6vtOhKuYxuVgB/LKDseSZF1OXnvlZm4lSLXzmTC2QDX
	eK/iauP+1urkmEea5Mf9mpbg0UWI6k2YId7IsmaRCXBXkOc344De9gfQcABcNzY+IWmlPsRnKK/
	Y/kI4FEMZdB/D4PYa/78b06eAyXDekOk=
X-Gm-Gg: AY/fxX439/Tiul+IP5q4yguizLflfZVuF0zylef/Q2Ucc7WFYrT1CWluETfjtA330ZJ
	PEb65xk95TqdO8Vc2T6/IhPTNK3OrYFa+TBzGpQtCdwGuQ9zhN6ZHzzkYaeZGfLZ0RwLdGGbpmT
	gp1O4lTyDvZqBCTAxr12oUhOBYQdwLnNddaSmjJD8a0XH9kTi5Fjv1p71fhsvfJxrovxFWjXU7z
	rIDQdbzHVonI4XfaMzsjXvR+dkHY3jg2CpP4JqS7/xML6A5lFWNSndH6720qBtly1tI2rZv6dr4
	KWutVu1cHZiRh1I6FS+srO04iuQHZzRUkie47XszxWM6ea82Umu5dYr8Rolb9jp5jIGyEHtlZGG
	Di81I188GsBij
X-Received: by 2002:a05:7300:80c7:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2b486c856f7mr5044880eec.2.1768483192800; Thu, 15 Jan 2026
 05:19:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
In-Reply-To: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Jan 2026 14:19:40 +0100
X-Gm-Features: AZwV_QhZPQknrtXwnBE-VmvcifbilrglnccDaxYAjYXmEjsqJZGxlA4yhKFjB1I
Message-ID: <CANiq72=KiKB-g-D5pvV02XrfQM7U=sSB4PtSpGDsO7HhGdatww@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts: generate_rust_analyzer: match rust/Makefile
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 5:39=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Minor fixes in this series. The main one is fixing navigation in
> pin_init_internal.
>
> This is my first series using tamird@kernel.org; please excude any
> hiccups.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Applied to `rust-fixes` (with Fixes and Cc stable) -- thanks everyone!

    [ Tamir elaborates:

      "before this series, go-to-symbol from pin_init_internal to e.g.
       proc_macro::TokenStream doesn't work."

         - Miguel ]

Cheers,
Miguel
