Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6AA35839C;
	Fri,  6 Mar 2026 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772794431; cv=none; b=rPmU3Ewa04q5t2hU7BCvVtSRhlJjOTOjLfOkPlZKRjjEtXctYoE4G233C/c37G2Gb7U6A1UKKPeZ7dOnvqpHd+NSXsgJhDV72ghoWynCdx+/82G6nvCzjDAjLAkqDxeEvYzBT6Tb+cYWUsCO+Wj4Ofl8PpmfpP0vUljL11Rqd+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772794431; c=relaxed/simple;
	bh=nhRdYKoFVBLMIadM+f8eRD+secw/nGDbxBmsZFHV2p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d94ASb+nhUaFpGJY+WomlbJAYmQsGI0arrpaDyokqmO1i5cB+5N+urWuSN6MIZnlX+fUMpSZxbh6sQ+i/1K+DlNY6ntf/xIGKxvagJjEfXjqE7tQajTQge10FOA0mIZfqL1UCxL45Lq60BLf1aYTZmZdouw2ewTV7RfSDCmlBCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cmx2wNdU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cmx2wNdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8CCC4CEF7;
	Fri,  6 Mar 2026 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772794431;
	bh=nhRdYKoFVBLMIadM+f8eRD+secw/nGDbxBmsZFHV2p0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cmx2wNdU+sGEBl+ZXlVU6V8ecY6bi4DkR+La67GrIIXRv3aQgkJMvap02ORqe6Xbi
	 rnx/GjKaBsJnJ71Z93zSBoG0cNFX1u3vJvMqWAVjx9wiL5urzKN0+LCci3IVqYI8Ys
	 5wqgHhksmDswoYIee9eiwSTddQLaPo4gDkniy9bVSNH8P28f7ArMiXH1g7jAHr0ju9
	 h+pmB5jEaYmu3Ny5QcTYBj5XXov72ZO0TNzXRiCQva7MFBU9LtgaLnJrKJ+CNEm/lY
	 ahULAbTEYBN0ZH10RmqISSHVyRl9sdDv6v/PG04UyHjnETtdW+ssXNTneOOt6kjyWD
	 nX+c4vVXFpsug==
Message-ID: <fbb1f03b-b87d-4f94-9be9-3dc53e4b1e11@kernel.org>
Date: Fri, 6 Mar 2026 11:53:46 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/10] gpu: nova-core: add Turing support
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Alexandre Courbot (8):
>       gpu: nova-core: create falcon firmware DMA objects lazily

It would be nice to add a TODO that this should be followed up once we have
dma::CoherentInit (which I will most likely just name dma::CoherentBox instead).

>       gpu: nova-core: falcon: add constant for memory block alignment
>       gpu: nova-core: falcon: rename load parameters to reflect DMA dependency
>       gpu: nova-core: falcon: remove FalconFirmware's dependency on FalconDmaLoadable
>       gpu: nova-core: falcon: remove unwarranted safety check in dma_load
>       gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>       gpu: nova-core: make Chipset::arch() const
>       gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
> 
> Timur Tabi (2):
>       gpu: nova-core: add PIO support for loading firmware images
>       gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing

Acked-by: Danilo Krummrich <dakr@kernel.org>
