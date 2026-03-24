Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB8D314B6A
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350025; cv=pass; b=a7FTbOwnrxf7OAapbsEdflJYkiHPLc6Ak5xPC3cyVc1sviw8+RacSwLxBMX3GkJ4DadkAgLA5IZ9gcOCV7W73gsYs9J2Q5uYfitofDf1TCsr1cZ8o6s/zLqpaVFAEeL4kzAgFJ5/ZveJ/282GQD9lYw4kqQ1CIMi5p3tRDCbGPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350025; c=relaxed/simple;
	bh=rVgUN7sG9dlUg/CIopoKvBWrOmOHEoGd3tE6n8H3eJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmCsih4FbyuUui5PqSnpPzJlue5X7WEUtWyuv+Q1LxSrBRQyIcwvDChIYJqcQGlYUPvM9EzA6+lrBYaRTHPhc3YU1V3Cw6ZdMXRP+bke2ioSDoSLPe8FsmRkba3HxuZNNqZ/fPKgMVcpDKxLOapjyCaFEunn3G/4f+CUUuOfPyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyJxnNrX; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyJxnNrX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2690928f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 04:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774350022; cv=none;
        d=google.com; s=arc-20240605;
        b=lGeODaP8RQgyR1Uxb8WXtvVt/BtJ5jS44ZNbY/95EUi9nGcFQbbCY+auuGwCWaxqe3
         RwKz58Frua7NMRAmJseW2X0O6QY4shpthMYz/QeqkAGX2o/qZO13Uux9AXPexjRZpwQo
         niaIb+OxymkugTYuMEuXITfWqaqCgUIPSjZnf8/lAIqbm2MjNq20ZyHHgk0J++hWqaYO
         b93vV+sBpcalAZer3zEbzxFVCNIHXKkKS3RUOlv2rgsvf4FbgAUK6IWCYp0hyVKUAAw3
         aA7olvS184ZC33Qh7p8bt2wbO6M44oBcAwQ7hx55SMROgY+hU1pITAv4gzZfzSdzqGia
         MfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jY/uy3yLMLv8f6bDRqU7cC+l89qOWFndk2uZeXEp37I=;
        fh=JvpH+1ECEcl+PiWUOXugbW8Ybo57VD5WdGtJYlkkwGQ=;
        b=IK0A/tGZ9SVcE0ZvGdpMJo0duOEY45A1pX6owqBLRDnAkP9bMffX6BYD7hoku5dW37
         hRg/r3k7smT4/zBE01koI5TwHxwBeDScNr2g/o1xlXNpBE9LjWiQfGBQ2LC/S7RNOop3
         Bra8aazKovoiJK+eAsPUIZbX3UjY9BRLeoNkYJYz34EKYBqNUsotSuyws/a7k0/puyD7
         OliA2/TvNMAlH/aIzUmfb8xAu08KMAx5LmvQOzprQ+zB7VLFxJfnEu676YyDmyhTOpvV
         9xi9sj1QwariXK3kv1MH5J/Od5X1m5ZhGbgOZ1gwfu388/L9Ro9kYEu50YTOKOz4fb4E
         UGiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774350022; x=1774954822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY/uy3yLMLv8f6bDRqU7cC+l89qOWFndk2uZeXEp37I=;
        b=OyJxnNrX0jwsf8tZl21FEP0dNcJ9HP25oAvnkrOJ2V4MEPyE2QsDKRCSwbQolmr6sD
         UgC375+MqkIvIJ7ZqtwleOz9pKbKyTm9Zateb2MhQb904WIu40gp3KX3Y7xXCKwBjGJA
         msrhpbQIoFfSBTgEn7qDJFhuwiLwjq9uRsvU6Z4RP2dZ23SyoHN7d/EXcPbRcJ6196z7
         QvU2SXJFKnI/k5x/+lZUFAAeHaIkHUxcsKrEMQOi7ohVN8w30A2jfLGbZ6S3pA2uBXyx
         vI6YoayhbmBMQ5RxC9kVcEXFOMvk/EtLQrS/d46LaXw1vCnsTpPGrIILEafFBClvC5io
         zW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774350022; x=1774954822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jY/uy3yLMLv8f6bDRqU7cC+l89qOWFndk2uZeXEp37I=;
        b=EA1jPWZDikol7MFAmDVtntFWoexYxtdaWNt0G00A5clMjk2DsHIJwYN2r00S9/ZVBA
         9/HbMZTD3ubpj8IL4QEp8xSlLIdEBI48Pix7FBCSF+cR9LaB6r7OW/msEWIABBgu/h63
         Um7ODeFvVnT2qlYuQRsyMT/Lz9nPT6KkcthW9RR39pcMXrt4QN7g3d7Tsf5L5p9eeaAT
         FGcrc3x+6sWpwE9Ir1XfjQ19YhYtDqDL/1bL+B3227YnbZR7cAjI8pLAkCZWXnaJSq5c
         HMc9hLCUoeVX+G4cF3YW6R8YfMEoeEJPpPXp6CSpBE2RVqjuzpJ8dG1ZtKOW8TJxvXxq
         pvLw==
X-Forwarded-Encrypted: i=1; AJvYcCVJFZRxXx4wsQABm6BfH+uV9kDa0QFUx7Sz1KBl5aMo1DAaa8M9mTY5gJyCBCy/TC9Be8IJp0DiD8EAqBAVZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNI9D/fHrr83NMLJNu5MW65f84HKjLJZNK9g7++SDYpXC0b7rn
	Wi8WkeECJLrr93hzHS7ZkdKJsOYLZ+R0CWTV1lHgnHrSmOEQ+x7LeLB9KgZrSDXu0scKcD8iNcd
	TJAFxcmAAbYcXANuVzFK9+blx5t4eX6JfF6YAyOUm
X-Gm-Gg: ATEYQzyYCutIF6QYVBIZlfFUSNfevy2nN7N2ffID4WaYJ3Nn7w7q0DKqc8xirM52syh
	HEzN1gUukkieSAGflvf1bLNpJKJNVCqSFcAek+VhnPQTjVRanquUGu0vQ/waHoblNbGYhxP8+pG
	Y//YNuaEJRIxuvTSMnpmmvbuSzA/A7FTbBvVJo6eAs+7Sgs8mvK+PhSklfsN+NZllLldnhMYtP5
	xqS5/dBLHdstj75z8d3jX9W+Iin7h8sBGJYP4Y9dBTDuDvW81Kb6/lNyV0be92zzGZIMuqdGeT2
	dlPGzntOumD4tAAMIb9Py0PgY1eV1H+/rzlOOA==
X-Received: by 2002:a05:6000:248a:b0:439:b791:f914 with SMTP id
 ffacd0b85a97d-43b6424e64amr23847803f8f.18.1774350021888; Tue, 24 Mar 2026
 04:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com> <20260323-aref-workitem-v3-1-f59729b812aa@collabora.com>
In-Reply-To: <20260323-aref-workitem-v3-1-f59729b812aa@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Mar 2026 12:00:10 +0100
X-Gm-Features: AQROBzDRZFY5heMoUsmb4VM8gbH0UlAUMB94X-WGOk-VF8eusmXF_LNO71WO-WY
Message-ID: <CAH5fLghpT9Sgs621=vCT8_i-ZqkZe0=HY9Wowf1h8cnuCCBegg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: workqueue: add support for ARef<T>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 12:27=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Add support for the ARef<T> smart pointer. This allows an instance of
> ARef<T> to handle deferred work directly, which can be convenient or even
> necessary at times, depending on the specifics of the driver or subsystem=
.
>
> The implementation is similar to that of Arc<T>, and a subsequent patch
> will implement support for drm::Device as the first user. This is notably
> important for work items that need access to the drm device, as it was no=
t
> possible to enqueue work on a ARef<drm::Device<T>> previously without
> failing the orphan rule.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/workqueue.rs | 85 ++++++++++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 79 insertions(+), 6 deletions(-)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 706e833e9702..6ae7f3fb3496 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -192,9 +192,9 @@
>      sync::Arc,
>      sync::LockClassKey,
>      time::Jiffies,
> -    types::Opaque,
> +    types::{ARef, AlwaysRefCounted, Opaque},

Should be imported from sync::aref instead. This is using the
deprecated path that we are working on removing.

Alice
