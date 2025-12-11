Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE32E11B8
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765491026; cv=none; b=KYr663LR7gxFW5sjkNXhCLag1lB3er6LsJuUkKYkoHZYx7/jK6Du6n3P37AhBJr5ekF1T9xKmljLJUzI7DfrCu/RBKQ0VdwvhUCfjNo60MiAuTr7w8rlJ8Mj8MqA3s0o8yP0xCaQ4KH+GOPd4CfwZL9HlgJo3eBAhvhhfQ4gQw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765491026; c=relaxed/simple;
	bh=DRrw2mEFcasOCUpxE3z89bZ0+erUgaOzx3WZhCZMjA4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nu4gs2ad8YDaJXZpbwej9wTiyhLrumy70v5AcmGr0g5rcBxspr1Mod9N6JLuMYwKkUcNox1Q7AltI/I0O2CryZH8ca6sterNVu15Qq16hs0mJjKKHsQE8DbSP9Y7OJVubtywHAjMvxiuEPHip152u+3ZxWMOQGeDXZKCbSPtNn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WQlYr31J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WQlYr31J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765491023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRrw2mEFcasOCUpxE3z89bZ0+erUgaOzx3WZhCZMjA4=;
	b=WQlYr31J9+DfHBEXABsbaAdlzl6OysVjKum856vN4OCRsQAS34T4bd2ksjlveurEHpMe4F
	VuadNr8gP7ja/zBtDF687OlvYUnh8NUKp/bvYHolgJAYHtoqmF6E1o+M+OnahxFIpxZWeP
	h/2Vt9omDyoJ5h+0MXsv2bZHdcqcmBk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-wtQjjAGpO9igubNK1XVzMQ-1; Thu, 11 Dec 2025 17:10:21 -0500
X-MC-Unique: wtQjjAGpO9igubNK1XVzMQ-1
X-Mimecast-MFC-AGG-ID: wtQjjAGpO9igubNK1XVzMQ_1765491020
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42e2d5e833fso260964f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765491020; x=1766095820;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRrw2mEFcasOCUpxE3z89bZ0+erUgaOzx3WZhCZMjA4=;
        b=UYANsvgo1UtzmhmHkzxaNdpqHR4R+EzmIjb3A48BB+SrsiDWY1YI//DTcIKk2Az25U
         v9qKVofID51e1Wlorw5ZrKnGeFgB0ggQ2K2+tA7U+BmDF9imunWajolkV0jM1KgaAldQ
         WmBsphj+SpocGQIQs4Sl4GktaVCx5DHigE5vEQJu2b/4oke2kOo2zp+MheV4OzXCrFmK
         cxcxeM4JtfFQApjR30EJu8WB8KM+aIGaElI+G0UVwk5nbUAUVSRI0SwJhgh2Q0bNmL2P
         ya2BS4984WRssTOblavvOfOG8oRTYGRiIs15ff5t5hMYWxfKrQ4cRLKAsk7aDCipStGF
         0B3w==
X-Forwarded-Encrypted: i=1; AJvYcCXJBDIvD5c5v1Ztcv9ngBPSWv5npZigkHT7KHknRTu+gOK8cLjLcQoy/S3mh509ppbjy6X+hORXlDqc4FsjHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKsci8li9tA57O53X7UBRwlQfuxCvva1WLP1hiM838n/OEgSL
	W3EG4S4PyPcElmV3zNQQE5VokbaoPtklhm9jIZyJYD+MyLhJLhtfJjT+SlXxuD2ZZDzv2c26N7n
	C8sjedCywnFmXeT20dYIrn3ZOXLZIrF6kdCryiWIz817R9XjInBG215q1MVxF5/UjUoE4
X-Gm-Gg: AY/fxX7DBqiuRba4JFhJpt6oIgyphbBdQ4bwoFWZo71mrWin3zFZZ3zjY8acAKZQLRB
	Qfd7miuOHup/5Nh0GlrUYn7JlKVF9W3gSXwcVJ7c/b4iCf7FKQH8Cimw4EJVbK2omWGiRvZ5mS5
	N6he+iGsjBVzRtjn7faFvJE+aLl62f3eSprk7okYRxPfVYx3KZzQBEqc/upBbsTzeoUG7WS3f/0
	z/TVN4K6AdspR2w7fO8bGxkZTOW8TJmXl5m7IjDHBb/nnnEJsPOu9QcnTekoL15y9N9SHBL63Oc
	g3jC/wKFm7YON2d1lLzqCs57RhxCdutviDeKRP5w6y2iiweedbVhA/EyekOTUNv6vOfInDwuYl9
	pI3q+Xn0IK9u6PYvvGQUShHvbdh+dGix/2Ub4xYQSh7bPmO6YseOlg2E=
X-Received: by 2002:a05:6000:1ac8:b0:42f:8816:c01d with SMTP id ffacd0b85a97d-42fa3b1ef32mr7586038f8f.61.1765491020507;
        Thu, 11 Dec 2025 14:10:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFusB0V2Lib9x8KFjWMKFfd38tMcGVkGiclpC9vpvKusJCxtLUq3Q5ZipoVVIeu/ntr7EJIkw==
X-Received: by 2002:a05:6000:1ac8:b0:42f:8816:c01d with SMTP id ffacd0b85a97d-42fa3b1ef32mr7586020f8f.61.1765491020099;
        Thu, 11 Dec 2025 14:10:20 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a665e3sm8220590f8f.6.2025.12.11.14.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:10:19 -0800 (PST)
Message-ID: <678b25aba2bdb2e08818780f6ae16470e83fb8ff.camel@redhat.com>
Subject: Re: [PATCH 9/9] gpu: nova-core: simplify str_from_null_terminated
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:10:16 -0500
In-Reply-To: <20251208-nova-misc-v1-9-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-9-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rWbU2t39ww90WbeqWXjHoqniSlAUb9iThp-R32qzUDM_1765491020
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:27 +0900, Alexandre Courbot wrote:
> The core library's `CStr` has a `from_bytes_until_nul` method that we
> can leverage to simplify this function.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/util.rs | 9 ++-------
> =C2=A01 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-
> core/util.rs
> index 8b2a4b99c55b..2cccbce78c14 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -2,15 +2,10 @@
> =C2=A0
> =C2=A0/// Converts a null-terminated byte slice to a string, or `None` if
> the array does not
> =C2=A0/// contains any null byte or contains invalid characters.
> -///
> -/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null
> byte can be anywhere in the
> -/// slice, and not only in the last position.
> =C2=A0pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str=
>
> {
> =C2=A0=C2=A0=C2=A0=C2=A0 use core::ffi::CStr;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 bytes
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .iter()
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .position(|&b| b =3D=3D 0)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .and_then(|null_pos|
> CStr::from_bytes_with_nul(&bytes[..=3Dnull_pos]).ok())
> +=C2=A0=C2=A0=C2=A0 CStr::from_bytes_until_nul(bytes)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ok()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .and_then(|cstr| cstr.to=
_str().ok())
> =C2=A0}

