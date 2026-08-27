Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C9E3BB9F4;
	Thu, 27 Aug 2026 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834914; cv=none; b=dzOO6lj1WseY+CKnItYNOqZQhC/kIfu5K4r7F4mrk/dnP6K2dqNMts24i+fvHk1hRxlCEMUshra65SW6nn03yp7szQMNz0DvhdNLJQFwCcOn+z5iQ27PWyGCX3CGepVDpY9HpRWzmW+Co+lAsdUnELoiw0ARhUSl4EDi2fCGnSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834914; c=relaxed/simple;
	bh=1Bhx/Raco5H/c+FE1c0VCLFACqcMQjx4hIqxzcdgWDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLtZJeLDCNCakmKX/UTJ5AhYqDQdQgytzESzfyoge8RXLZznsbHN9yh1pa0Ey9Ahu/wprzdkyqsN7GKSMvPQH+N7aUB4t3Ivc2H3VDVBdNPh0/ZCIM52orNK2SnA+YJYqMnhbWzU5Yh1Flc496gWwzJVA1TdadWRsUBsxHsGJ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aQL//VmA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aQL//VmA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HXw8p/Z8u7hwdpy2r92uaPSgWCw/J8UMZgsokUSz8Wg=; b=aQL//VmAcmGxqxEe77GBQWXmPw
	PDUexRf/tWtfO2GsJB70nNP01ZJG4nZZwjAsdBmyMEoZ2s3x9qtlOQaX0+osDEsZPenlnhXNWxJmx
	XQHmT5xv6lkpZP1JxSfIibKF1G0Znpd2nn9ykdI0i+5FcndOhBjheNEWV6XPyVqMko0C4fXvgcylZ
	kRQlOJi062D9vCUQxrNGWEFstD0l2aau2Q9pRWm+IENoEVPJhGoRX0v6/G2c5VsYjWLKTly650sO4
	f+GerBI1mMroc0OiADTzk+Vgc7F8QBhXjwe/B6ErpRiDfQXK5U0spb/q/2JfLLauvO4ceBKRa+KZh
	J/wzLbCw==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZWM-00000003zUW-2O1B;
	Thu, 27 Aug 2026 12:47:54 +0000
Date: Thu, 27 Aug 2026 08:47:51 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, ljs@kernel.org, vbabka@kernel.org, 
	urezki@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust
 [ALLOC]
Message-ID: <qvmn5p7kb4rrk6dmehtipmlxzjtiorflayyy2gakzn3qtexpv6@doqcxo7nujd3>
References: <20260826132729.3281308-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132729.3281308-1-dakr@kernel.org>

On 26/08/26 03:27PM, Danilo Krummrich wrote:
> Add Alice as co-maintainer for the Rust alloc module to share
> maintenance responsibility. This is also a natural fit, as some of the
> alloc code overlaps with the mm subsystem.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Liam R. Howlett (Oracle) <liam@infradead.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 24ca91ce5d86..7daacfd70197 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23945,6 +23945,7 @@ K:	\b(?i:rust)\b
>  
>  RUST [ALLOC]
>  M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Alice Ryhl <aliceryhl@google.com>
>  R:	Lorenzo Stoakes <ljs@kernel.org>
>  R:	Vlastimil Babka <vbabka@kernel.org>
>  R:	Liam R. Howlett <liam@infradead.org>
> 
> base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
> -- 
> 2.55.0
> 
