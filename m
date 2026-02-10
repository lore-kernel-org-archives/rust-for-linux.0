Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F040221F2F;
	Tue, 10 Feb 2026 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770724042; cv=none; b=kNOFFfx9oBFPHzf6OZckdvh8cx9yaA9bJ+SO6SoJ2YV9xJ3lRlSdMNhVMuRQDLSRuJIZX/+ftEvRrfGN85qkaObplIqtqTNdHUPzNpvqy2kIinEAmUO30bpGEK85FXQXnammH3cG6F6MEb4j5aA2hLaOnrAmk/R3whrvLo7H82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770724042; c=relaxed/simple;
	bh=r6y4S5ShBp5UhDTsF2wkO1MF2PaI6mao5Sz+74OdGTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bg7doWrxNgdbaRGMWkWhly0n6oPnBkoA+KSFDxRBWat6x7J7evOk1LdQd6IWBqup7heLSmGxJYC8ZWYcT5XKMhKPoxSfBpkF5BcmuwOxEsEfye79y4kHoTIBD0WbkGF9oBw7MM4xAf5UL5pbsUVVcaEznzZg5RZtsRyaKrO+nfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=Id1QzPSk; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="Id1QzPSk"
Message-ID: <5dc113c1-c9c4-4420-832d-65681414cee2@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1770724029; bh=r6y4S5ShBp5UhDTsF2wkO1MF2PaI6mao5Sz+74OdGTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Id1QzPSk1PUgO6ZqUIz1UswQCR2gV/xNkq54vLLHy0Q8l33FfhYLvntR1+xrA58j+
	 M4/QQCZ8w5eIoRev2+ArPxJmp44aIU8YE3DDPzW5p+HTP9wpf1MLH2KdhSYEQp1Pas
	 oUJdKHl9HV7eCGumE4lyTYXTD43fpc/hKFoGMGr4hsEDt7Ri30OxoQfVxKRvn4/aot
	 VOCFlvXwhKL4fO8imXGx633n8XYJlKmRoarbP7iBSU4CRSjNeFMkuW5qawRcvjcGsZ
	 X/DAT15tGYdUjDx91t/FNI3pcE2m8qe/RY9UWpMz9YL6744Vo8uKTZ2DAVgrPXqvpA
	 2bLASf65JctGg==
Date: Tue, 10 Feb 2026 17:17:02 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] rust: binder: shrink all_procs when deregistering
 processes
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <20260207-binder-shrink-vec-v3-v3-4-8ff388563427@cock.li>
 <aYnnBffE9zCe20Ny@google.com>
Content-Language: en-US
From: Shivam Kalra <shivamklr@cock.li>
In-Reply-To: <aYnnBffE9zCe20Ny@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/26 19:24, Alice Ryhl wrote:
> 
> Hmm. This way we need to reallocate immediately if one more process is
> added. How about:
> 
> if len < cap / 4 {
>     shrink_to(cap / 2);
> }
> 
> Alice
Good point, that avoids the shrink-then-immediately-regrow pattern.
Will adopt this for v4.
