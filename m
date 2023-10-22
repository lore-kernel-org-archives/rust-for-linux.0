Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364717C1
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Oct 2023 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019E6C433C7;
	Sun, 22 Oct 2023 10:48:58 +0000 (UTC)
Date: Sun, 22 Oct 2023 11:48:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Will Deacon <will@kernel.org>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com,
	andrew@lunn.ch
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZTT+GMucKZ192yuv@arm.com>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
 <ZTKuxaIeX3QMgdeI@arm.com>
 <CANiq72=hpO8dP_B0=gOocCeaC-GDNQJx1MeA2HDZcEKDt4ZepA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=hpO8dP_B0=gOocCeaC-GDNQJx1MeA2HDZcEKDt4ZepA@mail.gmail.com>

On Sat, Oct 21, 2023 at 03:40:21PM +0200, Miguel Ojeda wrote:
> On Fri, Oct 20, 2023 at 6:46 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > Miguel, Will acked this already so I think it's good to go. Do you plan
> > to pick both patches via the Rust tree?
> 
> Thanks for taking a look!
> 
> As you prefer -- ideally the changes for each architecture would go
> through their own trees (we are trying to get maintainers of the
> different parts of the kernel involved with Rust for their own bits
> and pieces), but if you think there is a reason to avoid that, I can
> also take them as fallback for the time being.

The main reason I asked was that the first patch touches x86 and none of
the x86 maintainers have been cc'ed or acked the patch. I thought
there's some deal that Rust-related changes go via you tree.

> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> If you decide to take them:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> I have boot tested it in aarch64 QEMU and saw the KUnit Rust tests
> passing and checked that the x86 side still works fine.

Thanks. I'll reply to the first patch and cc some x86 maintainers. I
assume your ack applies to the first patch as well.

-- 
Catalin
