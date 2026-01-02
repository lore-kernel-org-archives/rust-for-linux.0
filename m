Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5393B184
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356241; cv=none; b=B1NGU07NSxPs9NZmSz81nhcKnyO20O2MtYqSVUvIqUQI0B8JqVUjQ6k14X36SL7EvYLQRbCk9gw1EjrQHt7RweJNg0hWEMnlwleETgWhBB71RGtIj+rWVv3t2RebjI0TEjNxDwJXUzdHXK/0/ZpZDXwegorQafj6aYMDcFhryjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356241; c=relaxed/simple;
	bh=bee9HzUtuPK0UItgRVJspeoHdeBIWq+IOLzwiU/z4w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdiGAv/SPcSqF4BUYllMHT9DEd822iw1+9at00aOmF2bUE2bxNP1Na7b76F1UPH2CAwtEbfrMLWWkBtsnDZQY/qBchRmBDvq0cC+LZqVf9pIxMqE6Bdcszptp1OB9qALY3Ls27hicLZXTd0VYg37ExH76WSbVgZci5toN48KlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4DXDB4G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4DXDB4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767356239; x=1798892239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bee9HzUtuPK0UItgRVJspeoHdeBIWq+IOLzwiU/z4w8=;
  b=O4DXDB4G2ARDNwN7f5SSNxAgLriVQn+4pPcjPEzFL8W+9xMSDov5vloY
   yiJ8csozt1pv3l7v4qY91NLCykWBFrhRjAZLfSLypyj3KkEdw8eRYGjFn
   nQlAWcoBvANmbBczqhlWnKnioJSiGB2hzrgYetolfL3VNisUp3bV1dcS0
   dESIAqyqgzVAxxduUKsZiM4xNzK2W2gmKiepBk55ipN736k/89MHVEHjB
   ehGieE5Gcp5Giyq1gRtulIOfA9yI9o+gh+c4ML1gn4+/hVgnpdqQ0vJQJ
   PXDzLUuGr2X7DOE3DkPj+M9ZC6vPjOQdp9PFKrmf1bYjsCWt+AtYrccO5
   g==;
X-CSE-ConnectionGUID: +/k6Kc8+SsuedyrsPTk08w==
X-CSE-MsgGUID: L5CSsAOISwWixRH9fuH+mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94319094"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="94319094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:17:18 -0800
X-CSE-ConnectionGUID: RQJNjX27Sku/893uhl4H3Q==
X-CSE-MsgGUID: MHu0QsZcSOmEz6yCPfEe7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="202273524"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:17:15 -0800
Date: Fri, 2 Jan 2026 14:17:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	John Ogness <john.ogness@linutronix.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
Message-ID: <aVe3R9_Jz-eOFJ6U@smile.fi.intel.com>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
 <20260101081605.1300953-3-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101081605.1300953-3-sunke@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 01, 2026 at 04:16:02PM +0800, Ke Sun wrote:
> Add two pointer wrapper types (HashedPtr, RawPtr) to rust/kernel/ptr.rs
> that correspond to C kernel's printk format specifiers %p and %px. These
> types provide type-safe pointer formatting that matches C kernel patterns.
> 
> These wrapper types implement core::fmt::Pointer and delegate to the
> corresponding kernel formatting functions, enabling safe pointer
> formatting in Rust code that prevents information leaks about kernel
> memory layout.
> 
> Users can explicitly use these types:
>     pr_info!("{:p}\n", HashedPtr(ptr));
>     pr_info!("{:p}\n", RawPtr(ptr));
> 
> HashedPtr uses ptr_to_hashval() to hash pointers before printing,
> providing the default safe behavior for kernel pointers. RawPtr prints
> the raw address and should only be used for debugging purposes.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Definitely wrong tag here. Please, do not apply random tags on behalf of
others. You must get it explicitly.

-- 
With Best Regards,
Andy Shevchenko


