Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3D1E7C08
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738099448; cv=none; b=I5WTtbn9fo3fl5JwYVxPeC8LMYKGwSBVTSSOnP9j+p8LHgaoRmKISdAmGQKK6pBKnwyYWFw4mEDG/fwxn7Ud3Rw96a592dSvNs9v2tG2Ob8tMula1x6CjuQCYb85A+EXWX8i2xZxWxbqp8fVQ8mEU6rQKG0NmN2ji4nlA7o2jCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738099448; c=relaxed/simple;
	bh=4Jg0fLGTYdi5kIyNZusVGmRwQGphTGb6HXEYjPonQeU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nogo9XnoGmXjOj9xqfBR7mTXM9a+wOIyOFMzJBQDX+R+lzWeML31QllcItWIqReGiFifML80L8Ipsm6yY4k9zPFmUm3ZWphIhmxKuTjPs4UlaV/uCR7nMayt82CmxfZPHYM+egcajSZJ2JRNLZfJ9vybORQjGGxxKo/Uca66egU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=i1JvxHLK; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="i1JvxHLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738099437; x=1738358637;
	bh=eWYu3RiLT9KsH2RqzF+/EozZ1EtBWlmd+w4YlOjzAAY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=i1JvxHLKwmPIWAn87ubgMR8SEyQDWhJJ1oNPOKV6PGvRXsnEf9STrtdFMca3jyGdA
	 NUiA0JXEQrlAlWEiVsTnqUCIJSapw9s3KAOkustSWoYxl+0od6wfPUzup8s5ZbCQCm
	 5JrYH/fy7mgPPrYrmIdS9/yYEeD0bHFPQ0QcdoxExa9StHDZxxJ8zKojEdRGC7fAs1
	 MDjKKSvGH8zuBpv5Ag2aa4/IAWvygEV/m+ippR4QW6/A4lfCADiEI1mt3wwBI2d9YE
	 fBtruTr6ugxw3RbirTF5RtXIxxNetdSwS7ygnnn9nEsr1sBLG5AmxFunlYFu9WWwDK
	 IlciSaUWAR8SQ==
Date: Tue, 28 Jan 2025 21:23:51 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Timothy Garwood <gtimothy-dev@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] rust: HrTimerMode replacement with bitfield_options macro
Message-ID: <Gv30E9TnyGo2GTh5Z9xnxBXcr3jYGFBmgG2JwkEsCq0X4kHuaPrH_T6cq3iTSzf70fubE7CbJl_OghSPUurylDVQYVzPnoEntilzNv_CSHI=@protonmail.com>
In-Reply-To: <CANiq72n96fJScyVr5eWrfTu8WE9dWXNoyTaLr-CuFj30E57RdQ@mail.gmail.com>
References: <20250128-bitfield-option-hrtimer-v1-1-31033d8e727f@protonmail.com> <CANiq72n96fJScyVr5eWrfTu8WE9dWXNoyTaLr-CuFj30E57RdQ@mail.gmail.com>
Feedback-ID: 126901959:user:proton
X-Pm-Message-ID: 7bf8fd27a1bba55f400c327ceae5dda556e21017
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> One quick question: what happens with the generated docs of the enum
> and each variant etc.? (since that is part of the savings in lines
> here)

Here it is all lost.
This is something that could be much improved: for now, the macro just=20
generates a default documentation that equates to this:

+ // A wrapper around a bindings::hrtimer_mode bitfield that sets bitflags =
using its relative, pinned, and hard methods.
+ pub struct HrTimerMode(/* private fields */);
+
+ // if true, unsets the bindings::hrtimer_mode_HRTIMER_MODE_ABS bit(s) and=
 sets the bindings::hrtimer_mode_HRTIMER_MODE_REL bit(s).
+ // Otherwise, does the opposite.
+ pub fn relative(self, relative: bool) -> Self
+
+ // if true, unsets the 0 bit(s) and sets the bindings::hrtimer_mode_HRTIM=
ER_MODE_PINNED bit(s).
+ // Otherwise, does the opposite.
+ pub fn pinned(self, pinned: bool) -> Self
+
+ // if true, unsets the bindings::hrtimer_mode_HRTIMER_MODE_SOFT bit(s) an=
d sets the bindings::hrtimer_mode_HRTIMER_MODE_HARD bit(s).
+ // Otherwise, does the opposite.
+ pub fn hard(self, hard: bool) -> Self

I would like to find a way to have better documentation.=20
Doing something like the=20
+ <#optional_attributes>
+ <visibility> <wrapper_name>(<field_type>);
mentioned in [1] could open the door to passing the documentation for the t=
ype.
The method's documentation would need a different solution.

> Nits/tips: when you send the next version, consider sending both as a
> series, i.e. this patch being #2 in the series, and #1 the one the
> "real patch" that introduces the macro. That way they stay linked and
> people browsing their emails and/or Lore will see it together :)

Even if this patch depends on something ([2]) the "real patch" does not dep=
end on?

> Also, the notes on the commit that are not part of the commit should
> go after the SoB and the `---` line, before the diffstat.

I am using b4, I think I just signed the wrong commit? I'll make sure to si=
gn the
code commit instead of the cover-letter commit

> There is also some strange text wrapping going on in the message, e.g.
> on the `Link:` lines.

I forgot one [1] reference for the first link. I'll fix it.

Thank you Miguel,
Timothy 
