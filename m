Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE4C4666E
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Oct 2023 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsUs0xJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191C3C433CA;
	Thu, 19 Oct 2023 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697726501;
	bh=ObxRFemgpKK2dOpFgH2rqxPTtFoQK09xhdZUsccVGqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsUs0xJbY+BIiDnOx8Ybdrqq/LOyqnLUUbUhEqH3wo4hkrXOMp9dm19dPOIwzhp4y
	 yN7RE4qifVnkz8+XVk7V2chsS5KmTvAfmvaraKq3DTIq6wXEhsYrYyqMQ8Mx3aOINf
	 hMVcJh5ZTKi3eX2N+nMFWMk8EVD/AIg9mJ56ejtb2EcTVLOzafYNZJw0R5xVdC0hQZ
	 EekjqOUEDR0FrrJrL1n4wyVfnVBDH6HsrC58CfehcKVAxZYKAgGBLS7nzNLPbwPIF3
	 wHPJcSQY7CBUNqovAP1LnDnp7MdRPRqZh9txozo4x44UPldOJcV9PRsHUybu+hn6ag
	 S1LF7ujWgsGiw==
Date: Thu, 19 Oct 2023 15:41:36 +0100
From: Will Deacon <will@kernel.org>
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com
Subject: Re: [PATCH v3 1/1] arm64: rust: Enable Rust support for AArch64
Message-ID: <20231019144136.GA19567@willie-the-truck>
References: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com>
 <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Oct 16, 2023 at 02:15:23PM +0100, Jamie Cunliffe wrote:
> This commit provides the build flags for Rust for AArch64. The core Rust
> support already in the kernel does the rest. This enables the PAC ret
> and BTI options in the Rust build flags to match the options that are
> used when building C.
> 
> The Rust samples have been tested with this commit.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> ---
>  Documentation/rust/arch-support.rst | 1 +
>  Makefile                            | 1 -
>  arch/arm64/Kconfig                  | 1 +
>  arch/arm64/Makefile                 | 4 ++++
>  arch/x86/Makefile                   | 1 +
>  rust/Makefile                       | 6 +++++-
>  scripts/Makefile                    | 5 +++--
>  scripts/generate_rust_target.rs     | 4 +++-
>  8 files changed, 18 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
