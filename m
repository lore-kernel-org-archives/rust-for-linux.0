Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040221A700
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C273C433C7;
	Tue, 31 Oct 2023 11:58:05 +0000 (UTC)
Date: Tue, 31 Oct 2023 11:58:03 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Trevor Gross <tmgross@umich.edu>
Cc: Ingo Molnar <mingo@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Will Deacon <will@kernel.org>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com,
	andrew@lunn.ch, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
Message-ID: <ZUDry1L3w4sdGRN5@arm.com>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
 <ZTT/h5wKL7STeOhC@arm.com>
 <ZTUCdS0Vrev1iQOv@gmail.com>
 <CALNs47vb+-_wD0uKQJYVMswHdivOr-1v6ajQ3hQw4wNs4Da0rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALNs47vb+-_wD0uKQJYVMswHdivOr-1v6ajQ3hQw4wNs4Da0rg@mail.gmail.com>

On Mon, Oct 30, 2023 at 08:24:39PM -0400, Trevor Gross wrote:
> On Sun, Oct 22, 2023 at 7:14 AM Ingo Molnar <mingo@kernel.org> wrote:
> > * Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > Adding the x86 maintainers - no functional change for x86, any objection
> > > to this patch going in via the arm64 tree (part of the two-patch series
> > > enabling Rust for arm64)?
> > >
> > > Thanks.
> > >
> > > (keeping the rest of the patch below for your reference)
> >
> > If Masahiro Yamada (kbuild maintainer, Cc:-ed) is fine with it,
> > then it will be OK to me too.
[...]
> I don't think this has been picked up yet. Is it only waiting on
> Masahiro 's ack or is a new version expected?

I'd say Masahiro's ack only. However, it's probably too late for 6.7
now, the merging window is already open and maintainers tend to pick
stuff up in the weeks before.

-- 
Catalin
