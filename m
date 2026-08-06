Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149FC265CC2;
	Thu,  6 Aug 2026 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023586; cv=none; b=k5POGgZCsbG/DgsMxuaXeP/5oo28zzXtS1VR+8XzMZohCGwLUY9b+BFHsnZHzSvBZEGwNknwMCA+Uz3TuMmkLeoMmWFVtS+nYsbqAG7WTIIVBHt0LRu6Br3ZuKVkQ/LJ3ZuWhTUG9UbE+kDC5xp7igjMdVN7Dt7qN3zLoF3R7oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023586; c=relaxed/simple;
	bh=0N7F0aHd11Px++28KUxL+9PcnTzjtoDXdpsMGae4zE0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b8dgiZYfkTdtutwJUbJjrsDDBYCI637FuPZ25xRMZzPWhZpMVi4Z691bYZb28OIBbasWeH0SrrGZ3Go8KRdu5g1mHtUpDchS9qvrjkzaVMbLL8qD+t0iPliHvv+bjjTeBletm0j0Z7Vxk6O3Py8FHQiHs8F6wSrHMExovDH26W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 2BE9DC073B;
	Thu,  6 Aug 2026 13:39:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id E72BB20010;
	Thu,  6 Aug 2026 13:39:21 +0000 (UTC)
Date: Thu, 6 Aug 2026 09:39:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Kees
 Cook <kees@kernel.org>, Matthew Wilcox <willy@infradead.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?="
 <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, Tejun
 Heo <tj@kernel.org>, Jens Axboe <axboe@kernel.dk>, Robin Murphy
 <robin.murphy@arm.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, Thomas
 Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, Christian Brauner
 <christian@brauner.io>, Viresh Kumar <viresh.kumar@linaro.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>, Burak
 Emir <burak.emir@gmail.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, "Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?="
 <kwilczynski@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?= Roy
 Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "Onur =?UTF-8?B?w5Z6a2Fu?="
 <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>
Subject: Re: Invitation: Rust for Linux Training Day at LPC 2026
Message-ID: <20260806093917.113e5f6a@gandalf.local.home>
In-Reply-To: <rust-at-lpc2026@google.com>
References: <rust-at-lpc2026@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: duudog5bppg5hwedo6m3o9u8gzkujqiy
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: E72BB20010
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19GIkCh6SBiPzm2osiO5rC90wpPd7BBjg4=
X-HE-Tag: 1786023561-435137
X-HE-Meta: U2FsdGVkX18z8wRRbUhYsqRshcrMvcZ8/z7uJl10i9EwpdFmZFhpIrp88AhIM4fLGzXNCDu/vcd2vbrjen9KHfbUD7XmK4u2HCR5lMB77SFdP6DwphDpWHMsNK4xmPMgHZ0a69T3W3C6kNvQtk3yvr70/tHhSpwawT7dz/Kt8lehSq2TOEavsaRWN3QVO2JuPYhi8set5x1UXHxVvdTUl2i/fpaBkQ1WEo49kE8oIkxQxYdfsM75cwqCSES2RZDpXWSzKbhKq9MeBxSVxf4mDkNs40seXI6GbynWBNNSEr58YTIcWRCot2/60GSCYiW6gypRbNDbXH++aoYARHKedfvhwOrCim6g

Hi Alice,

I wish I could attend.

On Tue,  4 Aug 2026 12:57:29 +0000
Alice Ryhl <aliceryhl@google.com> wrote:


> Logistics & Prerequisites
> =========================
> 
> When: Sunday, October 4th, 2026
> Doors open 9:30, and we start at 10:00. We will be done by 17:00.

Unfortunately, this conflicts with the GNU Cauldron Kernel track.

-- Steve

