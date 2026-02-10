Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC6F30EF94;
	Tue, 10 Feb 2026 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741893; cv=none; b=jMvE3djA2gcVGcKN1+Y4KrDjOWcXHxb/gINzj+4METoBLWh7nrOFcg8cegk1FLRMQm2iC3PIOC+w58KCcU16/XxGZrZYw0m2Bf+wOi/qSTZ3PNiN/zYv3nBgUUR+9sfdwXgLSv6s3wg0fzwnspcVC36hq/a9Dwz15olgTfOe+lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741893; c=relaxed/simple;
	bh=ORE3cLC1BF2Tpcff5rGilSnuUUkcmfnBkr0UpJFyaho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHo0XiZGJqbC2Ghmk2Pztrl8jWD9deBieKiG+MJ0EhpE8X0f9wbwcuuXD09mUOBLh8QLtejX7oYHs7TS6qqnm6EltvIH4iNmEeOsdanpvv77BPnaqndi4VzdCAvi1SIk598mysxeA3v9yDvALLvxUeQJa4Xx0nwe6lXCDaT6v00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5cIAjV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5cIAjV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F198C19425;
	Tue, 10 Feb 2026 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770741893;
	bh=ORE3cLC1BF2Tpcff5rGilSnuUUkcmfnBkr0UpJFyaho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5cIAjV0w0eD3o/U5mUoo0u3nku/rYzUWjSKXhM2/DL1t+1YrAP2bGDy+6xOyTnhX
	 KAQhWxdiByuJpc48yB7KFtG4nS8BD3aNUPFJPuq3TlQ/fmRbUSkadxjBtmuIdzamwm
	 eX82YuhwxEzllhbvIf+xGdiUBVcbdPUGL3ngw1eFAQ+VEzHB+lLiuzo8xeLyqSxinp
	 gH+OKsMXE9LsjfFSknw5OEI577OLOcVlsxd7P1sX7NrNsoS7S/VvxIcokb9aZq82sq
	 KRsZvfc9d+4oZrBRU+W1LJEPSkr4KUu9EuxRS30uJpB2MdIHXs3cOTsJfeoFFCVH04
	 I/ddVaMz1z71w==
Date: Tue, 10 Feb 2026 17:44:47 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v3 01/12] rust: xarray: minor formatting fixes
Message-ID: <aYr8WL_neMB3Crt_@macos>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-1-f777c65b8ae2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-xarray-entry-send-v3-1-f777c65b8ae2@kernel.org>

On 2026-02-09 15:38, Andreas Hindborg wrote:
> Fix formatting in xarray module to comply with kernel coding
> guidelines:
> 
> - Update use clauses to use vertical layout with each import on its
>   own line.
> - Add trailing empty comments to preserve formatting and prevent
>   rustfmt from collapsing imports.
> - Break long assert_eq! statement in documentation across multiple
>   lines for better readability.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Daniel Gomez <da.gomez@samsung.com>
 
