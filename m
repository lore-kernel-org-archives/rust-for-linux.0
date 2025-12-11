Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69E1F12F8
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490768; cv=none; b=o7G49sENxzUpg7k+cZVvHHekJxE7ASpChZpR3Eo87h8B6v1FvKH4tlkRUBa4PC4LPhG2KgjcCtdTP4Ao4UhF2FUZY2PgGRaPHhBfIsjJi0Hge+E5h1HytwfdEJKCycVxQ9H32UNi7gAZG5plNCdOV/8A5bz2vvgAF7H3Iq1ztlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490768; c=relaxed/simple;
	bh=UIJi8A5enw0jKPdBAcq9mdV3DtYs80Ia+m9Sa3y5QpM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKGtOop8cc3XTyjE5Nm5/FzyFdhX2w7mgOBP/j59JXr91L79bnfqM7DzKlF1pb1fFz1wT7Ytb/zdPzv3TdFuaLytBt3V9DsnIdk7+SsfRUg4tNrSodaDNg099xcAhEHFS0tusCMCEZzMMurWyVClHAKXvisxLNHFtMeOeoOmYbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eZm1w7Og; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eZm1w7Og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765490765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIJi8A5enw0jKPdBAcq9mdV3DtYs80Ia+m9Sa3y5QpM=;
	b=eZm1w7OgJJB2VWbRAgv5bV3xbYNKtFtJQlwVlE19nvOGKihcs8oNufqLPP9LU8CebUWUL7
	4AqlGsUeRdzqjjWnPzA2Ggmws/k0gbSuBhmKsuesS8YlNP0HirlPXJSTPx3ayGBe2j+CyL
	uHAWrkACI68FISUAN3UQfBE9yNrue9E=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-1JGEo3cHPZ-tnQr-h-PhKA-1; Thu, 11 Dec 2025 17:06:04 -0500
X-MC-Unique: 1JGEo3cHPZ-tnQr-h-PhKA-1
X-Mimecast-MFC-AGG-ID: 1JGEo3cHPZ-tnQr-h-PhKA_1765490764
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b19a112b75so120411585a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765490764; x=1766095564;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIJi8A5enw0jKPdBAcq9mdV3DtYs80Ia+m9Sa3y5QpM=;
        b=ee7j5VKTdDGgx9Jx/Ys/KkAeoNymbarw9szKX2WZEthjpoe9l8nHdlqu5RV/jKgf0T
         DnlEaQ0HoOzgCFDwKynDxxs817XSR1jjAWwrbHIv74mKtpMfbExpFjFwgwufwaAc9LQb
         7P0F0I9NmOv/eeCs1zwHSu4Gs5Tl6yl6OSQFQp7HnjWCUDGRpuXX6OB1v9dIBpMnGo9U
         p5Cc6Y7A5ljeZk7KjOUkvfIeVEopkBHJEh7sJSyXAlYatpMdNFgk1k9m0/Fy/FiAoQzb
         1XN+uKxGq4fwwP42RrRBXqbb8+ltnEbZMZZb1H/coLWh3gK2Nsu/njrH10UlABaZuSlW
         8+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWjE/4p2+FDCS4CIXz80EnrmKnSMOQW+apslxAJUqztWVTU1uTFBLE6OGUVGkKZlVhEXokMKTFqE2BTfsnI9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKSZ2QW8BpGDiyBOswlQ9f8fgNfXhdgfMDa+rxJCDKUat+GFIa
	foigFkIVUFadTuzBsz97sRolsPvYmmpMkEPlK9aYqvxI9VMK5F2G+LzbDJmFW6EzY6P/h8ITdLH
	2QvNAr+Do+ZyF2buGLtQLPZ6el0OdlXFoK5VrVSKtdLLyR8ds9Mk9JFM2A1FfGI6FvxoE
X-Gm-Gg: AY/fxX7Z79DnvoPxT0GhvVxDQ327WAr5Bm+8/IDoqMGVX94E8bxTaeH4M7NP60HyBaA
	/KJ5nxNQOo3n4iQTVRfoLta0g3Ujq9ns/WWb7m19LCmcy+GG5ywNN3c4Tk7bu0K1XycGRvn+xPy
	zQ7ZogqJpM/fWiz+jvi2ODR+UQxgGfXftEzTS2In8G3NXfL6eAXe63ynUmkqfzeyy2u1R/m5bB4
	/GNSIWRkWCO8KfyHdenT+dF26+86S+raXqO5WeK1BrfK7Hf7F/Ck8RwEktUUSieeaVk9rCsQUbR
	b9KJxFQa1eknabSuYmfqCdAN+OqhThx/I4SzLHN1IFuh2/XD4f4V2Eg5hy65ybxbwgVUhHLWV7b
	C8AhltBXr8u/5igziA+7IujGiGX/qSje0qB1YcMm0USFZQe4fksey7fk=
X-Received: by 2002:a05:620a:7007:b0:8b2:6538:6b4a with SMTP id af79cd13be357-8bb39faf64emr8428385a.20.1765490764120;
        Thu, 11 Dec 2025 14:06:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeQGmo8QAzGHrPNh9dtBmXlMiOjCoOPGpEBjjdzbY/e4K13DUPj/88xc0QeIDjiQmjO9IPMQ==
X-Received: by 2002:a05:620a:7007:b0:8b2:6538:6b4a with SMTP id af79cd13be357-8bb39faf64emr8422985a.20.1765490763675;
        Thu, 11 Dec 2025 14:06:03 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5665e0dsm318609085a.18.2025.12.11.14.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:06:03 -0800 (PST)
Message-ID: <2a416f38699994a6e709ab7e4990ff17023d4c16.camel@redhat.com>
Subject: Re: [PATCH 4/9] gpu: nova-core: gsp: remove unneeded sequencer trait
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:06:02 -0500
In-Reply-To: <20251208-nova-misc-v1-4-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-4-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iVrIve3tvOn-K8HBsAtRA9jjqIFjz5rdfDQmBxkE8KE_1765490764
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:26 +0900, Alexandre Courbot wrote:
> The `GspSeqCmdRunner` trait is never used as we never call the `run`
> methods from generic code. Remove it.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/gsp/sequencer.rs | 17 ++++++-----------
> =C2=A01 file changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs
> b/drivers/gpu/nova-core/gsp/sequencer.rs
> index 2d0369c49092..4efa048b9d93 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -147,12 +147,7 @@ pub(crate) struct GspSequencer<'a> {
> =C2=A0=C2=A0=C2=A0=C2=A0 dev: ARef<device::Device>,
> =C2=A0}
> =C2=A0
> -/// Trait for running sequencer commands.
> -pub(crate) trait GspSeqCmdRunner {
> -=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> Result=
;
> -}
> -
> -impl GspSeqCmdRunner for fw::RegWritePayload {
> +impl fw::RegWritePayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> R=
esult {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let addr =3D usize::from=
_safe_cast(self.addr());
> =C2=A0
> @@ -160,7 +155,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) ->
> Result {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for fw::RegModifyPayload {
> +impl fw::RegModifyPayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> R=
esult {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let addr =3D usize::from=
_safe_cast(self.addr());
> =C2=A0
> @@ -172,7 +167,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) ->
> Result {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for fw::RegPollPayload {
> +impl fw::RegPollPayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> R=
esult {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let addr =3D usize::from=
_safe_cast(self.addr());
> =C2=A0
> @@ -197,14 +192,14 @@ fn run(&self, sequencer: &GspSequencer<'_>) ->
> Result {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for fw::DelayUsPayload {
> +impl fw::DelayUsPayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, _sequencer: &GspSequencer<'_>) -> =
Result {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsleep(Delta::from_micro=
s(i64::from(self.val())));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for fw::RegStorePayload {
> +impl fw::RegStorePayload {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, sequencer: &GspSequencer<'_>) -> R=
esult {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let addr =3D usize::from=
_safe_cast(self.addr());
> =C2=A0
> @@ -212,7 +207,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) ->
> Result {
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -impl GspSeqCmdRunner for GspSeqCmd {
> +impl GspSeqCmd {
> =C2=A0=C2=A0=C2=A0=C2=A0 fn run(&self, seq: &GspSequencer<'_>) -> Result =
{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 match self {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
GspSeqCmd::RegWrite(cmd) =3D> cmd.run(seq),

