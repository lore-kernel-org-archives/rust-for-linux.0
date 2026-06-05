Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C874963A5;
	Fri,  5 Jun 2026 15:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672545; cv=none; b=WlWG2Dgs73dH82kTlo1FMVEtRVKODlONZ8XZwNfvjIe3mxL/PTZtAduTiADraCIorSyR1iOAxgr1rrig+8w6sW6aE4JrcSiJqZUSJif2C6zPHqSdzv+wa4IQ5xYpjFR7Si070UtGLwzLi2VVXvMIyFMX465BYLWJX8O6nf69ZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672545; c=relaxed/simple;
	bh=7/3ohZokdRnzNHERRuARU9gC+/joNlb5cQbAU87A21U=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=HrQxDhZ/bj4Rmm3om6Aj4jY8dihYtLuZwunpyBhSt7sOjCpAULCZtYDArlLNfTxATbIZGmhR/KkG28u4/9XfyZKR7nHZzL+61PboHyNKlEKkv/g6pBFXxYtecU3XusJibepetk6Er8sLCRt/mzzsNYVY2cSEmx/gAqW3lZ+1gOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmLAYhfL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmLAYhfL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2F11F00899;
	Fri,  5 Jun 2026 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780672543;
	bh=RsE0MWm9RWknf3vEr/lnGCDxSan/mj8St/jdV9gvrPg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EmLAYhfLU/lYkC+kiwmTU0DMhVcgVG88rZuc84btTFw2S88Z1VQjCcGp9ojAuTEZg
	 sgvXVN8rmlHIu7YAjwQxMj5BeTVmI4DvmeYMZrM78+cmYI4h7hnmfqvxwbUqxsYCyJ
	 eOFqzBL4T9282GoM/yb/YZPNBwoIFGcfpVhWqQF8BAV/qQhoM61WR3MpfySCB1J1xl
	 c8KmFEDalPjozCmbpzGdFxBwR76It4ZjRoSW+i98qwMQ1v5+N3JjXdieHZsWa1shNa
	 3uhNFdDBSYFAL6S7Qb3rh+7AJsqA8Ma+CkBQ+rlkS5e4KEv7UgtF06bxgffQby4Uc9
	 IJk3M09dsIS/Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 07/11] rust: xarray: add entry API
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
In-Reply-To: <20260604-xarray-entry-send-v4-7-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-7-965f6028790e@kernel.org>
Date: Fri, 05 Jun 2026 11:15:13 -0400
Message-Id: <178067251358.96312.14084909265600226392.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=tamird@kernel.org;
 h=from:subject:message-id; bh=7/3ohZokdRnzNHERRuARU9gC+/joNlb5cQbAU87A21U=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKL4Rm/hKLfv/7K9/3JRPuCcz43miydGfSD8WUR3c9Y
 tZIaO2d3jGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCqt0YwMnyoO/WwwrRhi4XutHdVopqKfLW/VK0nZNZ8YHii4j1r3UqGP9xhU/5
 7Gpzc7xQZmu5w7jHzfdsjvH6bV2xvOG7FZ93KxwcA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Thu, 04 Jun 2026 21:58:13 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
> Add an Entry API for XArray that provides ergonomic access to array
> slots that may be vacant or occupied. The API follows the pattern of
> Rust's standard library HashMap entry API, allowing efficient
> conditional insertion and modification of entries.

There's a lot more API here than this lets on.
`find_next_entry{,_circular}`, `Entry::is_occupied`, `into_guard`,
`insert{,_entry}` (do we need both?), `index`, `OccupiedEntry::swap`,
`Deref{,Mut}`.

It's not clear that all this API is needed, and this message does not
attempt to justify it. It is also inconsistent with the split in patches
3 and 4.

>
>
> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
> index 08979b304341..19fce6862c78 100644
> --- a/rust/helpers/xarray.c
> +++ b/rust/helpers/xarray.c
> @@ -26,3 +26,20 @@ __rust_helper void rust_helper_xa_unlock(struct xarray *xa)
>  {
>  	return xa_unlock(xa);
>  }
> +
> +void *rust_helper_xas_result(struct xa_state *xas, void *curr)
> +{
> +	if (xa_err(xas->xa_node))
> +		curr = xas->xa_node;
> +	return curr;
> +}
> +
> +void *rust_helper_xa_zero_to_null(void *entry)
> +{
> +	return xa_is_zero(entry) ? NULL : entry;
> +}

These functions already exist in C, but are `static inline` in xarray.c.
Can we move them to the header instead of duplicating them here please?
That is what I did in 79ada2ae ("xarray: extract helper from
__xa_{insert,cmpxchg}").

-- 
Tamir Duberstein <tamird@kernel.org>
