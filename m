Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9A26463A
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765490915; cv=none; b=DC/Nkz+s7nspuP0C1u6RnaelSVBeZgGJm8ue7e+Rv8mGa2ytp6fbJuDhgM2rtVRCmIO66ghtGHPU6Zfho+ip1ecSvlYO4l1GLUkwFOrc/BCKBu9I7PV17n+RfdrdW/UYvx2sB/sFP0PQTlNKUWopCCd4pNLG/0dkDa4tQGLgeNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765490915; c=relaxed/simple;
	bh=zjFf5L41tBDbcZuShBXTixXHD1C4nxZ3Q2igYRM27mY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=icMCTnAbe7R8Hv/4ho8VlVptqKQWQehjAzJwr16Nnd93rRw3iJvu0srKT+SCAysDL2CEgLJ0W3rrzUNVOg1yoEyBGdHPpBd7WqNU4OcJesb/21q58fCggxfpA21YlTY9c5pc7R0MJgg3+zIpRolkMv0g3h+FyLGGnNfIaP9GwMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKBw8+Ug; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKBw8+Ug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765490913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjFf5L41tBDbcZuShBXTixXHD1C4nxZ3Q2igYRM27mY=;
	b=aKBw8+Ug/di1nowPoLHXjpU/wQv7XaWluU8P7EbB5pUwXb3hOPT4HoBKRBczuORjfTb2HY
	IHeMzfLn8DEXZiH9BIAD6UUWvrPpAno7p7IJ4B6pTOXilwhwHlH+P5fq3xeVgSds8Ps9KM
	JDUfd2UVPQ11tJm0cdVzeNFK+bSrjXM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-RoAFQqnZODCcNsBUO9Kv9Q-1; Thu, 11 Dec 2025 17:08:31 -0500
X-MC-Unique: RoAFQqnZODCcNsBUO9Kv9Q-1
X-Mimecast-MFC-AGG-ID: RoAFQqnZODCcNsBUO9Kv9Q_1765490911
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-880441e0f93so15544836d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 14:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765490911; x=1766095711;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjFf5L41tBDbcZuShBXTixXHD1C4nxZ3Q2igYRM27mY=;
        b=toJEhz4SBrnSbyFWxS2VVxVuxJgFmy0U+8+PpOBBLwNDXl/4HV5tFSMv/zZmpiW4bw
         W6ahlUbtA1fNVyEkWvnjHbn/HkBkIholOHHhvhTG/kgwf1dFfDgPhSCgoeGUgKHu/aru
         y5mI2KK7D2D7IhZOU6Bi/b3phea/zRbbU2sJCGrPYpUGO7Hsw+p7NTI3xEMP1/BXlP0X
         OJMJNPxp2Cx2/Tb4P9PXYh+LoW4C53I03MTL+/vLX9Vh1wicnGSX9E9beDvuvn3tuhMB
         FZOBdqjpHzEh0b9x1FcY8xMjegkETlE9du1QzSZEE30iXstKCP1b07Xq/CdkW/5w5d0A
         T5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCW9HYgK/eaVyzylEjHygfO14x7hdsRuGKSjnMqWeHQ8MuCVW79e8lNSoPY/AhyKY0sMGA38Fj9ZxO0g1HegUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0MeJQgx6YUn/jW7xFuN6cszVfm7NY0Lfqqm6UJuzz/sfXQKxW
	WMBYfsvXBJVF9iu6je7L2mOUb6VTBIBn+HUM0COiAO5FXcPTfSEynEaaf4pjb1SOSu5F96eg0Xt
	gzts34qZ1iFhA4vzTqiCjGKGF3hpMrjIiIGgxJtKHWvWmHL6180uZs9q0oU0i6ZRkpujf
X-Gm-Gg: AY/fxX5gW3l0bdH0YXAj1+iF0SmcLp348LReRCfoxM7R0ZDDk1CEQs6cHfymPg46yNR
	JRPzYEyMlZFbEOc7rTQ0IVv4EJ4ctrUh8iDpK4fuTHCCHCoKBkQ2MUyED4jbbEVm/OorQdFWBCt
	mflO3AjLVnyAq1hYYfXLwDaEMVdI25Wlm2hAckw36MUon9aH/ZWKMqwq6stsM4YbGm4sOoKOlV2
	YST4nAbMCqvg0DUOkPP/tSYEE8V20kgaGxgcBTBvPgzwF7iPvUBw+9P6kZZqHx7JIPBnabuwCsQ
	y8VDV/YQ24eE/s52YcV6Z2l/pH+tlfkb7QblsT4vvZ8+Kax+kLVXOqBii2D6M2p/BZLNYpT+dsn
	LBwhU1FhaNTS6d+GPM4SAwheS64nsmiazGXD88QrOp6Pv3hnHWo0Xeq8=
X-Received: by 2002:a05:6214:5190:b0:888:4930:4c85 with SMTP id 6a1803df08f44-888715bbbdemr57238416d6.33.1765490911223;
        Thu, 11 Dec 2025 14:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENTDQTVTO5abPiPnspbVewsjfe+HupVyKsPE/ZW6MQ2Op6oHfEVczT7wvjjsERpI1G70gtkQ==
X-Received: by 2002:a05:6214:5190:b0:888:4930:4c85 with SMTP id 6a1803df08f44-888715bbbdemr57238006d6.33.1765490910860;
        Thu, 11 Dec 2025 14:08:30 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net. [100.0.77.142])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ef0d332sm35706406d6.45.2025.12.11.14.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:08:30 -0800 (PST)
Message-ID: <8067808d2dda24ce27359e26653839a127eaa974.camel@redhat.com>
Subject: Re: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require
 bound device when unneeded
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:08:29 -0500
In-Reply-To: <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UWSOVglGsBYjffmygKIeR815QqySbjFN5Sd1xulhU4A_1765490911
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:26 +0900, Alexandre Courbot wrote:
> `run` doesn't require a bound device as its argument.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/firmware/fwsec.rs | 7 +------
> =C2=A01 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs
> b/drivers/gpu/nova-core/firmware/fwsec.rs
> index b28e34d279f4..b98b1286dc94 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -412,12 +412,7 @@ pub(crate) fn new(
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Loads the FWSEC firmware into `falcon` and e=
xecute it.
> -=C2=A0=C2=A0=C2=A0 pub(crate) fn run(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &self,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev: &Device<device::Bound>,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 falcon: &Falcon<Gsp>,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bar: &Bar0,
> -=C2=A0=C2=A0=C2=A0 ) -> Result<()> {
> +=C2=A0=C2=A0=C2=A0 pub(crate) fn run(&self, dev: &Device, falcon: &Falco=
n<Gsp>,
> bar: &Bar0) -> Result<()> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Reset falcon, load th=
e firmware, and run it.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 falcon
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.reset(bar)

