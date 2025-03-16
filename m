Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02A376
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742132799; cv=none; b=A8o0Tv0GdEuPdEeURad4zbl0M60J2bwkHeKbpm8ixTC6Dkj9dRXFOTX+KmLRinzX0UlWwY1ySslMoQbycPrMToUn4QOGy6lL2ogADoblGRXPoMzzOX8ivEqwV8uGGMeJNrcxxrpuxbbJ2RaRsrEJV5Tipr8tsT8ia5DcJW+LRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742132799; c=relaxed/simple;
	bh=mq+oNfMO3XEzykRc/M61LF11x+e5zznZY1DKm8fz1cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTtGGkOIIrE7Obw9USdauwvY3Hva6joCk2U9qDpVUvtM2JOrgXVjObypQrse8SuOdCycmQJTmfhWZpZUiD+k3aVxUEhmFMLFnjLQJNb3b8wqsZ4rJ0Am3HvErfgddd5SRCs9lUWFpTt83vQRrcUVhF5y5hJHJu9WX1Hw+sswX/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2FNnYrv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2FNnYrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454B8C4CEDD;
	Sun, 16 Mar 2025 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742132798;
	bh=mq+oNfMO3XEzykRc/M61LF11x+e5zznZY1DKm8fz1cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2FNnYrvblF2PhQqxlS71Kip3E9rezynNkSmFTg5gHnnhDmkQXdQHTJY9MSUjZZm3
	 wqzxUPNK8pmadBcuMqgF/w7T/cBnAUqDkS8/GuMppFepAvjX33h3H+AZ7mc6JjfuWt
	 zO4BKAp73wJVy+uxcGEC/vDcUBnYGT9FKYSrS48px9YontFLh/s2vjtWHUgBF3u1qw
	 fQ47+NmIy/LOs7TKRI60fFQ/GrkUqWdZSqX2+RQDMoLVFXmItqH202oFfMCzR1YIYH
	 9iCpyz3TkokosPYU8pUdCF6TqkN6118cT70YvJtDC/8dceRqMpkE0IINeyliWkD3AP
	 W1vqKO+Sy1a4g==
Date: Sun, 16 Mar 2025 14:46:32 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9bWODCNNEq3xI51@pollux>
References: <20250315154436.65065-1-dakr@kernel.org>
 <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
 <Z9XIk3WpzruUfh6O@pollux>
 <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
 <D8HL95D099MI.2N779RERY6DAE@proton.me>
 <Z9bEosVk8-0sgSbw@pollux>
 <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
 <Z9bLtgJa3PNB0bkf@pollux>
 <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>

On Sun, Mar 16, 2025 at 09:13:50AM -0400, Tamir Duberstein wrote:
> On Sun, Mar 16, 2025 at 9:01 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Sun, Mar 16, 2025 at 08:42:43AM -0400, Tamir Duberstein wrote:
> > > On Sun, Mar 16, 2025 at 8:31 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > >
> > > > Let's go with just "must be taken ownership of" then. Unless there's subsequent
> > > > feedback, I won't send a new version for this, since you both already gave your
> > > > (conditional) RB for this.
> > >
> > > What does it mean to take ownership, if not to run the destructor?
> >
> > Taking responsibility over the decision of what should happen to the value, i.e.
> > forget about the value, drop it right away, keep it alive at a different memory
> > location.
> >
> > > Given Benno's insight, I think the safety text is correct as it
> > > existed before this patch.
> >
> > Without the addition there's no requirement for the caller to take ownership,
> > but that's what we want here. Without the requirement it would be on set_len()
> > to take a decision on what should happen with the value.
> 
> It isn't a safety requirement, right? I think it's fine to document,
> but given that neglecting to run a destructor is safe, it doesn't seem
> to affect safety.

I don't think there's a rule that safety requirements of unsafe functions must
only be used to guarantee memory safety, etc.

But you're right, if set_len() guarantees a default of what happens to the
value(s) when the caller doesn't take ownership, we could avoid the safety
requirement.

But I don't want set_len() to make any guarantees about about a default, instead
I want that the caller is forced to make an explicit and documented decision
over what happens to the discarded values.
