Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB8221F0C;
	Mon, 16 Mar 2026 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641329; cv=none; b=rA1GR9CXFe0ndNMx/03/4O7cfZXqRcznGrIqPBF8VQv0TksDEab5NX9qR7W/W8g014ja9vCxcqGs70fjKLbnaEcSFnZjuh4HGmB+qmG4MX9KX+rKO3ley+XPpCloL5fnaUdoaiG7lyHU+KqTJgRRk/u7Giwzj7icFZ9vpeYBoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641329; c=relaxed/simple;
	bh=HkH+9D4cjKf0yg0LQ7vqFLjUWCtxKs0ZWpbqPBNz/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kk6MgeGgZ097Xjg8TvufKyl9DNuNMmrq4akFyF/V0w4nhg8UqfnhhurdrJvOh74nazhSZw9AQ95BiNmP3C3G9nLl1tIVR5jj3L0iBSjqjSUbKDvnIY91xt3yUz79arbn1dTsBDYlbVdR7Xu2FBwoQVkTC0d8bRCNZVkfDKBSdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f/hQddMu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f/hQddMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D31C19421;
	Mon, 16 Mar 2026 06:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773641329;
	bh=HkH+9D4cjKf0yg0LQ7vqFLjUWCtxKs0ZWpbqPBNz/Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/hQddMu7SVOOksc4Zrke8iI5mKZxnfsm2ELS+zbkXpMnXv/+8JIdiCIKgG8FnnBr
	 J2vwuNnaJvnBCAsV2ah+JGCZba24v9JtDz1gwUcEp7YUG8nNLIKHQAe1z8GGvyydcK
	 3rztoqr1T9tKoHSzaIoo3Q3Q/bXjuZvjEflji2s0=
Date: Mon, 16 Mar 2026 07:08:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Shankari Anand <shankari.ak0208@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wolfram Sang <wsa@kernel.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/4] rust: refactor ARef and AlwaysRefCounted imports
Message-ID: <2026031624-untrained-foil-3b94@gregkh>
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
 <CANiq72nXHj2q6=1jPYTds99=sLf6VX3WQwYDXBCjWfObnx9tFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nXHj2q6=1jPYTds99=sLf6VX3WQwYDXBCjWfObnx9tFQ@mail.gmail.com>

On Sun, Mar 15, 2026 at 10:25:30PM +0100, Miguel Ojeda wrote:
> On Fri, Jan 2, 2026 at 11:16 PM Shankari Anand
> <shankari.ak0208@gmail.com> wrote:
> >
> >   rust: i2c: Update ARef and AlwaysRefCounted imports to use sync::aref
> >   rust: usb: Update AlwaysRefCounted imports to use sync::aref
> >   rust: types: remove temporary re-exports of ARef and AlwaysRefCounted
> 
> Applied to `rust-next` -- thanks everyone!
> 
>     [ Move `ARef` import into the `kernel` `use` tree above. - Miguel ]
> 
>     [ Rebase. - Miguel ]
> 
> I don't see anything remaining in linux-next, and #1 was already in
> v7.0-rc1, so I just applied all the rest, i.e. including the removal
> of the temporary re-export. Let's see tomorrow if all goes well.
> 
> Thanks Shankari for your patience and keeping track of this!
> 
> With this, we are finally done with the move.
> 
> Greg, Wolfram: if you didn't want me to pick them up, please shout!

No objection from me.
