Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36882773EC;
	Tue, 30 Dec 2025 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085796; cv=none; b=qzd2zDvppaelOps8oq46U5zI7DJynlazTFLSj7P6Dau2Dczljwzvzqe+TxiRRNPdKl8pnstxHCvpXGh1ytcVpVo8nzmZyHX3DvE2GYfoFtWTQMpb/kCGqMr3mKbfJYQYp2k81BqnFB5PnuA5SIkIu/v/EPoPD0fPtrGRJo0qZIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085796; c=relaxed/simple;
	bh=7KdJALN0K+r9nZo/WfD49aKuvWF+zMNEeTAc2yOuSFc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=J2tDPXuaZUCCG/eNb441QO2g1U+HmTdrIj7ESADMx7ymDl6+FD44p23oYfhwlICeopD/fYiIoOByBv2FA60x8XIDQwmoqF9Fdx1vsZa41KW9Btua/ti4htcWJ63StuOgRqXQhVsAHNIfMh8/vdQm42qbD0EYEux4Go2xkculEDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1qiO14G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1qiO14G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A59C4CEFB;
	Tue, 30 Dec 2025 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767085796;
	bh=7KdJALN0K+r9nZo/WfD49aKuvWF+zMNEeTAc2yOuSFc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=N1qiO14Gvf5WrZiBFb39OFVVnCvtMz/+32LHFDuhzVXPUG6COb2/MPRt2/bEVfIWD
	 StPrjqG5qUQWUAQgU9C81zjcdCxv7XVnEv3TX9Mgj/PR0zc8MiAtazm8eJjPoyB387
	 vlWGVelYlHyICRkLJgrj9ivtkaovNbOPkOCfUAkE1UIOKCsKC3JArAmyQtQt2gj21Q
	 q3E7axxwRM+hGGIMKnhr7AKCp2tuuDXqjMlgEpEi2bpKUkeajFz0bSnnWH05F6R3Yo
	 u+qQ5Vlmon4x6Df3I6Nxs6QdY1LCUxNp59GN+xrqythc+blU6Y5HlwKuf0Y+qLWuac
	 NazMhPjbeUefg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Dec 2025 10:09:51 +0100
Message-Id: <DFBFMTS0ZRDB.30O3L4GMYW4XJ@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
From: "Benno Lossin" <lossin@kernel.org>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
 <CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com>
In-Reply-To: <CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com>

On Mon Dec 29, 2025 at 1:29 PM CET, Jesung Yang wrote:
> On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
>> > On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
>> >> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
>> >> > +    // Note on field-less `repr(C)` enums (quote from [1]):
>> >> > +    //
>> >> > +    //   In C, enums with discriminants that do not all fit into a=
n `int` or all fit into an
>> >> > +    //   `unsigned int` are a portability hazard: such enums are o=
nly permitted since C23, and not
>> >> > +    //   supported e.g. by MSVC.
>> >> > +    //
>> >> > +    //   Furthermore, Rust interprets the discriminant values of `=
repr(C)` enums as expressions of
>> >> > +    //   type `isize`. This makes it impossible to implement the C=
23 behavior of enums where the
>> >> > +    //   enum discriminants have no predefined type and instead th=
e enum uses a type large enough
>> >> > +    //   to hold all discriminants.
>> >> > +    //
>> >> > +    //   Therefore, `repr(C)` enums in Rust require that either al=
l discriminants to fit into a C
>> >> > +    //   `int` or they all fit into an `unsigned int`.
>> >> > +    //
>> >> > +    // As such, `isize` is a reasonable representation for `repr(C=
)` enums, as it covers the range
>> >> > +    //  of both `int` and `unsigned int`.
>> >> > +    //
>> >> > +    // For more information, see:
>> >> > +    // - https://github.com/rust-lang/rust/issues/124403
>> >> > +    // - https://github.com/rust-lang/rust/pull/147017
>> >> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f70=
55a59b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 =
[1]
>> >> > +
>> >> > +    // Extract the representation passed by `#[repr(...)]` if pres=
ent. If nothing is
>> >> > +    // specified, the default is `Rust` representation, which uses=
 `isize` for its
>> >> > +    // discriminant type.
>> >> > +    // See: https://doc.rust-lang.org/reference/items/enumerations=
.html#r-items.enum.discriminant.repr-rust
>> >>
>> >> I think we should error when no `#[repr({integer})]` attribute is
>> >> specified.
>> >
>> > Not a blocker but just out of curiosity: are you concerned that the
>> > default size might change in the future, leading to silent side
>> > effects?
>>
>> `isize` already changes size when you switch between 64 and 32 bit
>> architectures. I think the author of an enum they want to convert into
>> integers should think about which size the enum should be.
>>
>> They already can choose `repr(isize)` if that is correct in that case.
>> As a default, I would have choosen `i32` (but that conflicts with Rust's
>> default, so we can't do it).
>
> On second thought, I've realized that enforcing an error when
> `#[repr({integer})]` is missing would prevent users from deriving
> traits for `#[repr(C)]` enums. This is because rustc currently rejects
> the combined `#[repr(C, {integer})]` syntax. For example, a user might

It's only rejected for field-less enums, but those are what we're
interested here.

> want to do this:
>
>     #[derive(Into)]
>     #[into(u8)]
>     #[repr(C)]
>     enum Foo {
>         A,
>         B,
>     }
>
> In this case, the code wouldn't compile if we strictly require
> `#[repr({integer})]`, even if the user carefully picked `u8`, keeping
> the enum's size (more precisely, the discriminant range) in mind.
>
> Since we already perform a compile-time check to ensure all
> discriminants fit within the types specified in the helper attributes,
> I believe `#[repr({integer})]` isn't strictly required. Even with
> `isize` changing size across architectures, our compile-time check
> remains effective and will catch any overflows.

Hmm that's true.

> To sum up, I see three options:
>
>     1. Drop support for `#[repr(C)]` enums entirely.
>     2. Special-case `#[repr(C)]` enums: allow them to default to
>        `isize`, otherwise require `#[repr({integer})]`.
>     3. Permit missing `#[repr({integer})]` generally.
>
> I am personally leaning toward Option 3, since our existing
> compile-time check provides a sufficient safety margin to allow this
> flexibility.
>
> Thoughts on these?

Looking at the nomicon documentation [1] again, I found the following:

    repr(C) is equivalent to one of repr(u*) (see the next section) for
    fieldless enums. The chosen size and sign is the default enum size
    and sign for the target platform's C application binary interface
    (ABI). Note that enum representation in C is implementation defined,
    so this is really a "best guess". In particular, this may be
    incorrect when the C code of interest is compiled with certain
    flags.

Which to me reads as "don't use `repr(C)`, if you want to know which
repr the enum gets". Especially the last part is concerning to me, as
the kernel uses lots of (bespoke) compiler flags. So I'm thinking we
should just drop `repr(C)` enum support. Any thoughts from others?

[1]: https://doc.rust-lang.org/nomicon/other-reprs.html

Cheers,
Benno
