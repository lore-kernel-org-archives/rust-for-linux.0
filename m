Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2043428314C;
	Tue, 13 Jan 2026 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301041; cv=none; b=dZHYqBgA5De9nUUy4te+v3UW433+yv6gwjY/NU2NmNja2MxG04Iz0JRQ7Hd+Tgx4fE6j9ZQj+IMBlWoz3Wbdc9clY+aLp68UI4m6VC/ZsYSdtgi6JSEJIZxMki5b+Ifi36VwerNG7BkzJp9SsU42ZWuJd+8Aeg7wo9ytACMSCtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301041; c=relaxed/simple;
	bh=X28kvLJg1xnkxvUOQH4eyDV6osoA4D+yaYT9AjDK1zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8cWY16dWDVp2B5IioKSE98eIj1hL1dbybZRCG34TzhSfubGY3qKYSiDj8QNp5V9LoebtbITcLG+STJGdB1sJUpUBz5WpXyBTYY7khqsRdmQjr8kIWPezgg5hDS/bLyYaieJQPfbYB3H1T/QIlRxhiASLlMs/JIb0SAVlCulad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cVcV4q5S; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cVcV4q5S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rs0t6lm7/P+aWY+UTo7NoiZhO5+1kT9ox6xFFUmlQFY=; b=cVcV4q5SvC0Jhwj/AEDh8wp/u7
	mWhJXcsaSXUcVkSTEnYgIaUjC5incDfXtrAL4jNuCwV/j40m2Q1pD1xKY6Q/bMbRANncgEXpUHvz9
	wURurazL1sh6Das06lryNIZEvMuo8wc7C7CP5qMk5dZ0zb7EaTkiZBXRR/qaf/dfTCBt0efGhI78r
	8VTgXrjX7i8ydyTFuJ+Zd1GVQtSbKQzQdwyBJsfJOLx1KGmRZ+wKZZS9+l5680ats93ENHSr63j9h
	FMIbILEVCs4WIn6lhnR/1m68kgBvZevA6vWJC8m6DQhcyXBflfIjG2ymkgAabjnCPCncta6edaZVE
	IV9IqUDw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbsL-00000004auT-3ffI;
	Tue, 13 Jan 2026 10:43:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BF285301C77; Tue, 13 Jan 2026 11:43:48 +0100 (CET)
Date: Tue, 13 Jan 2026 11:43:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [GIT PULL][PATCH 00/36] Rust synchronization changes for v7.0
Message-ID: <20260113104348.GC830229@noisy.programming.kicks-ass.net>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111115808.5702-1-boqun.feng@gmail.com>

On Sun, Jan 11, 2026 at 07:57:32PM +0800, Boqun Feng wrote:
> Peter,
> 
> Please pull the following changes of Rust synchronization for 7.0 into
> tip/locking/core, you can find the details of the changes in the git tag
> message below.

Done!, Thanks!
