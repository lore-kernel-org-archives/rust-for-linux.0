Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40941D635
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786806039; cv=pass; b=rS2s3RR9gikAdj0vRC0svJLRdd53kpELSywkqdH4SdWTr1CmUPrqK8Hejyp3/Ak8+h2wBd5efaEUEn4U/AAkbZgsv0KQkutEwS2lR7ynR4ahzeaXHb0gfN0WFReRjISluG5uY8Lb3dvf2ZjNwCvRy9Tq8j4s5RViorVV1Gm7FtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786806039; c=relaxed/simple;
	bh=F80T8bGizUmF10YfgJvolA/hvtxH0CvhCxqiWGyLA8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIoQwmirgnNuxyB8d6SlWvAdba1Hctl8hCSpjIfGW6/aeZqL/ZwsOyJMjUUcoDY9GjYhDETFjzOvhlPSRPOx47Hj0cIiT7KHsagoKxtfnlSTUBzMKgh3BT3cvjmsGWaXLA/GD3AgB1UJRC98Y+5OmTGiWgspIkkmBxgW3ru2zks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHj90k1i; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHj90k1i"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-392af6bda98so187591a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 08:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786806037; cv=none;
        d=google.com; s=arc-20260327;
        b=KegDo7Ps7AR6ZJ3WF8DtFG5dEl4hyi3GxrnCFbiefsfrNRe+NFypwFoXBL1KkcTCnH
         X4FS3vo34PCGCXNZ0sNNcuudjsnRIyqZ+s3N0cEYkcCQd9V0HP+jOzeBXBt9jM8XdDyD
         /f8u/vX7rXlqPmqHNok2WhI7w6M59rSccOcX2MLEblmE5uVDSzNFmlCsrPXLPbjUg8tZ
         6DfgovSVzWaPPeTjo/G+uomjadArMzsLrJ42lPOZrQ48PUXvY3dVtSfgWoL79Cl2kp6E
         8Esc1CzPWj2GikaHsN8W93FAjZZZkZIxzpvKAIfptR8yvg1vb+Ci2zdThNd3uKC7xjJN
         JEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F80T8bGizUmF10YfgJvolA/hvtxH0CvhCxqiWGyLA8g=;
        fh=o9UZc0FLQ+sTYUA7PLQQXECr/mUJpMXkKmCibesrIHg=;
        b=jDvRwqOhoKVfau+nX/6CHI8OfFqX2f0UBNksSqAymru+i/eXnofbejqe00Xcfj5veJ
         xDnCBnwNoVANDeYiiQ+HdZxjoazz/u4a3bOukufmwRyPASuHkDDI5QyVx0OZDz2uN1Fm
         +YDYRWgZ8LQXL6tcj8e6yg/I9wtZn74HhyGAimdviGERawYkk9uuvk8w75PXyJ/rlgFJ
         0dvFfVOZgI+WASwewT0xCHQ8/HRzbskcbke3+ndJevY2gUha1XspP08WwNiDs1Ta98t2
         CCYyUVg6hUxKFmww1g5XK0NcYNEDOweBG+jnbGtCKCULtkjXGUPYGk8eufI14zhCG2Dh
         g2Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786806037; x=1787410837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F80T8bGizUmF10YfgJvolA/hvtxH0CvhCxqiWGyLA8g=;
        b=cHj90k1i3bCDtBM3N4F/mYj/KMSaqAOfO7Jnkh/0gOe8ND1QNz/tvWscEqnbn/c5ei
         Auj4krh1VmuUWPY3tGSw3wudjzfxV/L3ZQODBy0IGFlZmPms9C8vWKORVksMFzCTNA25
         fBMZpHDwdbs5otcqWMDgTPGy3ccE1AtOuZXY/tRZXNm+cqxMmYi4NJHKDrNgUNxZ0wI9
         eoyvt4xDYe8vubTFYq0Pxg0wKXtuujLnrwqUEs6/HrYOSACcrUlJfi+qkMGkw8VzCsQx
         Smak8HqrHmyRrUWJ9eVG3OR5QmTbj2rjfD59Ox4Ob+qMRBJWl092TWdvE82m8DOjPR4U
         jAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786806037; x=1787410837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F80T8bGizUmF10YfgJvolA/hvtxH0CvhCxqiWGyLA8g=;
        b=bB5z0UNYJ8sqNIXDcRq30Bvr47cWkjPjGKSya2nMHCNG3zzSumeGjN+NqjsLb+nK87
         ooZWpWhgJjsF0b9YvUIfxYyli4/8fumvglgdGsmVxAcK4RU+HHSFvQy9FzumG8Xe8AtT
         UDFRjSikwtQExbJDjwshnClQCR2Cjmkh0OUu/GdicCzVawkJ34IZXD2V3QMsRapwHBMT
         qLliRGlCQ44rkakVxBKT5jlG8rDsd2t9lZpZeL2giH0e3imwdIFGLgkK+Nz2Wrjwcxdy
         fMk4iXjzYtaXsc/uU1tYnq1rVRMZibPTCw7x0XuxxvVVbo8Ef+y3mdLHxjulu93ajGwg
         ucGg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Rl1wUyOKQCmH6hq96dVNqy0SQZk7DzMZ0wdanlDqkxpyP/BWP1eCW0B2V9KYP6q6H245MOeTelkzxHwufw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN7mUouQ7Cq2jYoMwDw9gt2ehcVMFIKRN+DnJtK9yyTBQswYk5
	R8CnHX9i5gh2I2qDXQ8rt6Fk8iTOBMRorJksu6Qd8FUQ+SL2BQ5gDXjAKTrFtfY7h+5IWeKrmpY
	wPawbjm62VNy9OFmR4e238TtA76nYkSs=
X-Gm-Gg: AR+sD12uVFF5mXtH7FWNx2SOEMm8bCQMhhRofaU/dRkW6ptwOEiII8HXAFHSk+CFg7H
	MY7prxo1O/BME76RUzKkuw8gHbXjiAQ9E1ZUGoLqKsCc31T8cJ06owqC/fBs3+Bwn3R/x6aZinh
	myhldEutL2Tgc81S5tcEWsWDM8NBxsq3DDvCx7zer7rYPGlLl7fPKLm8TJbElhbX6miM53A7g2E
	JoaaC0Nv5ces9ZoVklsoh8YgG7zVZoCTLGJ853iZdZ0TSABesvFjYKvTAHgyUV6Rx++wx+vM931
	36e1ebjZIqS3LJRk74+1gpQa5xMP2dMLLey+jL3knuzpnRmma82qayecaexgmtu6qoC0+L8SJK4
	9b3GPHUCes9AgBfHEwZ/xcLdho/eAx2tpix6YYa6d3b4DA3zNq6aVin8vEZFm
X-Received: by 2002:a17:90b:448c:b0:38e:55ec:e436 with SMTP id
 98e67ed59e1d1-3933b4f801dmr10089002a91.0.1786806036827; Sat, 15 Aug 2026
 08:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-fix-rust-bounded-from-bool-submit-v1-1-882227bf40ba@younes.io>
 <CANiq72kAkDeyqPKHHMT3gRNyC35R+934jNNQOKKytMpmwPwLCg@mail.gmail.com> <P-4v-PO--F-9@younes.io>
In-Reply-To: <P-4v-PO--F-9@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Aug 2026 17:00:23 +0200
X-Gm-Features: AcwNN1Wn7uixZildjRdjg8WS6aPMk0JG3Kwzib7LF04dEFlUG-lVVTMWQqy26Fk
Message-ID: <CANiq72mDbUzggU3uEK=DDQCxLr7Gzr3sFTCUUewt0XS_pJ-tdQ@mail.gmail.com>
Subject: Re: [PATCH] rust: num: reject bool conversion to signed one-bit Bounded
To: Younes Akhouayri <git@younes.io>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Rust For Linux <rust-for-linux@vger.kernel.org>, Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 4:56=E2=80=AFPM Younes Akhouayri <git@younes.io> wr=
ote:
>
> I tested this in a Linux Docker container with Rust 1.85.0 and two CPUs,
> alternating 50 builds of `rust/kernel.o` for the parent and v1.
>
> The difference was 1.16 ms (0.066%), similar to the identical-source
> control at 0.96 ms. So I could not measure a clear slowdown from the
> patch.

Great, thanks for testing that!

Cheers,
Miguel
