Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F774192E5;
	Fri,  5 Jun 2026 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672539; cv=none; b=BFfAv7WPAD4f0cn3LyKGsFHW+fdbXRZUA0xBZYD7FBtrn4xhdal7InwzPH6BIxJ4wzDCUgIxV9+pmeXTz2MnZ6EsvlvbvZsMgE3K0IeoO+0OWj7q8bma4nNwuG/tOEyHWXQMoq/XV5BDEHGmxR/Qq+6mA5c96bbC4Yub0ci0dLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672539; c=relaxed/simple;
	bh=EkC6+9W3siIvte4lZvaojy+iXrYIEK6ZDWqpH/zTx4w=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=TBCMy4LCvYV02VmFA3WT0zOJhV37nr1+27p4lpThuLIN04RzgUGWx8rXR4X7ENEyHarrnlDlQvJ18ShyXHMJh8wXcRygEM71WI65/60l2Lhbs2CLDaGEZDvcn9+99eB6NISeZh5ev88m3xAEtqG/xJtKjppq0LjslkKW1b6JhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNFGN8bG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNFGN8bG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C231F00893;
	Fri,  5 Jun 2026 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780672538;
	bh=m28nkewcyqgL6abQPpmwBZHkP7XmcVeR2cfNbPfRcgw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hNFGN8bGicL+Ge/BV8PW2aaLc2p07OPtI1bbcmI+TVtAMz0k1xFNz0XRSScPYJIFP
	 oZ5rX+zDkFrKXCgb8TM0uDvCDCC9Y3N9jDWiahC9nK6UNizXSieKNJ0uPgn9UVKL2d
	 jNq9bV5sJc6BM2CCJwO805IUbofdeQDjFAnA8KB5DHV5hCFVRzoUS6LLkvF54iAkbW
	 Rtel3vI82cAiXr6wLDvoLTIofxBBVWijw3OAvqStKAA8juLq1b/rn4CLKVUAWk+Bvs
	 P6KXKdj82hLwuYfPrRtKzD9yHjWX363uOAJ7JGa4gDtJ4JF6T2bmR34n0V428NZk5M
	 wUo2e/dRghljg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 05/11] rust: xarray: simplify `Guard::load`
From: Tamir Duberstein <tamird@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Daniel Gomez <da.gomez@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
In-Reply-To: <20260604-xarray-entry-send-v4-5-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-5-965f6028790e@kernel.org>
Date: Fri, 05 Jun 2026 11:15:13 -0400
Message-Id: <178067251349.96312.11784247103754750756.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=tamird@kernel.org;
 h=from:subject:message-id; bh=EkC6+9W3siIvte4lZvaojy+iXrYIEK6ZDWqpH/zTx4w=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKL4TiTDqWeV4xvOvlulvqnhNL+cyYr9IRj3z+lkU01
 SqlqzJ3TGRhEONisBRTZEkUPbQ3PfX2HtnMd8dh5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix0DHWMGLk4BmOpZMxkZ9jRWZZoFnFRku2PovOvSs7kOeStPNwcJ1d3LO6suX7qhj+GvaGrozpg
 dwRPWz3VieRLPu7Tdbs916YCahusH7jppnM9lBAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Thu, 04 Jun 2026 21:58:11 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
> Simplify the implementation by removing the closure-based API from
> `Guard::load` in favor of returning `Option<NonNull<c_void>>` directly.

This is simpler, but the closure-based API was here for a reason (to
avoid passing around untyped pointers). This patch is estabilishing the
style for subsequent patches, but doesn't honestly describe that it is
doing so.

>
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 05e6dc1ffe69..7da57c778669 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -212,28 +212,23 @@ fn from(value: StoreError<T>) -> Self {
> [ ... skip 26 lines ... ]
> -        self.load(index, |ptr| {
> -            // SAFETY: `ptr` came from `T::into_foreign`.
> -            unsafe { T::borrow_mut(ptr.as_ptr()) }
> -        })
> +        let ptr = self.load(index)?;
> +

Inconsistent whitespace.

-- 
Tamir Duberstein <tamird@kernel.org>
