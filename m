Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783423BE630;
	Wed, 25 Mar 2026 11:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438307; cv=none; b=JTjhcUndUxVDyuEmIJdCXTjXyWrfIOQHfPK2g4yCco26GO4OI4ASsdhp2jb5dLm5qA8kOF6GFiFOYKTWePUwLIrO0xSiu5lkFP/RC/MWv7zaMEDQU4AMfDCFGRnmjJLpY2/js4x8F0U+uYmHNTbUVQqsxh/lTdKJl5+mAi2SApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438307; c=relaxed/simple;
	bh=uEOg8PmRuFQEjScrs35/FxGppQa8V6ar3Ih6aNm4aT8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=J/qUEtLPmQattLsXxl0acORMSSaB8qJaKaqizZ05SF2FvbarDRzp5uLmLxbP3BJHd6dh+N9COsXGU8qfiyTrsVYBIYC+vP0zcOLOizo5rwmlHkA5UzsLWegX91OkjrghMDSb2CpgLstz3jlgKrdrOEWOcYl27VF8z4yqbR06T18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osTrcPl+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osTrcPl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315C5C2BCB0;
	Wed, 25 Mar 2026 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774438307;
	bh=uEOg8PmRuFQEjScrs35/FxGppQa8V6ar3Ih6aNm4aT8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=osTrcPl+scgF/gj4cHI62gffzwa6HYQxp/wVH27v385dsUdT3QCZQ4XE2NB/gPuj2
	 AXzpSCNuzhr1BU/SFr50tJY2cX5NimFAYbGj7qQPl+psXRU8BUwLwhLAW0y0dQwtRG
	 tgUB60xhxyPr5kPg+Mgb8KoNDV1JguA416sgBXUrgUf+KRMisz96D7m3BZB+GKpkWj
	 o3Jdtw/2lQAQHrCWMccA9ir0JOpMe+LGMAFeev0Vp0UW8KKK2jrm/QsK5aXL5UJUeU
	 wzn7CSbO92egZmXIsjxterOz9HKMlDQQPZU+6uFio1aZDIFc7edZOhWX/ADpUaWvtY
	 IAEXsrlejNAOA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 12:31:41 +0100
Message-Id: <DHBTVQ5C8GWH.22YI7TVB7RWN2@kernel.org>
Subject: Re: [PATCH v8 05/31] gpu: nova-core: set DMA mask width based on
 GPU architecture
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-6-jhubbard@nvidia.com>
In-Reply-To: <20260325035242.368661-6-jhubbard@nvidia.com>

On Wed Mar 25, 2026 at 4:52 AM CET, John Hubbard wrote:
> Move Spec creation into probe() so the architecture is known before
> setting the DMA mask, and pass Spec into Gpu::new().

Hm...this is not what we discussed in [1]. You implemented the change in v5=
 and
v6 and v7 reverted it. Why?

[1] https://lore.kernel.org/all/DGC28K8J39E2.1X173NHT9ZJDI@kernel.org/
