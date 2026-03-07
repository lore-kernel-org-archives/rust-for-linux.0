Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E63793BE
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 22:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772922585; cv=none; b=L/9Yjinwp9WpcmJQk/SqhF26JYsDu5T663Jxl2yePpXjvS+nfllyoA7rGQMsm7mxdDKpH1AsVHeu393/nc3+a2T49aNm3RVHH2jsMs2T4WP0VwydVFRKiWxmtVce1QUnKZ5+FVfNGxXjZ+hxehxFbkXUKhGqQI3MAnVT6CcFt+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772922585; c=relaxed/simple;
	bh=OIuwb2bopBRHElqFVopnz3DK28ntO84rZBTW9G4A+eo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qFSeCP5e6kVSFjVgv+d/wY25Ap5zC0HsDiWO0zrhjWDgg30pcaZcAmv+5n1BBe3uKgmzKGfMfNwc3tLb66McrdMZh7MiiFMayAp4mkaL5LeIwok1Pl7cJ+jA+n5fRPoNDahB7dLqzpCtXnAxrIPyKCPwZeqH5Wqfg8Uf02K2Hw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ks//Yn5Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ks//Yn5Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEA2C2BC87;
	Sat,  7 Mar 2026 22:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772922584;
	bh=OIuwb2bopBRHElqFVopnz3DK28ntO84rZBTW9G4A+eo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ks//Yn5YtQj5bJYjcudWuc/aB7fyscvq1Sb5mif5/zzUd7Dvyqi726NrUt1GRlVKt
	 5gQARpZTuM5G1PBx/wq0dgPw/ZbPDL+uzDEKB1MDsDs/kouPGDBlKOvrxDFR1XxuTD
	 QE8bOs19P3fVw5E5EmKBZmPr/rwznfXZkpliER2ZJfB+EUaSbslpyqCJFvZy2ZFWYl
	 EiLniYl2LHX5Yn0SsZfQqfJ/Sbc72N/kWTkhup2gOcM/dMIOK9gtkQLduSPO9b9lu+
	 RPlJH7dNFSG0/rsutDrdnHO8e1zMKoR9m47Ag0C8Kg0O0oH744IrLXpdn5OZxmL4PQ
	 283YspXXCkJ9A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 23:29:40 +0100
Message-Id: <DGWWLPQ03ZAW.3T6CREGS4CM4I@kernel.org>
Subject: Re: [PATCH v4 0/3] rust: add pointer projection infrastructure and
 convert DMA
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260302164239.284084-1-gary@kernel.org>
In-Reply-To: <20260302164239.284084-1-gary@kernel.org>

On Mon Mar 2, 2026 at 5:42 PM CET, Gary Guo wrote:

Applied to drm-rust-fixes, thanks!

> Gary Guo (3):
>   rust: ptr: add `KnownSize` trait to support DST size info extraction

    [ Fix wording in doc-comment. - Danilo ]

>   rust: ptr: add projection infrastructure

    [ * Add intra-doc links where possible,
      * Fix typos and slightly improve wording, e.g. "as documentation
        describes" -> "as the documentation of [`Self::proj`] describes",
      * Add an empty line between regular and safety comments, before
        examples, and between logically independent comments,
      * Capitalize various safety comments.

        - Danilo ]

>   rust: dma: use pointer projection infra for `dma_{read,write}` macro

    [ Capitalize safety comments; slightly improve wording in doc-comments.
      - Danilo ]
