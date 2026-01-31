Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A27F25A659;
	Sat, 31 Jan 2026 01:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821620; cv=none; b=rFVK/DyeRfJUCNbx0dH9HIaghkeUqz8MNgxNTsvxejCR2zJz7pPLuvack4eN2K/bsu7kOPsqYpfeY1cp1rkO9+aqsQsbMzZjbDK9BS+0BQxIdlrdfipAy7NDngSNrAj3loTXtdWn2ouJte1galcn2EGx7eVTeK1/6TT6X3isRco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821620; c=relaxed/simple;
	bh=dP0kvl+PDyklNVhWEefuB73F72bHu8TRW4DKd7Wz5KM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=ddq3TOLpfACgRIxf+9xNZepqIzbGYUsb+30FL9Io7CMWuodAzrwVFv86VV6/pLU0R7iJA7wl5UQPiQbDOAxJOIcRaO1CCy00BmLJlZdNPSs6U6NzM7aTHzXuwh2y8h14b7L+9MKu4CRqEcxiDA7EtVOjxc4uMzd6YzZXePodzy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RABvcGYY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RABvcGYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94305C4CEF7;
	Sat, 31 Jan 2026 01:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769821619;
	bh=dP0kvl+PDyklNVhWEefuB73F72bHu8TRW4DKd7Wz5KM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=RABvcGYYu/VwI7DYqz5h7sgjafRdADJh/s3zLlFXkjdtFhLikTXPpJ7nH2b9WH1in
	 JaJ8fx9MNiuy3qUgd/snvRgrWXMdQG2fXUrEDQ5rZY1IEFaaAsLSetnEyB2OuQcjER
	 SsdeaBl9Sb4AY2kmFKaKPAe/NJ4vh/CsM75rwfqJaJKP32WUFsywu9SV2R4aaR8mEu
	 rOwySzvCPBmPwy7ZfGQRYyjqUDcMVKhc8XhElSGiLtILLTxw9LnA3U9pEMhXXg6DxQ
	 DqpPjcw7HH4GpUN/WJdgI2E9NmYwJwv/88mj3g5Fs/T7FxaurRafGfbWFFRF5LgJNu
	 YTWQcOLCfiu9Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 02:06:53 +0100
Message-Id: <DG2DEH4ELYHK.2KUOIDQAILZHT@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 6/7] sample: rust: pci: use `register!` macro
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-6-aee3a33d9649@nvidia.com>
In-Reply-To: <20260128-register-v4-6-aee3a33d9649@nvidia.com>

On Wed Jan 28, 2026 at 3:37 AM CET, Alexandre Courbot wrote:
> Convert the direct IO accesses to properly defined registers.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  samples/rust/rust_driver_pci.rs | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_p=
ci.rs
> index 4dfb8a6a4707..df2232d6b71f 100644
> --- a/samples/rust/rust_driver_pci.rs
> +++ b/samples/rust/rust_driver_pci.rs
> @@ -70,24 +70,37 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u=
32> {
>      fn config_space(pdev: &pci::Device<Bound>) {
>          let config =3D pdev.config_space();
> =20
> -        // TODO: use the register!() macro for defining PCI configuratio=
n space registers once it
> -        // has been move out of nova-core.
> +        // Some PCI configuration space registers.
> +        ::kernel::register! {
> +            VENDOR_ID(u16) @ 0x0 {
> +                15:0 vendor_id;
> +            }
> +
> +            REVISION_ID(u8) @ 0x8 {
> +                7:0 revision_id;
> +            }
> +
> +            BAR(u32)[6] @ 0x10 {
> +                31:0 value;
> +            }
> +        }
> +
>          dev_info!(
>              pdev.as_ref(),
>              "pci-testdev config space read8 rev ID: {:x}\n",
> -            config.read8(0x8)
> +            REVISION_ID::read(&&config).revision_id()
>          );
> =20
>          dev_info!(
>              pdev.as_ref(),
>              "pci-testdev config space read16 vendor ID: {:x}\n",
> -            config.read16(0)
> +            VENDOR_ID::read(&&config).vendor_id()
>          );
> =20
>          dev_info!(
>              pdev.as_ref(),
>              "pci-testdev config space read32 BAR 0: {:x}\n",
> -            config.read32(0x10)
> +            BAR::read(&&config, 0).value()
>          );
>      }
>  }

That's only the config space registers, can you please also convert the MMI=
O
ones?
