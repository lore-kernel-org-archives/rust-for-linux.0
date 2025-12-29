Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A11F5F6
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017946; cv=none; b=U1UaLIHelbDOhi5AMNwIpVVSKv6M8pRr2Q4dz6AJKXA85AaIOv2L3MeFUv52S7NZZuHfyu/J7URrttQPG3OQ/lAlIxD6s+toonO85wyr1CPZLfXarzQY1U+Op7Djew5cd/iH8i1JMftVg9OYdSdfw+THY1RjnHAhQASBKNYFvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017946; c=relaxed/simple;
	bh=72IdS4+MZ2EdNFZXsxTep7P0laox0F2Qo5NSom4GvXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4Qm0GzIvMuOI4Rp5ZcjKGlE4x0dptjPDbvNwBPz2x2AjzcTmdtcVeR+hqpKgQlDjLfSEnEe6nEoAYDliL2mxuxc1uZlFZf+jmv8E20C8l5rJkTOwA0DyOF5ZarHgdPCfo9VwWL6yBWez52lN7nXOuW/j2ghdWiqcWYAtpPDokM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwXmUQym; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwXmUQym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767017944; x=1798553944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=72IdS4+MZ2EdNFZXsxTep7P0laox0F2Qo5NSom4GvXs=;
  b=CwXmUQymKglf/MH0ACuWrIF1TqoxkvmD9NQTpniZQlSWB+v1M87MDf2H
   tdcoXbW/896KsuV3AGlrWMzXQghuIBTiuj0rP1B/k0nuWiP/c5adIq1wE
   aNp0udn6goJP8eZoUU6OPdpW/gpybtsbklDWRAYQfGLnI7ghx8tN3mlej
   YZNaYo9PRbhtQRs0lY0pQq2NYwjV6f6XqhqKo5Kmi1AoyQ9WEJpbzx0ux
   H/BDLp9JDKsJ0Njh4NTz2Ti5kZM3rmpm2E/UxDajzRUremtZeIUrWrzWu
   Sr2peQkRoMJU4j8YUSTgM8J88oG9dNeHW5NecUfn4PjmRzTKfM0GKuG77
   A==;
X-CSE-ConnectionGUID: drwJYFR1RbisNSvTWS2sbA==
X-CSE-MsgGUID: bYAZMKtlSRqViCZP3vgg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79742368"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="79742368"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 06:19:03 -0800
X-CSE-ConnectionGUID: S7vERWtTRL+kVpaw296LzQ==
X-CSE-MsgGUID: dlihTbHkQiWI38SsHCvFEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="200550893"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.31])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 06:18:59 -0800
Date: Mon, 29 Dec 2025 16:18:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer
 formatting support
Message-ID: <aVKN0Q-6bsHGq_Gy@smile.fi.intel.com>
References: <20251229072157.3857053-1-sunke@kylinos.cn>
 <20251229072157.3857053-2-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229072157.3857053-2-sunke@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 03:21:19PM +0800, Ke Sun wrote:
> Export ptr_to_hashval() and extract kptr_restrict_value() to enable
> Rust code to use kernel pointer formatting functionality.
> 
> - Export ptr_to_hashval() with EXPORT_SYMBOL_GPL for pointer hashing.
>   This function is used to hash kernel pointers before printing them,
>   preventing information leaks about kernel memory layout.
> 
> - Extract kptr_restrict handling logic from restricted_pointer() into
>   a separate exported function kptr_restrict_value() that can be
>   reused by both restricted_pointer() (for %pK format specifier) and
>   Rust code.
> 
> The kptr_restrict_value() function:
> - Returns 0, 1, or 2 to indicate the kptr_restrict sysctl value
> - Returns -1 for error case (IRQ context with kptr_restrict==1)
> - Modifies the pointer value through @pptr parameter when needed
>   (sets to NULL when access should be restricted)
> 
> These functions are needed for the HashedPtr and RestrictedPtr wrapper
> types in rust/kernel/ptr.rs to provide safe pointer formatting that
> matches C kernel patterns.
> 
> This refactoring:
> - Allows restricted_pointer() to reuse the common logic while
>   maintaining the same behavior
> - Enables Rust code to use the same kptr_restrict handling logic
> - Reduces code duplication

...

> +EXPORT_SYMBOL_GPL(ptr_to_hashval);

I do not like this. At bare minimum we should make sure it's namespaced, so the
author of the code deliberately needs to import it (I'm talking about C side).

Ideally we should have something which is Rust specific, like

EXPORT_SYMBOL_FOR_RUST_ONLY(foo);

Can we do that first?

...

> +/**
> + * kptr_restrict_value - Determine what pointer value should be used for %pK
> + * @pptr: Pointer to the pointer value (may be modified)
> + *
> + * This function determines what pointer value should be printed based on the
> + * kptr_restrict sysctl setting:

> + * - kptr_restrict == 0: Return 0 (use original pointer, will be hashed)
> + * - kptr_restrict == 1: Return 1 if current process has CAP_SYSLOG and same
> + *                       euid/egid, otherwise set *pptr to NULL and return 1
> + * - kptr_restrict >= 2: Set *pptr to NULL and return 2

It's the usual practice to give a enum with self-explained definitions and use
them. plain numbers are prone to mistakes during the evolution of the code.
Also it's hard to read inside the code their semantic.

> + * Returns:
> + *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
> + *   - -1: Error case (IRQ context with kptr_restrict==1), *pptr unchanged
> + */

...

> +		if (in_hardirq() || in_serving_softirq() || in_nmi())
> +			return -1;

Give a meaningful Linux error code for this.

...

> +static noinline_for_stack
> +char *restricted_pointer(char *buf, char *end, const void *ptr,
> +			 struct printf_spec spec)
> +{

> +	int ret = kptr_restrict_value(&ptr);
> +
> +	if (ret < 0) {
> +		if (spec.field_width == -1)
> +			spec.field_width = 2 * sizeof(ptr);
> +		return error_string(buf, end, "pK-error", spec);
> +	}

This pattern is harder to maintain, decouple definition and assignment to make
it better.

	int ret;

	ret = kptr_restrict_value(&ptr);
	if (ret < 0) {

> +	if (ret == 0)
> +		return default_pointer(buf, end, ptr, spec);
>  
>  	return pointer_string(buf, end, ptr, spec);
>  }

-- 
With Best Regards,
Andy Shevchenko


