Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A559951614B;
	Thu,  1 Oct 2026 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862355; cv=none; b=lN5vfoexXx+poL1H8goeXOh5nnyi8qTOso886kkCh86LbhHxXmGj/fNWZmGWJCiUmdWvB7Ia41vyz0iiQogwsMKm4MgINLZlOHGTnYa8Q3NkCJ7+oue+NxcP3BKhQcMmLiV6oWrVA9RRWh5+1GV58HGvh+JqDE/0Str/VjxN+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862355; c=relaxed/simple;
	bh=apKzEwDGvm39faDzm+9FLwjhohGrNW4I7Dxp/WKtP3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KaCRBWR9zJ9fJ+2vrqzSwNeNewCWxIVmHsV4Wn05v0E5ssFsLMJo9v7tb/Vo1+rrhOlguqL4L3HJ+vIeSsD1+fR9WzQTiYiYdVfg5z9H/QGPKtrr3m4lkpwv5kumfHIbRbdhZjx0vzHkBEejMUFrO1deDtGkp2ypoU+E6E3pH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUpcTBxM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUpcTBxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853BA1F000FF;
	Thu,  1 Oct 2026 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790862354;
	bh=O+hFdg3vTjqlHkFtIZYWlUtyOb9Pvlpw/KTbPdqgDfg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=oUpcTBxMhif+OuMIVz8sidLgmOIuLLDYM4tgCbE/esDRHUbLHc5qX1g9G99Lreogr
	 AlwwRNOfNwhOLY9Hz+nuvtMydy+dTbcGCR/3YfOv/90CQpCFJNi61lzTujMAx5iars
	 Dkw6MXnmjstPNNytcANXASuU+x67gVlJsLXHRwWYeapBuWw/U30V6IXO6eUE/4fFlA
	 AokpQP4jOLHj0cl8Ab+LHg5ECRM3u0kAm8YdTQCy6myVmSx7O840oMRFhEa6X1BXdi
	 MW4uHxlZzwfy3DBn8WiyBTyDDCXh9yPclNB6AI5Zlt23y+46IoccSrs6qFECHm/tsD
	 mpA83Ymdc+Vrw==
From: Thomas Gleixner <tglx@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, Andreas
 Hindborg <a.hindborg@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lyude
 Paul <lyude@redhat.com>, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, FUJITA
 Tomonori <fujita.tomonori@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/6] hrtimer: add expiry injecting callback variant
In-Reply-To: <DLT1I5F55U3W.2N237BGZ1EDF1@garyguo.net>
References: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
 <20260825-expires-v2-v1-1-90411c6217c7@kernel.org> <877bk3ixp5.ffs@fw13>
 <DLSOFOGGZC92.12KYHEALX1271@garyguo.net> <87qziah0uo.ffs@fw13>
 <DLT1I5F55U3W.2N237BGZ1EDF1@garyguo.net>
Date: Thu, 01 Oct 2026 15:45:50 +0200
Message-ID: <87fqyph6up.ffs@fw13>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 01 2026 at 00:29, Gary Guo wrote:
> On Wed Sep 30, 2026 at 10:43 PM BST, Thomas Gleixner wrote:
>> So what's your actual argument that you can't build a "safe" Rust API
>> around this?
>
> Sure, if all expiry read/update functions have their _safe_from_callback
> variant.

Why do you need more than the safe forward variant to solve
the problem of preventing that a callback forward and a concurrent start
collide and create inconsistent state?

Just to take a step back. We have two sorts of hrtimer usage:

  1) a simple "start, wait or cancel, done" sequence, e.g. nanosleep()

  2) a more complex scenario which has to take care of concurrency,
     e.g. POSIX interval timers

#1 does not need any of this

#2 has almost always a related data structure, which needs to be kept
   consistent by some form of serialization. The embedded hrtimer is
   just a small low level detail of the overall use case logic.

   The base lock _cannot_ provide the required serialization and any
   amount of 'callback safe' addons will not change that.

I completely understand that you want to create a fool proof hrtimer
Rust API, but honestly that's just creating an illusion of correctness.

If the core provides you a get_expiry_safe() variant, which takes the
lock before reading, then what is the return value?

  It's a snapshot which might be invalid at the time of usage already.

Ergo, if you need consistent state across concurrent contexts including
the callback, then the only solution for that is external serialization.

I'm not against hardening the core implementation against API misuse
where it makes sense. But that's hardening and cannot solve the other
problems which are solely in the scope of the usage sites.

Thanks,

        tglx





