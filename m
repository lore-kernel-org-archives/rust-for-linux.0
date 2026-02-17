Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF33335546;
	Tue, 17 Feb 2026 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329157; cv=none; b=PgIdWCkOgfNRUVxMcLeirFaAm14DJRJ42dewp78uuJCn9QMftfhLvrsBak5lgv7h/bBVYHdC8sOuA0TkEVd05iEaaHdfGJTUiaOzjqsLKlUxNhXBgkIH6IuBUQ61+xDBy+j8bPyiHm8A9wgSGVNme2YYpyFTYN0b7k6EP2rTVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329157; c=relaxed/simple;
	bh=bhH7iF+cnDq2Pt5ZBwkse6iD2fwFe7a/HG2PI/y2lW8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DMLPD78fiuagRbpNFlX6b+KjTizmMxNeOZtrdq0/c4bwmKLTL/AfbjlJbmcrZohLJis3abRWngQCH3DPqT5W9bWCW1JDxZNxoLQN6+g7kuOl9MHX9mYTRqdW1QkUjldMj2SH1daSvaJLzutnq6JU0dkZaQd7gnTUwSvUZc8UG6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hz8n2Ubr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hz8n2Ubr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98F8C4CEF7;
	Tue, 17 Feb 2026 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771329156;
	bh=bhH7iF+cnDq2Pt5ZBwkse6iD2fwFe7a/HG2PI/y2lW8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Hz8n2UbrE9/dT4JPp8aOvp2KibU9qI5WSR51+5rh7xFatvJl7kdB8HgScZf+6JR8x
	 9uvg7uYQRFRZomawJC9HaDxi56gvQcIWy6KvDg28j+XJpEwQAf4Tp0nto1F3MwGYJ+
	 pPVOzWZSNjoFhS4Gw4zQ25MiWr0gf8U83qcWLKuLOn+w0cYC6AvM0/BcXhvUouKEPc
	 b3uSkNLcyoRuWm5r9cmRSdHPh2IydvhURqjKy/uOlhhuy1Uz6R9qAIEWprqTnxBybf
	 AIVum6lAmJh0qR9zmYWiF8YKqnlTG6O6AKPA8lsKI7dRj/TvwVG8FVfCpx2m/USMMy
	 Z+mYLqSlZDTkg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:52:31 +0100
Message-Id: <DGH7S2HJRDJJ.210D7DLTNFRNR@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: fix GSP RPC send sequence numbers
 to match Open RM
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Maneet Singh" <mmaneetsingh@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260211000451.192109-1-jhubbard@nvidia.com>
 <20260211000451.192109-2-jhubbard@nvidia.com>
 <DGH35X9GCFYO.EBY01G1C6XQM@nvidia.com>
In-Reply-To: <DGH35X9GCFYO.EBY01G1C6XQM@nvidia.com>

On Tue Feb 17, 2026 at 9:15 AM CET, Alexandre Courbot wrote:
>> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/g=
sp/boot.rs
>> index 02eec2961b5f..f769e234dae6 100644
>> --- a/drivers/gpu/nova-core/gsp/boot.rs
>> +++ b/drivers/gpu/nova-core/gsp/boot.rs
>> @@ -403,7 +403,11 @@ pub(crate) fn boot(
>> =20
>>          dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active=
(bar));
>> =20
>> -        // Now that GSP is active, send system info and registry
>> +        // Now that GSP is active, send system info and registry.
>> +        //
>> +        // These are async (fire-and-forget) RPCs: no response comes ba=
ck from GSP.
>> +        // GSP does not include them in its sequence number counting to=
day, but a
>> +        // future GSP firmware update will fold them into the normal se=
quence space.
>
> From the point of view of the caller this is a superfluous
> implementation detail. This comment is actually confusing as it mentions
> a sequence number that the caller does not need to provide, so I'd just
> remove it altogether.

The comment is not a doc-comment, hence it can more be seen as a comment fo=
r the
audience of nova-core developers in general, rather than a description of a
specific API. So, I think it is OK to talk about an implementation detail h=
ere.

To me personally it seems useful and I'd like to keep it.

>
>>          self.cmdq
>>              .send_command(bar, commands::SetSystemInfo::new(pdev, chips=
et))?;
>>          self.cmdq.send_command(bar, commands::SetRegistry::new())?;
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 16895f5281b7..7d6d7d81287c 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -58,6 +58,13 @@ pub(crate) trait CommandToGsp {
>>      /// Function identifying this command to the GSP.
>>      const FUNCTION: MsgFunction;
>> =20
>> +    /// Whether this command is async (fire-and-forget), meaning no res=
ponse is expected from GSP.
>> +    ///
>> +    /// Async commands get inner `rpc.sequence` set to 0. Sync commands=
 get inner `rpc.sequence`
>> +    /// set to the transport counter, matching Open RM. The outer `seqN=
um` always increments
>> +    /// regardless.
>
> This here is too much detail as well IMHO, even more if you follow the
> last suggestion in this review. :)

As this one is a doc-comment, agreed.

>
>> +    const IS_ASYNC: bool =3D false;
>> +
>>      /// Type generated by [`CommandToGsp::init`], to be written into th=
e command queue buffer.
>>      type Command: FromBytes + AsBytes;
>> =20
>> @@ -439,7 +446,8 @@ struct GspMessage<'a> {
>>  pub(crate) struct Cmdq {
>>      /// Device this command queue belongs to.
>>      dev: ARef<device::Device>,
>> -    /// Current command sequence number.
>> +    /// Transport-level sequence number, incremented for every send. Us=
ed for the outer
>> +    /// GSP_MSG_QUEUE_ELEMENT.seqNum. Also used as the inner rpc.sequen=
ce for sync commands.
>
> Note that these types (especially `GSP_MSG_QUEUE_ELEMENT`) are never
> visible in this module, so mentioning them here is assuming context that
> the reader can't easily get.
>
> Instead, how about just "Used for [`GspMsgElement`]'s sequence counter"?

Same here.

>>      seq: u32,
>>      /// Memory area shared with the GSP for communicating commands and =
messages.
>>      gsp_mem: DmaGspMem,
>> @@ -514,8 +522,13 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0=
, command: M) -> Result
>>          // Extract area for the command itself.
>>          let (cmd, payload_1) =3D M::Command::from_bytes_mut_prefix(dst.=
contents.0).ok_or(EIO)?;
>> =20
>> +        // The outer seqNum always increments (transport-level, unique =
per message).
>> +        // The inner rpc.sequence is 0 for async (fire-and-forget) comm=
ands, or the
>> +        // sync counter for command/response pairs, matching Open RM be=
havior.
>> +        let rpc_seq =3D if M::IS_ASYNC { 0 } else { self.seq };
>> +
>>          // Fill the header and command in-place.
>> -        let msg_element =3D GspMsgElement::init(self.seq, command_size,=
 M::FUNCTION);
>> +        let msg_element =3D GspMsgElement::init(self.seq, rpc_seq, comm=
and_size, M::FUNCTION);
>>          // SAFETY: `msg_header` and `cmd` are valid references, and not=
 touched if the initializer
>>          // fails.
>>          unsafe {
>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-co=
re/gsp/commands.rs
>> index e6a9a1fc6296..c8a73bd30051 100644
>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>> @@ -50,6 +50,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>=
, chipset: Chipset) -> Sel
>> =20
>>  impl<'a> CommandToGsp for SetSystemInfo<'a> {
>>      const FUNCTION: MsgFunction =3D MsgFunction::GspSetSystemInfo;
>> +    const IS_ASYNC: bool =3D true;
>>      type Command =3D GspSetSystemInfo;
>>      type InitError =3D Error;
>> =20
>> @@ -101,6 +102,7 @@ pub(crate) fn new() -> Self {
>> =20
>>  impl CommandToGsp for SetRegistry {
>>      const FUNCTION: MsgFunction =3D MsgFunction::SetRegistry;
>> +    const IS_ASYNC: bool =3D true;
>>      type Command =3D PackedRegistryTable;
>>      type InitError =3D Infallible;
>> =20
>> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp=
/fw.rs
>> index 927bcee6a5a5..e417ed58419f 100644
>> --- a/drivers/gpu/nova-core/gsp/fw.rs
>> +++ b/drivers/gpu/nova-core/gsp/fw.rs
>> @@ -260,6 +260,26 @@ pub(crate) enum MsgFunction {
>>      UcodeLibOsPrint =3D bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
>>  }
>> =20
>> +impl MsgFunction {
>> +    /// Returns true if this is a GSP-initiated async event (NV_VGPU_MS=
G_EVENT_*), as opposed to
>> +    /// a command response (NV_VGPU_MSG_FUNCTION_*).
>> +    #[expect(dead_code)]
>> +    pub(crate) fn is_event(&self) -> bool {
>> +        matches!(
>> +            self,
>> +            Self::GspInitDone
>> +                | Self::GspRunCpuSequencer
>> +                | Self::PostEvent
>> +                | Self::RcTriggered
>> +                | Self::MmuFaultQueued
>> +                | Self::OsErrorLog
>> +                | Self::GspPostNoCat
>> +                | Self::GspLockdownNotice
>> +                | Self::UcodeLibOsPrint //
>> +        )
>> +    }
>
> Mmm using a method for this is quite fragile, as we are always at risk
> of forgetting to handle a newly-added function. I wanted to eventually
> split `MsgFunction` between its command and events constituants, maybe
> that would be a good opportunity to do so.

I also think we should leverage the type system for such things.

> Also, this is marked with `dead_code`? Looks like it belongs to the next
> patch in this case.
>
>> +}
>> +
>>  impl fmt::Display for MsgFunction {
>>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>>          match self {
>> @@ -816,7 +836,7 @@ fn new() -> Self {
>>  }
>> =20
>>  impl bindings::rpc_message_header_v {
>> -    fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, =
Error> {
>> +    fn init(cmd_size: usize, function: MsgFunction, sequence: u32) -> i=
mpl Init<Self, Error> {
>>          type RpcMessageHeader =3D bindings::rpc_message_header_v;
>> =20
>>          try_init!(RpcMessageHeader {
>> @@ -829,6 +849,7 @@ fn init(cmd_size: usize, function: MsgFunction) -> i=
mpl Init<Self, Error> {
>>                  .and_then(|v| v.try_into().map_err(|_| EINVAL))?,
>>              rpc_result: 0xffffffff,
>>              rpc_result_private: 0xffffffff,
>> +            sequence,
>>              ..Zeroable::init_zeroed()
>>          })
>>      }
>> @@ -847,26 +868,31 @@ impl GspMsgElement {
>>      ///
>>      /// # Arguments
>>      ///
>> -    /// * `sequence` - Sequence number of the message.
>> +    /// * `transport_seq` - Transport-level sequence number for the out=
er message header
>> +    ///   (`GSP_MSG_QUEUE_ELEMENT.seqNum`). Must be unique per message.
>> +    /// * `rpc_seq` - RPC-level sequence number for the inner RPC heade=
r
>> +    ///   (`rpc_message_header_v.sequence`). Set to 0 for async (fire-a=
nd-forget) commands,
>> +    ///   or to the sync counter for command/response pairs.
>>      /// * `cmd_size` - Size of the command (not including the message e=
lement), in bytes.
>>      /// * `function` - Function of the message.
>>      #[allow(non_snake_case)]
>>      pub(crate) fn init(
>> -        sequence: u32,
>> +        transport_seq: u32,
>> +        rpc_seq: u32,
>
> The caller site of `init` mentions that `rpc_seq` will always either be
> equal to `transport_seq`, or be 0, depending on whether this is an async
> command or not, yet this constructor allows any value to be used. I'd
> like to enforce this invariant by making it impossible to build invalid
> combinations of sequences.
>
> As a matter of fact we already have this information in
> `CommandToGsp::IS_ASYNC`, so the simpler way would be to pass *that* as
> an extra argument to `init`, and let it handle the sequencing
> internally. It also has the benefit of not making this message-layer
> detail leak into the command queue code, making the discussion about
> this detail even more irrelevant outside of the `fw` module.
>
> An even better solution would be to to pass the `CommandToGsp` as a
> generic argument - that way `init` could extract both the `FUNCTION` and
> `IS_ASYNC`. Maybe use a public generic proxy method that calls into a
> non-generic private one to limit monomorphization.

I think we should go with the generic argument; but I don't think we need a
proxy method to fight monomorphization, i.e. I don't think we need to do wo=
rk
for the optimizer in this case.
