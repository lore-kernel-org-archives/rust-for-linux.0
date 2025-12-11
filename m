Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152792957C2
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490799; cv=none; b=ljvXbgN2jgRHWUeVkNcjhqwmBkqiYyCsByBcc7pjCoCifqjoMv8ftT2bpezu3p+sVgLNCyAReiyX7Dg6Fd4Do8CoV406l0HHnPU8D8MApqjA/FbFt/7OD0wa62yW7IkqldUcNSV5ULnZoXPbeNvFtAJq0P+3fgm1+LvQ21UdhkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490799; c=relaxed/simple;
	bh=FQD4zZ9at3sElDktWK9m7mDr3xTunsjTrPR6SORxQuY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNheF/JK+iSZEUjAXQulMSfFAmvyEk1/5i8dVy5vBVb4z2EMuXcI0++dQt9+iArOH4GVrcgLoiPsN+qm19eg2Dk/RZxuZGCiwwh2ZvQ8P0ZmDGYv4xPOVDksXDUTN2Hl87aiKmlXRteblD3f5xyGDL2Xb9vmeSX0fatN0E8lBrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZyOfB0xN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZyOfB0xN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765490797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQD4zZ9at3sElDktWK9m7mDr3xTunsjTrPR6SORxQuY=;
	b=ZyOfB0xN7vmGdE5CiP9NN0kgMZKDyrovMsKyY44RkNEE518itnuBDID6QYbzlh+rMRi2at
	QK56sqqu71F6v9KqK2XHKPUYtryCa3OLi9kP843PcH3pms+/bdmBBPn6S1aFvZA/lgqRUw
	zXAgWlD4NTcllvrWfDS3manHRpkRWZ0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-gtZgZXQ5Mb-m4TxtDeDXqg-1; Thu, 11 Dec 2025 17:06:35 -0500
X-MC-Unique: gtZgZXQ5Mb-m4TxtDeDXqg-1
X-Mimecast-MFC-AGG-ID: gtZgZXQ5Mb-m4TxtDeDXqg_1765490795
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88044215975so17059386d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765490795; x=1766095595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQD4zZ9at3sElDktWK9m7mDr3xTunsjTrPR6SORxQuY=;
        b=FEDTb2kfNkgEHo/EDSTJ4TTs6ZZ5/qJ4BOa3UF6yHPMpUho4vTslzgu42Lzur+u64m
         U2pcyQb0WkWLUU7zltSDoRXifisd6yv8uW0gvVScuqOdfXwaLroghVPO0aCU+I/7QqRu
         nJkwGcQ5oQEwSEFlJSoS7fXEdPBpvcyiUoW9uBMwN+nHh/hil4AOG3P5LMSY2f7Os2fd
         vz4w8LbTECixceWt4Kcs//Wrp2syjRwdc/3I6GpU1xGMvs8KionGKjSE50zGJnl8jhcY
         yUNX+ev1cDMvD0jfr3KTmt7VSTP4Nfx3MI00pe4uv/VSg08D07ro3aZ+cfDQ9icWG3G2
         5lMA==
X-Forwarded-Encrypted: i=1; AJvYcCVxkHYD4NfeiQhx7gSFuaCxNxO/Nm7ug8hEoKZsoqrLQ2PYbMJWpSZec5dx3Fxo35PsA9A0C2AeXLLPxtgJiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSmcbsA6NEY9PGud1b8MHrvigSdNSqwnY2ygxLSL0HycUxe91U
	UUtHaShrz9FsPwRvSHG0xgnmbFc7xDFhTWZetWzNPteoNAojp9eOG9WkblAiArC8vCtvlW8m1II
	hb8DiiA4PAr29ipfPKnw+BXOUsk59Det1sjPHkSMCtlUCrMy3y0jzmwEsF8eoHjw22tZM
X-Gm-Gg: AY/fxX5U1XsV9UlUWkGmj0LUu9+1y5DsowUuXZBOWxjVXZeupn5CRq/6M71/+XCFhVI
	XD53BOOPsQgBK3lxQoOS8yEs9wB7UxPa0vpbEF9F9+kmg3DWJYI7GvMMQ9Y7pzBU7gnJTLgELJ3
	+TI2xTMqTYzknJRA00wRXb8TGQDLBcC+2sKInghOrIfeEf3Z5hozadVpDAwOEPmScFVX4Mk/HFI
	ddA3yMarIda4qpeKN4dL+6C7f/3+TKxpPwMLDa2H868t7iK4kQxmb5LzysGPuaTnWI/c9rS4kXM
	Z6SZqL5UBMqgoRrVRS1mZqQhCCbwb/t7A4MMA4F7sNzhtE66CM8jCKnKOnCNHjKA6EHW8sT/8/9
	jiRgpcyoWvH/K5k0EVAr319HMcD0BTRG23PqEaekNM22FNvHMXUochYE=
X-Received: by 2002:a05:622a:4208:b0:4ed:6e79:acf7 with SMTP id d75a77b69052e-4f1b1a7e143mr102089881cf.41.1765490795204;
        Thu, 11 Dec 2025 14:06:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaqeBiuM6CsFwruI5tizpjX8j7kpXn5KxhwmEige7pYuP2pDesrOgqZ9YYEKxErZ2GWsjRPA==
X-Received: by 2002:a05:622a:4208:b0:4ed:6e79:acf7 with SMTP id d75a77b69052e-4f1b1a7e143mr102089381cf.41.1765490794825;
        Thu, 11 Dec 2025 14:06:34 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd5c5e17sm27572841cf.14.2025.12.11.14.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:06:34 -0800 (PST)
Message-ID: <2a80f215aafcc39fad8eaab5a84ca499d8c40500.camel@redhat.com>
Subject: Re: [PATCH 5/9] gpu: nova-core: gsp: derive `Debug` on more
 sequencer types
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:06:33 -0500
In-Reply-To: <20251208-nova-misc-v1-5-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-5-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sAtqGFLnTpjIimkcInnJzxv7Yx-_xkGyg8l4h5MzZzQ_1765490795
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:26 +0900, Alexandre Courbot wrote:
> Being able to print these is useful when debugging the sequencer.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/gsp/fw.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 +++++-----
> =C2=A0drivers/gpu/nova-core/gsp/sequencer.rs |=C2=A0 1 +
> =C2=A02 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-
> core/gsp/fw.rs
> index d06c0fdd6154..d1fc8f111db1 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -330,7 +330,7 @@ fn from(value: SeqBufOpcode) -> Self {
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register write payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
> =C2=A0
> =C2=A0impl RegWritePayload {
> @@ -353,7 +353,7 @@ unsafe impl AsBytes for RegWritePayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register modify payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
> =C2=A0
> =C2=A0impl RegModifyPayload {
> @@ -381,7 +381,7 @@ unsafe impl AsBytes for RegModifyPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register poll payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
> =C2=A0
> =C2=A0impl RegPollPayload {
> @@ -414,7 +414,7 @@ unsafe impl AsBytes for RegPollPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer delay payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
> =C2=A0
> =C2=A0impl DelayUsPayload {
> @@ -432,7 +432,7 @@ unsafe impl AsBytes for DelayUsPayload {}
> =C2=A0
> =C2=A0/// Wrapper for GSP sequencer register store payload.
> =C2=A0#[repr(transparent)]
> -#[derive(Copy, Clone)]
> +#[derive(Copy, Clone, Debug)]
> =C2=A0pub(crate) struct
> RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
> =C2=A0
> =C2=A0impl RegStorePayload {
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs
> b/drivers/gpu/nova-core/gsp/sequencer.rs
> index 4efa048b9d93..5eead7ad4cbd 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -70,6 +70,7 @@ fn read(
> =C2=A0/// GSP Sequencer Command types with payload data.
> =C2=A0/// Commands have an opcode and an opcode-dependent struct.
> =C2=A0#[allow(clippy::enum_variant_names)]
> +#[derive(Debug)]
> =C2=A0pub(crate) enum GspSeqCmd {
> =C2=A0=C2=A0=C2=A0=C2=A0 RegWrite(fw::RegWritePayload),
> =C2=A0=C2=A0=C2=A0=C2=A0 RegModify(fw::RegModifyPayload),

