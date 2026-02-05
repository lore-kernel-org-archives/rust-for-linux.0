Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12562550CD;
	Thu,  5 Feb 2026 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326459; cv=none; b=AF+/5zFo3kfc7RryLcWLnYfrUYyYpRpTkT3FZI+N1iKLZ5rhazpvO8dZpdkqL2CizhTvx08gVslS9EIZvtuq+0Dp3Jh5l0LTwu9nbgmHZJV70cqbhetrTWXFKwETYmkaIsVvyO/QW4Fl7D995GZZcE1dUaR5MHuFVFNEiLz3nq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326459; c=relaxed/simple;
	bh=mT4BjynNvy9Q9JITgjRP+IwJteQlkKSp9Ir56tnz7ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G27VJrU0KKf94XgiXE3wUBSjjsWftwaYnOXyJ1vUy4ea5eg8g8ivuzCJm6r9ezhFSqf+0U+TmyrYe2JNNw2hYQ21CIuCQi72tfd6MmX3CGOpTDHADoUWes2Dqr6QHso/uW0O0HLB41K+V42pqeTImm1vJGZt9gZNRheES6sRaXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 5C640F439CC; Thu, 05 Feb 2026 22:20:56 +0100 (CET)
Date: Thu, 5 Feb 2026 22:20:56 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>,
	rust-for-linux@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
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
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write functions
Message-ID: <aYUJuF8bI7mwD4ON@luna>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
Jabber-ID: linkmauve@linkmauve.fr

On Thu, Feb 05, 2026 at 08:05:08PM +0100, Danilo Krummrich wrote:
> On Thu Feb 5, 2026 at 6:28 PM CET, Daniel Almeida wrote:
> >> On 5 Feb 2026, at 12:16, Gary Guo <gary@garyguo.net> wrote:
> >> I think we should have everything default to little endian, and have wrapper
> >> types that do big endian which require expicit construction, similar to
> >> RelaxedMmio in Alex's series.
> >
> > Ah yes, the RelaxedMmio pattern is definitely a good one. I agree that we
> > should head in this direction.
> 
> I strongly disagree.
> 
> This is a great pattern for relaxed ordering because:
> 
>   (1) We need both strict and relaxed ordering.
> 
>   (2) Relaxed ordering is rare, hence it doesn't hurt to write e.g.
> 
> 	io.relaxed().write()
> 
>   (3) If you by accident just write
> 
> 	io.write()
> 
>       i.e. forget to call relaxed() it s not a bug, nothing bad happens.
> 
> Whereas for endianness it is a bad pattern because:
> 
>   (1) Devices are either little-endian or big-endian. Hence, having to write
> 
> 	io.big_endian().write()
> 
>       is excessive, we always want big-endian for a big-endian device.
> 
>   (2) It is error prone, if you forget to call big_endian() first, it is a bug.
> 
>   (3) It is unergonomic in combination with relaxed ordering.
> 
> 	io.big_endian().relaxed().write()
> 
>       (Does the other way around work as well? :)
> 
> It makes much more sense to define once when we request the I/O memory whether
> the device is litte-endian or big-endian.
> 
> This could be done with different request functions, a const generic or a
> function argument, but it should be done at request time.

Could this ever be done in the device tree?  I understand this would
mean having to change all drivers and all device trees that do big
endian, but it seems to be the natural location for this information.  I
have no idea how to structure that though.

-- 
Link Mauve
