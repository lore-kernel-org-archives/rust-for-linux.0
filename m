Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995954C80
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742128295; cv=none; b=CNBjLtO2JEIXrUc1lY0IJIYB04sYMwajH5fKraWbsT7ynH1u+hrBqZdH+Ft+OdaP7jBeCJxO27A1JOeD8OkLN/jYkp/zGTue2YapATxzcWVdcU6wwXu7tzNS0gGsCbD8zPKCQLePJrl2ly+wWhVnLcBkjjLbvaURBYdf5ray9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742128295; c=relaxed/simple;
	bh=dliBJKeVoI375tBesVKxDmBswlAJk5v74sHtT0H8K/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bK2W818eqhIwlEThMZI47ULGaWDUmEL8RdIsJgpVpwynK2uGgdmP4Y5SmzuqyOgpyI0dKbLD3guHhsxFOXhvp9sATqCJWxu8NGAs89MVvz6n0rkmwbOMvpq15EcSKJsq2iUcJ7t6IOh10bRFmJDZ/OGNayDbfhL/DnXp9FQT/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWlcMnj/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWlcMnj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B021C4CEDD;
	Sun, 16 Mar 2025 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742128295;
	bh=dliBJKeVoI375tBesVKxDmBswlAJk5v74sHtT0H8K/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWlcMnj/35vjdFhoTG/RfrcuY3i4Pghib2oCaKBBsQLcnJQ0J6UWNItopfcHNckli
	 K9yCNzHm92X4P0FBIVadHUHBqoANkhXPM+yXdBV7jtIptXSp+rP/zelchBrpak6hmn
	 fbsNjcJyEK0qOgGdh6HoLzFwCN1/BUk7ncPo7z7nFIVSs55kl3UxfIY7s6/p5GcuDY
	 U9KgO7KVNNoXSxK90ZqyL8UqdrPxoQMprtPrjeNHGnlDiJsclfmaAwxu1ucS9kh2Xw
	 AxL0TppDcrfG5V5CMUGpYtylFfx1hFdqMvrLxGcjqgEY0ux5SXvaFhpQyRVhV2MMYE
	 2Tx+cdS/PrBIg==
Date: Sun, 16 Mar 2025 13:31:30 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9bEosVk8-0sgSbw@pollux>
References: <20250315154436.65065-1-dakr@kernel.org>
 <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
 <Z9XIk3WpzruUfh6O@pollux>
 <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
 <D8HL95D099MI.2N779RERY6DAE@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D8HL95D099MI.2N779RERY6DAE@proton.me>

On Sun, Mar 16, 2025 at 09:38:23AM +0000, Benno Lossin wrote:
> On Sun Mar 16, 2025 at 1:33 AM CET, Tamir Duberstein wrote:
> > On Sat, Mar 15, 2025 at 2:36 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >>
> >> On Sat, Mar 15, 2025 at 05:44:29PM +0000, Benno Lossin wrote:
> >> >
> >> > What is meant by "copied"? I agree with Tamir, this can probably just be
> >> > "taken ownership of".
> >>
> >> If not dropped in place, the only way to take ownership of the object is to copy
> >> the corresponding memory, i.e. the caller can not take ownership of the object
> >> at its current memory location, since this memory is owned by the vector.
> >
> > I think this is the point I was trying to make: the language semantics
> > are such that "taking ownership of" is equivalent to "become
> > responsible for the dropping of", so it doesn't make sense to write
> > that here, as though this requirement is specific to the semantics of
> > this function.
> >
> >> AFAIU, when we speak of ownership, we mean ownership over a value or object, but
> >> not ownership over the underlying memory.
> >>
> >> Hence, I think it's important to mention that it needs to be either dropped in
> >> place or copied in order to take ownership.
> >>
> >> Even if we agree that "drop in place" is considered as "take ownership", we need
> >> to differentiate between the special case of taking ownership where its dropped
> >> in place and the requirement to copy the value and then take ownership.
> 
> I get where you're coming from, but I wouldn't call that copying a
> value. Copying for me means that there would be two instances of the
> same object. But since the one in `[new_len, len)` will get invalidated,
> I don't think that copy makes sense.

What I meant is "copy the memory where the value is stored".

> 
> Also why even is this a safety requirement? There is `mem::forget`, so
> doing `vec.set_len(0)` can also be done by safe code:
> 
>     while let Some(val) = vec.pop() {
>         forget(val);
>     }
> 
> I don't think this needs to be a safety requirement.

Given that mem::forget() is considered safe, you clearly have a point here.

Let's go with just "must be taken ownership of" then. Unless there's subsequent
feedback, I won't send a new version for this, since you both already gave your
(conditional) RB for this.

(I tend to forget that mem::forget() is formally safe, since it can cause all
kinds of bugs, e.g. dead lock the whole machine if called for a lock in the
kernel, etc.)
