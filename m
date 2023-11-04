Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAD618B1A
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Nov 2023 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkyJSCHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61866C433C7;
	Sat,  4 Nov 2023 21:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699131721;
	bh=x8XuhbC75O/yvjXyGVSZCOYtUyzjcnsgzJpfWu3lmEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkyJSCHoJiX81ILJEKUI2kyZBO3dk/yj33dCYgrwOA4xvRhvvT14olsOL5btyX/DB
	 7Z8u0Wfeb6g2Zn1zY+WBXxokB4+iaSnnt8pNNeCXHR6rjMmiXa67LEToWdP8IuRCA5
	 Yxo4lUxTln3RW/wHl/Gm3F8A+hy+xwBWxHvENyhBEQHKWMH/R4Ja2EEiHtvD+K1HG+
	 doXTTrg6aqjBai6mXU2F5+H1kuowpp/Wab7rOgHScRa7nZ7TiKOLm8+EuGCZmbThJC
	 rl9NfEVF/Ts1pHAGhHOnfRBYHs6Jkkx54OwHxDYiC36Ie6A7B2zbL/1DZRhxUJ8gHa
	 bo9/6oIEcL/EA==
Date: Sat, 4 Nov 2023 17:02:00 -0400
From: Sasha Levin <sashal@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: stable@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: backport 0b4e3b6f6b79 and 35cad617df2e
Message-ID: <ZUaxSDabYeRN7TPv@sashalap>
References: <1760daa6-7245-4d01-bb89-388c472ec5ed@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1760daa6-7245-4d01-bb89-388c472ec5ed@proton.me>

On Fri, Nov 03, 2023 at 09:57:46PM +0000, Benno Lossin wrote:
>Hi,
>
>I noticed that without commit 0b4e3b6f6b79 ("rust: types: make `Opaque`
>be `!Unpin`") the `Opaque` type has an unsound API:
>The `Opaque` type is designed to wrap C types, hence it is often used to
>convert raw pointers to references in Rust. Normally `&mut` references
>are unique, but for `&mut Opaque<T>` this is should not be the case,
>since C also has pointers to the object. The way to disable the
>uniqueness guarantee for `&mut` in Rust is to make the type `!Unpin`.
>This is accomplished by the given commit above. At the time of creating
>that patch however, we did not consider this unsoundness issue.
>
>For this reason I propose to backport the commit 0b4e3b6f6b79.
>The only affected version is 6.5. No earlier version is affected, since
>the `Opaque` type does not exist in 6.1. Newer versions are also
>unaffected, since the patch is present in 6.6.
>
>Additionally I also propose to backport commit 35cad617df2e ("rust: make
>`UnsafeCell` the outer type in `Opaque`") to 6.5, as this is a
>prerequisite of 0b4e3b6f6b79.

Queued up, thanks!

-- 
Thanks,
Sasha
