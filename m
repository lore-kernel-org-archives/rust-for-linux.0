Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F024A076
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017520; cv=none; b=rORmcyXUhQOMy/8e8LrR+XbV7Ub0NNYG2zvdcm+YIyIb6fHcemNu2CQoCCxvLjYciNy1nVAvdoUcPEXZzKqm0YLMGfG0jUCrpjqU1dwPwh0H7C+gHqXAFZLVbt3q+dR4kYLymyhhjKK+iz/UOC+TooNFCMkBFlkq6tO7QsxZLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017520; c=relaxed/simple;
	bh=iAvimqBaFcWKzeQSE5PH5xbnutQbS9Md5v8WfZQk3iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIcy36ZRj1zY9eoRpO14nyxdzaX1QZfyrXGuEvon/Zjz8rKzUtucoGVexgjDOweD7HCZudbvz1lYvvmenn4WTzT6+NiYxRzFQvEw5uB2mUgsNZvtymwPhgfbmP0NF4IlFw8qA9Uh24KgadeoQpWur/idch6Lypc+3ThqSNOB00k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhU5JUW1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhU5JUW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767017518; x=1798553518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iAvimqBaFcWKzeQSE5PH5xbnutQbS9Md5v8WfZQk3iY=;
  b=UhU5JUW1A+rtRADi8uFIVpMa636sDV911e0BJQSutmDbDaLCraQerILW
   pqXQRUj9XwpmAM7aXsW3tHAhW+l1/10fxshQAbHrRoLho3/PbfFri/DQ7
   9M3KkMKsosjSyCdbTYsE6hKDwxiF8tMBUXorRpgOlOboWDfs0yzhLGD2M
   bSrVv6g+c4fnu3ad6+elab8kYQ+zWo8q7a/rIsterQQkhFaFB4LVHFTq9
   g9xjFdnvX4vxgtUxsMR2BgIJI6mrLAWBF16tM4mbkpieDl2udqVV5pFnF
   5WUBqD9IIxlndkMnPXlWX71lqp3n3O/N9hKn0vLfJnC7YCz1W2Smn+mPg
   g==;
X-CSE-ConnectionGUID: m8zrfdTnRJiVrFV0P5aPzg==
X-CSE-MsgGUID: HiIJLQKkR2Wh2riveSb0XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80076102"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="80076102"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 06:11:58 -0800
X-CSE-ConnectionGUID: 5C6gre+fS0+DXeH7bpb//g==
X-CSE-MsgGUID: YlOXEDAiSOi7z0aWA64dBw==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.31])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 06:11:53 -0800
Date: Mon, 29 Dec 2025 16:11:51 +0200
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
Subject: Re: [PATCH v7 0/4] rust: Add safe pointer formatting support
Message-ID: <aVKMJ3prJu6cqANm@smile.fi.intel.com>
References: <20251229072157.3857053-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229072157.3857053-1-sunke@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 03:21:18PM +0800, Ke Sun wrote:
> This patch series adds safe pointer formatting support for Rust kernel code,
> providing three pointer wrapper types (HashedPtr, RawPtr, RestrictedPtr) that
> correspond to C kernel's printk format specifiers %p, %px, and %pK.

I didn't get the motivation behind %pK. Also what's about all the extensions
we (currently) have?

> The implementation ensures that raw pointers are automatically hashed when
> formatted with {:p}, providing safe default behavior that prevents information
> leaks about kernel memory layout. Users can also explicitly use wrapper types
> when they need specific formatting behavior.


-- 
With Best Regards,
Andy Shevchenko


