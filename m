Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C9289824
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 01:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762566132; cv=none; b=sBqM/kctGqK/yxBFB3VPxznXsaFs3yW9hkjQm6CQ4AeKPonkuCTe56F/OY/M6BNr3DXgxz5n6nT7eSjUchxxonWVK3IOukSZFBq3oGAXsXzmYez/2yLlVA93dgMjsEneoGgFPh0QqVV2CHW7bos5g9OgXPH14tUJ7WojP4eKDlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762566132; c=relaxed/simple;
	bh=3WeD8Dmnp9s0W77pKxc8e9Dgz2UhqJOcVyjDFyEoOoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eea05qMQldebMCdKle8ZJbVYYMPsyJc82U47+tn0UCzXCaSHEQSJo5idBiZ2WK3H150VMXBmSTvd5w5WfG+D8HoSJlGPvpHf5uD3oghaDrn6A1HK6aDYnNypmYKlV636vpZl63or1BbULNEJ9vmW4TArfchRJ0ksswDF6QE4eeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3A+kAG8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3A+kAG8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297e2736308so281975ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 17:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762566131; x=1763170931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQh/QKgqiWY0F/kYR0/DGTjHf4GdskWgqiVXYEvWpmA=;
        b=K3A+kAG8+6llaTZn9u6Gjtdnse6Z523u0yR53Dk5f5J52Qes7XoDSciq35qZ/NAJuH
         teDQVKxC8qz6ai4K/uji9IfR8JQCqU9SKU1ihXuKl6R/ezLusVLHN2CSowcuFpCrcFRM
         SVtSOqvE3yZCQNYqruewxSLVoTHbY0mapTKNS21Nbd6aR8hhhnfUesnHoR2t/cpGz2pd
         H6rlAbasZhuCs/QMHhQDoad3PPB+zV9MtBhVSo/pfvW0cU+TsY6koXBKb94clfHtnLBW
         AlXU6VLSQt3tfXHIvfKlil1Ml72RyadxNo+D0WFnnUv01IKxj53MX4YpeLbZYKzNpstH
         DhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762566131; x=1763170931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQh/QKgqiWY0F/kYR0/DGTjHf4GdskWgqiVXYEvWpmA=;
        b=QvZmdyYsw6sa6tYprYlY29mJytlryoEoFBgHTKjsxfn6XH3F+gXioMMK5Uy3AXsUBi
         ZR6TlE8wWV8cAQ00ADCuV9tYAyeDz1mOt9InAf2U/rxIAQaNoUiX9Pa6sNmmxGb7K/mV
         W5R3BX7LPPKJz7oIZzdhp9bDa9JY4t2bC1JVmzeI/cdIrK09wHLMqYESZ1OVUBRix00i
         Khu8XkYJyKhAdLqs4GvSD31vALHBVBDquvd0DFOUTQfK37klNr969J+QUOh6B/OpcChA
         7VvKZspo39w8tQGttrmBtSRFbl0w2Vph3AVKozEXyjaG4OOUglHD9uId/rG7tDsNLVy/
         XaXw==
X-Forwarded-Encrypted: i=1; AJvYcCVJru2FY4JrIJV6l6eEuYQIuPW8KHdzVXhL6pgFGDJ3lyyQ4K/pAnqrtqYwGISa6zPDT+Cr2ouJvaQ54tubxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xiAfYzCWwN2MWG+ISyineIOCYG4VFFFVwGIHusxF50H4ZWG3
	f0i3yj53EIZE99cN6REGDYHufIjsu8OPFhCIZm9eFXu58GQ4w61QHIgf3mw75mHCSvlCwxm5Z9Y
	GzDZuS2eEiYllu7CHpil4mfIBaz0al48=
X-Gm-Gg: ASbGncuy5sbca65ShO7O4VnUtOoMlYdfTSOloaekSRg8ItP4stOGP28uZ4ZklaZpymO
	28oU9iQYndSWUIVU584/hq3r38pZvSo4Oa2xm+EPuShLEKWX0FGJGuwJwN2RRiHi+3o6e/NcoF+
	+aif1xnaf3J5uroBPUo6Z4tOU1HAcGHt3+yxSa+T1bkhpJmmJTqIgm+AyFidJoWsJ9mfNlTT/0w
	9F+4trSg/4fjN7wRJFv9objCT2yD+ZYPKZIvdg73W9FN3BhZ3Zdqkj/nYFe6UJbZ2LdyhvtJKuL
	eBBUBeb/L0Feq1oBAtE9ta/wYxqdB1V+5xZWbsEqPuFqU8TqqG33SdvO3rLGenweHJFbaeIqWqU
	xZpNa8BGpkZW4SA==
X-Google-Smtp-Source: AGHT+IEAGSzfMOpxmrbolmpong1BxR+uMm9NBIL1bBLX54yYMJG3qLRQsxBO1D2dsj3UIE4/5YdndA6SaL+W6coRSBY=
X-Received: by 2002:a17:902:f683:b0:297:d825:bf22 with SMTP id
 d9443c01a7336-297e56831acmr7380815ad.5.1762566130592; Fri, 07 Nov 2025
 17:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com> <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
In-Reply-To: <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 02:41:57 +0100
X-Gm-Features: AWmQ_blv45UTCFAAWu12yAL46MeLrGuBV1cf6wcE3BtvuHynhWIUHkMp_cqIowM
Message-ID: <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 6:54=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Bisecting nightlies, it seemed to happen between:
>
>     rustc 1.91.0-nightly (12eb345e5 2025-09-07)
>     rustc 1.91.0-nightly (9c27f27ea 2025-09-08)

Ok, for reference, it was upstream's ab91a63d403b ("Ignore intrinsic
calls in cross-crate-inlining cost model"): the object file stops
containing DWARF debug information because the `Default`
implementations contained `write_bytes()` calls which are now ignored
in that cost model and so everything is essentially as if `#[inline]`.

If one generates the bindings without the `Debug` impls, indeed the
file stops containing DWARF even in Rust 1.90.0.

For the moment, we can just skip `gendwarfksyms` starting with Rust
1.91.0 (sending a quick patch for that), but it may be a bit brittle
in that new versions could again re-introduce some symbols that get
exported from that one etc.

Sami, would it make sense to "auto-skip" in `gendwarfksyms` itself if
an object file does not have anything interesting and then remove that
from the `Makefile`?

Thanks!

Cheers,
Miguel
