Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5C34D4C8;
	Wed,  7 Jan 2026 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811622; cv=none; b=O5daCf/szLHK3EhDDgxDP1T9L/MWqFOSx4+YHqVeSb9mmMaLbuRL7+NyiMSfX/g8RoEADjp0iv8bAkN0/rnAdDkw2MfPVFcOnLMdIovYM1F0lFWkPV8bmdVl+2+qoP0W7qof0dAd7wAln1d0tbPw+7tcySv4+56J+HAGju4ctxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811622; c=relaxed/simple;
	bh=DibBgRBaACVLcQ9IOd4ZENP6nWAU9Djio8RDETTMxnI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=CFxa8UQyzuh4+9xbLZ3Osn73A5ncdf8An5aGzSu98nddRJqzw/BWq6S6aB7HLIBUD337TfAzI5/Rr/RmsWQmccR9ATxuO+/u/l6ArVhpsf+ctAvaEQ6htLBdAfARYZFdSeigICtwTO4/Kd/WGCHlnkt//5FN0QhtDna++rJwWfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeBCbKz9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeBCbKz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C852CC4CEF1;
	Wed,  7 Jan 2026 18:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811621;
	bh=DibBgRBaACVLcQ9IOd4ZENP6nWAU9Djio8RDETTMxnI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=NeBCbKz9K0DWoMhoQyTqiVoBbIvi+v4bQBJDXsK0yv3t4ZBDVFv8aQmNeA8RF9/Bj
	 R67uAcLM59JVMbxTvr60riv9POimSA/CBJZPXhI6svYY8e3sGsa75XGJ0hAqQPVIdo
	 2j+Fgu9yNQ40y5BtlHoX8GqJcc973gycynO0w/5gwtHwj37q7uV3Fr/a/mZUgEC29f
	 ngvX+mk2o6vzXPExlFW6FK6d0bx3X3n79UMePBJqxvRxn2eVA0wTgkk2H6ThzKDqP+
	 qlEgLIdIJeht0n12n9DLYu/bQ5HGIS8tCG8Cicwj9Q8RuqsBcRPdOis74MaVemSalW
	 AsX5/aA+OMMnQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 19:46:54 +0100
Message-Id: <DFIKX0D35T6B.202RY6VMN2ZHP@kernel.org>
Subject: Re: [PATCH v2 0/2] gpu: nova-core: use CStr::from_bytes_until_nul()
 and remove util.rs
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
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260106035226.48853-1-jhubbard@nvidia.com>
In-Reply-To: <20260106035226.48853-1-jhubbard@nvidia.com>

On Tue Jan 6, 2026 at 4:52 AM CET, John Hubbard wrote:
> John Hubbard (2):
>   gpu: nova-core: use CStr::from_bytes_until_nul() and remove util.rs
>   gpu: nova-core: use CStr::from_bytes_until_nul() in elf64_section()

Applied to drm-rust-next, thanks!
