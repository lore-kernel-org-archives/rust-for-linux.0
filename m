Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEF11DF26E
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 00:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765585571; cv=pass; b=Kv4SJt6MvCtr4MoxFpjMxKBTv2osaTDBUUv3S9hO87S7jg6B1r/9Fa8+PGNHVbpnio1Ms6Mrx/XvRU9osscNYk22kvHA2Umssc2vwJyZsDnrWXDMlH4qm98MlEorGLtIquHCV5Eb6jRcXNMEXjA/hBoemJBS3Vo05XvMa1KdV6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765585571; c=relaxed/simple;
	bh=ctnchpJB6EtMnnGG8/4J8cAWPja/RaCQMxArqOduV9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HunfVEXk3yEesAzZtE0ObzlsIGUidT0BypGzoASqA7V/iB5QmWJ1JrDilAqqC/JpO5C7d9zAUWwC2NAPH4b4k+lbWf3wvuditCy8q0jXzcElUkave2VQ3uquIOW2MLGZCpye9s1/jz5rmQ7NKoMP++qcN7UrMnthdGSPirf8XrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/4Krirp; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/4Krirp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64969e4c588so28915a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 16:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765585568; cv=none;
        d=google.com; s=arc-20240605;
        b=V1dXUW6WLAcZaOxFyOzmqFbJlwjYx22Lwcmeq9vfYjlK6G7CY6/gj6Nv0EVrSLOYkr
         XKZq5WaTBnF9yGuSu6m3exTKES1QXm7aQQqbHcMIyNRLm26o0+ndpsPetlVJMruKKEjP
         +R3a2rYM+oecUkPj040/kOxrpcqbyWusU0y7Je842ojILY4LKW6jKVpXnhnX1TElqQpj
         2qI57Te+fJBqBulevzJ4Vsxkfvf+sNhSpo1hZUHuyVwBwKoJAbaakzOviCdd0J/fpZqy
         B0MH2wig37+OJxwGdRizVVpN6N7/hkdPIQBEd/g4sExQYZ77PXMmnqKqrhV9QCQ7IIGa
         xAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MaeYinhqyL6LVG4feuyjnwlmv8qUIfmvVgGqT4nsacI=;
        fh=vNPAm6yYFNdXWW0ktb3dbpKqqTn4CBftaC6eTJqYjvA=;
        b=Zr0Stgf8y7xMvLS7OUJTzHkzWKLWL1vqMgnWrtsMm/GbjB5Jxj9up00qQIjhNQdtuI
         vGWwjMYhZMoZ4HwnA6q/AuxdGizYwK7R3kETpMOzi/73csJRdPzXS4//EKEmU9GORVVC
         BeF9doQPTRXMagbySI6jDQrJQ6lGbVJb4ULI5Y0UgK9WqNpu0qLRaRuxePZ0Rs/6o5nR
         sGu7dHczFiDSmZpB4qqd5wQLRUPx0NPEiWQX64HsVtonVKLMO3Ma0cdPR9WPjNg5kyxJ
         XiuepmUQ00qdLzO6ku2/ccesxOp5zYHDYQChlMMZNNemNTKf43uzL7CCEBuSjESMHA47
         7goQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765585568; x=1766190368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaeYinhqyL6LVG4feuyjnwlmv8qUIfmvVgGqT4nsacI=;
        b=Y/4KrirpojmASeqS2iFyIcwzH0pNqqQmNQuM5Ov6E9PgBWVl1NEHft2KKYt6hGAk0q
         DCu5aP2D+gHFB7DbcpmyuE+GdjeQH14hscSzwfcHHYwULUHFfL7vPp5eeerIlydsrwXf
         xIb22lHpBc1wATAuJjYwY7H/LwXr88oDXO06YblgBAWJhYh4CBf47B+PhrmtVj7ZvBK1
         pik5vLsiJSmDx/pWOAUegZSt17i8z1rs5f7Mfowy/js48Gnt8ytbLjp+kAd7qwvierzf
         KOzNR1jkOBXHva+hYzyTNZBNytV3QozBx0oiFWb4yVTvcfhosDUSzuugI80DJmYGyF6f
         3ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765585568; x=1766190368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MaeYinhqyL6LVG4feuyjnwlmv8qUIfmvVgGqT4nsacI=;
        b=Yr1LXzF2Ff3zylzmsvjuDIFbOtEpqJ2mhdkFhW4ol9pnb6gAiRjyr2cg5AJ8QK2NJf
         RGCPSpYqwlSDmtApNvBN5EIaIASRdTDj1fd91bYx2WB0ON1oxhK+OjWQuyQcbb5Bdqpz
         aeHxM1Vl6xPN6WMpnSqdXdY+3DafqRKRb5LLP2cz12o4qvMFrQi2yzZptpjZZtfWVZkg
         7BLP1H/ZoAwUV/LA1CndptOcwg+DegG3+WbxTLSMFJGxouh2ESz5wBCp94+wy++aZqip
         WPag3k0YSExMlJ8q9T8sJES2nEwC2enhDmpCwAUy7m0MW/rs1K1q5r9M5fUXrv/4G99j
         ZBUg==
X-Forwarded-Encrypted: i=1; AJvYcCU6mIORq6Qf4kjw9r1VuoAP/YP8BTzSpk4OvwvaweFg0xbZ4QDZ1qlqC6RCJHP/SdAzjA8lVn4gaw7X2q0xSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kzPJLxhZ6yYvQe09NTtPuelPGL+Bx2eamYmHZjGv9LbKG4eD
	IBoMsEMtHWjg0e5+Xnc+d/kbPHCDRQQX0tpcI+ShoJkX5Em0J9qX8a8qRZOyxmlUcOdowdLbcyL
	SXPcuFK5hfzrSzhXFlc1Nay9OPKCvkHu/wCFHU4R6
X-Gm-Gg: AY/fxX4UF7Ucbr00eqjZB9uf+pQKTSarUxMNGT4n2xvMMwlTtUQvGkCGTdkU88E7TQS
	GPDLx/ZeOjlAX9P2bV2e6HUkxn1ilgHbEs50tpeD7VF709wSutWwU1SwILoke9kmTq2Pfx/lpB9
	W4uV4r8psXQzZWpQu6uxvSDLZPyi3o6Imz/ODI2VdMnoPAX91lXSvkjM7jYtNmVWqAosKxo3eT9
	h6JKrFr8BlzYXVJLuL7bUroX1zmQrne9KgvKpBmNOuqWFe6tSmpz5GuNHsyvrOTF5ffS0YmHcot
	Hu/bRAN0oXec5M1ija//O+3SZA==
X-Google-Smtp-Source: AGHT+IFMX/yTlDyLI0f4o+DotQAvjUXrLZ146YgTqxWhIslmeUDl+HScKTnNk/A0bVy0TuCh2v8kYFsMZcRYealpLls=
X-Received: by 2002:a05:6402:a2c9:10b0:62f:a20d:5a92 with SMTP id
 4fb4d7f45d1cf-649b0573d3amr16529a12.4.1765585567956; Fri, 12 Dec 2025
 16:26:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212-add-entropy-v1-1-e70ad1bc9c65@google.com>
In-Reply-To: <20251212-add-entropy-v1-1-e70ad1bc9c65@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 12 Dec 2025 16:25:56 -0800
X-Gm-Features: AQt7F2rBw7umHDtbOwcqqO0QOn9gCK-hfwRdEmnvdgL8MDcT6wP61SDGt93Ik5k
Message-ID: <CAGSQo03bzjFbciZ00GU-s14VaBbSbCnWrR92RhWSyZnVh25krA@mail.gmail.com>
Subject: Re: [PATCH] rust: Add support for feeding entropy to randomness pool
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 3:19=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Adds just enough support to allow device drivers to feed entropy to the
> central pool.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/rand.rs | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf12004286962985a068665443dc22c389a2..f93886ef4eec9c4356799f4b5=
5916bc12c10c621 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -128,6 +128,7 @@
>  pub mod print;
>  pub mod processor;
>  pub mod ptr;
> +pub mod rand;

I've just noticed that the rebase misalphabetized this. I'll send up a
v2 after folks make any comments they want, but figure I don't need to
spam you for now.

>  #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
>  pub mod pwm;
>  pub mod rbtree;
> diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..b3fb30f40a8950ac7b47d4812=
9eb89024a1cbd26
> --- /dev/null
> +++ b/rust/kernel/rand.rs
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Randomness.
> +//!
> +//! C header: [`include/linux/random.h`](../../../../include/linux/rando=
m.h)
> +
> +use crate::bindings;
> +use crate::ffi::c_void;
> +
> +/// Adds the given buffer to the entropy pool.
> +pub fn add_device_randomness(buf: &[u8]) {
> +    // SAFETY: We just need the pointer to be valid for the length, whic=
h a slice provides.
> +    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>=
(), buf.len()) };
> +}
>
> ---
> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> change-id: 20251029-add-entropy-f57e12ebe110
>
> Best regards,
> --
> Matthew Maurer <mmaurer@google.com>
>
