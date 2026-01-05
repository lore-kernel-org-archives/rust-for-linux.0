Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ACC33508A;
	Mon,  5 Jan 2026 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624176; cv=none; b=HmLqAGmP7dVhytuZyceIcc0JcgX6PLnc7s5aVGtyxLhSW70yFAY/6IyvfGAoK6MhQsmfF4kCwnzlAgWYB9V3D5kVhDPyo3GaUMIBzdup4HQ7f9YknLsdoShu3UH9TLHZNtlhZpYDMvD+676gUVnOuWsi/xoMlCzluwlx7Fj7qz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624176; c=relaxed/simple;
	bh=6+8f2BT3Z4bZnc2ROvMYTb+LPX7mFTDLfErvycYF72o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=L5O8UK7ZUHGh+EHPj5CvScBvywayrwLMeefBX/DfQ8YCjzIyVd6VLls2AE3/JA0Mw2LdJc1srHi6ynIPczDgSmK9WyeS5aJiJysXBxX4DL7PdTDWAo2YnJfjUbtmB90CplQm/oxEaEldLw31s8kTB+SEn4yk4O20kJ+B9ke1wHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqZuT1CF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqZuT1CF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D77C116D0;
	Mon,  5 Jan 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767624175;
	bh=6+8f2BT3Z4bZnc2ROvMYTb+LPX7mFTDLfErvycYF72o=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=tqZuT1CFfHbPqkdofgWoAvVTM9Y9mwz2Manjn2sjc5klHUPgD5zKtW9tepNdXObTE
	 lj5zcF5jCiAY/gFx+xhfP4EfRXuo8tYtKXcYtKr0aOx+zh9LPGRtyeJ5mdC0JEpWz+
	 OnO4sXQINU+07aXMSjgNxUGDU/yfqxNLMlWwPLcSUPhqGp5QTOa70m6yfyU1FgB5V3
	 KXminCeHSMOsPzTS8IHAqbTDk4lZ2fnffQXsWLhCpmfmedeywpDSIiJRbIM92aBPf9
	 7EMb+2QjfFZ7HpifIJIOAR+aDgiZpQsB3yWCxvnpRGmcFZI4YPm9OjhxKK07LKMglq
	 CWICg+IlM1R4g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 15:42:50 +0100
Message-Id: <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Maurice Hieronymus" <mhi@mailbox.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
In-Reply-To: <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>

On Mon Jan 5, 2026 at 11:29 AM CET, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
>> On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
>>> Add a derive macro that implements kernel::fmt::Display for enums.
>>> The macro outputs the exact variant name as written, preserving case.
>>>
>>> This supports all enum variant types: unit, tuple, and struct variants.
>>> For variants with data, only the variant name is displayed.
>>
>> I don't think we should be adding this. Display is designed for
>> user-facing output and so it should always be carefully designed and no
>> automation should exist for it.
>
> In general I agree, but simple stringification of an enum variant for a D=
isplay
> implementation is a very common use-case and it seems pretty unfortunate =
to have
> to fall back to either do the below (especially if there are a lot of enu=
m
> variants) or having to go the declarative path of doing something as in [=
1].
>
> Especially in combination with things like FromPrimitive and ToPrimitive =
it gets
> us rid of the cases where we need such declarative macro mess.
>
> Eventually, drivers will most likely implement their own proc macro for t=
his or
> repeat the declarative macro pattern over and over again.

When the definition already uses declarative macros, adding the Display
impl there is the correct way to do it IMO. If it is just a normal
definition, then a match is annoying when you have many variants.

> Maybe we should just pick a more specific name for such a derive macro th=
an
> macros::Display.
>
> Maybe something along the lines of macros::EnumVariantDisplay? We could a=
lso
> have an optional argument indicating whether it should be converted to lo=
wer /
> upper case.

I'm still skeptical about having a derive macro for `Display`. What
about adding & deriving the following trait instead:

    pub trait EnumVariantName {
        fn variant_name(&self) -> &'static str;
    }

To print this, you of course need to call the function, but it is much
more self-descriptive than printing the `Chipset` directly.

Cheers,
Benno
