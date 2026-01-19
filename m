Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3846C358D1B
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828708; cv=pass; b=s6LZhwwoHyPSRCp7N/5DidP51JTWruFznPRcvi2EUHp8oH4+S1YFO3kPynWhszUoaaGQc/F8v7z5hPszOkjh2jVeWptksTDKDyyuApLrbjCno6kGMe9ZnuUSTziLRvocNdOEWlbyCbTEJXeqFZUgO+3lKVSQ3AnyIGRxOl3DG+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828708; c=relaxed/simple;
	bh=cl2vU7PiFXCZWfRijLSzy8Vzwr3CPdzUCmYZJRs1SVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBSi504Rx+f+bRwyttJXbIxAS0kxi+Wwsh8yKP2RicUNEZH1pzx6ozwCK2YR/YqEzZL3LDcCT8X88fPX9q+YWngZYa13dOMqyuPTmLW8RfmpCl0LC9Rg/QvCtdpDcQzx15GxqWJsTltg5F01ufQcAA7pbbUQPUwvzgedrbb7GMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deKA58RL; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deKA58RL"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso39114231fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 05:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768828705; cv=none;
        d=google.com; s=arc-20240605;
        b=S69xr143cTZA9CudDkhQIq3furrU5MIvnkof4Ut9xU7SdoBsTG913ydyCjDl+cN2J1
         5FOOPrp6Ho+SBOZro1hJg2Rjk5qUNE7p10bBunxfziELV/LeQ0quuH6rjLEuAYEYdz5M
         7BlKTw5FKut8YgS82Limx4ozMlFMwxPQp7Kz7GvHtHCxhUnb603qSn4S3ROeyS7lBGFe
         3yjLRSBu2JeYK66U6HB8/eEpAHmDv5znVMyZeEXxbnwdUSpO/2o5h+InmJjF6gDp+Fe7
         2LmO7Q6loDzrmGz3CatiPC3Zox1cMmzyUaFCIyNJjIf8fEBnAsLSJ3stmPFzJX9ziruZ
         9UPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kjD3JEARGzp0UiXvO7+D/Os7OGtZnS9aK07aGaWrtYU=;
        fh=yIgKpSIKolwHbH8mmkYLG9wYnwCwn9s83+PHbc6066o=;
        b=faI8J9h0XhNSIqgbkHQ+KMZMVT6jX4cPmzOBD+EYM/nRsvWnWpBxidKUU0kDD2mjPM
         V+oGFmBsHhL5DTxwKEeKAenHstd8GGWs5OJuBiC8Wb3HRv8Mf/Blr5s0c52pWIE9LuLN
         UW9jM3d12XBp9qNP7mH5ntC8KnUrlvsQ8YW3wAPhWKb25oZAdRr47Iu9F+4rcAGy2ME7
         EpOjASQ9B2GygzBVLKH4W5Hn4J9F0BE+pHk8RIGHAWUx7GBCN5ymyFjv7LxaPhvTonkD
         Rzea3WhHt4ZTHTHo0+IMxOCqtAOOc2S3tg7ywhYEXKq9IxzMFJgoR4e/pOgYXK5ZPpRa
         lW9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768828705; x=1769433505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjD3JEARGzp0UiXvO7+D/Os7OGtZnS9aK07aGaWrtYU=;
        b=deKA58RLdQGwa+I2zp402qFOXIycWVrbXTDuML/PDX9C5sHfuWXa8y7sCdfRXK23UP
         et5ejgkP0FaMVjXFfYogUobycIcJZ1pMcu6d3JTS57ah4fZHiCdOHyT89PQ8Pp3QRvGF
         8L7JyRC/OseKQGS1hjYq8ZNMriP84TR6wlr9dk4zjZfw7aLPimNlUe3SNbjYApfM1+4/
         RTRAMx1X65ncHYtKlMHU5osb6KwN3Z7TFUZWJfVJqt/b9s7GibTjh9cbz3o3Caagd7e/
         a8fsOaQPFuK2NZWCJAbusL8/udSxrKRjCMwvqs5wUXFQN1ddEcb7ymTH95JfiI3hawAV
         QEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828705; x=1769433505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjD3JEARGzp0UiXvO7+D/Os7OGtZnS9aK07aGaWrtYU=;
        b=eSi0X18ssMDyBKDyglOdb3QCKPl9gVsYWwrIDNji5HYxXhevxIiitTLgGTfvrNllGI
         pFkUu8p7lbRmGmO0SNf++ZhjGM1wWYPdtSbNyZ82uv6uJIE1MyJ8Az4+Jahgxe+lO02n
         fY+/mbiqsakMjrOQCWfOOa8TKGx9occivGEz6bcw51JW4CwGc2pZ/YC8dlwhabXHNuJo
         Sraj9u92Prl1iFpgtNjHckHeLkaLfiyWE2XDKHTmB6+qNE82uySvHwDhV3+2UPM/Ko7b
         HXHzDGb6EHEmqP4Sh0FNnBvNEqppmpnDxyivCwBCir/oJqk3vsnQZ7rMgF6HigopA6py
         PjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsOimT9vPNsbevb4k53zDkJbqMEe10hXKbjDX8KGtC9Mqr0LFpvQt7SNdsrjSOKrTzfzVhYie/8pljg3SrEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzngupUy3hHFBgPIWBEiHxfxjNtEqvrOmKmX9f50veNaKjgtBnQ
	m2nyhtaZh7ehd1IfPlEdg6ez8ZqIDFrZ5I2LhzVIZpxg0/fvFvtjchHc2CQTHdgduH+PK5AAsXg
	SuDxa7qQs4oTr7FWkv7ETjq1u52uW0No=
X-Gm-Gg: AY/fxX53YuF7d2sZ0uLAaKL9IndC2YvYR+zvcyUXPXp0ZQsw2QyfNBG7htP6OadVVmm
	+Jon95cXzo9qd6/R3LMJDZBxURD+NCSGCZkIzUnn1SwqfppACCduLs6ZswNXiVjNb/p/Al16MPp
	bUo6DGAsXLOW/ts9ADBUhVhQscDCvz1Sy/9OGIY/cj5wElc34VbUsHy7N0cNlNKcf5TdDgzPYwP
	oeMdVmzaOx1/cYvQH9NSTdoZed+UUDQxmY3OpscA+xhHoFLe7qMgyWFIdmHUgtw9j/dEbpXmSuv
	kxqUtO6FJXR9tD6ABV1C+/wGqDKuKvP2kAdOlmEZaSGx7LJstMst88wHsEG6ZfglNHL8SfHrGXi
	0uU3uaHXJ5OnFodiH6BKCwK7vfQwAPtKFZQ7xPBnqMg==
X-Received: by 2002:a2e:bcc3:0:b0:383:2fbb:6e63 with SMTP id
 38308e7fff4ca-383843237d2mr40509011fa.42.1768828705064; Mon, 19 Jan 2026
 05:18:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119033006.1453006-1-sunke@kylinos.cn> <20260119033006.1453006-4-sunke@kylinos.cn>
In-Reply-To: <20260119033006.1453006-4-sunke@kylinos.cn>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 19 Jan 2026 08:17:48 -0500
X-Gm-Features: AZwV_QganpbvhB5_IZtqlx93YB3avOhc9a_jf9ApVCUxBcxvnGBHShEDWsMQt8Q
Message-ID: <CAJ-ks9m9HV72MSchSS16FUzKLu9c6Ka2N4zZbg29VjNf8RCLOw@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] rust: fmt: make raw pointers default to HashedPtr
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 10:30=E2=80=AFPM Ke Sun <sunke@kylinos.cn> wrote:
>
> Implement Pointer trait for raw pointer adapters, making raw pointers
> default to HashedPtr when formatted. This provides safe pointer
> formatting by default and prevents information leakage about kernel
> memory layout.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index b3501a11c7a3c..6052d9f8628bb 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -192,3 +192,44 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>  impl_pointer_forward!(
>      {<T>} HashedPtr<T>,
>  );
> +
> +// Special handling for Pointer: default to HashedPtr for raw pointers.
> +// This overrides the default Pointer implementation for raw pointers to
> +// use hashing, which is the safe default behavior for kernel pointers.
> +impl<T> Pointer for Adapter<*const T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) =3D self;
> +        Pointer::fmt(&HashedPtr(*ptr), f)
> +    }
> +}
> +
> +impl<T> Pointer for Adapter<*mut T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) =3D self;
> +        Pointer::fmt(&HashedPtr(*ptr), f)
> +    }
> +}
> +
> +// Handle references to raw pointers (needed when pointers are passed by
> +// reference in macros).
> +impl<T> Pointer for Adapter<&*const T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) =3D self;
> +        Pointer::fmt(&HashedPtr(**ptr), f)
> +    }
> +}
> +
> +impl<T> Pointer for Adapter<&*mut T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) =3D self;
> +        Pointer::fmt(&HashedPtr(**ptr), f)
> +    }
> +}

The equivalent code for Display handles references with a blanket
impl. Is there a reason that doesn't work here?

> +
> +// Bridge implementations for raw pointer adapters.
> +impl_pointer_forward!(
> +    {<T>} Adapter<*const T>,
> +    {<T>} Adapter<*mut T>,
> +    {<T>} Adapter<&*const T>,
> +    {<T>} Adapter<&*mut T>,
> +);

Can you help me understand why this isn't a blanket impl like we have
for Display?


> --
> 2.43.0
>
