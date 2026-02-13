Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEBA1B85F8;
	Fri, 13 Feb 2026 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991991; cv=none; b=fge3ooX9Kjy2ZTxtYIzKtAdTT1RVAjPJVpde2vXa/OyC3AWWZ4WwzWssNqvVJswrejffk66E7aedYBEZoyrG+fPPexzR1x1gZd/4lmXUOruuB/KcJ6Ls3mWLFXlCsjRI/ZJXF8GGgEzJBppcTiNDT9y9+vFdte9MuOwPbfLOols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991991; c=relaxed/simple;
	bh=E2kq+60ChwvA0zSTCHAMAR4HYqeBWEU/apZzY6Mpj6U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lR8qgS98G0oOT3Gxjw1R2mR0ZoWlCcCJuRqd8JxZ5qdGrXT0/Sjx9A78kngBdG1mgP3QuCYfiGYD7lxa1xiiqmBhonxAhwT6tc58RM5wrLz4exRgujYc7Zg7BRyzW/tjxneb34cTjZyzgbifGkIQAkE3i5hTGYbtFTvNe3C1L9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLm3Urb1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLm3Urb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5EEC116C6;
	Fri, 13 Feb 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770991991;
	bh=E2kq+60ChwvA0zSTCHAMAR4HYqeBWEU/apZzY6Mpj6U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eLm3Urb12yOsS637vvtPG/rLob73yke/aXkvuirZswy29Crhao8l3lE0m397Vu7vr
	 phoHU/BcmGYw1aZsmYKqJJ3OEe5R5EnAuWHHEMx1LEdDjWlezP+STMuLzZMoOyzvdF
	 33MXlveULyXP379dkkbakrTmRRP0XaChX7LRuqz6ciiJGFFcWcUurvbMyyWMJFJjmk
	 VZb+XQVnDJ4hPJQPclnKkpBLaPw8M8MGV4GHR4T+jmAIpzwjNABcEHZWGjaShfi+0l
	 SJ0ELaH7+yI1Dd8DwLzszHlt4xNnXOLGgppx1qMA4RWUBObXzMTAv9Dwq46P1OrUpY
	 fW4SnPXwTzwBg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Alice Ryhl
 <aliceryhl@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <2026021313-embody-deprive-9da5@gregkh>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh> <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
Date: Fri, 13 Feb 2026 15:13:01 +0100
Message-ID: <873434u3yq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Fri, Feb 13, 2026 at 01:58:16PM +0100, Andreas Hindborg wrote:
>> "Greg KH" <gregkh@linuxfoundation.org> writes:
>>
>> > On Fri, Feb 13, 2026 at 10:55:57AM +0100, Peter Zijlstra wrote:
>> >> On Thu, Feb 12, 2026 at 03:51:24PM +0100, Andreas Hindborg wrote:
>> >> > When copying data from buffers that are mapped to user space, it is
>> >> > impossible to guarantee absence of concurrent memory operations on those
>> >> > buffers. Copying data to/from `Page` from/to these buffers would be
>> >> > undefined behavior if no special considerations are made.
>> >> >
>> >> > Add methods on `Page` to read and write the contents using byte-wise atomic
>> >> > operations.
>> >>
>> >> I'm completely failing to understand. What!?
>> >>
>> >> There is no such thing as an 'atomic' byte load, nor does it help one
>> >> whit against concurrent modification of the memory you're copying.
>> >
>> > I too am totally confused when reading this patch, and the previous
>> > ones.  Shouldn't the "normal" copy_from_user() stuff be used here
>> > correctly?  Why is anything new needed?
>>
>> One use for this is copying data out of a `struct bio_vec`. As far as I
>> know, there is no way to know where the pages backing a bio_vec are
>> mapped. They could be mapped to user space.
>
> And how does C code do this today?  Surely there's a function that is
> used there that we should also be using here, right?  Why do we need
> something different?

C uses memcpy as seen in `bio_copy_data_iter` [1] and in the null_blk
driver [2].

Rust has `core::ptr::copy` and `core::ptr::copy_nonoverlapping`. I was
informed these are not safe to use if source or destination may incur
data races, and that we need an operation that is volatile or byte-wise
atomic [3].

Thus, we build an abstraction relying on byte-wise atomicity that does
not race under LKMM.

Best regards,
Andreas Hindborg

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/bio.c?h=v6.19#n1458
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/block/null_blk/main.c?h=v6.19#n1162
[3] https://lore.kernel.org/r/aYFKbWfQmTInYy91@tardis.local

