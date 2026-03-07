Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147182E7BD3
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898246; cv=pass; b=joeLxsIHf5W9zI4J7qq3ZhsrnH1Wgu9Us0B53MNjsZ4bPnqps7b6bgH948vtRUyI4pH0rM+83PN4A3kPrkgHaPIsJwX+VYQz/a0XNltW4Ruw+g+vPD517iP5/i4Hd/GCE/Sju9GW9iU59EGTGt/57cx02w5rHtiIfbgSPddXbXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898246; c=relaxed/simple;
	bh=Q/+WY8n6vQjs2kcO7fAVUG+PYDlcJ/fknkWKSslQ6+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pt/e01EcKbJF9tExEMzCFoI50Lp1dbsFOySUyyK9lQJWPf8sMFrOirROtAyTQU/U3Ex99lTafhaW9xKkFSuA6BzlxXAKCPOfc6d4AipnXjaQlpbw0IzQLrLPwIoVQvXkg15xiEXDKqFmZEERCT2YtYx/b8H5oYUbPH5VJx8yERs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTdVMog6; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTdVMog6"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2be21f91e58so294392eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Mar 2026 07:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772898244; cv=none;
        d=google.com; s=arc-20240605;
        b=FVVc2E0zHkgmfltbXpo2IzI3x0nD02CGK3sb0GdhjB5aVR626yV9nFB6aODT+nDpbc
         zaEqeoXBpyrAWnHwezVzVXJXh8lLv94qIuP2wiinjOyuHpAnnJVOiXvMx3MjsGDvydNU
         Eo+4uoNqOJcogp5ihozZo/ObBfpulBNww2gcHWRjbk01W5xFDIEjBZoCaS9g/iD54flh
         45fAy38uVua6TyWvHmDJ7WHC5mJ9i5gSr5w2S+He9/ZHQQdumr/MqfOHpi2C/ntR0Mee
         sPAUSPIB4nrCZ5M5VUydiShAX9TlCr3Z0z2oT+fupOZw4BTVpE+5obr1Hm2+s3uI42hd
         ibGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/+WY8n6vQjs2kcO7fAVUG+PYDlcJ/fknkWKSslQ6+g=;
        fh=VU5yzGXvuu+2+8RWP5X9pxqy5+mAw4qEpUfm3XSJpM4=;
        b=KjnNnXXb+kG9OvNA3ig0mgY1ocrAFR+V/yHl5t/2bUAba0l2hnMbua9JFpmdxUnVwf
         GIs2QNEUMJZgci/SkHrK2MdQWiTKtRX99uvW5sBwhj/4kwFvydbQOHyDHYXkAeZNQ0mx
         HFbhnO7lU7nFey02axKoF1lJeE83KbdM+Z4ljh9vn25WZw6IqJHmHFEIT6pmLEHCslD5
         p6ykMh1J9WuOAoo4i5fYp09u5ehheuNUP+Ot5YKaH7FtsfPLVDGFy7+/FcM15x5bIph9
         xCJcFaa0+t8zuTM7mUSCwBKNxG/vcfkaYlWU8dC2fj1RN7xFsgdw2HEubf3vuF+hAiec
         OuOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898244; x=1773503044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/+WY8n6vQjs2kcO7fAVUG+PYDlcJ/fknkWKSslQ6+g=;
        b=HTdVMog6StTVneEzoVU0AaYN2ktj1yZH4gPOUZGXvxH6J0SQbwQIq6TrMrgpdeVbeb
         hnI3JcrbZ5+zjM67tS9dDdtwRQnL3j1GnhW01x05J4HVArFJzeFrrmcK1N8C/FpCWNxT
         fpLduKD63ThoqM/wcQXNbAhDcBUw1twwRR6ex/FiByIssJq5ztE5nIyow+fsqvtmSXfM
         LF5jeiav2dg59lwwjo5p4s1wFAZtcRsTZfHm5NHZfEmZSO9ZRRtkaG2NxEGhqKTkIiZW
         9VxPxGtBAFziw9kE0hURsRhhLdExHffHlo/A7rvkxnfH1S8AqMKa4wlSECAIQAc8PP/l
         kmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898244; x=1773503044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/+WY8n6vQjs2kcO7fAVUG+PYDlcJ/fknkWKSslQ6+g=;
        b=Ndas5mKYjapzgHzH2g8IdEfbG6TGGIblXvFoqoY2n/9miGXnAEZHTDmuiHJeXTopbH
         WRE80zC0qq/X+BLxLuJSLZHBh9N8YpZWpPA08TAg64yRSXSfbcDt2Sd2wBvnwpl+PnAs
         RWuUD3KIB45FCKM6vgc2SgI4r3YVwhHBUhEbJvLZuvf73FtW0E7l/MoaIy3ikpvxjIHM
         eIeQmJwJxddOxNhwts6IsGYzoKD7w59UEXmdYDOpJ/GrHyKJcX32sBTKaLZHZgIEdCfq
         n7dSsN6goqYRNY/EgBhKYAix2OurYSSmIJVVZhKOx9GqzKFJdsmuiI3aDQZFkOYimaUH
         VcZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKgGWFooT6PmTo795iftG3mtSU2jD+hA0ge0KPGfinlJb5jtK3Vsca7W6y3qJSJ4Z2kQLDbuLzoSKhLtNjfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaU5kyH74VBI4GYCefnm6YEG3XQcELLJTLQre+joANBR7mFNO9
	jo8LD1n0m7dZdpDoXioL1Pd5gYMCtLsK3j7FRqovPN7FTSnYTNS6TYCc6fRp6VtCGs0DZ3EQQ9G
	yJ3+MB4sC43LJD3QFmZ46LnrvaDgRW2A=
X-Gm-Gg: ATEYQzyDQkFY0cLIYMxJ0NCRsESp9Id8nqMebKIcPvoXzl9XEWNhRUcNjO7RDKFBy+h
	9LFB166Fv3uKrD3TCM4k3B9NItzJ6tgNGOaY0hsZWIhzF5tw1nw6/9DjuAE29EBR923qxQteFYf
	zkVd6m0BdNKkVm4ZR8EBmTlmjstDZBTZc3jRzllHEZ/9Vax8sYEhvkjDUJfMi4SJB5HDEEU+iCQ
	+7YYdI8X3nV1TjGBVDGJtY7csv6qOm8HEagozogwLy7MMBzyYkmpFHALtx/L0QMT9uKslOad0uv
	aYirA1XnlV964QpjpaXxX6YboaruZJ3/VEXRiCIqCkmBYsmMO0VDqYZXMa582YHRlZe2VFYBTwE
	TJ7urYH37KiImnS4NeremwoT0
X-Received: by 2002:a05:693c:300d:b0:2be:e92:7f44 with SMTP id
 5a478bee46e88-2be4e268d09mr1119915eec.8.1772898244071; Sat, 07 Mar 2026
 07:44:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102202714.184223-1-shankari.ak0208@gmail.com> <20260307152633.8205-1-shankari.ak0208@gmail.com>
In-Reply-To: <20260307152633.8205-1-shankari.ak0208@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Mar 2026 16:43:51 +0100
X-Gm-Features: AaiRm51EyRgRwGtUgc6f4NIsnHF5PIx_b-jwhyIQBlIfklazySmLhDMwjWCqY1I
Message-ID: <CANiq72kbVRVZCtU_9FWdPnqwOi27RY8Xr1v5DcoD6FQBqaCZ9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: refactor ARef and AlwaysRefCounted imports
To: Shankari Anand <shankari.ak0208@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 4:26=E2=80=AFPM Shankari Anand <shankari.ak0208@gmai=
l.com> wrote:
>
> Would it be possible for you to pickup the 2,3,4 patches of this series s=
o as to
> complete this cleanup in one go?

It would be nice to get it done, yeah.

I think we were waiting for maintainers to individually pick them up,
or to get Acked-bys otherwise.

Greg, do you mind if I pick #3? (USB)

Thanks!

Cheers,
Miguel
