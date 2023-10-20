Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306682115
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AFCC433C8;
	Fri, 20 Oct 2023 16:45:59 +0000 (UTC)
Date: Fri, 20 Oct 2023 17:45:57 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
	steve.capper@arm.com, Asahi Lina <lina@asahilina.net>,
	boqun.feng@gmail.com, andrew@lunn.ch
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZTKuxaIeX3QMgdeI@arm.com>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>

On Fri, Oct 20, 2023 at 04:50:56PM +0100, Jamie Cunliffe wrote:
> This commit provides the build flags for Rust for AArch64. The core Rust
> support already in the kernel does the rest. This enables the PAC ret
> and BTI options in the Rust build flags to match the options that are
> used when building C.
> 
> The Rust samples have been tested with this commit.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> Acked-by: Will Deacon <will@kernel.org>

Miguel, Will acked this already so I think it's good to go. Do you plan
to pick both patches via the Rust tree?

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks.
