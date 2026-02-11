Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC14B183CC3;
	Wed, 11 Feb 2026 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770820717; cv=none; b=nN84ZJOSVde5EANPbqzsOnXqLekPULtYw4z7HU6wZd1pGBOHsnld5mx6QCEiHpVdsEeJ8pdiP27eyYWMWAthJtVgYGqoHBVGvO7W8qdQu/baoq4KXAb94NbWfboI1M/d7UpZ+YpLfI2TCklbzrUctwGIukAAccKRplYGC9zTtco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770820717; c=relaxed/simple;
	bh=LLfEZdrWMC01KnSUzsRLFapK9SAcgEquZEXKmPEaFrM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EDo88rHF6v6MBunMt1+sn9koQMfH44btwPWNVWhf+q6pXSRTuaaPBNS9MgB/hjADNG3qxZO/mR8HxxFTD9HzmfpA1SVe1baCrHW5reUbEYFoUqEPJryVfeyvDq9SU+AQaJI91C7TG4wCTIrCvf1kwxW8X2U12xIUTPbCejEV8jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bd2QNiC9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bd2QNiC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049C3C4CEF7;
	Wed, 11 Feb 2026 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770820717;
	bh=LLfEZdrWMC01KnSUzsRLFapK9SAcgEquZEXKmPEaFrM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Bd2QNiC91p0a5SzTno7OirdVI6LrmY7vJ82fbNBDgx32FSgEgK69zLP6iCpMAd5QM
	 Wvpj8Def+8gnIzc3VCl0heIAcs+hBaD9yEPc5SHGv8zhY4usuXbusr8pegzM4T5VNE
	 YelRwylzUq33Eu+OFsTma7U9ttrqcb0J32s0OKHx0rVCoEO+UsOmDTuhk5b1xtyS9x
	 FhWscwnesL52cLA/5dcFjr+Gv0iXyrL1eX4T0mb2rK/ntcAOv+96J58+VYJ8pPgUvU
	 1EsmfJx/9/Zs50c83DqEgEIKgm2opCoAyT07A7dE0C7IrZsOZaIKdK4LyCRYndIrAN
	 2M/2CVLN9BlgA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 15:38:32 +0100
Message-Id: <DGC7JWOL70HH.2AMUEI3M10I9J@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: "Alice Ryhl" <aliceryhl@google.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com> <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
 <20260211112049.089b2656@fedora> <DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
 <20260211121223.78674f22@fedora>
In-Reply-To: <20260211121223.78674f22@fedora>

On Wed Feb 11, 2026 at 12:12 PM CET, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 12:00:30 +0100
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>> I.e. sharing a workqueue between JobQs is fine, but we have to ensure th=
ey can't
>> be used for anything else.
>
> Totally agree with that, and that's where I was going with this special
> DmaFenceWorkqueue wrapper/abstract, that would only accept
> scheduling MaySignalDmaFencesWorkItem objects.

Not sure if it has to be that complicated (for a first shot). At least for =
the
JobQ it would probably be enough to have a helper to create a new, let's sa=
y,
struct JobQueueWorker that encapsulates a (reference counted) workqueue, bu=
t
does not give access to it outside of jobq.rs.
