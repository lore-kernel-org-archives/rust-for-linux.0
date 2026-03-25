Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4633E4C9B;
	Wed, 25 Mar 2026 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451335; cv=none; b=PApBpztUX4e/HWGpwez13aipTA4nuSZK+B/JwsaCFcFMSbIioRko1qzzEivkgeAbPpRhOm46iNeb/K9w7cGW7IesLItcvLVwytHVTw0y4YxUesnMb6X7Nfg1n6jmtrMj7a7BcboMnLvSPK3S804dtvhfdY9jMtwbijVFdGpn98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451335; c=relaxed/simple;
	bh=OW8445jqebc+NvlG9ta4yvi9YVo/E4p7fEoIV6y1i/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ME7NWNT2/FZUcLXTcVXqvaBuAIKEh10ODG52p+SlzbhiidY7W2UuB8L/H62NGxeuwHQi29WePDXDQ5UB9GbR2Z4Gv7Oe4IG0Eg5Kk2ngJNUlJREU/p9wstJwvzzf74VXovArynVjiTZL6pSJIGaxRMStkWYdkX7yTbbk6Ujyjm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMMrTo/E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMMrTo/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A67C4CEF7;
	Wed, 25 Mar 2026 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774451335;
	bh=OW8445jqebc+NvlG9ta4yvi9YVo/E4p7fEoIV6y1i/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cMMrTo/EMyuqTrQPIJpmL7kZrxppL2nYk7si2a+rqTa+xQ4hUem+VbPaHrISyCVRA
	 orN5B8d0LCGcywOpZvkuwPXATwCU1+5ZyPfUi04bMRnXW6wqK4gF7bAhcKXMwfX/Gt
	 y+sMuQZxMMTTVC7tfoZyVBzwQn7a86o2nFqk0T/xlcw7p7aEcBy7NIIdTKxlTfStk2
	 8VEEI58iGbc3+/gA67HxShRyncvde5xcyv8UqxCCspKJsXYmoTaq2TH79DTXQBJNDH
	 AomMn5TTH+mynIA+OlidormSynck2b2rNafgBRBX5gb71+uK76nhwN9nN/F4qpamm4
	 LrswOitvMLBqA==
Message-ID: <d17c4875-f3dd-4743-adf9-05297e8aa29d@kernel.org>
Date: Wed, 25 Mar 2026 16:08:49 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/31] gpu: nova-core: firmware: Hopper/Blackwell
 support
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/26 4:52 AM, John Hubbard wrote:
> John Hubbard (31):
>   gpu: nova-core: Hopper/Blackwell: basic GPU identification
>   gpu: nova-core: factor .fwsignature* selection into a new
>     find_gsp_sigs_section()
>   gpu: nova-core: use GPU Architecture to simplify HAL selections
>   gpu: nova-core: add Copy/Clone to Spec and Revision, add chipset()
>     accessor
>   gpu: nova-core: set DMA mask width based on GPU architecture
>   gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
>   gpu: nova-core: move firmware image parsing code to firmware.rs
>   gpu: nova-core: factor out an elf_str() function
As discussed with Alex,

Acked-by: Danilo Krummrich <dakr@kernel.org>


