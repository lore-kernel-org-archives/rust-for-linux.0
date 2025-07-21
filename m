Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF31ADC90
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112035; cv=none; b=uJhJ9r9jsZtg6wtDp6F+V784IJ/bOC3CTONTNbRUd3JWHQiRJt3rPfK6KctJ5krLs4JawkPt6AqvLpA97v1kUQ6Bv+fJ4jWiDYv9CUz0iNtnFYeyUZK7yqrG/dcZwLNRirGFcABIzLtyXyMZRXVCxvwsuuieVkpc38A14x+JmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112035; c=relaxed/simple;
	bh=hyyuyfbxHodKvSyqExb7ImrgCIZwTFL9rTdX6poyFrA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ok4+a9qW6wysa1OKO91doI+0e6PdkM2A9P96V8e93I8WrQFKxKXKxZPqI16sHWIbAVOncMrdHFOsbfhVjR6AtzkNxZyiWvDtFODGlvM/rzJtSUQvnygoG0aJGSSjgkODix1BPtHY3IlvKnetRZqrcT/39pXrab01XMnK+4LLIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKLmbz+C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKLmbz+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596E8C4CEED;
	Mon, 21 Jul 2025 15:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753112035;
	bh=hyyuyfbxHodKvSyqExb7ImrgCIZwTFL9rTdX6poyFrA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=FKLmbz+CxSiNML7F+p65oJIHLjvl95Pv/hVEblsYZTTWlg6gn+oXGNJIX02LFyhNp
	 dCdS718g72JP2jUZgODe+lsRafSHI8B1NVsB/c+RkJhy78hxeiwLkUZMb41Uksd/jQ
	 5q6ZrH7iMt0d1l+wQzZBq9JoyE5TqH6cru4LgW2R2OZLRSzM95tonuefJNuY3N/ElU
	 aCT0x45l7ucQzuuFb/++Py7R21I6ckm84W/+wl3v5oHefDsQ1a8hErT1TL7nXd8c0b
	 1yH54Yn0rmRQ4fZGAyBU03ZovYUIPFViunpxP8ao3gwRYPJFwj24Z7eBR1asyjActb
	 +fjS6Sh+P5zoA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 17:33:50 +0200
Message-Id: <DBHUCKLO3YG6.3MFXYIE4XZMN1@kernel.org>
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl
 arguments
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <alyssa@rosenzweig.io>, <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Beata Michalska" <beata.michalska@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250626162313.2755584-1-beata.michalska@arm.com>
In-Reply-To: <20250626162313.2755584-1-beata.michalska@arm.com>

On Thu Jun 26, 2025 at 6:23 PM CEST, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraints. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where none is actually
> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

The patch does not apply on top of drm-misc-next and does not have a base
revision.

Can you please let me know which commit this patch applies on top of or res=
end?

- Danilo
