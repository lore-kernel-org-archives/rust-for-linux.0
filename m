Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2E18641
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732369521; cv=none; b=II1+/HkAbxX1rufNk8UURA4DY8ZOYfvcNIWKGCKYPlgPrx4RkhM+U925UOGe+VMqZj/JYkWvTS9salpCrjDwRG6L03qo+UgjAcMp3sZQ/pmvrZj5KIhVohro/hjFfXHzb5jGaEhZ8kh4n/Awga1de0GTKKAqXJWSpSMNrNbyJPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732369521; c=relaxed/simple;
	bh=65DYwv3ug/l0bzHXqqLa9HT99Wp5s7/lb6e4adHNBUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBbxTtx/TYrMvUtI7ZKvoora0SOFsaOh36+NaH0FIcQ+WQkFzxoVS3u4DPNnei1AHhtNdoaXQewV5ZdgCkZip/S1PCVqLnkmw8xzhtmM1OfnxGSiC987UDP4rDETs/WNEhSm6ohNtm+O6nBL5V8+M8ZN9GAqn8SvX6i9AbFxA80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z934biIj; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z934biIj"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fbcb11ceddso315832a12.1
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 05:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732369518; x=1732974318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5+pD9c96sZLTAIB5z74aDI2ro1YAgWbn7XsD+lOFeA=;
        b=Z934biIjD5j2SU+E3TeSLCUoAxLmkjvaW9blC6JPW6c6tlMaukdpLd1hdSTLXkSplU
         ltxRMzMnwC/2YyHYqybEmlh9xqKQ3lXmSJO/OYIIXp8bIvIIrNWmSWLfU3Acb64YSOXz
         cSPR6/dUjvlTMz8Dzzewq9DWpeyUF+qnLA2jThVgS9sC6/ooR0ji0nuYh7TDaiylmrVE
         yu7n7EnngeBIcCc9cIBJ2YXJeO82yACUKokh3BjH/KZbukhhSIlDJXXCZcrdEP8uwV99
         D1zAauPOsGSQt6d9F6Rw6jCQs1L25nlKFAPjQwV4E4YgVnDk5oOMi5rczoveLoJsjVq9
         4Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732369518; x=1732974318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5+pD9c96sZLTAIB5z74aDI2ro1YAgWbn7XsD+lOFeA=;
        b=sQfnth+LlKwTuDhD0yMF4RE8FcwDkKLhJ4/X3lX2932xtgx9PvdGRpPjNM00OfWLBR
         axYySntcRLpIQbBF/sU83wvRi4P8QrT6MWGvhzuDkX8MOsBx/tLbIMcD6ZFHdH1aDphb
         gueoAIXtbNFBArzA7proOmrCxu5sJyg78ciNhwDTuTtKmpFas21hszUCt0AqnMgqKZ/i
         A9hKHgF7B8/5WkqqOzH++npOre4LLSlFfiJg7FicWVFfK03E+0HW1OsIZE9O6FMROiSm
         KHmtj30vABNAL3QNrtg8EzFu9OKOiPPl1DSRCfH6yvJl+c2lfHHJ9owIBMp89YOHRQ7T
         lAmw==
X-Forwarded-Encrypted: i=1; AJvYcCX++l+owFFhGE3snfypLbfCZul47eUi4dSQPmdEVf4MLt6yR6aRXRUx31pYBVCrXKfbDbq+BhUJyyCmfD9LfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVxZ5CqVW6zUX3Xb3Khuc3SOu9EzNMKK41ZN3VrCYifBryXto
	OevaP8B7SWYz7DCBgPLCmpydQMD4dm/8FIs+zPta3iFNowR59Ik+QdkHK0vP1eZ9SkD52/aA536
	bFPa58LWeYYCAbgkocjx3y/9A8qo=
X-Gm-Gg: ASbGncs45StzSjEybreaCLaw62ENqu64AsciieJBw7ok9LTNxk7XV22HxY+0ZBHTsLG
	JWqM76iVH1HKCzutvqibiOgdxOz2urQ==
X-Google-Smtp-Source: AGHT+IGB96AuwJA6oVqTUNpGiXSAqEWmG5OLNXHr22zzf1bOj+x/OZb0SPf3Yk0bE5amiAqHVQJYLgQDwPtAROyIDeA=
X-Received: by 2002:a17:90b:38ca:b0:2ea:c2d3:a079 with SMTP id
 98e67ed59e1d1-2eb0e22ce05mr3678048a91.3.1732369518033; Sat, 23 Nov 2024
 05:45:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123104857.49385-1-daniel@sedlak.dev> <20241123104857.49385-2-daniel@sedlak.dev>
In-Reply-To: <20241123104857.49385-2-daniel@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Nov 2024 14:45:06 +0100
Message-ID: <CANiq72=YeDPnj==btj+4ZxrUub1kLB_vgHVVQ5RygivSP_m=uw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: modify `from_errno` to use `try_from_errno`
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:49=E2=80=AFAM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
> Modify the from_errno function to use try_from_errno to
> reduce code duplication while still maintaining all existing
> behavior and error handling and also reduces unsafe code.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1125
> Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gm=
ail.com>
> Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmai=
l.com>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Usually, when you have a cover letter, the title of the patch would
have been "[PATCH v3 1/1]", to indicate there was a cover letter. Did
`git format-patch` not generate it?

It is not important, of course, but I thought I would mention it in
case it helps.

> +    pub fn from_errno(errno: core::ffi::c_int) -> Error {
> +        if let Some(error) =3D Self::try_from_errno(errno) {
> +            error
> +        } else {

`let ... else` would work here, but given we just return the `error`
rather than having a long function afterwards, it is true it does not
really help.

Thanks for the patch to both Guilherme and you, and for navigating the
race condition on submitting it!

Cheers,
Miguel
