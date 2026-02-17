Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6F83358AD;
	Tue, 17 Feb 2026 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343041; cv=none; b=O9OeGDUXIYI2/h4jsDH7AlQyI5X0dHahyN4PS1bq2TcbK24YRSqRqiK1buBsTM7d0jruK4ugw/heLLGagZzhM5bfcGbU9MumYUPQCuf+9cLmIm4wP+2tBqazd1JswXYzHeQHgAAJkWXIig3f7i9hD20KwkJFMGOBtFbvZVVv1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343041; c=relaxed/simple;
	bh=XBoj7jEee6VfITY4FrVhLwIQfn3xCXCky7dYUphWrbg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VQfioMSyyCHE06VTn/d4O6+4i0Pnee6hsGpngiajYVefvqMTlcskQn6Zvp5pidG5hCdDW+BcKP9WFusvE6U38fec6USaFdAj9FuaPZ1Qfmua40805rxIMfFrJpj2xkVbtJ0ylwAqHez20VtsM9plSU6x61rX95wl7Pd/kQKgs7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVWscTb/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVWscTb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D88C4CEF7;
	Tue, 17 Feb 2026 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771343040;
	bh=XBoj7jEee6VfITY4FrVhLwIQfn3xCXCky7dYUphWrbg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sVWscTb/mAJvi7p5NHrL9Wyzu+Rbk2HYWjeFQebqQWPkAr1bjPIMBBT56d2CZSSdz
	 cAgLZNdUAvB7tfhy2u8UghAK8GizWwcQyoVzjmERGfr8fA4VEC5XyQ/PsKEfpcccd3
	 8MdOarGwt7ySv6rGm89MXnQfsscQdlOT2rCSc0Qkt3rQNUtV/8paUxq70iU2a9A6OW
	 9UeGTWVFCZr5POebt+DowX4SfTlmeuhtLBAZY3/AgcUfJp0Wb0gTjn7kGtWeuuvsWX
	 hI9x6xae/QMMPgGk7G/9jUbZ/aUT2F/7mfF3s0y5o/uMm+C1qtWoFH9Fsvo+U1YGZd
	 MFLcJ1Uv++RUA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 16:43:54 +0100
Message-Id: <DGHCP8CM5CRI.2C5YJ7S899XE1@kernel.org>
Subject: Re: [PATCH v4 17/33] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
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
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-18-jhubbard@nvidia.com>
 <DGC2UTPTU2ZH.3Q5E9OW3ZRPLP@kernel.org>
 <b38a9707-a640-4104-a8a9-238cab23187a@nvidia.com>
In-Reply-To: <b38a9707-a640-4104-a8a9-238cab23187a@nvidia.com>

On Thu Feb 12, 2026 at 3:09 AM CET, John Hubbard wrote:
> On 2/11/26 2:57 AM, Danilo Krummrich wrote:
>> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> ...
>>> +    #[expect(unused)]
>>> +    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut=
 [u8]) -> Result {
>>> +        // TODO: replace with `is_multiple_of` once the MSRV is >=3D 1=
.82.
>>> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>>> +            return Err(EINVAL);
>>> +        }
>>> +
>>> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
>>> +            .set_rd_mode(true)
>>> +            .set_offset(offset)
>>> +            .write(bar, &Fsp::ID);
>>> +
>>> +        for chunk in data.chunks_exact_mut(4) {
>>> +            let word =3D regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, =
&Fsp::ID).data();
>>> +            chunk.copy_from_slice(&word.to_le_bytes());
>>> +        }
>>> +
>>> +        Ok(())
>>> +    }
>>> +}
>>=20
>> Technically, we could represent this as a separate I/O backend and use I=
oView /
>> IoSlice (once we have it).
>>=20
>> So, you could have Falcon<Fsp>::emem(), which returns an &Emem that impl=
ements
>> Io [1].
>>=20
>> This way we would get IoView and register!() for free on top of it. IoVi=
ew will
>> allow you to modify fields of the FSP structures similar to what we have=
 for DMA
>> with dma_read!() and dma_write!().
>>=20
>> I just briefly glanced at the subsequent patches, but it looks like this=
 could
>> save quite some code.
>>=20
>> We may not get the full potential right away, as IoView is still WIP, bu=
t I
>> think it makes sense to consider it for a follow-up.
>>=20
>
> Yes, let's keep this in mind.

Just to clarify, I mean we should implement Io and IoCapable right away, bu=
t
leave the rest as follow-up.
