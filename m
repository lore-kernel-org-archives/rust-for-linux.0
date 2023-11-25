Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Q0aGNxFz"
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7597F2
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Nov 2023 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=bk4765lcuzg2bdnuqztpj764ku.protonmail; t=1700924540; x=1701183740;
	bh=gof9ChInamH5ECCSkTNXtzzGmXtuXsCMfRl1DTKJMUc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Q0aGNxFzedO96fXx4SBrwy0BzQxVjSYmwUC/QPgdyzY0U0REORTDn/ZtMrcs0ToY4
	 Icqr4dUeXLx0wbtGkAtt/1juIOzYvFV6zqaNbXNaXRz4nLy40WzbFBZy8v1ikW4TEA
	 kTVn9n9vnq6encvzpBoAJumtZ0TPLv+MYDeZYxOAL+sG7/9xe/33yyluxM3dQ9mij3
	 61FYKbmXFadOqvBff/Hl7WvEQiHe2zOBL0hh3yuiatPe3ctB4ps4BaVssF6GaiKIDb
	 ADXumuvo7WwlxJ8hQJOhtLXqh0c/nQM19fSAGRap0FcZxYxUDjkT+MQEzcKzgQ2YYI
	 /FShV5AXEfa3g==
Date: Sat, 25 Nov 2023 15:02:00 +0000
To: Greg KH <gregkh@linuxfoundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: macros: allow generic parameter default values in `#[pin_data]`
Message-ID: <t4HJjY0Oft2K2H1ssXTxZchdPTx25J6WqSJqAx75NiRUYg40BBLt1AHxm9ZF0UA70FkqIXb6Pp2sz3BErD-AyXmQCkU4xDvqyXHSinaWGb4=@proton.me>
In-Reply-To: <2023112525-impatient-untwist-ee3d@gregkh>
References: <20231125125024.1235933-1-benno.lossin@proton.me> <20231125125024.1235933-2-benno.lossin@proton.me> <2023112525-impatient-untwist-ee3d@gregkh>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25.11.23 15:26, Greg KH wrote:
> On Sat, Nov 25, 2023 at 12:51:09PM +0000, Benno Lossin wrote:
>> This patch adds compatibilty for generic parameters defaults by using
>> the newly introduced `decl_generics` instead of the `impl_generics`.
>=20
> This says _what_ is happening here, but not _why_ this is needed at all.
>=20
> Try taking a look a the kernel documentation for how to write a good
> changelog text to make this much better.  It's often times the most
> difficult portion of making a kernel patch, the code is easy, writing a
> summary of why everyone else should agree that this code is acceptable
> is hard.

The reason is hidden in the third patch. Without this, the `#[pin_data]
macro would not allow specifying const generic parameter default values
and instead emit a compile error. I will add this to v2.

--=20
Cheers,
Benno


