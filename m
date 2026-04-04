Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3C137750;
	Sat,  4 Apr 2026 00:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261392; cv=none; b=XUEA0NxZpE0QxBJNawOwM1+tkyO1c/QQcbWvBWY8TyFV7NxYBLOHH3s2BWfB3mc+tS8M+q5TSDZO6xj5+jCT0Oot3kndpuzsk5za/LBuXfOPHUq0WTpPlWEGjm1D0irlgVhiPhH9CTPOyJAy9N8kKzxL3eL1qUg4t3tLe01Mlmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261392; c=relaxed/simple;
	bh=vIy1Ll9qC2oyfXhmdhIT7TXP8/zUi4JSdeupiKPg+9E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=W6XWd0q4JlCUU5pSrekcnGDZnqEXYWBEhde6H5/yyYdjs3lFA0hhBgKRyooUjfrRdO8VfxEXOYkRAmmg/OpuvKWkwDjNxMefTRcHC++tc+/oKFWgislLrWb8N/r2Ry4dG00OjR4M9IO4RaOUF6Uif5+vUPYW+39cwO9TQZr+Pxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sge3PIuj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sge3PIuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22891C4CEF7;
	Sat,  4 Apr 2026 00:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775261391;
	bh=vIy1Ll9qC2oyfXhmdhIT7TXP8/zUi4JSdeupiKPg+9E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sge3PIujCFfaeJ/VjXEtbWh43ZhoT5uLd7ZviKQEMyiXOb6Tli+ymIuMAEsTBQIl2
	 EI1yMfHkMi1R3Sp+zktVVPTJ+bAIfG7OdbDoSDJO4pWAN+geajHZUaELBhXv5bGn9W
	 HEp/ZQDQ6s6YReJwNX1tloP8UZKgWEoxgyGW3yAeXxc2lxq+IBoOdFoZT15fTW/erf
	 Aa3RlWMNJhKLT4O1whg7GI724geAUjGRXai/9d4n1EtF2DRBSyqkUTN8lomuY18LLL
	 KDD57YZ2bWCHczFAPKUEAMg8UZ8/pv0RqJ0Y/rhZOgtdmTAfJqNZlx5eu4+CkLp3Ou
	 pNhIlVpra20Fg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 02:09:47 +0200
Message-Id: <DHJXN2MZTZBF.3LSU0NJD0BQNC@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: bitfield: fix broken Default
 implementation
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Lyude
 Paul" <lyude@redhat.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260401-fix-bitfield-v2-1-2fa68c98114a@nvidia.com>
In-Reply-To: <20260401-fix-bitfield-v2-1-2fa68c98114a@nvidia.com>

On Wed Apr 1, 2026 at 3:42 AM CEST, Eliot Courtney wrote:
> The current implementation does not actually set the default values for
> the fields in the bitfield.
>
> Fixes: 3fa145bef533 ("gpu: nova-core: register: generate correct `Default=
` implementation")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Due to [1] I dropped this one as well for now; I will pick it up once -rc1 =
is
out.

Thanks,
Danilo

[1] https://lore.kernel.org/all/DHJXK4PAD7V0.3UYK35FDHRNIK@kernel.org/
