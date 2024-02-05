Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5E312B92
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Feb 2024 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707126333; cv=none; b=ODgVwOU2VwynkdYll+rYoB/KIGDsQG9vovGbFFW9JIIae94i60nZZVYgKblOHIMOgNtaWOuDGG7cjrIlnd6THu2XgxiuZpRPvx4GFXBcpx6rJEDa2Kfb29ahOiBn45aIsjo4j6XGXIN/w3zKd+LCrvwldrkLCi8OjZ+wuoHbXq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707126333; c=relaxed/simple;
	bh=wdhdIt3ccDUDuBGqbmV/fcT+Y69+ORShwPwCmRVvTcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGv9HCKiaB2ys7tyIbtH8JCnCpPn8XsWa1gvwhIvuBJyK4gvfL4E6tclFPmHj4tuFxGi8Z/rrqPou5JQThNqg0W/3hE0QMUw43MgYPYr5fflgb6A0cZM8X0LKSwrb96D3VVD6lKQwOSNQ6fwJeNiwF2LQpNg+2T4wkjc036u0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m0APugkw; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m0APugkw"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7d2e19120b5so2201852241.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 01:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707126331; x=1707731131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z354V4vEoB2vQoq4f/3IDxCUlv/Hk9MOyS1c6kY6RCw=;
        b=m0APugkwSQzpoiQ+KCKGkTqXW9wipiKJ68ITN/MYPcxZCfQa3XnJQkxiXry+2SRBLb
         NZjMeop/QSob3uB5vWPnWN7jxN/uRv0R2gzcVw78prJ7wcjYpqxvSxBwFFunZUAi2xw5
         aUy6VQ8F9EpsIDMgQxJZ8zifXkGd6Oahvcwoan/xoKWpICr6Wy6KWkuic2hU+XA3YDxN
         BbfnPXfSUZF7GJNeu1j1UpUDKhScUwjvhvAcYfHwCAwytpCj7xp99dtxOu01sywZ1gYO
         l7SC8aAqM6pAZVu9THzrcpr0tOH3MpFUYqlHklCyIXWEFjlELr5yxLk9PXluTDN63xnZ
         +x9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707126331; x=1707731131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z354V4vEoB2vQoq4f/3IDxCUlv/Hk9MOyS1c6kY6RCw=;
        b=IAuXHBXlzkVmj7E9gC2qXXuLcVbhVxArjw2RKrCTkOrRMAZumR/HfDOp+Lq66CDvHx
         yWM92RmV91ddeyQyieaxkplr2vb6pcOavAOd3nleeFHs+ztRbMhHu2P2S78lGtpPTWnY
         NfJCt+hV2Moul96dxKwzX2QFvBbLMBRBMKqxGDh3pnPEdINrotu00dvPDjBk3KTolccS
         qKtJ4fnWjNutIvKTh1rGBBbsqqTGhmo3iy57mB71M6hMfZnzvtuabWkpSWsvkI8SoKIX
         votfWWruWIQAnlmICDdVykWCR7OT2X66cel+bIXg62Smx6JSzxGhUB5YbX2fJV761WxR
         fEIA==
X-Gm-Message-State: AOJu0YzcfYcBTgpk6xiq6YKDe+/kesq2IWh95esGv2CqaveH1jZRq0lB
	mkdB3Jup0/7zU2EpBHk5H4hBjeLZskGY9pHj9P7PjNX+dQI3pS5Gt8KasP+ZfCQ12DvhSagpBVa
	6g2sVRjC79mmkf4xJWwNPBBKfAzBOLm7D2Y/9
X-Google-Smtp-Source: AGHT+IGbZjcYIWy6yooXUMqIWO2GjzeYkCyMDKLbYH1vMmyG6XPQAd4sTSD4gPKdQoGzdRx4NxBRBNMS1C1KoF6oP00=
X-Received: by 2002:a67:b345:0:b0:46d:fb6:648e with SMTP id
 b5-20020a67b345000000b0046d0fb6648emr5406468vsm.8.1707126330842; Mon, 05 Feb
 2024 01:45:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240203182735.295946-1-tahbertschinger@gmail.com>
In-Reply-To: <20240203182735.295946-1-tahbertschinger@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 5 Feb 2024 10:45:19 +0100
Message-ID: <CAH5fLggUe-O8Zh+y-Lh7pquRNEWsEorkoT=xXjjOC-Cp7gcwyA@mail.gmail.com>
Subject: Re: [PATCH] rust: place generated init_module() function in .init.text
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 3, 2024 at 7:28=E2=80=AFPM Thomas Bertschinger
<tahbertschinger@gmail.com> wrote:
>
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index d62d8710d77a..d09be1bee397 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -225,6 +225,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream =
{
>              #[cfg(MODULE)]
>              #[doc(hidden)]
>              #[no_mangle]
> +            #[link_section =3D \".init.text\"]
>              pub extern \"C\" fn init_module() -> core::ffi::c_int {{
>                  __init()
>              }}

Perhaps this function should be made unsafe? I don't think there's
currently anything preventing safe non-init Rust code from calling it
directly as-is.

Alice
