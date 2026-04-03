Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6EE2248A5;
	Fri,  3 Apr 2026 17:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237862; cv=none; b=RUP95EjxBL99UHCCX1Q0x+UDUA8d2WHg/MadSUAXSdKXsTrUwuwasZqeLsLb5WWsXs3MPL8LZLPs3CTGsgEyl0B5YWqVW+a6l0mWgqC0PpRtiJ++j1Dojv/UoM0WH10psQRnF+ImNG/yMHVd7OjLXjIhi9Lc9+KoFo00L5DHG+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237862; c=relaxed/simple;
	bh=j5Lg+DOCGLuJzSedXBQFy1M5HS8GXHosnGnLzNSWDic=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rQcViG4TwbKu+VwwOCsVYWorU9mG+PBXdt1rpac4Vu0dadp4ONpev5+fLk+Tof5UA8lVTnezQEO8H2xcDIY6O2g8AwnxFRH1XbAS32TS4oigG69GO69sRcLKWVWWdWrGgb1hrevyl21Q4Gt1GV1RFIqNLoPwu4dcaztSSbR/l9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWTrcwWe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWTrcwWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CE2C4CEF7;
	Fri,  3 Apr 2026 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775237861;
	bh=j5Lg+DOCGLuJzSedXBQFy1M5HS8GXHosnGnLzNSWDic=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SWTrcwWe8frx7pOV00HJEAe4tjyaVxdgruJZUCuNgbBFc/fJaYKEYnyhOMYIpojb3
	 w4FX4yPkZc6CuAmvxOdCLG/g/WuaxtVEkuN0ROW90tfGqwhzEW0kQhon/8RY31E8Ie
	 UkBDQ3KVOc+mwNE4aDuFJfpA/gXXA0RNObFrNIwtDjMfuB+pxZW8nfDwqsdlIm4/cE
	 GRsdKGWLJAihdbLCbfXArOT59YIgBc4HJtyTN1oiY2CWSQtJotqZvtc6BPc1HZH7VQ
	 DYRA1TPXtiwtotxGf7Mio8l8TEbxZtkefNfV1C0oziN9ZXnWCpIGJkDHsOm1Ly0HwE
	 vmfT4iRO7OKYw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 19:37:37 +0200
Message-Id: <DHJPAT57O4B5.27NTSV0S1Y2TI@kernel.org>
Subject: Re: [PATCH v4 0/2] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260401-cmdq-ub-fix-v4-0-a9a9cf982485@nvidia.com>
In-Reply-To: <20260401-cmdq-ub-fix-v4-0-a9a9cf982485@nvidia.com>

On Wed Apr 1, 2026 at 4:29 PM CEST, Alexandre Courbot wrote:
> Alexandre Courbot (2):
>       gpu: nova-core: gsp: inline methods providing queue range invariant=
s
>       gpu: nova-core: gsp: fix undefined behavior in command queue code

Applied to drm-rust-next, thanks!
