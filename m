Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F87543A
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 16:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/K8p65H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96328C433C7;
	Tue, 12 Dec 2023 16:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702399679;
	bh=XF63h1kuxEzpbT+A2nxez/2sqsSVuEBj4HJY8oeJ804=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/K8p65HG8NeHJBLKa0McHedFOXKkI5TEbfPf/eRvxIY/BOeqWYgdrGo8cV+eakxL
	 z3HRDcj7GmshpVpfZU/9VPEAHCy3/ZujPN9JX0iFB2CzeQikP2Qaea+J/qvr/SEHMA
	 n/vFNBtlQ+pGgV+fEaY1VXs3HTOiEstXdmA5tZ7xjxKkjlowA/R+rRqTVLQXDl0T4o
	 +Fr8efQlEKmwk3sb0FwIIguX3fEPh5pklNHjkxNdDGIxLXCmNaoHtJWwbuipx+TRRe
	 4US22/AMqEFx1T7cpUvnw7LGpH0wurNlMmpEzp5HslQMfVw34c4D1EmuBkJddizuKC
	 6c2/JWMfeOlOQ==
Date: Tue, 12 Dec 2023 16:47:52 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, Ingo Molnar <mingo@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	steve.capper@arm.com, Asahi Lina <lina@asahilina.net>,
	boqun.feng@gmail.com, andrew@lunn.ch,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
Message-ID: <20231212164751.GA30181@willie-the-truck>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
 <ZTT/h5wKL7STeOhC@arm.com>
 <ZTUCdS0Vrev1iQOv@gmail.com>
 <CALNs47vb+-_wD0uKQJYVMswHdivOr-1v6ajQ3hQw4wNs4Da0rg@mail.gmail.com>
 <ZUDry1L3w4sdGRN5@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUDry1L3w4sdGRN5@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Oct 31, 2023 at 11:58:03AM +0000, Catalin Marinas wrote:
> On Mon, Oct 30, 2023 at 08:24:39PM -0400, Trevor Gross wrote:
> > On Sun, Oct 22, 2023 at 7:14 AM Ingo Molnar <mingo@kernel.org> wrote:
> > > * Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > > Adding the x86 maintainers - no functional change for x86, any objection
> > > > to this patch going in via the arm64 tree (part of the two-patch series
> > > > enabling Rust for arm64)?
> > > >
> > > > Thanks.
> > > >
> > > > (keeping the rest of the patch below for your reference)
> > >
> > > If Masahiro Yamada (kbuild maintainer, Cc:-ed) is fine with it,
> > > then it will be OK to me too.
> [...]
> > I don't think this has been picked up yet. Is it only waiting on
> > Masahiro 's ack or is a new version expected?
> 
> I'd say Masahiro's ack only. However, it's probably too late for 6.7
> now, the merging window is already open and maintainers tend to pick
> stuff up in the weeks before.

Masahiro -- please can we have your Ack on this so that we can take it via
the arm64 tree?

Thanks,

Will
