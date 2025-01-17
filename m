Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520331F8685;
	Fri, 17 Jan 2025 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737115896; cv=none; b=bwa8NKKZm3Og2Nonu09Di3hjceC3yokl8fR69E32KxdI6O4eQYZlRMBsvzhyJINkCijWgoloX04bQsLZ9EMSMCUmDqOJO6nyK3OCKZk0qHOTn40uKPPUD0CspMq5/3YNRmBtsyMrKT7KZz3/JXT2oKOr9zvIsYdmq2Nyt4l4XCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737115896; c=relaxed/simple;
	bh=+TJeiWgpAWbI6yOwRHlPPWvjLMcZMizybqvRcHkiRms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SndoKtxbT4fv5L5T0IQGSBICmhttPE41fdu28hqfrLouHNY2MM/5EqMdrm3uf7o6pkZcllwZ/9bvN23ocs4xsbVqNkfXV8tpfoIm4kWEvOrZ1Ae30l212P+j60rYWrEB5R9HiiK5mgw4IlIGzo1i9UhtzBM8WyizgcrZOb/0vCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZbEPjChX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZbEPjChX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54927C4CEDD;
	Fri, 17 Jan 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737115894;
	bh=+TJeiWgpAWbI6yOwRHlPPWvjLMcZMizybqvRcHkiRms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbEPjChXr9r7gMMGp5CHmMmIQ8JK8isbUEuBG8G90DJDbsa06InylcO7QrSU8wYAx
	 PHRAxsru6d1ylrWyO+3BWlBhNukYXf8vqVXf5mHpDm+ThYoUfNZd/4iLsvVfaAzjPj
	 M/TmHOHTF5cwd0cJ+KG1uYds5RVvs4uYaNmSIQHk=
Date: Fri, 17 Jan 2025 13:11:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v12 7/8] rust: miscdevice: add mmap support
Message-ID: <2025011724-borax-letter-93f1@gregkh>
References: <20250115-vma-v12-0-375099ae017a@google.com>
 <20250115-vma-v12-7-375099ae017a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-vma-v12-7-375099ae017a@google.com>

On Wed, Jan 15, 2025 at 01:35:10PM +0000, Alice Ryhl wrote:
> Add the ability to write a file_operations->mmap hook in Rust when using
> the miscdevice abstraction. The `vma` argument to the `mmap` hook uses
> the `VmAreaNew` type from the previous commit; this type provides the
> correct set of operations for a file_operations->mmap hook.
> 
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/miscdevice.rs | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
