Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6697130EF82
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952653; cv=pass; b=fr5QfnOvkMmsidkIFilGq7FI9Vir41Z2AlC3iwPjcTnl4ZXyaiAq+sEH+Zx45yn59UzavrLR1SjMOI/4rdRE9ZJi/sPCnAZVXJyoQrHO0CxnKH0n8SEBk+ZY+ankLgxCvwRFwkrvGJI3yQJAGTKnxSUUPEJXT59q0KHWuj2c79M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952653; c=relaxed/simple;
	bh=CPhiTWTBujSlqTPCMuWqa0R9rRxBfdH+7ETOkTgDBak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG2q6WlREJ1PYZ/s1/ccZhk+uMXWtgTM9dmCXY7CqYh7NgTs+OSU0P8peXR/6dJQimoziIWW6nYnbDKZW8blyUbWHAfdYDKRUIO9EWb49Tu0wBPooBN2KGvoJ8+bMFdMq9dgHjvEPuPrZfOVkUpCLIo2KfaaoftuKXZcM2AcaOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6S3c4V6; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6S3c4V6"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd801b40dbso67946eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 13:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773952651; cv=none;
        d=google.com; s=arc-20240605;
        b=iqplQ78ICv9qFLlzUyMND0L1O2XPbEzn6jJNNjgL5Dd4mvuDGWc6Nlgg36V7IDAxDD
         Ym8wo2YxAq/avtrykSSP+ed3INgtXppmTH8pDRjJlegJO/EOkGXj4jEoVuFMzJK6eM0w
         1iQgHrBaFhL6iycQXhQhK9noNZTy2iERWFOdmyWDzEKK0PBa+XhjMCLdIsI1BC5uEW4o
         MbN/wBJMFynq5WSgHkQu2hi+oYv8JzhEi8fQ0QTlaDmxmdyQqY3g7GE3BNFXKHDEig4A
         GtooyTBHYvHNIseKaQSAD49HsU+axBhaaSI9P/e/eTzEiiA6XJIymJ6Ol8Bq4qWxnxQl
         021A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PG6TOeTlBYopJNbZYyJpmVT0/rfT4F5f7g2trnXU4aI=;
        fh=YJjhivQ50EQKCio4suGrmqRVUw2f0sO5njZ4rLqiLCM=;
        b=eKIrK67q3srFIkYqqcH0pzToY9Mka7mwYDINM97i1nQsMVqjAchpqSQ5xZoTwnRSv3
         kf/RtZYoGNasgEWtH7po3zz2qo+pI0egQvwmEp23k1j/V46VOolvT/kH8u2ycqXdL3D5
         dt14pN/bHDb4rKAuauudVe9p3kMaUMpzMoyMWebQOMgFSZICUjuLDjJlwLClZXR6je+s
         ZcXoYZzuAdEzuv1we6RvyD/9Eku5wko60LC46NS7MAeu0HZzojSfncu+e7rdZzRTG1VC
         FBTsR+mCmIPWr+eQrI7KdXLG7QEW6gAg4L2bpLdNocYO+orvG6dBZUz8VZpPuf9tS9Aa
         aNew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773952651; x=1774557451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PG6TOeTlBYopJNbZYyJpmVT0/rfT4F5f7g2trnXU4aI=;
        b=V6S3c4V6grGjlPkHEpjMHimbjm9+IhrbX8Xv9qnaK+QfcUhaWsdwreYy71w79VsvMZ
         hUqBaOj9NwqF6VUp06m47WXUowA2w3m0jQw5c2aoYMOg2XMGxoJxQUjqcWXqh4+iSp8Q
         X3efrQkHaNiNA0LLVmmddC4/GCbdDV6BKOsm1XETjOIIoCjnHreMIoke2NCTry+ojC/m
         6z+wD3pBbDNf9C+5s0xNQqI8w5vHkRbRjijgqwkGM1pDxx7WET4CQHbjrHtJ+WbFwma7
         gmSJsmK0zkYGeCWPEncHUKnbQOzdsnK+2u6qEJSPtZzSWZbKM+oLAwC7LnunCkX82Vmf
         RI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952651; x=1774557451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PG6TOeTlBYopJNbZYyJpmVT0/rfT4F5f7g2trnXU4aI=;
        b=AjcPIqi32IGw2vA6VXy8L0ZmA/kxaa+ydTCvevEr/yIV+bLhBquhx+DS0hpJs1Oc6E
         g25sJTPay97qDSaQPX5D5eLTaeXWxJep4bgcTr8DhNExORSR6pe6IWVx1IS0Co8Isg6M
         gSChhwMGyEucj0hla1uDYLmPBtboPdt/41kB9l3SgyYUc8XpBSWRGiZ+u1obnlw4Zg83
         OI7gjTUPxFW1J9gu3ifetnsS0wOiPm15Vkb/sqd69slOVHtv0XGGkmiI/4OEHTrz1LNx
         hAoFTaY/rtDZNhhmKGe9UfGXaD2VrqCgkPaykKndSt6glMTaZka2zzGn8HHxkFMn95ss
         c5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6+DB0QhUzuzXhkZOYKJ+OXr+rLIflNnkBo6zPSZ0mxBjq3q2mHs7JfYaazGLmLFea3S98t09Gm0ItpWHyug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWs6xd8oHyJ+3f6enCFBRzClwz8A4OPdDzNJlz3OZIeb8A2Ezp
	B4y8WYFNn81s+YjEXdjt0GdP79lFozd7dCzTsbZ/ilb2zorqr37lzya4ql9lJX/ggyNE1bCPIo6
	p946JngOvi0SbFc9rz/8PFiYUCLMMxa4=
X-Gm-Gg: ATEYQzwkefKhPxWeR9PhesSa4E00zYaEIZv7F98vARzHzp0EGmlxmwIkrCFRsh3Ge0L
	7IkOQI1/CRSHLElMIL1wWEX2cM+kI/rg9RlUCT+/Xpq3cVcFozg9mTbdl2nr8xCRkRYZ6bm9ZgQ
	/zIAkzXqge0hav6OipAYSKi3mgKkG5E4XcF0gHDdhPLsEo6m3FrrvMHxNCakkGf4SNY+c3McHmZ
	8hU/+PPj/7U3PGr8D7UJMHl/ESmElm3ZnPx6KiDtYIgTjYG4NnhTZSInjHIUMf//O0U0AOjUA8E
	yRsYSdBfIWJ5dI5lXL/Jm7Zxq789ouvv/8hF7k53A6Q6reCeYiQ66b8eTYGiRC9MP8BIy4IiuUw
	wnPSrq+fi8S2poC78K3xIfMc=
X-Received: by 2002:a05:7300:f195:b0:2c0:c961:4b98 with SMTP id
 5a478bee46e88-2c1098bc5dbmr179708eec.7.1773952651428; Thu, 19 Mar 2026
 13:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net> <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net>
In-Reply-To: <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Mar 2026 21:37:19 +0100
X-Gm-Features: AaiRm53aYTZYVqlOaDrgZzFQV_MQE0hGpsZgGOA7E3ahUoW4EZWbp0QSXJaW4mc
Message-ID: <CANiq72kFkcukzLjLKEJhaQqpdFJKcymnvi4qS+Higsx3_8y6JA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 8:09=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I don't know if there's an established practice on renaming CONFIG option=
s when
> this sort thing happens though.

Generally, we try to keep users' configs working.

In the past, it was quite painful / pitfall-y to do so, so to make it
easier, the `transitional` keyword was added recently -- a couple
references:

    Documentation/kbuild/kconfig-language.rst

    f9afce4f32e9 ("kconfig: Add transitional symbol attribute for
migration support")

I hope that helps!

Cheers,
Miguel
