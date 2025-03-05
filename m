Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB0D2E3385
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164018; cv=none; b=p2xFxw0yVlh7JXGskmztOq51zN7BR0HubgO38XTHoyIE0B+S0ofABW5zU4WR/FaezSdTAfkpzFNXIcUH41JdS8ccXgvPmTtNDb7XS7yaUIZYW72pVY/7f85bnRtHmFqU7iadpVhjo9iyACDJfBpTgGg9WyxpZZW5LdPrrsE0F/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164018; c=relaxed/simple;
	bh=6p7MN1zmIoYP/YtGnC8wnqWggns4BxXELBmv8cpJa3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ohEeoddywMMVJCl9BCBhwVyoudV21EbeTjAFQwxQCThdcu2sXnpWjlrMm2CIQlaXKbz3CCAiYAR1sB2RrqCtgB4x60RMSqUKVCgcZrlM2Mrs+O6Rv7LfAVFwxDc+2zoMGH7FOSDcpzFka/ETQmNFkyLyuKA0+QAog2XEPOmcAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=ZrNS6Miv; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="ZrNS6Miv"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1741164008; bh=n8HRAV1SpuXRAgU2VcBmFiUl/G7s+L9QC/OMztyPZFE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZrNS6MivAzSPLPwfzhqrCMATnFyIt92XEsT873oxPoDmI3q/n/yWaW2mJl0XB+eHq
	 qjsRBQ3QgcwCgx/4zK6AnmGQCMUJtpJJWrqkqlBJFWj33DysRpX3wLxtaPLxNdZZpT
	 bC7qe9o0hUKo+nVXS/klq1JngqrzZQ9P/KDpuxrU=
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,
  <daniel.almeida@collabora.com>,  Boqun Feng <boqun.feng@gmail.com>,  Gary
 Guo <gary@garyguo.net>,  Andreas Hindborg <a.hindborg@kernel.org>,  Alice
 Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 1/2] rust: types: `Opaque` doc: Add some intra doc
 linkage
In-Reply-To: <20250305053438.1532397-1-dirk.behme@de.bosch.com> (Dirk Behme's
	message of "Wed, 5 Mar 2025 06:34:37 +0100")
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
Date: Wed, 05 Mar 2025 09:40:07 +0100
Message-ID: <m2v7snj2fs.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dirk Behme <dirk.behme@de.bosch.com> writes:

> Add some missing intra doc linkage `[...]`.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
>
> Changes in v3: Move the non-linkage artifact to patch 2/2.
>
>  rust/kernel/types.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index c3dc798221dbc..af30e9c0ebccb 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -271,7 +271,7 @@ fn drop(&mut self) {
>  
>  /// Stores an opaque value.
>  ///
> -/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
> +/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>  ///
>  /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>  /// It gets rid of all the usual assumptions that Rust has for a value:
> @@ -286,7 +286,7 @@ fn drop(&mut self) {
>  /// This has to be used for all values that the C side has access to, because it can't be ensured
>  /// that the C side is adhering to the usual constraints that Rust needs.
>  ///
> -/// Using `Opaque<T>` allows to continue to use references on the Rust side even for values shared
> +/// Using [`Opaque<T>`] allows to continue to use references on the Rust side even for values shared
>  /// with C.
>  ///
>  /// # Examples
