Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689E274668
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609022; cv=pass; b=B1Su/eS4el9sCDadmM1XbtTsmVzQ2OU9CaH5ucNIW/Oi/RiddyxqqY+pxPunNSVqqDZ0rImWyu+qCB0awMoN1A7yUknDq3TERfBaeT7L/1KOROsc4ltmfdeqEGHuh6NKTfVWAylLFsVI7rK6BbNj0Zq1XCcQ72t+2RP0oerlqtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609022; c=relaxed/simple;
	bh=P+6T2wA0BD1PlclQuXYmX+cyldBpFgSlBtgFkBP8EXI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=V9xgHxiSKeHDQx/jMfXd60FGYaFI9+dTMkTq4dsIu0f/HMAb7P1mEOttwNeB/kPd5m6L6wXaoChsXpOdNLxrupLs/N7nDorwZgnmHe8inPeHJ6BacgJco1QDgXNd0RUV+fTrTpPpn/dz4IRBR5cv4Oqthqjo96PWFWquMt2P7gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=KXuxv1HF; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KXuxv1HF"
ARC-Seal: i=1; a=rsa-sha256; t=1755608994; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UMCIWT9BE8ruyoDHDd9O3hXARwxcMn8/nIoTRAqvXoWtXzHmdwGdWceo5E6/3F7JrYHGUz+FxJyjeu3nN5id5db5bGwHr408EU+WipEHe8+Hy75h3zwM7JDffiAzK0ggSqy4HA8BGutlOBUEj9i/4R66Nd7p+IvPL/6x/U50M4c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755608994; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Nbe0C4ePqnSqXiBpyJkGdLPUmDVsHd3rZ6LpeboRpFE=; 
	b=RobvhRtJzLOoan7NBvXeOvwYnK7U+cdY0Fz1koqZY3vQWD8sedZh1zVa0LDdZu/xQbnaZ8p6xEggzgjZ//MomC5mYHYXyU6vn/iMTkXsrENC0JLFR6S2uarTjh73N8P9pTz3OmlWwAwXAgA5ATWW5G+9FwFB2P94Kug2Z3hdLJw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755608994;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Nbe0C4ePqnSqXiBpyJkGdLPUmDVsHd3rZ6LpeboRpFE=;
	b=KXuxv1HFA5Q4ByOoJ61t5GhfKbIjEc63YxlaDdptoM8fjhFcZj/VPo6HeE3jHB1b
	OHlKd4CbHDKQTmYJM4WHbCzVDRkcbmK1GM34BPy4xKMwvlkz6CTAhkUJ7nqzgXJFp+E
	7GSx8t+cljVu/iyw+jgM9xO9QgziZ9M6ILjuBKPY=
Received: by mx.zohomail.com with SMTPS id 1755608992702848.4372384044658;
	Tue, 19 Aug 2025 06:09:52 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 6/7] rust: alloc: layout: implement ArrayLayout::size()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250808181155.223504-7-dakr@kernel.org>
Date: Tue, 19 Aug 2025 10:09:35 -0300
Cc: lorenzo.stoakes@oracle.com,
 vbabka@suse.cz,
 Liam.Howlett@oracle.com,
 urezki@gmail.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 abdiel.janulgue@gmail.com,
 acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F7DB6BFE-A2F4-4D4B-B1B7-B124C9C32DBF@collabora.com>
References: <20250808181155.223504-1-dakr@kernel.org>
 <20250808181155.223504-7-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 8 Aug 2025, at 15:10, Danilo Krummrich <dakr@kernel.org> wrote:
> 
> Provide a convenience method for ArrayLayout to calculate the size of
> the ArrayLayout in bytes.
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/kernel/alloc/layout.rs | 5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
> index 93ed514f7cc7..5c3db8e9f930 100644
> --- a/rust/kernel/alloc/layout.rs
> +++ b/rust/kernel/alloc/layout.rs
> @@ -98,6 +98,11 @@ pub const fn len(&self) -> usize {
>     pub const fn is_empty(&self) -> bool {
>         self.len == 0
>     }
> +
> +    /// Returns the size of the [`ArrayLayout`] in bytes.
> +    pub const fn size(&self) -> usize {
> +        self.len() * size_of::<T>()
> +    }
> }
> 
> impl<T> From<ArrayLayout<T>> for Layout {
> -- 
> 2.50.1
> 
> 

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
