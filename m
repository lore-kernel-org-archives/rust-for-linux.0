Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D98B18042
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Apr 2024 06:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713765916; cv=none; b=H7as2jtxXRI6XkBwjKu8SvwBywSL4Ve9pLnL2iWGwAeO5Z3z9m5Fv2S/IyKbsXPp02vbYINXCl48aNXtLVMFAxbusHfcb+e/MPzdeQfv6vI7ep00aDVkuur16UDZzRyxxSESi3nN8Kp65CDGh2089HGCGWJG5KYEhvwYUd3MY+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713765916; c=relaxed/simple;
	bh=UcCqaQGJOGn25mW9CRnUnp35rW9WIvdAR4yCs+VCGDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYbo0VWDieRWohelFadewzeT3r7p+w2vAPj20uSJXM8lXT3KimZA5pV4QsHWGkQuEjxst7UIeviLZVZP6tJABE8ooz+gyAmKyFrLcHKzQ3J9ppcmIju3I0u6BZ5+6UDeaLKuRbpZC2yd3563jdkz93vo235wO30INLAum5EDJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AGzirdJ5; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AGzirdJ5"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7eb2d7f0efeso1440132241.0
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Apr 2024 23:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713765914; x=1714370714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcCqaQGJOGn25mW9CRnUnp35rW9WIvdAR4yCs+VCGDQ=;
        b=AGzirdJ5ClokpVu73Lu6fmRN9kubcV+2zYJXlgiIhuyna/iLcGXBVbrahvaRlHm5NT
         O8LNbIhgcClRrLcI7bcUz6Jfu7rVc3YJKUQHtJP2fwAHAzJXxdS3sQ+WDzsctzFLZL9H
         CzgtWpD0TKeCff+k9zQAkORJqwrdoyscknRANIYMeeSxQmNIyOafqkLdtbNmH+SKUZ9a
         Sn6TEOW0Lbj02xD2I5Gcn4MQjlVrbBF+mZ0dfev3ttWLZ/8umRLTw63qfoVbOy8xAg0H
         lLhqPRYcXMrR2eJbRHMqs0a1Ju06CpbdV9EEX6/hplMrxlbonmDvOzya0Byi2jJikF29
         WEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713765914; x=1714370714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcCqaQGJOGn25mW9CRnUnp35rW9WIvdAR4yCs+VCGDQ=;
        b=DeEW4log+ccIIoilFU3e4ENz8IF4LOcA/DfY774hIe7/u14qlKASM+Rh3Jn4bH4K+k
         7niDECZJ/G7vMPzIzzjo2THebQJCkHNgOogM8H69KNIRstL3Gqw8rc/3NAGBSCnPCDK5
         F3grj6S5Jp5hBfMLtIMpl+dwPmLoT84frMYNBlBhn0xBJ5gBBnOCU/WjRT3lK94ZS/4U
         cQfCEOHEwYnuQLYA803EOAqz/bvLBD+FWdPQhrpOAD7k3JNxvqRWMVOZ5IPlE8LE8ZFi
         +D86sq+SSXF2lk0oM92tNFFCbuWvK13iStDcIKfvTC8XuedsXgSGzMoEjKdvqxkW47zD
         yUBA==
X-Forwarded-Encrypted: i=1; AJvYcCUsoSwtYrVjM94WwW8bKLtaIUc3l3xw/oRxTKIU3GYai3teuTFmjuSvwG9IX9c9+KNHmAoI870uDdlINbM4QnKIs/XC73u3Mecvh4FUelM=
X-Gm-Message-State: AOJu0Yy1IOpnDBUthmFj165Wgy29ogNvGxvWw2IWOhq5+3akPE3EnCsp
	vdWgN3mZilJunJ//syAE8KPlOCkDKWV2fY5rEicCF7x1OX4lkpIaap4IvsTlrZyuRfK1iAg9fFM
	eOs1ma4AfZ6P7HKXu94KLN5HUaRIEWsH1KXHma3tZ2P0goxaeGEsC
X-Google-Smtp-Source: AGHT+IHI3zt+3i4uJYKhHnfJdDX9OWE00AHyt9ryuxOdsiSVdYpfJIkQxpmPqhGS/JDdK1pm3iL6i1ztrUfgFBkFAms=
X-Received: by 2002:a67:eb89:0:b0:47b:ca6a:c5d9 with SMTP id
 e9-20020a67eb89000000b0047bca6ac5d9mr7226850vso.28.1713765914054; Sun, 21 Apr
 2024 23:05:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419215015.157258-1-aswinunni01@gmail.com>
In-Reply-To: <20240419215015.157258-1-aswinunni01@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Apr 2024 08:05:02 +0200
Message-ID: <CAH5fLgjqQ-7WqdtZVwYLZpZc7ajxmfoWoE9=Jhtx-AnV7YTMqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: remove `params` from `module` macro docs
To: Aswin Unnikrishnan <aswinunni01@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 11:50=E2=80=AFPM Aswin Unnikrishnan
<aswinunni01@gmail.com> wrote:
>
> Remove nonexistent argument `params` from `module` macro example,
> because the macro does not support parameter list right now.
>
> Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
