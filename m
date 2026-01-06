Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373931C84BB
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767733224; cv=none; b=WKkmAOZcf1KU7p5p9bZcJurQ6OEOwNokUvfo+Qob/qQHGTSjrtKMTPKs1/ouZ4BGM1iaYOnAk9mL7jid+02HNWg6dKK2GoMZw++QQaJhwm9nYpbraZa8zxQ9DtBNOYeSvKojQYDuk8MlsQO6WcihYdeCFVYbUSb87GjJ2Dj3XZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767733224; c=relaxed/simple;
	bh=qBF0Z1xcGLZ1UkkCuZpNmYtrZklEGIc+5cp+P48w6U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOMUOMB7Vf9WGrLFuKZJsYDrJMo0T6Xntq73fTJV8dv+HMgZYKcEL+VS220Z8p1DT1h5SLzYVGuhF9ZvWYfTZxppkB4F804o0nZay/NpqYAKU49xi9ek3OpTRfyQZOCftiCGNSJMwICXZzPmwKevuD7YDpuxAotoWwZwEWkSYWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0bT0z8o; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0bT0z8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767733223; x=1799269223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qBF0Z1xcGLZ1UkkCuZpNmYtrZklEGIc+5cp+P48w6U8=;
  b=X0bT0z8oRzZcsQWbt9nLA2zUYV6zuBhkwk5BWWMxPYvL1qnZ0VLk485Y
   vuX7dmw6K89LfRkSHWe5z0ZreWMV3IKo0dd1Ma/+3Jo0dnTe6aXopOxmM
   S1uiKcm80ZnwSMu7n8UHutN7z2uFI59X+vUnMgrkK01YrE0sfsr+DUR4f
   hBpzDw3BCpNERksd4aItVNTSvZajAwLvhmYTyshvyOubcHY7DBFnGaHYR
   kRy+KBkTYefCEVlYuthUI4vRjHi0aECKjCr8kN319ynlClqNrqUifD7ed
   fyFFKIUssjZbBYhZQ+o2Wpon/ef+sArDAS8vQWSe80ldwjtRARB8gl+8T
   g==;
X-CSE-ConnectionGUID: yFwAkYMUQT+wyLSM0AyTCQ==
X-CSE-MsgGUID: DAwZHLpFTQyd9cVih3W7Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72961175"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="72961175"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:00:22 -0800
X-CSE-ConnectionGUID: fzDHa/bkT36KDehBxlNhuw==
X-CSE-MsgGUID: ND5SNW18RxmmCJsd+D9tBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="207295410"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:00:18 -0800
Date: Tue, 6 Jan 2026 23:00:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Petr Mladek <pmladek@suse.com>, Ke Sun <sunke@kylinos.cn>,
	Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
Message-ID: <aV133_IhL91g1PuA@smile.fi.intel.com>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
 <20260101081605.1300953-4-sunke@kylinos.cn>
 <aVgC1qXp1La6E9p0@pathway.suse.cz>
 <aVt0JYbbXLeuqFBt@google.com>
 <aV08Me9QLvi6uqsf@pathway.suse.cz>
 <aV1D8d8EyuzwQhHK@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV1D8d8EyuzwQhHK@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 06, 2026 at 05:18:41PM +0000, Alice Ryhl wrote:
> On Tue, Jan 06, 2026 at 05:45:37PM +0100, Petr Mladek wrote:
> > On Mon 2026-01-05 08:19:49, Alice Ryhl wrote:

...

> If I write this code in normal Rust:
> 
> 	let ptr = &3 as *const i32;
> 	println!("{:?}", ptr);
> 	println!("{:017?}", ptr);
> 	println!("{:17?}", ptr);
> 
> it prints:
> 
> 0x602ae0ec95d8
> 0x000602ae0ec95d8
>    0x602ae0ec95d8
> 
> If we implement {:?} on a raw pointer type (and {:p} on reference type)
> to use scnprintf with a stack buffer for the string representation, then
> we lose this flexibility. (Or we need additional effort to pass through
> the various ways you can configure it to scnprintf.)

I think the field width or variations make a little sense on pointers. AFAIR
printf() in kernel ignores field width and padding modifications to a pointer.
Only size of the end buffer may cut the string in the middle.


-- 
With Best Regards,
Andy Shevchenko


