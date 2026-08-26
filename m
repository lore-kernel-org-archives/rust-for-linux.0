Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477A4345EA9;
	Wed, 26 Aug 2026 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787736629; cv=none; b=VekBaNdNPNzmC+Lzr2pag1eddLh9+glBR++Ji95EP6rri/sLIWcT5ADsoiqi+zh1fzqarisEPBQm8DBPij5WoYmDgeSrShOk2fVSiyLlZnI2lBQZYhvjq7ryh12z++oi1w9TMpQqWsJmPFbwUhAsT2evD5mrZuWzjiLsHP6m6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787736629; c=relaxed/simple;
	bh=iMEzDkYcY451+lpGVbq4N303Ki4TMyeDEp9MG7bMHsQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YsLw5wkB9TFhUFKzXMRQDUegFlBDE/IrgAkQlyDk1KABB7sVcWq0IFKtbs6Pdo7yMKKWoW32AMvi9fjGlZOnaL5UTjf01HsxgZZTtod/YsOGqlSubhpJRTjBQpfpQqFtiJGZSkp08Q3RXkRn1E0aX2nJlUmj5N6BjGSPDAdpI+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=We01mxx0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="We01mxx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702F41F000E9;
	Wed, 26 Aug 2026 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787736628;
	bh=iMEzDkYcY451+lpGVbq4N303Ki4TMyeDEp9MG7bMHsQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=We01mxx09AWtjjIEC7dgcumwsPTlnB+RumUI2X0cDWBcS8vCWRsEp95aPLzwMp3cZ
	 02Qz7Xa8UziCq4AVb2PuyW+VeMwVHCBn7/Ht9JEsUpbO66PmqRHIYGlGme6/JRYYfF
	 4hwgZ5jHIH3cKf4LlWBOPWrXAshUGINwiIuCBBZ9A+pg3n8jwT2Cdg0romH8wAoany
	 v6WOn2w8PTxqpz5X76NgihkagKy381C55iE9qZQDsk7OR92r7bc3bFDjNNF2oE+Jba
	 CoADfDyTO9Hogk1Z/rRoipR5eCZMWRtbg0iU6x8zaas/Si3BBz0BOA+XZYR16VH061
	 ai9S/QRmsD/IA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lyude
 Paul <lyude@redhat.com>, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/6] rust: hrtimer: Make HrTimer repr(transparent)
In-Reply-To: <DKY2AIA7ELLI.1REFFZGXL78Q5@garyguo.net>
References: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
 <20260825-expires-v2-v1-6-90411c6217c7@kernel.org>
 <DKY2AIA7ELLI.1REFFZGXL78Q5@garyguo.net>
Date: Wed, 26 Aug 2026 11:30:16 +0200
Message-ID: <87v78x1b6f.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Aug 25, 2026 at 1:16 PM BST, Andreas Hindborg wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> HrTimerCallbackContext acquires a &HrTimer<T> from a
>> NonNull<HrTimer<T>> while a &mut HrTimer<T> can exist at the same
>> time. This is sound only because HrTimer's sole field is
>> Opaque<bindings::hrtimer>, which puts every byte behind an UnsafeCell.
>> Adding a field to HrTimer that is not Opaque would make acquiring that
>> shared reference unsound.
>
> HrTimerCallbackContext is removed in patch 4, though?
>
> Still worh preferring `#[repr(transparent)]` over `#[repr(C)]`, but the
> motivation should be reworded and the comment on `HrTimer` should be removed.

Yes, I was a little too fast when I added this patch. I'd like to keep
it as well, but it needs some edits.

Best regards,
Andreas Hindborg

