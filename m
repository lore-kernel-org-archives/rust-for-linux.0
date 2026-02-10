Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE61DFF7;
	Tue, 10 Feb 2026 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742103; cv=none; b=LScb+qcHEjErKtvjjXVPOFPx2ZbB6W2C2sjZbW6Sap05SSMqBIA3xSd37dyuySBatoqhe6DLwSw8xr2sqeUbqQRcif8wRROrdF4bl/gkq8abHR1vf87DZ5/l5ok94sg/iwyNxxe0vU4Rb8ivw4V7hOs7dKBLueiRJ+KwDxcvhE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742103; c=relaxed/simple;
	bh=dbU65BlIpoty7iANfnMUj5LC3wQ9NypEMYFqKBMtFNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQ9MLrqiaAGelp6vfCxJVrAOZa7uUPigvYkWGlz+6sLDTVGontM/HcfsNH5/fpHD79K502C2eOOzEXk/uWk0WFzeAedIbjBneKZxwdQlMF9h2qjaMge2lSV3WbA63nRFZFGaJd0r5uAbULSYtVRPlyVjlDpAUnNWMWsRwPOSfnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duEGMgzn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duEGMgzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098CAC116C6;
	Tue, 10 Feb 2026 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770742103;
	bh=dbU65BlIpoty7iANfnMUj5LC3wQ9NypEMYFqKBMtFNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duEGMgznopIsNjn7WQGLrZdYtLHW88WzN9tTcIXtOsQON/YFK27PpTV4y/PMxcmPV
	 vyC0sd9d09b5lzjdooeuwg3IDXZxdOe70puulAmC9peMETXOLWlBOg8Vpzzzyg0HSo
	 WWaMMuhuJWnneGxOzGa5mcSKKzIW0/RZcepXWobvi4VVKKqMGiBPKoKYYiHeZseXIt
	 471PwB+TaYtKdfQgBYFsNYYfx1MLUEOUKfdbT0fmyspmoJcG/hmFbzZPqipuCfUzs0
	 a4cBvqzRQjEoAXUj4am/BRTzfrIqcQ/TGsoRbJef/jjauCcrpafiGesOelQIjlJSru
	 5VrvrVKJNpEpw==
Date: Tue, 10 Feb 2026 17:48:18 +0100
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
Subject: Re: [PATCH v3 04/12] rust: xarray: add `XArrayState`
Message-ID: <aYtcdGk8zcwaHfsd@macos>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>

On 2026-02-09 15:38, Andreas Hindborg wrote:
> Add `XArrayState` as internal state for XArray iteration and entry
> operations. This struct wraps the C `xa_state` structure and holds a
> reference to a `Guard` to ensure exclusive access to the XArray for the
> lifetime of the state object.
> 
> The `XAS_RESTART` constant is also exposed through the bindings helper
> to properly initialize the `xa_node` field.
> 
> The struct and its constructor are marked with `#[expect(dead_code)]` as
> there are no users yet. We will remove this annotation in a later patch.

It makes sense to me to merge patch 4 and 5 to avoid this.

> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/xarray.rs           | 41 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index a067038b4b422..58605c32e8102 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
...
> @@ -319,6 +322,42 @@ pub fn store(
...
> +impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
> +    #[expect(dead_code)]
> +    fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
> +        let ptr = access.xa.xa.get();
> +        // INVARIANT: We initialize `self.state` to a valid value below.
> +        Self {
> +            _access: PhantomData,
> +            state: bindings::xa_state {
> +                xa: ptr,
> +                xa_index: index,
> +                xa_shift: 0,
> +                xa_sibs: 0,
> +                xa_offset: 0,

To match C XArray __XA_STATE() we should also pass shift and sibs. Even if the
only use case we have currently is setting these to 0 (XA_STATE()).
