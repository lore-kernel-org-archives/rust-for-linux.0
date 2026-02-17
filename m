Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000D3352F8E;
	Tue, 17 Feb 2026 17:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771348423; cv=none; b=MZTFYG+kf/1emPRhPR60NtkjJ2H9pogYW61GN4/T+EoAlKln7SfXmFnfoXYxxmmtf43xlRTzSSrb18wMFVShcS+S2OCivUE5GQ+dKfnGpSKiSE3qx3fJwtyutS/1tYmUJbP+OAQ6Jp28FvwSZ9aR+uZzTNjiEp737JRQn0swQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771348423; c=relaxed/simple;
	bh=vptxEgejUk6RUu8QcN6WZNUoO045BQu6cw/K+CzpiQo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=YvMTENQvBKKKMowdD2ZEbf/CSkClz3TsycC+J5Rxgu14ebw6lVZUNPorDiKvoDtiw7Ccxip9Wh5PqtGEnHWHchtFl5XB/KUMjTwaAPt1gNMhV1jgUAlkmvWuUYrg1OOnkSJ1ihPT6nXs/fHbbz2ePL35i708a1epO+0GbdZq/zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m551fof/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m551fof/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFF4C4CEF7;
	Tue, 17 Feb 2026 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771348422;
	bh=vptxEgejUk6RUu8QcN6WZNUoO045BQu6cw/K+CzpiQo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=m551fof/DH3BMY9KhVN6WKZmmjyb5d4NtKj0Kbj98ukoi68Bx8jyZhfvwtE2uVonr
	 ncDDLHbrtqiiXahbjbuuP782PWWQ+QVd3Qs8ZC3EkRXMrxzxFLE+vW70+plo37SuiV
	 pJjZn3iFLB2AFjI8Bew/RIGFEaCAERSzhugzudBbteUkvxHUIsg6LX1Wa5bVbMvyGn
	 1Pf0utmPUm93Jd5zLyJfa6Fq5Kj4RffaA6rWRZsEityUbnlJ+f565WVYQ477PIllLJ
	 X/e+s0CJdvB+wgfDUeGALl1XVbc+lv+vnSsOeNAi8yREnPJyd/jH4k27rL+VMSnDRG
	 5bHEduK6XTYVQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 18:13:36 +0100
Message-Id: <DGHELWT4WZXI.3JE0RQF59ZFZL@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 20/33] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-21-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-21-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> +/// MCTP (Management Component Transport Protocol) header values for FSP=
 communication.
> +pub(crate) mod mctp {
> +    pub(super) const HEADER_SOM: u32 =3D 1; // Start of Message
> +    pub(super) const HEADER_EOM: u32 =3D 1; // End of Message
> +    pub(super) const HEADER_SEID: u32 =3D 0; // Source Endpoint ID
> +    pub(super) const HEADER_SEQ: u32 =3D 0; // Sequence number

This looks like it should be a MctpMessageType enum instead.

> +
> +    pub(super) const MSG_TYPE_VENDOR_PCI: u32 =3D 0x7e;
> +    pub(super) const VENDOR_ID_NV: u32 =3D 0x10de;
> +    pub(super) const NVDM_TYPE_COT: u32 =3D 0x14;
> +    pub(super) const NVDM_TYPE_FSP_RESPONSE: u32 =3D 0x15;

This seems like it should be a different type (or even types) as they are
specific header field values.

> +}
> +
> +/// GSP FMC boot parameters structure.
> +/// This is what FSP expects to receive for booting GSP-RM.
> +/// GSP FMC initialization parameters.
> +#[repr(C)]
> +#[derive(Debug, Clone, Copy, Default)]
> +struct GspFmcInitParams {
> +    /// CC initialization "registry keys"
> +    regkeys: u32,
> +}
> +
> +// SAFETY: GspFmcInitParams is a simple C struct with only primitive typ=
es.
> +unsafe impl AsBytes for GspFmcInitParams {}
> +// SAFETY: All bit patterns are valid for the primitive fields.
> +unsafe impl FromBytes for GspFmcInitParams {}
> +
> +/// GSP ACR (Authenticated Code RAM) boot parameters.
> +#[repr(C)]
> +#[derive(Debug, Clone, Copy, Default)]
> +struct GspAcrBootGspRmParams {
> +    /// Physical memory aperture through which gspRmDescPa is accessed

For the whole series, please end them with a period. Personally, I don't ca=
re
too much, but it's a convention we have for Rust code.

> +/// FSP interface for Hopper/Blackwell GPUs.
> +pub(crate) struct Fsp;
> +
> +impl Fsp {
> +    /// Wait for FSP secure boot completion.
> +    ///
> +    /// Polls the thermal scratch register until FSP signals boot comple=
tion
> +    /// or timeout occurs.
> +    pub(crate) fn wait_secure_boot(
> +        dev: &device::Device<device::Bound>,
> +        bar: &crate::driver::Bar0,
> +        arch: crate::gpu::Architecture,
> +    ) -> Result<()> {

Please just use 'Result'.

> +        let timeout =3D Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
> +
> +        read_poll_timeout(
> +            || crate::regs::read_fsp_boot_complete_status(bar, arch),

Let's just import regs.

> +            |&status| {
> +                dev_dbg!(
> +                    dev,
> +                    "FSP I2CS scratch register status: {:#x} (expected: =
{:#x})\n",
> +                    status,
> +                    FSP_BOOT_COMPLETE_SUCCESS
> +                );

I don't think we should have print statements in the condition closure. Eve=
n for
debug prints we don't want to spam the console.

> +                status =3D=3D FSP_BOOT_COMPLETE_SUCCESS
> +            },
> +            Delta::ZERO,
> +            timeout,
> +        )
> +        .map_err(|_| {
> +            let final_status =3D
> +                crate::regs::read_fsp_boot_complete_status(bar, arch).un=
wrap_or(0xDEADBEEF);

I think read_fsp_boot_complete_status() should just return an Option.

Also, do we really care about the actual value if we time out? If so, this =
won't
work reliably, i.e. final_status could have changed to
FSP_BOOT_COMPLETE_SUCCESS.

> +            dev_err!(
> +                dev,
> +                "FSP secure boot completion timeout - final status: {:#x=
}\n",
> +                final_status
> +            );
> +            ETIMEDOUT

Even if it is the wrong architecture we return ETIMEDOUT? Actually, since F=
SP is
for Hopper/Blackwell only/plus, we way even want to print a warning and use
debug_assert().

> +        })
> +        .map(|_| ())
> +    }
> +}
