Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A642E6CD8
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767084063; cv=none; b=Kr9Rmnrs3Z83BpuBYXIgv9809NN/JN3WhINt0ckEZstgakajWPVebiChAG0HCZWBj6P0Lu4VKhhDnRJCqIC5sxsc6R6bCcU3QHx8GpAkXrORaVxdq/O74YoSPulowXOkkVtDFIW0jX+J+4wPoqSFuqGC9fH4jTc/yYkLJgeIKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767084063; c=relaxed/simple;
	bh=cnewSLsab1EEfEkBPwwp+xGyqqg0CkGWZ8UzB7zKUZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4Qn1G3y83xE6mbboIS3OTeIPSow7yXZ5lfNIweIGAaAADBsAvt1y5fpUlBCEsxxTtNvx96LZeHutMplH6EqFc1sAxC2ivv1PjULqEYN0vLoGNlIzOWJlxrYNixzvrngtEDv2iaQOVSzJtSzieFPPQNLlK7LnkLEZtbdkSG2UQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9/jWZXd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9/jWZXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767084061; x=1798620061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cnewSLsab1EEfEkBPwwp+xGyqqg0CkGWZ8UzB7zKUZ0=;
  b=F9/jWZXdT5sgF5gy835ZZr4YFzUJe+AwFr8CutJYEEK0J2UMN+MOB1mF
   sdjJrxewpn0lR/9f1l1LkdqAKEIAZNGkD4z9jCF+k5SCWczUlHgnQmQSY
   gnmcZsoc5QB3/ZKTuJ0PRP246QknvWikyTpslwKfKA6V1c7XNTkgufBY/
   j7XceuR0XNZhYCKw7f4XrR9/bwq8F/W+35e985x9pAG25e1I0TlqbTuVq
   nA5iaP+QgsdCX7uUlqCTW/yhepS+/SqIKSzAq5emTASdkKyay045KRhCY
   hTZt4PvrELoy/tkbQqqIbnO8bGk5qGdGd1msntEgA929xsTQ2bJei0c/G
   g==;
X-CSE-ConnectionGUID: SYVe/DpTQmySUOPBCX9uzg==
X-CSE-MsgGUID: zcwb96fhSTeLn8c8yuApCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67679191"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="67679191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 00:41:00 -0800
X-CSE-ConnectionGUID: x+EYOid5QKaopB8OBH7uZg==
X-CSE-MsgGUID: /OV8d4gDTMK0VGTk1cPynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="224666179"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.103])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 00:40:56 -0800
Date: Tue, 30 Dec 2025 10:40:54 +0200
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
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 0/4] rust: Add safe pointer formatting support
Message-ID: <aVOQFmqZCfZWdKSJ@smile.fi.intel.com>
References: <20251229072157.3857053-1-sunke@kylinos.cn>
 <aVKMJ3prJu6cqANm@smile.fi.intel.com>
 <CALpAb9Omfq8+KoC6Vwgpi+hzy9RezrG+_FiWVc6xf=71iRDj9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALpAb9Omfq8+KoC6Vwgpi+hzy9RezrG+_FiWVc6xf=71iRDj9w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 30, 2025 at 10:03:17AM +0800, Ke Sun wrote:
> On Mon, Dec 29, 2025 at 10:12 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Dec 29, 2025 at 03:21:18PM +0800, Ke Sun wrote:
> > > This patch series adds safe pointer formatting support for Rust kernel code,
> > > providing three pointer wrapper types (HashedPtr, RawPtr, RestrictedPtr) that
> > > correspond to C kernel's printk format specifiers %p, %px, and %pK.
> >
> > I didn't get the motivation behind %pK. Also what's about all the extensions
> > we (currently) have?
> 
> I'm implementing a R4L wrapper for the RTC driver and currently only
> need basic pointer printing. %pK is typically used in seqfile to
> export information to userspace.
> 
> All extensions can be implemented by modifying and exporting the
> corresponding functions in C, then adding wrapper types in Rust.
> What's your recommendation on which extensions to prioritize, or
> should we implement them all?

I have no priority list, I just asked for clarification of your roadmap and %pK
case as the latter is quite rare (3 in Documentation, 8 in tools, and 25 otherwise)
and probably shouldn't have existed at all. So, I would rather not advertise it,
may be even mark as deprecated or so on Rust level.

> > > The implementation ensures that raw pointers are automatically hashed when
> > > formatted with {:p}, providing safe default behavior that prevents information
> > > leaks about kernel memory layout. Users can also explicitly use wrapper types
> > > when they need specific formatting behavior.

-- 
With Best Regards,
Andy Shevchenko


