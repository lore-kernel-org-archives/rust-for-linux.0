Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD751DFF8
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742130108; cv=none; b=sGNM0dIOKKXYZRNo4U+XwHJq/gdWG3/q1RNXgjcK5RXKBYtHJlfpJ+RzuhZD+IZnAWD6EvXtYjc93eAQBTrr24nCXr7cg3CbdS7tp+gbXNIYAN7xwu8sxV504cfPpOctPwfFzg6qotxVZJz/Fe4CNCUZ3Rn4efruImSI9Shi2ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742130108; c=relaxed/simple;
	bh=T6vf6YEfTkjChx81HQWilmJ0TjtehGdoCj0DQ3ZvFM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHqA28GvFg0UPdTxK7w3ZvhDRK12lHm0vAr6L1fL0lU7v/vhZMZVTG5B0oEVFRQ/y6vNadvr5NEEGvLwifWbfAkmLZXKyaAIQBWAfuzL655bND8eKW+aGThiSHkh25jixfoF2UpetDCtMZwZmkv2o9TwPsLWSuXpJtYvFSUY3cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDcIxA/u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDcIxA/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F9DC4CEDD;
	Sun, 16 Mar 2025 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742130107;
	bh=T6vf6YEfTkjChx81HQWilmJ0TjtehGdoCj0DQ3ZvFM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDcIxA/upGuRttOswxL3Mx9EUYZ4wLJLa2JAwr6z1Wp3tKNeVg/wB1EPzhRqO4pZD
	 JnlvG5bYb8zJ87SXoRYPIhrrIDZ7mkPwTUnJ/SezBbYGwsRNQOkEHC6+8rLUVmnkrf
	 bCzxTfBUm2RQt7BB6WfFWsaVGBPvqGetU66D+sA8mtiFO/Ol+1Xt6iwxwthIU/rosM
	 8u12Yu1OR2CNWzC+p61y8CzE3x1/Mh3bFpC6m8w6JkbZrGMUEqSysbcdvfW8xwBmPZ
	 RUV6INaBPZxaiVHr47ia2cJyX32JzQGhuGdklRLmbksqjyK3xXU1kiA0kgjYcxKr5B
	 k5rgqfS9R9PnQ==
Date: Sun, 16 Mar 2025 14:01:42 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9bLtgJa3PNB0bkf@pollux>
References: <20250315154436.65065-1-dakr@kernel.org>
 <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
 <Z9XIk3WpzruUfh6O@pollux>
 <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
 <D8HL95D099MI.2N779RERY6DAE@proton.me>
 <Z9bEosVk8-0sgSbw@pollux>
 <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>

On Sun, Mar 16, 2025 at 08:42:43AM -0400, Tamir Duberstein wrote:
> On Sun, Mar 16, 2025 at 8:31 AM Danilo Krummrich <dakr@kernel.org> wrote:
> 
> > Let's go with just "must be taken ownership of" then. Unless there's subsequent
> > feedback, I won't send a new version for this, since you both already gave your
> > (conditional) RB for this.
> 
> What does it mean to take ownership, if not to run the destructor?

Taking responsibility over the decision of what should happen to the value, i.e.
forget about the value, drop it right away, keep it alive at a different memory
location.

> Given Benno's insight, I think the safety text is correct as it
> existed before this patch.

Without the addition there's no requirement for the caller to take ownership,
but that's what we want here. Without the requirement it would be on set_len()
to take a decision on what should happen with the value.
