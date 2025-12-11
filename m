Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361062D73A1
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490964; cv=none; b=D4Zbs+5rBwQXvAxf9P7wEZl+EsLCWY5ZDBu1/6rcZ+Aj8Of9F1BF1nVGfp4OmsOXgHkRthntpnUBvwwT5igxKLf/asmLtTAGZUl8TZ8F0aOAZIdktOvhvaIax5JcqlYKxdzmp/WLDdw5KbPKYdftXs6cvGeWc/4BGMDvdFh8k/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490964; c=relaxed/simple;
	bh=Y1O7V3uHqYBRFQTCFqzVy63thnPnR5+8cC39VQTSAaE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSPDfCJlJLJmD67097LtoFmac43H/6AQSuR0vdZ0dhu9S0njgF1vWItAU2UX/ezMgxfsQ+NMSsBkjhND5xScUcYedIO4fbstJkZu3l9kI+yl+duucuQSgDxN5ZFsEKkIUp3xk0eHgQUS8LCiahInUp/u8Nxban6qVYIdkYKYLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=grRkXWuT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="grRkXWuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765490960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1O7V3uHqYBRFQTCFqzVy63thnPnR5+8cC39VQTSAaE=;
	b=grRkXWuTvw0UZ9VP2PpSqo3GvQByZYwsX+0vENI5Cd5Mx3Yb6JZe1sJH5e/SdHb31KHtR7
	B501FDX32Mu8Ne+kvH7oSrcnAhzk4HUfyQK0RHThpKYHcUFMVjbAgvEW0xzcvO2nvjhI5i
	RVOEQehwipv7YBS7e1fZGAb9zNi+jtI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-TBk5OHg1PQCP-WB7DbyGeQ-1; Thu, 11 Dec 2025 17:09:19 -0500
X-MC-Unique: TBk5OHg1PQCP-WB7DbyGeQ-1
X-Mimecast-MFC-AGG-ID: TBk5OHg1PQCP-WB7DbyGeQ_1765490958
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edad69b4e8so11032361cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765490958; x=1766095758;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1O7V3uHqYBRFQTCFqzVy63thnPnR5+8cC39VQTSAaE=;
        b=MDusO3bTQNBvi8tcxbY8WtZbQC/yl/KWDcJPwL4jeW8S5f4aURIYXMCvpmBTwHgfGJ
         fioiepRUqpPvvydPFWUwMgDN3CtmnfkAV9Dqjk1ucE3QstSalLxGfzbWMRClnnIimYVQ
         HFqg2GZOyIRNsDLtJIqLipnE5JokFoP/lpuRLOFOugCr6PJD+LoqJd/Dvr0lJbm/s3s3
         goNHU51hFPM3bYTnvEa7sZCW1lBukNQoycRQLAROQN/MznpP8dPaHWQ4hd4l4PFBNUuU
         lPYk1yzXFMeAP8bL76hWitXKB7wXrenlNEYvxwupLEh5oMeYZmv4jyHkETb0Ms9VoVGW
         g3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCX0L6fHqjjSWN6TDAHfswSiMtD5CJVnneu47XxnWLgQxQLblYOg4DrnS465Hi+dvz62E4ExQQGQsqvD9zXg4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZEkKrmxdCMHDgjypD66Eo4a6mkRDKvrPtYgno6FPK4JjS4HJV
	5h94nj7MRPTEoH3hkldCb96jfHamU+RHyc3ir4O6IYk+Pu/+nVoFv/JS2Cvjp8+shNjnVhiO76H
	Hp3O9XIrmd1ecD+TuQU+o9Ivr/ORAFPUar04VG/PPbWIBt+V4bSpvHQTk62L9BHcH3fig
X-Gm-Gg: AY/fxX69+g0ydteNWDjAs1WG8JBJ5klJSc4yket1qY066GmH7e1XbcGtLPesceVm/5D
	dcSKgBDIS3xqMiNvsqlxoImhcGAKMwfiTChYqlXzbfN2thNgcR2FvsYtsHpm0f1XLFteI0wsB0j
	dqTRJHEWz5jVkkLa7wgytMzHctM6XyLgainsBDlWrEoz5JZzMThdTBnEPOFiOHTB2PemylqQ8w8
	brEcntV60FSTeOyGD6P2uY6JyzXHTm8yHl5zPH4+yewTXoSC9nCtbj/VfLNOTxTllCdh7+WTjMp
	ZCDL3LoXgjjJ20l2CN0rsi7YgguCQ1CvwMKwqP3i391ig6JpZjNf/rQgSGd3pgQPtud/biKITSl
	AmLp2HcE9PjoBX/o049b4tL3Gglk8dWd2d0ctoR6vmLkgM6eRP9YWc7c=
X-Received: by 2002:ac8:7d8d:0:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f1bfe7d21cmr49692481cf.41.1765490958380;
        Thu, 11 Dec 2025 14:09:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKiMuyVXq1Y18ZPJmxWCrvSzCOmjyB0gpUsQRsIZiL+/Y+mf2tNT73tJxLC2mGV7AoiB82QA==
X-Received: by 2002:ac8:7d8d:0:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f1bfe7d21cmr49691521cf.41.1765490957363;
        Thu, 11 Dec 2025 14:09:17 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5665b6fsm314872685a.12.2025.12.11.14.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:09:16 -0800 (PST)
Message-ID: <2f4c3d869a1a47c31fe0c1b387511a33836a9647.camel@redhat.com>
Subject: Re: [PATCH 8/9] gpu: nova-core: use core library's CStr instead of
 kernel one
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:09:16 -0500
In-Reply-To: <20251208-nova-misc-v1-8-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-8-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rp4CcprqxvimLj-jvQ5Cy-RSVvYD8mU5RsFgMsvamak_1765490958
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:27 +0900, Alexandre Courbot wrote:
> The kernel's own CStr type has been replaced by the one in the core
> library, and is now an alias to the latter. Change our imports to
> directly reference the actual type.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/firmware.rs=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/nova-core/firmware/gsp.rs | 6 ++++--
> =C2=A0drivers/gpu/nova-core/nova_core.rs=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/nova-core/util.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 ++--
> =C2=A04 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-
> core/firmware.rs
> index 2d2008b33fb4..672f6cd24d4b 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -229,7 +229,7 @@ const fn make_entry_chipset(self, chipset: &str)
> -> Self {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 pub(crate) const fn create(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module_name: &'static kernel:=
:str::CStr,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module_name: &'static core::f=
fi::CStr,
> =C2=A0=C2=A0=C2=A0=C2=A0 ) -> firmware::ModInfoBuilder<N> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut this =3D
> Self(firmware::ModInfoBuilder::new(module_name));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut i =3D 0;
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs
> b/drivers/gpu/nova-core/firmware/gsp.rs
> index 0549805282ab..53fdbf1de27e 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -34,10 +34,12 @@
> =C2=A0/// that scheme before nova-core becomes stable, which means this
> module will eventually be
> =C2=A0/// removed.
> =C2=A0mod elf {
> -=C2=A0=C2=A0=C2=A0 use core::mem::size_of;
> +=C2=A0=C2=A0=C2=A0 use core::{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ffi::CStr,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mem::size_of, //
> +=C2=A0=C2=A0=C2=A0 };
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 use kernel::bindings;
> -=C2=A0=C2=A0=C2=A0 use kernel::str::CStr;
> =C2=A0=C2=A0=C2=A0=C2=A0 use kernel::transmute::FromBytes;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Newtype to provide a [`FromBytes`] implement=
ation.
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-
> core/nova_core.rs
> index b98a1c03f13d..3c26cf0b7c6e 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -19,7 +19,7 @@
> =C2=A0mod util;
> =C2=A0mod vbios;
> =C2=A0
> -pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as
> kernel::ModuleMetadata>::NAME;
> +pub(crate) const MODULE_NAME: &core::ffi::CStr =3D <LocalModule as
> kernel::ModuleMetadata>::NAME;
> =C2=A0
> =C2=A0kernel::module_pci_driver! {
> =C2=A0=C2=A0=C2=A0=C2=A0 type: driver::NovaCore,
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-
> core/util.rs
> index 4b503249a3ef..8b2a4b99c55b 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -3,10 +3,10 @@
> =C2=A0/// Converts a null-terminated byte slice to a string, or `None` if
> the array does not
> =C2=A0/// contains any null byte or contains invalid characters.
> =C2=A0///
> -/// Contrary to [`kernel::str::CStr::from_bytes_with_nul`], the null
> byte can be anywhere in the
> +/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null
> byte can be anywhere in the
> =C2=A0/// slice, and not only in the last position.
> =C2=A0pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str=
>
> {
> -=C2=A0=C2=A0=C2=A0 use kernel::str::CStr;
> +=C2=A0=C2=A0=C2=A0 use core::ffi::CStr;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 bytes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .iter()

