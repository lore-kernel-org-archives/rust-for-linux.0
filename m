Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8D630F524
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356169; cv=none; b=FQ8VDvuZbbIALVX7sfJNsE3iyJKcsSTPK/gu5NQSvlbkuMAaGpBlNfNgjzUb/dj3Qjpk++9On1Mr9g/L9larKe+fU0jl257cWR0bR27ReY6+2qNK/IArKpvqlPRRT7aHLwF4rEnEw8hEodo+CrXI5gmU19IngnOwAnZ4sM0lZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356169; c=relaxed/simple;
	bh=RCxAJzkb+MdtRs2FOWpwnFhijutboix6wNyuVuqUmQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lE1RPTmlzoJjy3hhSSwnOfmT8ELVg4dh9h5clV4GRB2DO2Qn92eFf4UNwL24SX2Myl42Hr6CPZiumtN8jpIrCaFEhJ9bQFQ3r6uVjXGEOBPKtIE60+UA6KEj+BOG773syIMFErTlbS6f4Nkv62D8Vdd89I4Qe7uZ0GqHxFJAdoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZ11Y9ej; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZ11Y9ej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767356166; x=1798892166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RCxAJzkb+MdtRs2FOWpwnFhijutboix6wNyuVuqUmQY=;
  b=kZ11Y9ejCgaWcFANCIT3My0vV++VFI7OBwYZFtZ4hP/5vYfKuZ0u8p1v
   AOoNDpU0M9IEgtqNqJtfCJSL0J5s3j+IYDRr4xZQsoL/ju72wYNQByZlc
   NbH3kGLmWuz0PRRB7SKdnYEvoiZK1SJ8o+2VXPXiOm/X4gqVz7rv03lS0
   zFQmBRCq8mAGsobVpDO2i4zAvBMoZ24iC80D9TplvPr0KZdDjmXeYXWKq
   +RaWtXpcD7hD8ITnBCnM+/BxMC9IfzI8EKjB/eHhTBwIUL5uqhY/DNvS4
   H5zwNIC+ajRh+SxAPAUkRGYEx2+WRnhqwQdZRk8D4f/qEaLXKpFf3oRP1
   A==;
X-CSE-ConnectionGUID: HCeFq5viQdOJ7/090ojWkQ==
X-CSE-MsgGUID: /OTPhSo4SKCw7/vCUDqL8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72698378"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="72698378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:16:06 -0800
X-CSE-ConnectionGUID: cq8Ce7KFSmOPT50mHViavg==
X-CSE-MsgGUID: MX/F2/G3RcKhKG14KFj0WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="200943892"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.46])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:16:01 -0800
Date: Fri, 2 Jan 2026 14:15:59 +0200
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
Subject: Re: [PATCH v8 1/4] lib/vsprintf: Export ptr_to_hashval() for Rust
 kernel crate use
Message-ID: <aVe2_8EVHVLJGGGa@smile.fi.intel.com>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
 <20260101081605.1300953-2-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101081605.1300953-2-sunke@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 01, 2026 at 04:16:01PM +0800, Ke Sun wrote:
> Export ptr_to_hashval() with EXPORT_SYMBOL_NS_GPL using the "RUST_INTERNAL"
> namespace. This function is used to hash kernel pointers before printing
> them, preventing information leaks about kernel memory layout.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I haven't suggested this change. I suggested to make the export be
Rust specific.

-- 
With Best Regards,
Andy Shevchenko


