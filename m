Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC803A1E8B;
	Mon, 22 Dec 2025 06:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384612; cv=none; b=a4rPhZ+Dm0OxEtX7SMF2lrwydXXmjpg2Wh7E3Q+qXwnuDDVsPuF8dzYNypoO4HljAQ2uLjsgtvPJWU9lxp5G8vipN73M+Ev3P5Ow0TMOd+6YTDesR4dAucmZz2UNuRBwjHwnsRMnvAOaIShUWdStc76m0Bj/GlbDA+VMspHS/YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384612; c=relaxed/simple;
	bh=rLfAN35Kv5TMGjRUSkpch0JryUhQpmb6z6BtiH/XGCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eDSj4bCpCwIkZ2xpOo3REYsb7NKh0keePiOMxr4KtQwaUAM9VSJtMxIfiGyUKUX2HP7AoyIUNLF6XF/qli6iqja6w+nfcxdYpguITNtKcZG4VCgclgn+LUMwjgIxF10DppMo+qqE8KvkTGBGTikWK4+uWKeTNdcXGkxIFRhNfko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uu3GWc5O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uu3GWc5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268F4C4CEF1;
	Mon, 22 Dec 2025 06:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766384612;
	bh=rLfAN35Kv5TMGjRUSkpch0JryUhQpmb6z6BtiH/XGCw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Uu3GWc5OxMWW4dQKZGEgbAUi+V0kYmDhZ80FZTDMy3OiMNSWEd/pt1qqgbnNvRYXV
	 ZSAAJ2OdUhWIVO+6krAnj1xEMZ9wtzQZOgSF8m4KDmTCZ7F801G+iEh+bgF0Nkx5w7
	 MkJ65iqazfBh7ucjOvQMvHknPyhY2a7tN0ekoJvPK7HITzGVFS7K8TS9rfaCmUFdcp
	 qodArdtxGOtMLTjlXXgJf+UOCo13r5E7MN36YTpkFbEI89IcXjX1+AnuHEBsc0rNh/
	 pnSI/I//Py1aPm6voPh5qSZXgiFvqDZGGyGBJCDwTl3LsH9pvKrzz6kFFfcF40Ongg
	 Rq1i71/Qx6/Mw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:23:26 +0100
Message-Id: <DF4J31QHOZ9K.2I58JYI6FBJHA@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v16 12/17] rust: sync: lock/global: Rename B to G in
 trait bounds
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-13-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-13-lyude@redhat.com>

On Mon Dec 15, 2025 at 6:57 PM CET, Lyude Paul wrote:
> Due to the introduction of Backend::BackendInContext, if we want to be ab=
le
> support Lock types with a Context we need to be able to handle the fact
> that the Backend for a returned Guard may not exactly match the Backend f=
or
> the lock. Before we add this though, rename B to G in all of our trait
> bounds to make sure things don't become more difficult to understand once
> we add a Backend bound.

Would be better to have this patch directly before the patch that needs
this.

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

>
> There should be no functional changes in this patch.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
