Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575EA1D6BB
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783865341; cv=pass; b=khDDOBxaj3ZBkCs5alohST8zjycp9G7OOXy0v7OQruU9OeM4XLSJEgIFFYrX+ciQYjh9Mn6YB/QTd6P/M+ImRR4GwRL0UnSOqbKpEqh+7xywFn0/B2UPO7UaxnjPf/NzXB+uXsZsrslznrM9K5We/99u7zd3F7Xzkelc2A3mSCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783865341; c=relaxed/simple;
	bh=OhN46kwiJyID2xs9srGI95r/1ozLnBdNV2rPzyVcP4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0Ok4erRfzO5VBYstrrc5whjJ7Qbq10msk+oH2uzAMF//ltWMygqsk6fyZPgq+VRz/Px8J3Bqsshosly3SYtbo3mwIZFvLdOzFS0yGDQHJlWaHv0UQAxAjKLn/QV8VRq9zzfYNQ66Ih91Crt4qPYvj6DJXGYQw/azVLVj553jMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B1RQ0rNG; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B1RQ0rNG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de008b020so1130000f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 07:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783865339; cv=none;
        d=google.com; s=arc-20260327;
        b=V/qGCWLPgTLx5uIg4lOPGDXnpvRcTM/nkcdI948S8aC5fUQtfEMGKRb/a/FzzDT893
         GYw/zcUUVDpt7VxxVfDHyFJH5uXjaluG22Gkv0vEcgKVnmyiy8EeX8PWguZnFDHc/XJq
         AF25E5d6VjzA9rwG3fPE3+hYflVBXxtjma5X0ei1G7ln04hyQibHJYV+jm9m4EffF5Dl
         97FX6fcmCZNW/RnA7r4kXzqXprsAtKVgo6OoAiC/7vuxn+kYwfdCQCXh/4pT2yqQHVQL
         cHs43DArLKfyH9K8uPATxS3uNOpir/XFtbhvmtc5619Bjv365cs80UkyZhJ/2pDKRoVx
         92zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OhN46kwiJyID2xs9srGI95r/1ozLnBdNV2rPzyVcP4Y=;
        fh=WbTYd0D4DXdHADVHX27ShZT1JwikXUMQODVHzgJJ1Wc=;
        b=UWniG4bodqC2dh8u+f2C/BgWXMiLsohraMLSUQFE+YeGvIs2ZhBlm2u4iW1+2T8Zj4
         8w6h8nxKlvwnEFGsIzmtWYExVQMzBB1BLhx4+i7fAfH07zjfXKMLAyz680FCM6YJbGsA
         m+52x1LoSQ/uvQcXjXQXi0OTkyGYhypHrpGP200UI2cpa7hTi3fokWhgcqEiDmDeRQsC
         Ytd/Id8Lo0rjL2suTHsr3whPHPq54ymkwYewBhcx+PTmFVvy1JX04/n5SQcv9yEiWU+j
         NltEBOOB3u+oltygeQRWSqL2l5hax3K2tWx6uLM5XXBB0Z7AbQZcgWq5x7Q15JxQs0rj
         Idzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783865339; x=1784470139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OhN46kwiJyID2xs9srGI95r/1ozLnBdNV2rPzyVcP4Y=;
        b=B1RQ0rNGcd8NM4ojbGn0OTF7EfTAXXSB7deMo4qM8ztAgT8kKjaLPNfcHofh5vZoB0
         ze8GMpnhMSC0ZwCbnxwfSBJSQKeJxTTPEa3oBCprpxlhqv4eme6BfjJw808zKawH1bu5
         mDK/v9YyYjweCm9ovAaQaQjFDQWX9Yv4YG6iu4Rjoi5V1J7pQYjujy00PiHvwTBFCWp6
         A9aUUsPEk5QLR+CRC1o/vIOeVOo6ODXAZ1j/cqQ5BWPBUFNYlsjI9aCuIho88NgdNUBf
         gdAvgKHUEd6F2Zg3xJNzCK36EvduuFK+0YYyER+uM715kDLHMQIuO7EzxCvtdS2xsY/k
         QwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783865339; x=1784470139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhN46kwiJyID2xs9srGI95r/1ozLnBdNV2rPzyVcP4Y=;
        b=e+b0VVmEpKYl/gvRku0Sr53lVt/nIhu08bvdCdq8JOXISEgcTRWbQ6JaK8LMUcr9mk
         3U3DdLpnLmzAK2HAOPKgdLZeJgXAoXBJmqwMNB2tsNw6qaLQcb7Pl6oxgnoAszFNikKs
         bK/iVgqXhRQd4mLm7ERLcZVWbStWNrs+EQxHfWpwDP+vZg4aE/ZhOXxBLnPlzj/7l+KR
         zgygeuxEfGseVTRK/4pStwDl9tKqMhBv+VR9f4Ark159sUZHLBe9hbvRHmpJUlj32v5s
         nfXVJ17W4DMcXmt6TyiRiB6ImcQbWX1M+E7TTK40SHC4lBRSR3UCX8QOgJHzGEvXeFSp
         JAvQ==
X-Forwarded-Encrypted: i=1; AHgh+RruowrgHzweeS77yMH0XgO1691VaM0WW/oA2Gcs0z6mUZ9ITFFKdcdXkrmk3rpr29FolprmFT6MXvxEYv0JsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0OiqgSIZbztadlByrAXEkR+q3a1VTRmu5tOmZYHN6E1VbrJDk
	gNwKjbQoD/Lndyf0hzrKZNh1iJzt9sCj76XjQXN3HFAmRaZy3ZBWmSKx6UvAsaMy1nYrGzQnLpX
	T6EHwhNbv8qYuX9lVt3Z6/za3y64kghGHHhl2Dtsf
X-Gm-Gg: AfdE7ckKDHmSYQGPQjLlNCKFetWodzOtO7Gx8d/N2HxkIbr1f5EOxDWeZ/FKxawTMfE
	NE7prb7wR7XK20LVbGWsBwrEeYUmg88hr3h2aFj6Wq7xTCm0hRJekbJ8/6SpppP3PCzFBrtCq12
	ncgavT6uHlHa2hGONesaLdK/6Jc0yoZpFw8q4aGsYANg3+RwwIKVdY3NtfNgkL5twr+hNc7s2Hi
	s5cgBO08eXEI3qfFg4Af8lX9rws3tvV+Jm3xYJcXc4HpDNlWdF2JmVzsNfXBEX6G2XSXfLJEVtF
	5W381y74yoz7+9TjS3Va44nDxmI=
X-Received: by 2002:a05:6000:461c:b0:474:a0a3:df0c with SMTP id
 ffacd0b85a97d-47f2dc86345mr6255714f8f.10.1783865338431; Sun, 12 Jul 2026
 07:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712-docs-drm-feat-render-rustdoc-typo-v1-1-c9df1cbbce4b@younes.io>
In-Reply-To: <20260712-docs-drm-feat-render-rustdoc-typo-v1-1-c9df1cbbce4b@younes.io>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 12 Jul 2026 16:08:46 +0200
X-Gm-Features: AUfX_mycHM_jQkgK2zFdp4Z2txwSWvgYY48UKO-G0U06UDfohdKyzRcwH8XJmjI
Message-ID: <CAH5fLgjHSU023AO5SWbC9qtNsLd70xQZtSq3-EPdBU_CJOPJ_g@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: Fix typo in FEAT_RENDER documentation
To: git@younes.io
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 3:40=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> From: Younes Akhouayri <git@younes.io>
>
> Correct the spelling of "privilege" in the DRIVER_RENDER Rustdoc.
>
> Signed-off-by: Younes Akhouayri <git@younes.io>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
