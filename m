Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C1332AAAA;
	Wed, 21 Jan 2026 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022079; cv=none; b=GS/iswaANyBbmmHjpj3rNVnK6PxU9gHTmnMp0i+sgHf6W0TF7cIR/yoTF0O6grIb7gjPbc8qZPnbRu7e9GtfaIWYYRaYZv9NMTXqJY58900lrwoqGj73nLPHJzqsp8Npr/6IWJ3SDf/Zk8kJb6zDHmIEMhhHputWqQfD0QzDx1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022079; c=relaxed/simple;
	bh=6dY+XGz+TZjbG/DogvwFg6J6tYZdRoBhkmfMS0ocEoA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JrxcwtsKwKwXHX0uEAp6EyAtkjYx31OgFTNcgC6o1ers+Rw5P6mWs0Sm3XC8hTTjGwE01U/rNQgU62nfkcGUbjkGWUDYl4lGioOTPFbuUPyxwqezLAQo3WMphquFMJ8ivtF5IF3N2E67CqUvJTudA+VJc+LAKL3JF1uN776y7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWALlp6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWALlp6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B01C4CEF1;
	Wed, 21 Jan 2026 19:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769022078;
	bh=6dY+XGz+TZjbG/DogvwFg6J6tYZdRoBhkmfMS0ocEoA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PWALlp6HVcRhP6FK+j+/jfxW2RK2OqodkIblRTGBaNBzcGKCZVHAerblTvaU4aPr4
	 xRT1or6xdCKlnftOtRWinkDTetjxo3qNqxBUyeS0tjkz3kaGJbKiItjg+f6PVR+4cr
	 tN5MLDbrajO8+5gxQ5edqWoRqQQ7VaDnJAB7fhrk5x7Z7AuixkqYaZus9CFgdvSTBR
	 xZkVEGhUTUfG7r+KuAlHFqbzBfKIx0sPrPXad5q0CnooVZ9E4+fkPY2pTZHPlrFDcl
	 MJbLiH2bCHuOCMDOsOCKcer6eCkt4Xp1G4mb6FxdFFe5bZ4KLW7pEYm60VLJ9cgIEk
	 /sS9iGnHkBK4g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Tamir Duberstein <tamird@gmail.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
In-Reply-To: <DFUE4FBOIF4Z.22DLDSQS06LO4@garyguo.net>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
 <L-BdidfnzrZLOC35Y3KX2Y4TUkcBRy3f70o2nc8XRz2yHxUR9D1O_ECPqnfScNWnrN6sHRQNdGbZEspB39xTEQ==@protonmail.internalid>
 <DFUE4FBOIF4Z.22DLDSQS06LO4@garyguo.net>
Date: Wed, 21 Jan 2026 20:01:07 +0100
Message-ID: <87fr7yu6x8.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Dec 3, 2025 at 10:26 PM GMT, Andreas Hindborg wrote:
>> Replace the `xa_init_flags` helper with direct initialization of XArray
>> structures using `__spin_lock_init`. This allows each XArray to have
>> its own lock class key for lockdep, preventing false positive warnings
>> about lock ordering violations.
>>
>
> Isn't this potentially a problem on the C side as well? `xa_init_flags` is a
> static inline function, which means that the lock class is going to be the same
> if a single C compilation unit initializes multiple xarrays -- unlike when you
> use spin_lock_init, where each callsite gets a different lock class.
>
> Best,
> Gary
>
>> Add a `new_xarray!` macro that automatically generates a unique lock
>> class key for each XArray instantiation site. The macro accepts an
>> optional name parameter and uses the `optional_name!` and
>> `static_lock_class!` macros to generate appropriate names and lock
>> classes.

My intuition about this was that when the C static function is inlined, a
new static address is used for each place the function is inlined. Is
this not correct?


Best regards,
Andreas Hindborg


