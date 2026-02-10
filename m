Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAFF248F7C;
	Tue, 10 Feb 2026 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763952; cv=none; b=raVPQ2rbDBamN0MJ+AKpl4D8lYosQ5cYx/im1Gtj1RDdS76sfme1xAW5+qDuPxO9FsaRG01E3jp4P7EU8TPFJXKATZUAPflMW9gRyqUm0fRl7qtJNoMASRXvnbDJKpKzXgO4J/v14AucBJHdjCBVm0USc9EdeNciSRCd5SGB53c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763952; c=relaxed/simple;
	bh=ZvqqhV5W+8y/oSlcYQjLtuEox1jRzqw+qeDGKbiqMkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8sqGB0rytostO3QCHDDeBEmj9shCnWjzwJ6D4hFrVvBSnxP6LLg/6/2FFL8pzCMffrC1GNVCJGtvICwuwbRL/ShrZbi9LedG38w7WabG1sKo/W38xppoT6WN9Z8+COYBRJyM2RuLRj9fAbBXqMZ3MkErPCu2ov2TG2/JiKRgTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IufyRaXV; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IufyRaXV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5sr2QJGU+iBAVZFE8qPnrf4JPvGtYGNcJCPblgtf/vk=; b=IufyRaXV9RkE6ttwzJNepYvHOt
	SCsBsayIb7uFRs5W/gEatEZzZjSuE1JkAdaaUyawDtkgJ48lD/chGvJaPYCCdIh1+FF2eqI+H+ssa
	crxhYo46/NNZ7Xcddccf8DDJjy2h3rNfWc04TMssv0am4P5pDpuqGFslj3IpF95/u2iXEPG2pjbM1
	Hmcu3P7QsHBEs376GTaoEZHzfHOXoTUNk/1GyN/z9UwnkMRzreVhWd68Kse9TYOqZqIhXiXvUiVXR
	oisgpybDBkk3Q6Bq+NdB3AcQw4YBlErV1xYPchFt6qLOeQajhLH4fnH8HXNtOPhKUZ+P6X78u7cf5
	1BnFmWnQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpwai-000000090Ou-2yXy;
	Tue, 10 Feb 2026 22:52:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1EE1F300969; Tue, 10 Feb 2026 21:26:30 +0100 (CET)
Date: Tue, 10 Feb 2026 21:26:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 09/27] rust: jump_label: add __rust_helper to helpers
Message-ID: <20260210202630.GR2995752@noisy.programming.kicks-ass.net>
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-9-51da5f454a67@google.com>
 <CANiq72=-Xh3wVA=nu7eYOEqR9V8jpLziaVHTFXh2n3jYAsrzvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=-Xh3wVA=nu7eYOEqR9V8jpLziaVHTFXh2n3jYAsrzvA@mail.gmail.com>

On Tue, Feb 10, 2026 at 06:54:59PM +0100, Miguel Ojeda wrote:
> On Mon, Jan 5, 2026 at 2:08 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > This is needed to inline these helpers into Rust code.
> >
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> > Cc: Jason Baron <jbaron@akamai.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> 
> This one is the last one -- I guess if new ones were added during the
> merge window, we can have a v3 next cycle with this one plus any new
> ones.
> 
> Otherwise, I guess I will end up applying it after -rc1 -- and
> Acked-by would be nice.

Sure

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

I think Alison poked me on this, but cracks and all :/ Feel free to take
through rust tree.
