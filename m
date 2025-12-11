Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F55D254AE1
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490840; cv=none; b=QrB2tQpotnScWDGS6bCXu1mPn8EP8eQ0bbFEDFJbXdVktZkrFM6QRAbKgFDlNhMiH26RsMsi7kblSnrhb/Z07pa7OO4sVqDa/3LxCcZDsx4ytu3ns8jCeG+BrDKCQ7v5FLwX84BBIaN33UWcoFJbLPtxY3Vk4edMpB6IfUPIkHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490840; c=relaxed/simple;
	bh=S/yt3h0LA2CQSgeXoj4ym7AxrOljIdTgGQSxKRVOCsQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ncc+tyvjXRaIm8j/Ti5ZHcMXN/ATIGPLKG3RN2f2LqvFfK/Qh8FFGoHJzSUHFw8bO9IWZ+6IUZBWgW1r1/2doZDpIkCG3yPc5NP+FOMbiBiDV3WS2N0t3N3UXTNP2ZfyJ2JzwGifTKSxB3YC+e7+/qXwe0EVWlWzIpcoTxBIpz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TwHsRSIs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TwHsRSIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765490838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/yt3h0LA2CQSgeXoj4ym7AxrOljIdTgGQSxKRVOCsQ=;
	b=TwHsRSIsJ6s9Kt5a+slTqyEicycgAovhxYryD6RFK6t6FA7lm3km1WjGUk9l/DfM+VKecs
	W7ZmVmafXBnblVboPWtA/Fz2jAHSwOSMsxnBC0fe9eHi3jlfh+NKIGMHt4Y0o/srqY+y0Y
	5/t2bYq5P50FYJbLxtaZ9Qg7gI5YxdI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-mo2TxTIINjiOIBrar3z-0A-1; Thu, 11 Dec 2025 17:07:17 -0500
X-MC-Unique: mo2TxTIINjiOIBrar3z-0A-1
X-Mimecast-MFC-AGG-ID: mo2TxTIINjiOIBrar3z-0A_1765490837
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88041f9e686so13770946d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765490837; x=1766095637;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/yt3h0LA2CQSgeXoj4ym7AxrOljIdTgGQSxKRVOCsQ=;
        b=toCD/IGXLv0Ey20nrEwnePfRXafafwQBoyfxKW5K0INC0vS8fyZJWBp7nd/ihAvxmq
         LdXtCQoaGY07zZ4mpv4/a3z4BTCW8rRo+nhLfMYFipp8U3PoxQhQiSrxGkppITtuc+io
         JHBDLsQfnGAN/7WxV1SK8rnSHzGPOxA//3q09DxUD3lmmct+tziIeMFMGx42VdS8ELgU
         m8UguJ67eyP21oQlUUTWdqoHupVQztflfbdYsSLfXl6fRKneoH3Z7myeeDPMzcV6KygC
         /qizKQHnffvRzMItOPflA9upe3lEt/KxWbe2G8ksQ9jnrfCx3ted2S5lFr1XZLnJ9TNz
         2rBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWswf8VIcLfgSo9KC+gULj1f9kadgcB2K3IUykty3N26q8cjiioeHNFlrLqB+YZdTk+4ijRcnZ6FvfeGXxaFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsT0cR9PL7juNYyCCB4df3Pu+EsPlxe32M9mM7eHSx2+elkv1+
	lWjzGjiTTw8dEARJCm4iE5rvx9UIdGorNPyjvUnTUf0y6yd2gYzzKRGMGLQDlcmhBdWTFz+9zuN
	RiSg1N4fxI9FJhehy+1F8FIiiDNNujCboN79k45TnaS08YWRE4wjdJ/agDGh4bsvHXdCd
X-Gm-Gg: AY/fxX6lYx3gmPADce74I5cDkhdVMnlG9T8n8Ip9G83iEBI+6zs0d6F/Dbd8k7qrVQh
	MEbB9sNvXP3jPCgFQQm1yQ7Vfh2G3hXh1v4FEhJhgJEK/6O/qL7uQdFyb625nCCiVwqkW7pCqOE
	Bp5mMDXG9YSMG2gV0H+xvKB92aIK7MZAYaYZn4/jGnv6oew3pF+gSi+PkJIdTSfHkzmq3orDWRQ
	6io2Ku14C46gzVlN7TdcYhFYZi9QbGoQLOnTf6Qju3jlneF0sfht9OvNAAcEA/WCq26b0t/pspo
	AfghA6eSQqYhE5UGFGp6ic8Fto5NG7b5Ql84Qp3PeD5i71ZsA5+8P8esch57JJQ10aSQuzjCx9+
	5S8kxEcwtO+92KfgK0xNXxyE4PIj7D5SrnCMrQ/w5sSWyE4Fq8iOdMow=
X-Received: by 2002:a05:6214:1247:b0:87c:27c2:2c0e with SMTP id 6a1803df08f44-8887e7f4717mr2002936d6.59.1765490836924;
        Thu, 11 Dec 2025 14:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpL7P109j0TrrJ6OMch/eU/9skpG1csWeSXfbkzBfpFzWr1R23nHPE1F9w7iK8jbzWzXkOng==
X-Received: by 2002:a05:6214:1247:b0:87c:27c2:2c0e with SMTP id 6a1803df08f44-8887e7f4717mr2002536d6.59.1765490836603;
        Thu, 11 Dec 2025 14:07:16 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ec56964sm31777496d6.21.2025.12.11.14.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:07:16 -0800 (PST)
Message-ID: <a8276c36fe1638cc584262d0d722623987deb1ae.camel@redhat.com>
Subject: Re: [PATCH 6/9] gpu: nova-core: gsp: derive Zeroable for
 GspStaticConfigInfo
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:07:15 -0500
In-Reply-To: <20251208-nova-misc-v1-6-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-6-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ktxLPQjLUSMIvgwklMrpNrTN6jbsRu3HA5n7_1jPGA8_1765490837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:26 +0900, Alexandre Courbot wrote:
> We can derive `Zeroable` automatically instead of implementing it
> ourselves if we convert it from a tuple struct into a regular one.
> This
> removes an `unsafe` statement.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/gsp/fw/commands.rs | 11 +++++------
> =C2=A01 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs
> b/drivers/gpu/nova-core/gsp/fw/commands.rs
> index 21be44199693..85465521de32 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -107,12 +107,15 @@ unsafe impl FromBytes for PackedRegistryTable
> {}
> =C2=A0
> =C2=A0/// Payload of the `GetGspStaticInfo` command and message.
> =C2=A0#[repr(transparent)]
> -pub(crate) struct
> GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
> +#[derive(Zeroable)]
> +pub(crate) struct GspStaticConfigInfo {
> +=C2=A0=C2=A0=C2=A0 inner: bindings::GspStaticConfigInfo_t,
> +}
> =C2=A0
> =C2=A0impl GspStaticConfigInfo {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Returns a bytes array containing the (hopefu=
lly) zero-
> terminated name of this GPU.
> =C2=A0=C2=A0=C2=A0=C2=A0 pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.0.gpuNameString
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.inner.gpuNameString
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> @@ -122,7 +125,3 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
> =C2=A0// SAFETY: This struct only contains integer types for which all bi=
t
> patterns
> =C2=A0// are valid.
> =C2=A0unsafe impl FromBytes for GspStaticConfigInfo {}
> -
> -// SAFETY: This struct only contains integer types and fixed-size
> arrays for which
> -// all bit patterns are valid.
> -unsafe impl Zeroable for GspStaticConfigInfo {}

