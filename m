Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEC9390983;
	Mon,  2 Mar 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772488327; cv=none; b=YV/X45WrzMeSoSVgN7s8MvcTQoKjmUN14C/25BWDcKmQ+TZjgAcIituit3Xl+Op8oS5wjaZglt0ekmN7KQhqLH+5DJ9SmgKrvhbOCYY/Hb2dYyrays3ERIW8uPcXH24Egbg9SmUWM0Gk7IiE/rhDmyeK5vp5Y7BoZ4kM7xufg6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772488327; c=relaxed/simple;
	bh=w0k8ukwK/mauZoTDTyEcg+++htCALnmHppSLKf4agaY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LKTgEIO/NLd97NT0pKPwamrJFBDIyL9CxqT90wTdNDUKA3/LDiDbZjzk77YH4OGqHPvOMkM993sZ6z3RyptaC2Qe6SpVT1I6+kt/1/u4IXncy+btugNhVsXqen/xAe/00pFHGDt1H0cxk9B2fo0ilzPESjYkdNvbvOyOtVH8Z5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktnovp9R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktnovp9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A6FC2BC87;
	Mon,  2 Mar 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772488326;
	bh=w0k8ukwK/mauZoTDTyEcg+++htCALnmHppSLKf4agaY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ktnovp9RXA/Y+b9Lp4nlBs3btI1mVdV8TmI4FbK+73WrHfu7/0wqYIDqhA752kmnx
	 GIZltHGMY2acUVBKMK8KtBmfHsCdDnhZxh6sl+UtseJCLjkk9O7sHV+lUWveKICCK9
	 Ztbb9mSTLlOAB0eGRU/vyuQrWpxmZCSfMTwqbaZoivY2LPG4Paw+PE7o279MnvuUrp
	 mSLqu6ubQw66cTblE1Xye0ivg3eFJdagZGNgtiJpTV1WBhVIs35j6ETQjuZm5C9Waf
	 K/toQbb9l5zzr+1I05wN8z2E55Q6YCXxeDiUQvpywIKDLocO9sG/U8sCogxj8WKEa5
	 V27z9o0Us4lvA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 22:52:03 +0100
Message-Id: <DGSMO6I4H9RW.2J31NCV5UTKYQ@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] rust: ptr: add `KnownSize` trait to support DST
 size info extraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302164239.284084-1-gary@kernel.org>
 <20260302164239.284084-2-gary@kernel.org>
 <DGSIYA7A879T.2XI2BBJGPRC34@kernel.org>
 <DGSJX6W0J0KI.3PSYU2YJN0AHL@garyguo.net>
In-Reply-To: <DGSJX6W0J0KI.3PSYU2YJN0AHL@garyguo.net>

On Mon Mar 2, 2026 at 8:42 PM CET, Gary Guo wrote:
> On Mon Mar 2, 2026 at 6:57 PM GMT, Benno Lossin wrote:
>> On Mon Mar 2, 2026 at 5:42 PM CET, Gary Guo wrote:
>>> From: Gary Guo <gary@garyguo.net>
>>>
>>> Add a `KnownSize` trait which is used obtain a size from a raw pointer'=
s
>>> metadata. This makes it possible to obtain size information on a raw sl=
ice
>>> pointer. This is similar to Rust `core::mem::size_of_val_raw` which is =
not
>>> yet stable.
>>>
>>> Signed-off-by: Gary Guo <gary@garyguo.net>
>>> ---
>>>  rust/kernel/lib.rs |  1 +
>>>  rust/kernel/ptr.rs | 27 ++++++++++++++++++++++++++-
>>>  2 files changed, 27 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index 3da92f18f4ee..510cc7fe4961 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -20,6 +20,7 @@
>>>  #![feature(generic_nonzero)]
>>>  #![feature(inline_const)]
>>>  #![feature(pointer_is_aligned)]
>>> +#![feature(slice_ptr_len)]
>>
>> Oh and this is also missing a stability comment.
>
> I don't see anything missing here? This is in the same group as other fea=
tures
> that are stable in 1.79.

I didn't look at the file & only at the hunk.

Cheers,
Benno
