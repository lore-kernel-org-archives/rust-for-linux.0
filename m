Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585C0327C19;
	Tue,  6 Jan 2026 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767700978; cv=none; b=OsV0f94szgntKdBD9pFzCznsk4vJoffuR8LigBpRHmHBnOvNsvXv0loMQylOHq/SgEuXCcS0R8C0MUE/p1PkB9HlznxyJWb4reIzNX+HP2mzSBwIG9gFtOrm8u49yYp+vEB7p+UAGswwD8Yql+ODOtCwtZz3F1G9VDB06MVVhGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767700978; c=relaxed/simple;
	bh=RuR20ntLSihU7i4U/Z71FOOJsBvzHsUKXpYAf9QNo5k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=LgcPeMru7I5D3dG+2PmCRWW3J5VLWYt3CbLmSS4JZkJWC8qQce3kqmjwHl5LzSm4/fcTNZTiTLgOoKXIPkODqhdKtu9YDpRNnGWg2tZpcgP7YfxBVtDUOrTS3bhez0R+nM8sOdEPGYkL5KEVTSFthsA86rqHX6t6YJCuFPMHXC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT5UdRQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT5UdRQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8139FC116C6;
	Tue,  6 Jan 2026 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767700977;
	bh=RuR20ntLSihU7i4U/Z71FOOJsBvzHsUKXpYAf9QNo5k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=dT5UdRQgmJpc3yEWySg1nUr+5EtLuryqgJyy9pbNyBaLQpno0fhxEhdzeIt4pN/ML
	 w9ZF8E7JLB0/JB9yEcXOkRobNbwpKwhw6k03fNG93N5lDTUSTY/fnHMPU/hDPaq4DI
	 nVc+pOhH+F935WDEJgQ3gFrYl7VTMrTEPC8vqXSZ6JkE8I/7elG78/psjuEqKFikBE
	 DRE70jAe3Kwa2HXf4OnCFnsW6x3JPbKHOMnDljTV1jWYkI/EOABWLfo94LI+so71CV
	 +j4dPogSIz/7hU0VXC/a574quUxWu0gAiPNgX1YjKDA4mvy6xsi6gx1gknsLaHtpNQ
	 GmsJby6TeLrXA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 13:02:51 +0100
Message-Id: <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
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
References: <20260103013438.247759-1-jhubbard@nvidia.com>
In-Reply-To: <20260103013438.247759-1-jhubbard@nvidia.com>

On Sat Jan 3, 2026 at 2:34 AM CET, John Hubbard wrote:
> @@ -209,7 +208,9 @@ impl GetGspStaticInfoReply {
>      /// Returns the name of the GPU as a string, or `None` if the string=
 given by the GSP was
>      /// invalid.
>      pub(crate) fn gpu_name(&self) -> Option<&str> {
> -        util::str_from_null_terminated(&self.gpu_name)
> +        CStr::from_bytes_until_nul(&self.gpu_name)
> +            .ok()
> +            .and_then(|cstr| cstr.to_str().ok())
>      }
>  }

Did you see my reply in [1]? The question is orthogonal to this change, but
perhaps it can be addressed with a subsequent patch?

[1] https://lore.kernel.org/lkml/DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org/
