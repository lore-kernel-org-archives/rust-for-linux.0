Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D431C567;
	Wed, 18 Feb 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771453447; cv=none; b=W+mb3bz8/YZe5M5ECTioHuTyZtHhGNvounNz12FAlBNziFq2LzylpS/DdLmBwQz+jKcc7nR43fiIMcn5d4pNyqw39flEOeEMgI2olE4KxlPmS3dr7YYZklsHs69O3eICNh7ZBazL6Yhtb95nZq7RuRRH/Y0aRzH3lwkvSB+k/ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771453447; c=relaxed/simple;
	bh=zQn0Q5wZfpk7S2Q8aholhB3Xtns3J/Vj36VDYCIlYi8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KeHQWGjtJEbNxjke7rNZnLNFFD9YMunmaBoN/8WgzCEKUVDhudjRdLa8+PUo7EYO4Z+E1AxHUJ+FuWaucItxNDgXCuXK3bdHV9A40YyXurrOGZI8Ka6vzbhS7TqMBgJWTCbd3c9JNCd00QY4AxQz23s1618VX33PHyo+wZ7GKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwgT2mGC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwgT2mGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAF6C116D0;
	Wed, 18 Feb 2026 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771453447;
	bh=zQn0Q5wZfpk7S2Q8aholhB3Xtns3J/Vj36VDYCIlYi8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TwgT2mGCxSaU1yc8PMjqS55Ur7/a+wcxjcuI7d3a/94mTa3Y0AFqYd/8nfUv6vyfD
	 /+3lemhhupa/JVo+a3IYXvGC3201kjnFg5Onw6DBAhhr+vCuKQn7l0gPnfsR94W995
	 UHPgkpQZZVzmhIYLPrJKPweANgPFyY3bDzoh3h3YDbhbiaQTCQJp5tkdlRVQcSuDKB
	 KjxlfU9jFUzFS+N1jySX9rYXvlqjc7b1gKJxkbw4FGrB5wAFqi5HnX/QobLQsLPIPO
	 gavC4Nd3rxv/iSA/ViW2EZlvZmUtgIbD7CtX7eXRN5vl6azqgaCEQMmVPgKEDS5NSP
	 H8QFIWWJvfLkw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 23:24:01 +0100
Message-Id: <DGIFU4JV4U47.QNCVFND4EA40@kernel.org>
Subject: Re: [PATCH v10 0/8] Preparatory patches for nova-core memory
 management
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Dave
 Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>

On Wed Feb 18, 2026 at 9:54 PM CET, Joel Fernandes wrote:
> The clist/ffi patches are ready, reviewed by Gary and Danilo. Miguel, can=
 you
> pull those via the rust tree?

I requested changes in the last version and have yet to go through this one=
. I
also think that Alex still has some comments (Cc'd him).

Please note that if this goes through the Rust tree, we have to wait for th=
e
full upcoming cycle before we can land the GPU buddy abstractions.

Alternatively, if it goes through the Rust tree, Miguel can provide a signe=
d tag
for me to merge or we can simply take it through the drm-rust tree in the f=
irst
place, if Miguel agrees with that.

> The non-Rust DRM buddy related patches are already being pulled into upst=
ream

They are in drm-misc-next, I will merge into drm-rust-next once they hit
drm-next and -rc1 is out.

> I will post the nova-core memory management patches as a separate follow-=
up
> series just after this one.
>
> The git tree with all these patches can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova/=
mm)

This is now (at least) the third time I have to ask for a patch changelog.

	"When sending a next version, add a patch changelog to the cover letter
	or to individual patches explaining difference against previous
	submission (see The canonical patch format)." [1, 2]

Please, add a patch changelog.

(This also goes for the nova-core MM series, which is flagged as v7 despite
actually being v2).

[1] https://docs.kernel.org/process/submitting-patches.html#respond-to-revi=
ew-comments
[2] https://docs.kernel.org/process/submitting-patches.html#the-canonical-p=
atch-format
