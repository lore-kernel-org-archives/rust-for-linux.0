Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BEB1EDA0F
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 04:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748717; cv=pass; b=t8KXGJ0ZYFnkA1ySrp5sPLOySJHJnDs0KCqWZOWBaS1ISXCY3yYViO3S9k6W/xdkMm+xsjlqRiZ7lvbP8qoItn29KEtAL10DDP9LQI+R8vHy81P6ELb7uL/mq8EHM7+KKzIZSTr7vqXN/yFwE4g973xli0xpOR0zJ5WCheJShj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748717; c=relaxed/simple;
	bh=1u7bIRWp2Pd8qCUbSac5FjsS+jfGiGGCb/ASTQ189hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsriVJ36bloDEnxM6V+SLPT8L+hl8GS4cIFCdwM3TjWmK9i32pnuF80zTwmCpa3uIFyEKFedBlWVz4yITrDIALBs7Re0J5zpnIHnAprmJ6MMiMRD86C16HCvqwmyYd2vFJITycy4mJ8o9NlNf2t0X/wAaA1SFAnaxuA3LEnWdT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp+dceSg; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp+dceSg"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b70b21ce0aso6425eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 20:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748715; cv=none;
        d=google.com; s=arc-20240605;
        b=Etv+/B4vGaRbXuJbosSICdwp3X30R1Lcu76M4udg8OMh3UNtJXTEJaQup+jE8xM7ph
         s3eyWA3sPx3Za0nzL9Ddz6+lY2k6fPALL17ift+qJpuLC+jR0JOMVKsqhIyetbnOj1r4
         PF2mHxJNEyL1NcxeRsTwXFULuZZzVvOm5gjVmQGY+W0B5gSpAIe15Zc2RLAjdcpnpC++
         gCJI8mPkSWofYP9qrY0BW2bYAd75+56huQo0+CB+RyeFctKMb3oCP10cCKt1Mb1/AznM
         liEFfKsdE85I4cF/NueAqA9T/AjYDzyh/+3pL9494AMF8w4QmNa5OBJrGOsa0pJXFzoT
         jYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqjGaXvGxanS0d/vyrt8/Fubz63X60VirMxVGzKrpeI=;
        fh=DMdwqKwur/8kzMKOlvosd7PqCJv0PL9WRKUL7jcCIqA=;
        b=DSFiZsDlGDfSAJ9wNQ37CvKpKWruMqxV8nKjicYUX26BanRpObdQS0dOcJUR/QomzV
         05nx6/md5UcYJNCfTFB1EePaRZ8eH8T3AyCqE4XeAE3mofVaI5MS/4BnP9x1jIjqquGE
         2uCGXJTCPiVmGEnPPdOfdXklB2xCRp87TkSij6yyGoFQsLBn+ZDvg/lZ2PWUz9ZHDAXy
         if9Wpa1BLUgayFTTg2S5dCD3EhzlSb5q9IAirnUPcsHKDFs5wYkFMV5CsET0Wzem1roh
         npu8115gEIZcBcboXDdcQHyW0WhFbdo9fcYQ8tkn4WDa0cvTrCEErQdAGS/n40x2avKn
         MzvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748715; x=1770353515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqjGaXvGxanS0d/vyrt8/Fubz63X60VirMxVGzKrpeI=;
        b=Gp+dceSgY0dR0O8xtGjVeWR0JnpJaEVNL6x4jgscjIZn4ptZIHHok7qGW/ynoXtjJj
         4HMnnTa5hzcu7QWLyWtO2JFCsUS4DpR+rnRV0bk2OybsfShsSDqrD1Mqt56zH0KrxE7g
         iMmNWiPxIiAdLjeen8dWLpIrdSRK+PFPmfO9v47QHte2v6qvWuCZmeYf1dWeyABpQbtk
         E6jxYETykrbF8UzoTReRzhb9IdkQxaTFYmOx1HHVejmm11cGEeNpXn4cFG8HDLpK6lfa
         Ihj48DvuP02dAWOT7byv666ewnwJcYrCdo5Ro3Qp14NB8IKcHd7ufRddQEsuGvXqZO86
         gw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748715; x=1770353515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqjGaXvGxanS0d/vyrt8/Fubz63X60VirMxVGzKrpeI=;
        b=iWCKKRM8RalEFgXXWwXeR/CFSCcu7kyoXa0eQLpmXCE9wA9fdbrG/j/x60hgjv7Dy8
         Or5kz+MZ47LWb/1kM2XT3YtJ2xeL77Q5YjH8woPsgxb03Vi91I15x1BikPqSrCHkesMO
         RaZZlvAHu35iARtdkRNaitMtbT2NeOgEGRLMq4JkvOhejl+jqmnHS0msqX3Q8ZhErBk7
         +qsFaeTIVwinSrXGqgUTnXu8LrVdX3f2CRYEOtoGe91ytu5AX8FfgUxXUiCfX/uqLl5z
         MRzNZe0jJQlbmq39nAQbqfKx7BC+saCDNHaxzXet0rqcUcwQC+0rCdTVTNu/50Z8ecmY
         7GZg==
X-Forwarded-Encrypted: i=1; AJvYcCXJZBI1RULx4atLTSG7J8mlufCjLJKqLuVN7cnGk4O4GYWnw3qhA+9VggT+PbJb5sKb1wD3lcLUbpsWetmDyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Enpc6NZfEbAyDysNOFk0ViLnV/9bBna9nQHYz9cxJ1AtqjY3
	RLQ3KOi4j7eRpZIU8FMcMK0X2yTM4wI2W1B2rFeW+CitNMS++wWn7piX3QCwjHyPHJKnh3AQgvG
	I2DHbhaUcCrUgeTJSJ4snYAOS8gF+tJU=
X-Gm-Gg: AZuq6aKXxA3MFQSmamFqBSWsxKHyzH66KVXyKIxQ/ZEREAda+0fpt9kyELxEtS4+YJH
	/CEcsThzttGU+cQHG+J3XH2ZLfaTuvdmrhZ0F8LDFBfqLVAR+2jeixRho952lhYHKSnz60zJ0mC
	Q9XOf53o2g7oo3D51tARm4pf0/dcR7Fjq8I2N0C1GdqI/iTyJFR68Ep1ea/+DpS3o2I5wggBUGF
	EwITgiylQHZwuUedRhDGHWcQbdmbwYtjlYho0ovmOyYAdB4nXNbPzJGWRmeEHU8hDoR7qsqQEOR
	lW9iv0AqgbWlvEdgNlSOmNOwWZAn8A3wmgk+ijgzfEaWIsdUy7t5h5zAQwVEaWJZQ/wPvWys4GP
	tbTcP79civmcEdWC0QBSUBOM=
X-Received: by 2002:a05:7300:fd10:b0:2ae:5549:2c86 with SMTP id
 5a478bee46e88-2b7c88eddcfmr503547eec.5.1769748715462; Thu, 29 Jan 2026
 20:51:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
In-Reply-To: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:51:42 +0100
X-Gm-Features: AZwV_QipP2FEm9jaYoX4XV0Wba1UPdksiqIqY7CVoEJyzXF9SJWNtQfwyv771b8
Message-ID: <CANiq72k7qXoz3wcHqjNK29ZZ9gTdkmpwX7oqxgV9Rq6uGRwugw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add support for print exactly once
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 1:25=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This adds the Rust equivalent of the C's DO_ONCE_LITE and pr_*_once
> macros.
>
> A proposal for this feature was made in the past [1], but it didn't
> reach consensus on the implementation and wasn't merged.
>
> Unlike the previous proposal, this implements the C's DO_ONCE_LITE
> mechanism using a single atomic variable. While it would be possible
> to implement the feature entirely as a Rust macro, the functionality
> that can be implemented as regular functions has been extracted and
> implemented as the OnceLite struct for better code readability.
>
> To make it clear that this feature is intended solely for
> print-related functionality (just like in C), the implementation is
> placed in print.rs. If an equivalent of std::sync::Once is needed in
> the future, it should be based on SetOnce rather than OnceLite. Unlike
> std::sync::Once and SetOnce, OnceLite only manages two states:
> incomplete and complete.
>
> The do_once_lite macro places the OnceLite object in the .data..once
> section, which may be zeroed by memset at any time. While this means
> tear reads might happen, OnceLite only manages two states (zero and
> non-zero), so no actual problem occurs in practice.
>
> OnceLite currently uses Atomic<i32>, but may be changed to use
> Atomic<i8> [2] when it becomes available.
>
> [1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-4=
10b8ca9643e@tuta.io/
> [2] https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujit=
a.tomonori@gmail.com/

Applied to `rust-next` -- thanks everyone!

I have used this nice cover letter as the basis for a merge commit.
While they were just two commits, I think the cover letter adds some
context that those other commit messages do not.

Tomonori, please double check the merge commit message! And if you did
not intend for this to land in the Git log, please let me know (I am
starting to take more cover letters into the Git log).

    [ Added prefix to title. - Miguel ]

    [ Added prefix to title. Fixed typo. - Miguel ]

Cheers,
Miguel
