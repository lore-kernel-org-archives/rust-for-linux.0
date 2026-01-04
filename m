Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623163A1E69
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 02:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767493871; cv=none; b=uAtIDm0ow2YYdniEH926eB3Nxk3kPRvQ0FwZAwXPfriudNzXGJ7UUZV3duByUGcBftznN2SUTEVnp25YD2cpn2g6Cl7JdDwE1Xl5lr81Z+5ATqLIWF6jz2CML/qpjWts0sKs80omItr1B7oCPsDJtBnMid+RkNp4tfO4gzF3Zhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767493871; c=relaxed/simple;
	bh=SXUs0395dHcb2gfcReYaXRrzvSio3wMCt59ML1bLCOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INGjAHmkOA6+vyk7dmzzyqyJAifPLsvq0+2gWp/Q58geK5DgShL/7SYyNUCuMnSbjlKmEMi7DQAKWDwpJND6E2IpIFMgwAK2gEaFaFE3iN7NpwGOMA3LhqSBW+akrDPGE292N9i+OaBWMPgBPI2VrMtPVXVcD45Ym0IxCMhKIl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmPVNLCX; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmPVNLCX"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-598eaafa587so15015489e87.3
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 18:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767493867; x=1768098667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsRWgvZP95DFqQgE5Dg/83eeX9dTEUkTAnlAVYh6kW4=;
        b=SmPVNLCXbfW44c8Mg4p1byHfZewt2c4184Mm3MOQfK/7QBNu4LCAG5UXAOH/OefU66
         /v2Bi7KQ9UDfDnFMaEbh6PYJUfqzZtuN/nmJ6VWGUQTWGmkphyjJ5y/IRWf+J3lwKg9N
         jOSXFPheF50YiaNjeVs9fWPHIlMF1h7HeVXDh9FeEVS+0IxUnIn8zlhxW6/L+YgAm1Un
         4vj6xmJTXkM6yN5p+gb4rcw7k4p/jVmX9gW2nuHTHh7bsGKfvDPh3YvdWhawXN31SANz
         suEnN6RyHsoJEYxt/qK3ppB/osAxhAdy3k0/LE4+Ez3Bcs3ppyEDFvoSIVwKwEiXCBOu
         WSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767493867; x=1768098667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsRWgvZP95DFqQgE5Dg/83eeX9dTEUkTAnlAVYh6kW4=;
        b=OfwKSGr+4k9Ckd4WZ3ZBzLciuu1C2CeoISkAIwF9nVnlC6VgxVL1Q+CDezAOZupTNa
         g67aiJHsKuc96dMWN9zhKupYMeuWLJvXkZJ53MZnb2zUItDjjvb2s4ugknGZ3dSr7faD
         bUR8/gF/jOSD+8LhxX9osTR9D1Um7yzTD8LPPNZK/T+b2+ZrECLSJCpFgaXpBZ5B8lk7
         wnCAbJV4PGRqRuBabt2ZwhmcB+f9EGOiCU50U0T/pAo0wOJz9YvCqPtMldTOktVP/CnN
         +MEmRLfpBUNkYtPo3QeYxI+0YeuV0+iwDIDeqljp7oCH9T5WS9n49XemaGjFjqGgfM9Z
         wvLg==
X-Forwarded-Encrypted: i=1; AJvYcCWqYAiYyrn3sMvkfrt7GhTZkFFSdjMjM7jfun8yR7eZcrTRQzjUBdUiNhW4gs76r+kj/70eqdM0kO6tatLsGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyAb3dao1vBTVK9S2oNoRKyql+QN7Opk8DrYTlKY4jRIoIi1JM
	WqH4JMN/zELQiF0I14JkZbptZcmPna5549ZxIApQGPMyoTxuboT1mYRge2faIZEj9C2Pl14dDEd
	5CGST/WHmX+POVSqNWT7USPj3oJbqz0w=
X-Gm-Gg: AY/fxX6yhKxPfZkM/724KkJqj7LZHgsG0mnjNOkFW8heFa2yonqIc0vseDDGv09vVte
	18U90RyLO/noMGCJd4bUYMkj5M8cJ3HLnjC7FTt6Pmkb1KDcFORRZHA42wiiBb99y6bxyfKed42
	cFhnNBaFM97mL+h43xuANOjfjV0gD+H1vHSGkqXAHPW5egTmVl5JircDVlNP7BuznR0ImRw3K8u
	s/j6ZYDCA7k6uIUI9XVj9uY9QxpW2neCvn70lREkNhahsmrlmrLFPkUxFpnVfureGnW38nxfdW4
	u3N+grA150eQlI2eBQFD2G0dL2WJvFWas/wCI++FeCoANa5MlF8FzctmmD/vT4hjNIrFvdp/D0K
	2qc+Ml+TTwM6Pm37RUzXgDl2wxq/qKE1VKNxMpSXzhg==
X-Google-Smtp-Source: AGHT+IHCfWg304ZdWsohB+YD/N10Y1S3fIz7YcKtU4yVi6JuHY84X3Cvj0L0zoUQtCI/DmqwIRlf4bayHj2gTJG6s+o=
X-Received: by 2002:a05:6512:398c:b0:594:522d:68f4 with SMTP id
 2adb3069b0e04-59a17de2c1amr15711243e87.28.1767493867357; Sat, 03 Jan 2026
 18:31:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
In-Reply-To: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 3 Jan 2026 21:30:31 -0500
X-Gm-Features: AQt7F2qNa6HgMSZbmev-xRE2S9e0Bs2mMObDhaf91cavhP-VhsbNAWN5nPUG0C8
Message-ID: <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 7:24=E2=80=AFAM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/pwm/pwm_th1520.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index e3b7e77356fc..8ae8f852ec02 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -22,7 +22,6 @@
>
>  use core::ops::Deref;
>  use kernel::{
> -    c_str,
>      clk::Clk,
>      device::{Bound, Core, Device},
>      devres,
> @@ -327,7 +326,7 @@ fn drop(self: Pin<&mut Self>) {
>      OF_TABLE,
>      MODULE_OF_TABLE,
>      <Th1520PwmPlatformDriver as platform::Driver>::IdInfo,
> -    [(of::DeviceId::new(c_str!("thead,th1520-pwm")), ())]
> +    [(of::DeviceId::new(c"thead,th1520-pwm"), ())]
>  );
>
>  impl platform::Driver for Th1520PwmPlatformDriver {
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-pwm-c9b9a4701157
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

@Uwe could you please have a look?

Cheers.
Tamir
