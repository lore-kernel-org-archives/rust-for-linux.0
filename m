Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0821D26FA57
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766047476; cv=none; b=AN0RoWP20L0/TUIP0flvPc5SHFlzdHx3ibRJhvdxlFL1qy3bIwjhFotAZ2M+Vc0y1H5M+5FuzuKjjylsO8SVts2PNuSaxhOzBJQW28fdSCey10toWAFNAjkcPOH/l3zjbMaSbdHjgolycqtwIjfmet4pAW9zubUEuEE1xO6CexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766047476; c=relaxed/simple;
	bh=zifFDzDFd3xnbQtT56Qnj/xOx5z3VQ11LSFh/5Xp06s=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=qcNWrlCJP5RtK8dNjkA8KBj6dDJUEhOHXhj/dn17rF+uBkW2Mlnj+tlQfClb58AGpdTS+LAXktX9vfGFBMhkElDYBjl6qfZmRBeDPoayPBp7h6bxp/WWTzTWCrsrPZmeH+5OctH+AlGaUGiHOCom5vgWv4bMV9Zy7I/c2zt+MJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiT24CQO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiT24CQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F5BC4CEFB;
	Thu, 18 Dec 2025 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047475;
	bh=zifFDzDFd3xnbQtT56Qnj/xOx5z3VQ11LSFh/5Xp06s=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=GiT24CQOJmTubVtEDgioxHO4vjNDj3b2YxsSI69C+xWKpMcNpK9bUKjWYkxEkwTME
	 joGTG2ekaBHFLs1R4zMkkS3xAZJguVo/HJcfT/2i0GchwPvETXTIPyqZo1385ljb5b
	 1raAoZZNDB/PMfANPhr+xKuEww5vjVPhnL9Q+G7AJvafPK1zkgALR4CLNgRlFo1S64
	 J8LxUAuF65cE7J8Tk/HfKM0EgfY04faS76m7RFkCQP792em7YEJ008jBEVYJND74x/
	 DFaObLEyFR7gljJi030r8BzcUYFvj/o5bfnWdNbuD611Zp2rtFdW7iaQy2R7is+bNv
	 q3WdK86MlptAw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 09:44:32 +0100
Message-Id: <DF17KWDOWIW8.3KTSJU30CPIMF@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
Cc: "Gary Guo" <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> Summary of changes:
>
> 1. Replace module_pci_driver! with explicit init function.
> 2. Creates root, per-gpu, and individual buffer debugfs entries.
> 3. Adds a pci::name() method to generate a PCI device name string.
> 4. Adds a lookup() method to debugfs, so that the root debugfs entry
>    doesn't need to be a global variable like it is in Nouveau.
> 5. Makes some updates to debugfs core code.

This is nice, but given that this is a v3, where is the changelog?
