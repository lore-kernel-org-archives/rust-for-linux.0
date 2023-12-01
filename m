Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NGszqyCT"
X-Greylist: delayed 152360 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Dec 2023 09:37:23 PST
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6884B2;
	Fri,  1 Dec 2023 09:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=733i7nh34fae7nqvhxrtxokxny.protonmail; t=1701452241; x=1701711441;
	bh=SDEs+kKoImcW0/37ZK07RqKOEiMzhsKpKss6HpH9yX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NGszqyCTA9a++ZSjmKG7lMsbXMaRsYWcE1OOO82R9qa95qsfTr+JngRey35OgZdnf
	 q8MOOHsKA7qRcFaqREzbnppBsmo1EcJ5ya4zmvuQXSApR+2svSWP95OwDbjdHhj3tD
	 26S3dYAXNkw3i3P0+X6festAERaAmDJ1CBEDuop4czT9JR559meWHij2vGgPA35jBH
	 KG1S+NAMLsYbTOrbsybnT0KK7ilCDSHlqCMFQkxVvl/T+1UYnOx0IW+GEG4Jb6TU7t
	 GNRon9RiE6BmQZOgJdK+bz5bydWReHzyb1cS7NRs4iT553RjNIS4B6HgcEWMjFY73/
	 nbOHG+G+GTqnQ==
Date: Fri, 01 Dec 2023 17:37:06 +0000
To: David Laight <David.Laight@ACULAB.COM>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Theodore Ts'o <tytso@mit.edu>, Alice Ryhl <aliceryhl@google.com>, "a.hindborg@samsung.com" <a.hindborg@samsung.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "arve@android.com" <arve@android.com>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "brauner@kernel.org" <brauner@kernel.org>, "cmllamas@google.com" <cmllamas@google.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "dxu@dxuuu.xyz" <dxu@dxuuu.xyz>, "gary@garyguo.net" <gary@garyguo.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "joel@joelfernandes.org" <joel@joelfernandes.org>, "keescook@chromium.org" <keescook@chromium.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "maco@android.com" <maco@android.com>, "ojeda@kernel.org" <ojeda@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "tkjos@android.com" <tkjos@android.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>, "willy@infradead.org" <willy@infradead.org>
Subject: RE: [PATCH 1/7] rust: file: add Rust abstraction for `struct file`
Message-ID: <ajiq9UHMeP48LeNuGAPzLS38mW-fCL0OlXZKOCzg1D9H1JSQo2NroOEEjzLuuClpn7b3Do-IuDO8DqAT3z9s8ozEHAdqyGhHXUl0fvUKDDg=@proton.me>
In-Reply-To: <70efae6ae16647ddbb2b2c887e90e7c8@AcuMS.aculab.com>
References: <386bbdee165d47338bc451a04e788dd6@AcuMS.aculab.com> <20231201122740.2214259-1-aliceryhl@google.com> <20231201150442.GC509422@mit.edu> <zWaYgly6VpMZcvVUAILQWBSs9VnO7nFiAiCo4eTzT4SJEfqXY8G8w7f6az7kz9wEB4pA8EbajkQZRX4CuifI00Ce3EA_4muXjz_kfdAuzOU=@proton.me> <70efae6ae16647ddbb2b2c887e90e7c8@AcuMS.aculab.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/1/23 18:25, David Laight wrote:
> From: Benno Lossin
>> Sent: 01 December 2023 15:14
>>
>> On 12/1/23 16:04, Theodore Ts'o wrote:
>>> On Fri, Dec 01, 2023 at 12:27:40PM +0000, Alice Ryhl wrote:
>>>>
>>>> You can import it with a use statement. For example:
>>>>
>>>> use kernel::file::flags::O_RDONLY;
>>>> // use as O_RDONLY
>>>
>>> That's good to hear,
>=20
> Except that the examples here seem to imply you can't import
> all of the values without listing them all.

Alice has given an example above, but you might not have noticed:

    use kernel::file::flags::*;
   =20
    // usage:

    O_RDONLY
    O_APPEND

> From what I've seen of the rust patches the language seems
> to have a lower SNR than ADA or VHDL.
> Too much syntatic 'goop' makes it difficult to see what code
> is actually doing.

This is done for better readability, e.g. when you do not have
rust-analyzer to help you jump to the right definition. But there are
certainly instances where we use the `::*` imports (just look at the
first patch).

> ....
>> Alternatively if we end up with multiple flags modules you can do this
>> (the sixth option from Alice):
>>
>>     use kernel::file::flags as file_flags;
>>     use kernel::foo::flags as foo_flags;
>>
>>     // usage:
>>
>>     file_flags::O_RDONLY
>>
>>     foo_flags::O_RDONLY
>=20
> That looks useful for the 'obfuscated rust' competition.
> Consider:
> =09use kernel::file::flags as foo_flags;
> =09use kernel::foo::flags as file_flags;

This is no worse than C preprocessor macros doing funky stuff.
We will just have to catch this in review.

--=20
Cheers,
Benno

