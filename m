Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1562C374194;
	Mon,  2 Feb 2026 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043977; cv=none; b=Lvs5evII8xPuvxShuQ2a9TsxdDEYGvYJWEgtPG0heCZ4DoVSs0LlbZ9LkCXqNIJFzBZ3fjOqpJ88sjGT+Gb9xx7vt0swtXv2QK5FLgx9IAbuy2uqa+XHmlnU2BmzPVZCzXTpsA3EvtkJ0Ou8NzetZ40zjzFOXSoWVUoFBOv485Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043977; c=relaxed/simple;
	bh=DpKN1zB9jDt5oLNW9GWwTCcpJ9LVGF8ljqdByG6v1QY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=ZAYEgMb5MAtdStF05xd6XLlvvSM0gaDSm+Sj5irPdWK5RVsxE0VAQsoYjbhr8RRe9ZvmwlPWAhRaTOT66BRk8aR39qRXTu3sX8rBpAZwFc5zWo8f3FgV1BBFMTfpaMiaGluL7HF4dqz2RTxDEzaOfi9+54j0lRJ8PNJepMOh2RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsI6GGBR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsI6GGBR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EA7C116C6;
	Mon,  2 Feb 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770043976;
	bh=DpKN1zB9jDt5oLNW9GWwTCcpJ9LVGF8ljqdByG6v1QY=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=EsI6GGBRD6G7M96GB0buE0ifwjXzDUAmK0Tv7femLa8HX+86PIhZlqpukrFyCLNy0
	 CH3kM7dzUpPq6yiUCAC8GbZYpxEWEIpDPb3UZGc4wtuWMWTdbbbQFMnQBRx/w0d+y6
	 gs2+TcoW3DLJ1DHv3asu75XjoQdoIQCi78KrNAsnSYukkH/U6Vk5JHGkGVsA7nMQOt
	 m1zaSknm4t36bRbimxsccNY/sp0pMnA8/969UAQ774y1vyF4djsekNGVYbSgy57rQk
	 QeSLHQnRUdcsyixG+zDllPewP2ieK1zp7jzMKbN17lrvIke2YU55NEv2gOGKmWQ2am
	 eRPVlkWoHZU0g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 15:52:50 +0100
Message-Id: <DG4K7YGOOHA0.PR72G7RL07PE@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 08/30] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
 <20260131005604.454172-9-jhubbard@nvidia.com>
 <DG4K5PA5DYIF.1BWA30EA8G1LQ@garyguo.net>
In-Reply-To: <DG4K5PA5DYIF.1BWA30EA8G1LQ@garyguo.net>

On Mon Feb 2, 2026 at 3:49 PM CET, Gary Guo wrote:
> On Sat Jan 31, 2026 at 12:55 AM GMT, John Hubbard wrote:
>> Hopper and Blackwell GPUs use FSP-based secure boot and do not require
>> waiting for GFW_BOOT completion. Skip this step for these architectures.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 2e7b90b80877..2ed0f6d8d19d 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -304,10 +304,19 @@ pub(crate) fn new<'a>(
>>          let chipset =3D spec.chipset();
>> =20
>>          try_pin_init!(Self {
>> -            // We must wait for GFW_BOOT completion before doing any si=
gnificant setup on the GPU.
>> +            // Turing, Ampere, Ada: we must wait for GFW_BOOT completio=
n before doing any
>> +            // significant setup on the GPU.
>> +            //
>> +            // Hopper/Blackwell: skip GFW_BOOT completion waiting entir=
ely, and use the simpler FSP
>> +            // Chain of Trust boot path (elsewhere) instead.
>>              _: {
>> -                gfw::wait_gfw_boot_completion(bar)
>> -                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot =
did not complete\n"))?;
>> +                if matches!(
>> +                    chipset.arch(),
>> +                    Architecture::Turing | Architecture::Ampere | Archi=
tecture::Ada
>> +                ) {
>> +                    gfw::wait_gfw_boot_completion(bar)
>> +                        .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW b=
oot did not complete\n"))?;
>
> I think the `as_ref()` here is no longer necessary?

Current drm-rust-next does not have the required changes yet, but it will a=
fter
-rc1 is out. I'd recommend basing patch series on linux-next if they do not
target the current cycle.
