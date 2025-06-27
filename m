Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2576C2F1FCB
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 23:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067979; cv=none; b=OkeSbn1fH3Sk/E9GQipNRlOeD0kl9iqCjE4bdNOSKG3VnQEa5+b+Ghx6O5atdecVd9Nk5EpOHVSq7Iu9oaEVJMPJqyBOCm/xJ6AE3aXviN5dHHZfNA5L699FA6+FQuIFZ0XAAQYfeDU4pSTo4jLjGGUzD1MYKFSWc1VBPtgaP+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067979; c=relaxed/simple;
	bh=Lrhi2gkCItdv5YXx85FF9R2huyOdFHn1PCllkjvLZA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXTia0swOmZY/7Vwv1wKDvT9xCFvnx/mw6bjvph5xpxs95QLavWel9Gduq0Eq5Zvh3ALD/mG93zlgZ/pJ99+Yf6c46UnliVnFbGk2Od7R3XJMK5xcdMwUeGQvt2LX1z1i/XiPV4r65pbEc8YoO2kaX3aR7sqjiCH+YsYjOhJypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oOUws00F; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oOUws00F"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso4165a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 16:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751067976; x=1751672776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxi0tOD/7IOqoceOZy5x8NvkHomJG1RzyOwutiJktbU=;
        b=oOUws00FPo/R4Rpz9XEihgdiNKppC1aPK20zB0OOJMT6aW3w9VP7nSgaSa9Yj2rmdg
         a1oz4Ae6hUzic22z2fa821JlsPxz/igiYlTob/t4JDLzf/L89DdzgkYYfmFp2g/aWxkp
         xNK713FKcT9pTb8x7lA+/4PsM3S1n1CMJ/f1X7Nt5k8AUwfGIWvw5xKf7Aq2O8E5djpY
         eBmBGL0/+r2+QbCZOBhnEx7hwX4shA/yTivS+quz6iGFRMfCYN4wx1wtWPzs4ZMEZ6iZ
         0BK4GLiBd20ap9QEQX0H1kBOSn4rEwPBKUPIIW/Zm4Cu3bQjUfvFGkoBbF1OJ4dbsmxs
         ItgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067976; x=1751672776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxi0tOD/7IOqoceOZy5x8NvkHomJG1RzyOwutiJktbU=;
        b=W9JFIwy0qF9QdGqQv8/oPPWTznTerTM38hXlnQBXhBgjhISp19m7y//t8G2e9m7NjL
         WpMNwjJJlcLf4hBQh0YxlzY/ii/HFYm47K0iZVv9WK+kdhDdXyBpkrDHo7ZNGS/r1cFw
         yNjVv3aKRtge5ks8kR6X65/YpS398FJAnk6HWF8yCrkOkIHHR7JrXAk0D6GO24hURZmE
         iT3tuBY1VQ7cczJcNdCBuDzkJOZ1A78SEv+CzYYV6lg4hKahAxcnFKzNUF6NMc/u4253
         6sQJhfQ3nEW31NBpq7FKvlteVPZAQiG2vVo7UTltHcxFKlMB/OPMlHsk8K5v+fLXiyvB
         FsaA==
X-Gm-Message-State: AOJu0Yx0UmrGBGyQUGBsWh1WT2vH8AhYUyFAWKtvQABTsvNK8ZsezWMl
	64Q1unTkG9MCgUZXZddDBXLSVag/XQixNKD508Y2pQ9w+C3Zbg0cGtfZ4803FZjSiuIq/Hn5nm1
	c4xklX13CW525lXCpEd5h8MgwWoTyJ9/KUNoVsgiF
X-Gm-Gg: ASbGncvhBrR58EJdokxaFsQyI/eceZa59Oj+UXgCHBp6WEqOSAP3ltZpyG7WhQiVNOu
	PwqtLKj6nkgCCsK4r1hbsDtgBBiSjogTv9DXg+5hHAyqXCKEJOe42CNzfv1V0wDrAzCgEwUNmHw
	zvPN1YFRF1V3M35S/hbfuMF+6pJQs+YynXvu+GryGvM0JnUWzoJgouJ4u2ZP5aYbes1JDRo+S4j
	Q==
X-Google-Smtp-Source: AGHT+IGGvQWrUecDT2rO9N2vQpFIU/bJH+u5vvObubXckN3HH16OSwQ49/u15QPNM7qmIVHk5rbm5B2QhToBhmNUEME=
X-Received: by 2002:a05:6402:414b:b0:607:41dd:5fe7 with SMTP id
 4fb4d7f45d1cf-60ca582499dmr27121a12.1.1751067976395; Fri, 27 Jun 2025
 16:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-linux-miscident-v1-1-d37c870550ef@google.com>
In-Reply-To: <20250627-linux-miscident-v1-1-d37c870550ef@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 27 Jun 2025 16:46:04 -0700
X-Gm-Features: Ac12FXzltduGfJCCaSruSW9Vc7bAJam5uXPuyh9cD2kBqzctmGZLsOCdZjPGjmE
Message-ID: <CAGSQo03_FTLyYpvLRO8pFzZ1_aCu+i2-Xp5GVYVDzEg5MKGyPQ@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: Export vtable testing
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Isaac J. Manjarres" <isaacmanjarres@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 4:42=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> A common pattern in the kernel is to test whether a file belongs to a
> particular driver by checking its `f_op` struct against an expected
> value. This provides a safe way to perform that test for `MiscDevice`
> implementations without needing to directly expose the vtable.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Additionally, we have a sample user[1] of this in the Android ashmem
wrapper. They're currently working around it by grabbing the vtable
out of the registration and testing manually.

[1]: https://android-review.git.corp.google.com/c/kernel/common/+/3477511

> ---
>  rust/kernel/miscdevice.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 939278bc7b03489a647b697012e09223871c90cd..5f59eda57c38be5f0d54fa969=
2fe5b2819e31480 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -177,6 +177,14 @@ fn show_fdinfo(
>      }
>  }
>
> +/// Determines whether a given `File` is backed by the `T` `MiscDevice` =
based on vtable matching.
> +pub fn is_miscdevice_file<T: MiscDevice>(file: &File) -> bool {
> +    let vtable =3D core::ptr::from_ref(&MiscdeviceVTable::<T>::VTABLE);
> +    // SAFETY: `f_op` is not mutated after file creation
> +    let file_vtable =3D unsafe { (*file.as_ptr()).f_op };
> +    vtable =3D=3D file_vtable
> +}
> +
>  /// A vtable for the file operations of a Rust miscdevice.
>  struct MiscdeviceVTable<T: MiscDevice>(PhantomData<T>);
>
>
> ---
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> change-id: 20250627-linux-miscident-7b67db234a5c
>
> Best regards,
> --
> Matthew Maurer <mmaurer@google.com>
>
