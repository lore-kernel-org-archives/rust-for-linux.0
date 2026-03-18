Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F420CCE4;
	Wed, 18 Mar 2026 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837335; cv=none; b=q0G/EWH0v5AhGckq2v129gIJxIPxAmKLCG4UWBAIF4ID3zwg/S9mEKFWV+mevAnd6wwMbuIHvjE4KsCNU6Z7T/FS/O87YliXGl7GI0S5S7WYb7F2kFPuii0OoOMHOpnGrsulCXfXy1fZ7/WwwaJ6xJ99hX2KJv9SPNgpL3z+2ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837335; c=relaxed/simple;
	bh=NDsQzqQQiqjkWVvTFg8y+ZO7wQuH0DQ09PyDLi4Nka4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aLgaZbMtdAKqjC6OyG+zoogkUOudQwaEXbplotVRMlxJ4iuRQj5r3Mw93l6zyXovgV6TB4tShh6rd9Pjgk5+QIZmp+g5bAsuGcFOXO0JqvNfBz6/hQSqi2Cnh09lME32rkuZtuX/37GUpAKq/PTAKqj1o7grPGI3snpvCe+8mbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBz3NdRO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBz3NdRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B44C19421;
	Wed, 18 Mar 2026 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773837334;
	bh=NDsQzqQQiqjkWVvTFg8y+ZO7wQuH0DQ09PyDLi4Nka4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=vBz3NdROytCyTw/YjviQqmybb3rmSvNgi1kIckDArb+4+GBZug2DkSg4vrsize22Q
	 L8Ar47Fglvp+0u/P5WFUlymjtBQh3VXGCSfG+tbZrzIF1U4bE7aSm0bsMi/bxfYLPX
	 uegY6/yuF6YEc+EPb2n8JYbJcw10SY5SbgabRETyTgJTpPxgH6gcg+eKNeav3vKKAL
	 zvRX4IDjbX2J5eJFd9PCjYLgwehmQ4Vb6s1pOGucJ9Lm7cMILT2TzHdr/WMRqDGOpQ
	 E35r240F0pzQVv6c5JVOsZXBx4mWHuu6iLJ2DzoDs/h1dPnYWmp1yBV8vXUaSdjzgX
	 5awrVeUlzBNKg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 13:35:30 +0100
Message-Id: <DH5WURVBQNI5.1ZO9K0IR3PEOQ@kernel.org>
Subject: Re: [PATCH v2 7/9] gpu: nova-core: gsp: add RM control command
 infrastructure
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260318-rmcontrol-v2-0-9a9fa6f1c4c3@nvidia.com>
 <20260318-rmcontrol-v2-7-9a9fa6f1c4c3@nvidia.com>
In-Reply-To: <20260318-rmcontrol-v2-7-9a9fa6f1c4c3@nvidia.com>

On Wed Mar 18, 2026 at 8:14 AM CET, Eliot Courtney wrote:
> Add `RmControl` which implements CommandToGsp for sending RM control
> RPCs.
>
> Add `RmControlReply` which implements MessageFromGsp for getting the
> reply back.
>
> Add `send_rm_control` which sends an RM control RPC via the command
> queue using the above structures.
>
> This gives a generic way to send each RM control RPC. Each new RM
> control RPC can be added by extending RmControlMsgFunction and adding
> its bindings wrappers and writing a helper function to send it via
> `send_rm_control`.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs             |   1 +
>  drivers/gpu/nova-core/gsp/fw/rm.rs       |   1 -
>  drivers/gpu/nova-core/gsp/rm.rs          |   3 +
>  drivers/gpu/nova-core/gsp/rm/commands.rs | 118 +++++++++++++++++++++++++=
++++++
>  4 files changed, 122 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 72f173726f87..14c734c53e7c 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -17,6 +17,7 @@
>  pub(crate) mod cmdq;
>  pub(crate) mod commands;
>  mod fw;
> +pub(crate) mod rm;
>  mod sequencer;
> =20
>  pub(crate) use fw::{
> diff --git a/drivers/gpu/nova-core/gsp/fw/rm.rs b/drivers/gpu/nova-core/g=
sp/fw/rm.rs
> index 4a4f97d88ecf..1c6e8b4c4865 100644
> --- a/drivers/gpu/nova-core/gsp/fw/rm.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/rm.rs
> @@ -53,7 +53,6 @@ pub(crate) struct GspRmControl {
>      inner: bindings::rpc_gsp_rm_control_v03_00,
>  }
> =20
> -#[expect(dead_code)]
>  impl GspRmControl {
>      /// Creates a new RM control command.
>      pub(crate) fn new<T>(
> diff --git a/drivers/gpu/nova-core/gsp/rm.rs b/drivers/gpu/nova-core/gsp/=
rm.rs
> new file mode 100644
> index 000000000000..10e879a3e842
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/rm.rs
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +pub(crate) mod commands;
> diff --git a/drivers/gpu/nova-core/gsp/rm/commands.rs b/drivers/gpu/nova-=
core/gsp/rm/commands.rs
> new file mode 100644
> index 000000000000..5a3ac7bd415a
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/rm/commands.rs
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::{
> +    array,
> +    convert::Infallible, //
> +};
> +
> +use kernel::prelude::*;
> +
> +use crate::{
> +    driver::Bar0,
> +    gsp::{
> +        cmdq::{
> +            Cmdq,
> +            CommandToGsp,
> +            MessageFromGsp, //
> +        },
> +        commands::{
> +            Client,
> +            Handle, //
> +        },
> +        fw::{
> +            rm::*,
> +            MsgFunction,
> +            NvStatus, //
> +        },
> +    },
> +    sbuffer::SBufferIter,
> +};
> +
> +/// Command for sending an RM control message to the GSP.
> +///
> +/// RM control messages are used to query or control RM objects (see [`H=
andle`] for more info on RM
> +/// objects). It takes a client handle and an RM object handle identifyi=
ng the target of the
> +/// message, within the given client.
> +struct RmControl<'a, T> {
> +    /// The client handle under which `object` is allocated.
> +    client: Handle<Client>,
> +    /// The RM object handle to query or control.
> +    object: Handle<T>,
> +    /// The specific control message to send.
> +    cmd: RmControlMsgFunction,
> +    /// The raw parameter bytes to send with the control message. Interp=
retation of these bytes is
> +    /// specific to the control message being sent.
> +    params: &'a [u8],
> +}
> +
> +impl<'a, T> RmControl<'a, T> {
> +    /// Creates a new RM control command.
> +    #[expect(dead_code)]
> +    fn new(
> +        client: Handle<Client>,
> +        object: Handle<T>,
> +        cmd: RmControlMsgFunction,
> +        params: &'a [u8],
> +    ) -> Self {
> +        Self {
> +            client,
> +            object,
> +            cmd,
> +            params,
> +        }
> +    }
> +}
> +
> +impl<T> CommandToGsp for RmControl<'_, T> {
> +    const FUNCTION: MsgFunction =3D MsgFunction::GspRmControl;
> +    type Command =3D GspRmControl;
> +    type Reply =3D RmControlReply;
> +    type InitError =3D Infallible;
> +
> +    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> +        GspRmControl::new(self.client, self.object, self.cmd, self.param=
s.len() as u32)
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
> +            params: sbuffer.read_to_vec(GFP_KERNEL)?,
> +        })
> +    }
> +}
> +
> +/// Sends an RM control command, checks the reply status, and returns th=
e raw parameter bytes.
> +#[expect(dead_code)]
> +fn send_rm_control<T>(cmdq: &Cmdq, bar: &Bar0, cmd: RmControl<'_, T>) ->=
 Result<KVVec<u8>> {
> +    let reply =3D cmdq.send_command(bar, cmd)?;
> +
> +    Result::from(reply.status)?;
> +
> +    Ok(reply.params)
> +}

It still feels wrong to me for this to be a standalone function.

It should either be a method of Cmdq, or it should be a method of RmControl=
,
that takes self by value, i.e. either Cmdq::send_rm_ctrl() or RmControl::se=
nd().

Please choose one of those options.
