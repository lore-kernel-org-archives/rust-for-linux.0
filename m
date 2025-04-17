Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666FE1F63F9
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874302; cv=none; b=adrajD5b76Ttfk53qQQi+Xgn1zr+JIdwMLCnHjN8g3tIj9BsOEsjHknsRQCj47iScgOzjXUY2gy2HwmjGCWHhwsSm2m4ihvqgmNs0ULikFh4GSy8xolQTij0WSS7fUtnEytLb5xy4IvDjEseJwvTDx9WkuGuj+ezOkMdxXBIbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874302; c=relaxed/simple;
	bh=0DochLUCf3EDF7cSTVV6DMLXVEm5zzzHpzA9U27hY1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwF8Apud+v0hKAnDZZdkNPjiY6GkmW4AulLtkCc+P5leTdoTW8dH1/SPLBi+gCvS3P1hRMRkiwkQEkAsP3hjEeQNHP+pnu5M90idxbX0YIv05TqRRG0/mYsmuhdpgV57jmKDwmK3/r6wNkHl7TTvNyFyz///12CviqubvBtRRcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=O1wqDDsT; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="O1wqDDsT"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e694601f624so346605276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874298; x=1745479098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUQCFU9BiF8vetueo+nRCArBfTU3iwTIfqg8rvm4bK0=;
        b=O1wqDDsTxEG1ZtFZTpk40YN7uefJezQodg0PesQ+WyoFpXqEPQL/oHBSj7bbTKlhcW
         2ZMXZ0CGjDTNLwtTfYafvXBfQIlyCiI8cG/Lf/UVGsGcFL+WfMN6xOM/EgdSvgC9F08G
         H+33Gt8HwoXgASHQdOV4wStZ+vKLIx8FHPcEaI+JSlIEwv6LYlDJSawaNXuWBTJX3qtv
         wji2lOodfEg9fBULiJiLmjXbZrAUeSVbl6mirWXFi4rFO6+JEWILCAIKsLEe3r2PANvx
         E5yflPq0LxCMMPyZ/66w8vlazfky2zDu/wul8qQ3pgwmLUu8It/DRl4Sb+mWthJVfxa3
         1CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874298; x=1745479098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUQCFU9BiF8vetueo+nRCArBfTU3iwTIfqg8rvm4bK0=;
        b=asCaiOYeyaf1t6S43uiQXdF83a52dUvOXW+jDcjzpARRDdHodQA/IJDagRLbH1JUTt
         LqtrtUPgnqo2ecyfbCFiy0Zg8ggxPV/fspISIQFvCzXIFp/8b1PvcGS8MDvvHUtbKAk3
         UgmQ1UD84ZltbIcxF3UTCz6imn6Rvf7IU1Zw7eE2nKSPexOA9WQS4Jk5qiLnSHFnsN79
         CwTy+fZo2EeeiDXM8DQBRGjVCiJeTN/n96zUvycMPR9rrCvESuVCkiGgWIlQlo6Qhcfg
         ouOENciaB+/OWyQYyugVbDC0n9YvsWDxUa43wRgbyR1a0uqn4FAoAGvpU3Z5fpKZj38A
         d7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIeY+xEs4bn645KSTpP87otdBcQJbSPqRnalux/FiRskaUIShsaeJvkN4VeYCGi6OKdjC35oSIbdiM+Vv9HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynExJKRVe2WKhs1Qnaue3f/LoMUIDDtcuv7slVlN2Bd7gtjG9/
	VKI5XLMESRmHIoJGTzrD60A0KsGR4rDUa+t2K7PdSrPEGj/sU37FLzaJ5Fg75VoylHPatDpuwsN
	8jx1dcM57FL3snkaeXyXYJ8ZKF2H/QGvelVBxCg==
X-Gm-Gg: ASbGncudSJmZcCEEGYaG8v28yXV+ULlGlDYIB6IxYHqSrXGZWFsCn+KaWCvR/ujSvXE
	hTTVQRa0aIUKKmE1gqvYYmjoU+rEO2EslyOUFsrYhF/MMRI8Jx/k6m8quGBi5PrWAMdipJru2vw
	dySaatQ8tNpay63jVxmN6XFg==
X-Google-Smtp-Source: AGHT+IGaRFAKYv6R6SEVyGNxAv1QL/bCYgREU98ZKY9w9ker+ywwW2nKBVuxpvK4JbL0+FnvZaF13fw0p6r25aR8Gf0=
X-Received: by 2002:a05:6902:2b92:b0:e5d:c11c:3494 with SMTP id
 3f1490d57ef6-e7275f1774cmr5303370276.30.1744874298195; Thu, 17 Apr 2025
 00:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-9-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-9-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:18:06 -0500
X-Gm-Features: ATxdqUGFtOVoje6Xk484QFU_fNuQjZwpW6TyxCH4gHbPmHRWQgY9WnmaXXPUd8I
Message-ID: <CALNs47s_uj9gcvUUjnRVQtYF8mhYERHozhAhs0u_LdmiFr5QQw@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] scripts: generate_rust_analyzer.py: identify
 crates explicitly
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Use the return of `append_crate` to declare dependency on that crate.
> This allows multiple crates with the same display_name be defined, which
> we'll use to define host crates separately from target crates.
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 82 +++++++++++++++++++--------------=
------
>  1 file changed, 40 insertions(+), 42 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
