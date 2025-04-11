Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198591EB5D9
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382201; cv=none; b=lcxvczasBA9KBbF4ZHEeGdMzAgXCWNX/bvVZzxuGzsPoIdf+0Ge0uTip+BA5nmH0jNOl9xOsbABdVbGToknKFVyMFHxp842Rl64sEYyAEa64YuWbCOD2qOhM+KMGSQPlykpPXwMg6g+7M/YIO+1CwUPOSPJxb8IFsHCdAS6Cfcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382201; c=relaxed/simple;
	bh=xGl1SXOEJg8B6NNVxXxTkAc0a/Sr57AdS3ZfQ42iV4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyHKF29jFeO5Dp/Ra8SIQrGjXaMx+2tODzt211yze4Z9N/xZ4dMO2eNFpeYkCHNzusnCbtrMrrrngToQpzGZyJcgPZp0AKGNOS1qrKrmMaF3jCXoyHNIr5LlUUah0GhdWX85FuES1P2HIJhMUiUiAhpHCsjEax29q+jsmcqmij0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yk0wPUfC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yk0wPUfC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1331441f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744382198; x=1744986998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86Tk0TkOxFZKAMLgJ7FnptgLNocXvxcyZhQgIxzF/Pk=;
        b=Yk0wPUfCnlDft6LrWEt6IfKJcNwTE5vPUYdz9SMmeTlLDh1WTAlqw8TbWXSPNPc5Wi
         LfqMImnBLK0X2y5zfePZrwpeBVrqNk0DuB2Qnmn8Z26DdMso2uxdHyzllLcNUFhXYR+U
         DC4rEVvzfZcNDSeupYeKpbrFj0P2QvrKmT1OzkazrfLkTkVwhzh24ctUnBcuAZZtmUoT
         UtiBIcD+j6y2zGodUeeLHeRfws4DC+5p3bhhmsfPIzCpMv9f1ekzlJyDgcT6e+6IoX+p
         3DSZoeLKjUBRPT7T6K8YUa9WlJTuXclyw1F4SffxOcW8n1eWf35fuysYIZ9Gf0Blot9m
         q+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382198; x=1744986998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86Tk0TkOxFZKAMLgJ7FnptgLNocXvxcyZhQgIxzF/Pk=;
        b=CnHO9y6u0ZLXI9YkXYb1Fh8yQwsg0Sy6qTo4C7Gs/kPs72fcC3ckoTwK6vvuXtllrW
         u4drUm2O/mvhgMYkPJv4AT5APJhEdfuxe+fNMCsjy/RnuD/gpZdCjUbg0f5UIFhqG8PY
         gVbWEeoXK/XlojmTpmT+RnXHi0du9cXFzizC3zoj0fJdmBXDkHDGkWumKQIOAxWQ+j/2
         Nfzpc9xsSpNllII592iVqA+F3gZfH53pc6KYB29YAaeqXotabLx1XenDGPRwbdB5JEyP
         OkiYy4UBNja1OGt3enjvhS1tezeyuO0I+uI7hQyCJhJvcg1prxSMp6u/1Js3+JPczJJS
         jrFA==
X-Forwarded-Encrypted: i=1; AJvYcCXp869Y7/alf5zWnDoIvfLOmo+UYtNgkMLWNfU5o7UtXlxRQnzryl6KfD33n34xkan6ijlnJfsbiFXjHAB8Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXilnpPllxXe1G0sVquqO2wjHQVCxyXbZRklGmmdZx2XS9SEBO
	M1ZlQ5pqugMJcNssA4f5Aq8XziskLZwjRCXD/XtLZxL2gi3XFaTGSa4XmNWK2rMOsnS1Bognslq
	eFbH1Pdj+w4etbZm1wf+qbd1pMzk4dciXJ+6k
X-Gm-Gg: ASbGncvNiMu412wP8Zo02bSEpYQfg+COo3O30Tba6hEiz57+H4B9cDed2ozBMcax7Hh
	792RsKADO6V9hZXxt4R3OaJfvDzeObr6mbsEC6K4vr7x9KUnJKjf9eW2RMzFTGSyQy6gtY4k0nP
	rPQ13grLPYt0LKzhwQgb/j0a8=
X-Google-Smtp-Source: AGHT+IF+nfnyJohZTmbIMjRYCUe6AFBonUPfBZ4hsfowRN2xKWzascKi9y1oY1o9JWOxEXR3LURdMNXq/ECTotl0QhY=
X-Received: by 2002:a05:6000:2401:b0:391:20ef:62d6 with SMTP id
 ffacd0b85a97d-39ea51ee240mr2814635f8f.11.1744382198181; Fri, 11 Apr 2025
 07:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com>
In-Reply-To: <20250411-b4-container-of-type-check-v1-1-08262ef67c95@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Apr 2025 16:36:26 +0200
X-Gm-Features: ATxdqUGiy9-fSODvrU5tgZMf4vnMPofYajVouZ6l9z9KjPZH-G7JwkPF4qTcWks
Message-ID: <CAH5fLgioEPTrh0vYt5zdmj8POCMyDdV+Bd=j_M3PZ-EdKLZtTQ@mail.gmail.com>
Subject: Re: [PATCH] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 4:31=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wB=
uGPYh9ZTAiww@mail.gmail.com/
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/lib.rs | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 1df11156302a..da9e36aa7967 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -200,7 +200,10 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>  macro_rules! container_of {
>      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
>          let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> -        $ptr.byte_sub(offset).cast::<$type>()
> +        let container =3D $ptr.byte_sub(offset).cast::<$type>();
> +        fn assert_same_type<T>(_: T, _: T) {}
> +        assert_same_type($ptr, ::core::mem::addr_of!((*container).$($f)*=
).cast_mut());

Perhaps it would be better to wrap the type check in an `if false` to
avoid evaluating the expressions at runtime?

> +        container
>      }}
>  }
>
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250411-b4-container-of-type-check-06af1c204f59
> prerequisite-change-id: 20250409-container-of-mutness-b153dab4388d:v1
> prerequisite-patch-id: 53d5889db599267f87642bb0ae3063c29bc24863
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>
