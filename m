Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC42286889;
	Sun,  4 Jan 2026 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767528564; cv=none; b=PQaNdNdINe3qGSTxC9qSBbDTW7sg41LcYrfoDIenzi5gX3x+I7lmZfHgi/kSAUlkFBN1bvb0b7dnTmzf/+c5IlcK1TT38H2qlPVt6f1SjSId2ma/mvdtCK6/nTetbylP1x54jIPaNG+ibLJEE7ZhzCckPIEqJgO/WYo+mGGGVzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767528564; c=relaxed/simple;
	bh=QtFHZNtm6NFEuNaLYNk8c88SHdeqYcmbUo0yV/Z7mew=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=d+2Af9ieoME5TCekK0T34BhUaEjmlbj+cycn0WlQjG7L2vA0s1lGBge919AmV6QBtw0LYfM535mqKAFvauhgbRYCjuXyufeCAeb0NmFudSvnSOYBrZA85tOWExnDMoeJIDNfk1c94RMTGwMOvXql6Z7SUFGGrfFOWolnZ0hs8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENxA7Roq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENxA7Roq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B052C4CEF7;
	Sun,  4 Jan 2026 12:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767528563;
	bh=QtFHZNtm6NFEuNaLYNk8c88SHdeqYcmbUo0yV/Z7mew=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ENxA7RoquCeNXxKCzS5gP+h0pe11n0xgAF8HSoCNEUBAC867uqsDhCtEImkqou3tX
	 KEaq9zYzWQiDByzLnlIlYXFEuQKvIY3/XU1azkOwQicB0fFqeYvsolQ0qbre+FeqzV
	 uDMN5cg9Dpn9kSewUKGoG6z7L+DBmrdpMHTlpvVBIJ5+sT+aEBXvw+jer0QUn7NI5y
	 /nfgqpwVWsjLKsCMFM1sDRqiMIaQpyr0afP0UITWaEu4EETUALnFkEJgZNzTfwM7aN
	 cmDBBTDdYHhtERXe5SDC0rzSZ5deE9Tw1shgLdteXS10vMk4oB0ZDmgtpQ8czWYQ5t
	 qn6V4f6Q3jvfA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 13:09:15 +0100
Message-Id: <DFFSKWSC1SHC.32YAJT1GI79IY@kernel.org>
Subject: Re: [PATCH v2 2/4] rust: i2c: Update ARef and AlwaysRefCounted
 imports to use sync::aref
Cc: "Igor Korotin" <igor.korotin.linux@gmail.com>,
 <wsa+renesas@sang-engineering.com>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Martijn Coenen"
 <maco@android.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Christian
 Brauner" <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Suren Baghdasaryan" <surenb@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
 <20260102202714.184223-3-shankari.ak0208@gmail.com>
 <c7be9f2b-003b-4dca-8296-5cb7a06ded8c@gmail.com>
 <DFF8D5VJ7RMG.VRLZJ24NT2T3@kernel.org>
 <41d26500-d425-4359-91b4-b738725c0b8b@gmail.com>
 <CANiq72=YKO3fvX=CP1VeXoKfROtdJWF3rysNdz+k_nOWw1jv2A@mail.gmail.com>
In-Reply-To: <CANiq72=YKO3fvX=CP1VeXoKfROtdJWF3rysNdz+k_nOWw1jv2A@mail.gmail.com>

On Sun Jan 4, 2026 at 12:58 PM CET, Miguel Ojeda wrote:
> On Sun, Jan 4, 2026 at 12:31=E2=80=AFAM Igor Korotin
> <igor.korotin.linux@gmail.com> wrote:
>>
>> I see this change more as a Rust infrastructure change rather than
>> something I2C-specific.
>>
>> If it is not a burden for you, I would appreciate it if you could take
>> it through your tree.
>
> This could even go through the Rust tree since it is a general
> cleanup, but I imagine Danilo wanted to see what Wolfram thinks first,
> since it is the "parent" subsystem.

Yes, that was the intention. I think it is a good thing if the C and Rust p=
arts
of subsystems are handled closely. I think making even trivial patches flow
through the corresponding trees can help with that. :)
