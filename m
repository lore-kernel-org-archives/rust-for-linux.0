Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C698C3BED45;
	Fri, 13 Mar 2026 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416422; cv=none; b=jw8gq1tOgRlS2olb8+KR90L10GejiOQRRPG0Emyzsz8D0i0+sskp/TF2j9yZXP0o/nF/M8NowAfhlWP5WR25KidpfKA5yEL3qKMiEUAsxt0+jYQP3PqYRj3bzEqXJ0ovYSHv/P04Gu58DHXFoeLBhYp1g/b9lgBfhKttHig+w/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416422; c=relaxed/simple;
	bh=bqxV/ERiJOHIQHsrkksCf/hS2sdEqcyyCJ33sU1fNUE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=r2O1CgFnEsnS3MCaxVeo1BZpraDrnEjyU3HKtPoynHlNyubaiXcC9gtkEkyi4A220i07sKlWgaNj/bRBvdpwgkRsio3JscxZ3ZtTRUkUZZGfFNzFN2ntDpkN8A2uLUAn7B8qNfjBBodRaOhxIoNk4MgVeMl0cvKQcilikBK/mcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmynuLuA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmynuLuA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A29C2BCB1;
	Fri, 13 Mar 2026 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773416422;
	bh=bqxV/ERiJOHIQHsrkksCf/hS2sdEqcyyCJ33sU1fNUE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=HmynuLuAU0p/faBUpY/pHuDDchwCJ4MxJQxxNWBPl7Hsqi5cFIGZSOB647VQ06h0+
	 IAbwadcPv4DP9HbHMbDYWLpJuFSMtMHxHmGpR5TPTnOtPpt+3klsKyqgEWsTCaLInB
	 P8lY1CVIr2Oh8OPMGEb+qP1LN7catbNpH3p4e4OcQKYlhEC3iB7zFsGgG8aKGcNm+b
	 yqMm06oc07pvzUSG93I5nna6mNaEdJnKN6O8zAh7uLBsvnhbTTctVU6S4K6iSoxO6S
	 P/Wo059iTU6IOapnrfl9kQqVbZBIUxsaSsdcCsnM4NnW7WIzCp63fRNgI+CxUCTHkh
	 erkx7hRx5kyrA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 16:40:18 +0100
Message-Id: <DH1RNJQP1IK7.1H96Z7TENYPC@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 7/9] gpu: nova-core: gsp: add RM control command
 infrastructure
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-7-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-7-86648e4869f9@nvidia.com>

On Fri Feb 27, 2026 at 1:32 PM CET, Eliot Courtney wrote:
> +/// Command for sending an RM control message to the GSP.
> +struct RmControl<'a> {
> +    h_client: u32,
> +    h_object: u32,
> +    cmd: RmControlMsgFunction,
> +    params: &'a [u8],
> +}

Please expand the documentation, especially the fields.

> +impl<'a> RmControl<'a> {
> +    /// Creates a new RM control command.
> +    fn new(h_client: u32, h_object: u32, cmd: RmControlMsgFunction, para=
ms: &'a [u8]) -> Self {
> +        Self {
> +            h_client,
> +            h_object,
> +            cmd,
> +            params,
> +        }
> +    }
> +}
> +
> +impl CommandToGsp for RmControl<'_> {
> +    const FUNCTION: MsgFunction =3D MsgFunction::GspRmControl;
> +    type Command =3D GspRmControl;
> +    type Reply =3D RmControlReply;
> +    type InitError =3D Infallible;
> +
> +    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> +        GspRmControl::new(
> +            self.h_client,
> +            self.h_object,
> +            self.cmd,
> +            self.params.len() as u32,
> +        )
> +    }
> +
> +    fn variable_payload_len(&self) -> usize {
> +        self.params.len()
> +    }
> +
> +    fn init_variable_payload(
> +        &self,
> +        dst: &mut SBufferIter<array::IntoIter<&mut [u8], 2>>,
> +    ) -> Result {
> +        dst.write_all(self.params)
> +    }
> +}
> +
> +/// Response from an RM control message.
> +pub(crate) struct RmControlReply {
> +    status: NvStatus,
> +    params: KVVec<u8>,
> +}
> +
> +impl MessageFromGsp for RmControlReply {
> +    const FUNCTION: MsgFunction =3D MsgFunction::GspRmControl;
> +    type Message =3D GspRmControl;
> +    type InitError =3D Error;
> +
> +    fn read(
> +        msg: &Self::Message,
> +        sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
> +    ) -> Result<Self, Self::InitError> {
> +        Ok(RmControlReply {
> +            status: msg.status(),
> +            params: sbuffer.flush_into_kvvec(GFP_KERNEL)?,
> +        })
> +    }
> +}
> +
> +/// Sends an RM control command, checks the reply status, and returns th=
e raw parameter bytes.
> +#[expect(dead_code)]
> +fn send_rm_control(

Why isn't this a method of Cmdq?

> +    cmdq: &Cmdq,
> +    bar: &Bar0,
> +    h_client: u32,
> +    h_object: u32,
> +    cmd: RmControlMsgFunction,
> +    params: &[u8],
> +) -> Result<KVVec<u8>> {
> +    let reply =3D cmdq.send_sync_command(bar, RmControl::new(h_client, h=
_object, cmd, params))?;

Why not let the caller construct RmControl?

> +
> +    Result::from(reply.status)?;
> +
> +    Ok(reply.params)
> +}
>
> --=20
> 2.53.0

