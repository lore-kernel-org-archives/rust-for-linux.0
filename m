Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2F3D301B;
	Wed,  4 Mar 2026 18:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650497; cv=none; b=BzXSQGc5cH/+ll+MBkAW9TchKYGevTt9w+aE62KtNo9l3SplesHGPzcnzP76V+N8Lc9smk0yNWa4NwKavuJAAX1fan0um7kb+AbZd9FCky0ys+2JDPf0J+znXxpVL9yIYkRF3oLKLErWru6YR73Wz++KcT6h6+RAHXV4MWjIHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650497; c=relaxed/simple;
	bh=cgl947mQfJMBGn1WoSGClRrfM8NxfN4X2g5wR0oCQL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6yPtSnyN1yJ4IukrPh4XWFdT4m2kpRORfVHUZUYcig8shvgnLaL4SNtXIf0wt5x6yq5aTgtxFIg9KiWbOOAi+VbyQAGQvwqUbWK3gDbmCm+fZw7xOmD75Nfx10syNUd9Qhp/1jFFMXnpWj+jTclohrnWT+4R669V3oy37ts/M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id C5E68F4392B; Wed, 04 Mar 2026 19:46:59 +0100 (CET)
Date: Wed, 4 Mar 2026 19:46:59 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 3/4] nvmem: Replace the Wii and Wii U OTP driver with
 a Rust one
Message-ID: <aah-I7qxeI0Va3Qy@luna>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-4-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204040505.8447-4-linkmauve@linkmauve.fr>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

I’m working on a v3 of this series atm.

On Wed, Feb 04, 2026 at 05:05:00AM +0100, Link Mauve wrote:
> I wrote this driver long ago, and wanted to try seeing how hard it would
> be to convert it to Rust.
> 
> It is a very simple driver, we write the address we want to read in one
> memory address, and read the data from a second memory address.  A third
> memory address can be used to disable all reads in a range until the
> system has been rebooted, but I didn’t find any reason to expose that
> feature.
> 
> I made sure to use no unsafe in this driver, to make sure the API
> exposed in the previous commit is usable.
> 
> Ideally we wouldn’t have to impl the write() function in
> NintendoOtpProvider, but currently the vtable requires both.
> 
> I have tested this driver only on a Wii so far, but I assume it will
> work the same on a Wii U, just exposing more memory banks.
> 
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> ---
>  drivers/nvmem/Kconfig         |   1 +
>  drivers/nvmem/Makefile        |   2 +-
>  drivers/nvmem/nintendo-otp.c  | 122 --------------------------------
>  drivers/nvmem/nintendo_otp.rs | 127 ++++++++++++++++++++++++++++++++++
>  4 files changed, 129 insertions(+), 123 deletions(-)
>  delete mode 100644 drivers/nvmem/nintendo-otp.c
>  create mode 100644 drivers/nvmem/nintendo_otp.rs

Should I make it a Rust reference driver[1] and keep the C version, or
is replacing the C driver like I’m doing here okay?  Ideally I would
only maintain the Rust version in the end, but I’m fine with maintaining
both for the time being, until we have everything sorted out.

[1] https://rust-for-linux.com/rust-reference-drivers

-- 
Link Mauve
