Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208C22339;
	Fri, 20 Feb 2026 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771606123; cv=none; b=Y/otp8hk9M2azpNk4BmHc+FyAe+Y8ZsCmCkySz1X/vg3agA/uYXyS5pxZn23StLbI1lRISx+QH9DK6G7nq6AT+Zxqw7+1wvRp7sh9AJe1SsaRQZfJJ1IjaYcBW5BdrLZxJlmCt+ou8zRPa/GIUYqjNHcRdietIAsjQPPXCS7x30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771606123; c=relaxed/simple;
	bh=+vXeohK+QXDo0ed+wtOjiTKww0It+m/EbKZccebf/cU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EzmSlYIK4od1oFtN91wN3tWCG9pim81+Q2jhL1AQIP+hz5+vkFA6+OPhwpH0/Jm7/gOANY31JKdULIKtNsDUNlv2BZsnYvppGO7dGQJxvRH57jvq2UduGDYHMwwUwKBy4PYIwEn3oogmSIabStfIioU/aiXeThjB61dVu+7mTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/PdMzut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/PdMzut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F51C116C6;
	Fri, 20 Feb 2026 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771606122;
	bh=+vXeohK+QXDo0ed+wtOjiTKww0It+m/EbKZccebf/cU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=f/PdMzutKk8ct2B+TiMlXuQzV4bItd1UscDXW9PaRASzQ7p2/1SeLFm8G0V4WXGfi
	 W7q7Yl1uG5ILHbgFWXRf4uAP5IrVCn0LfW8lvXJB1GjVXA1EMFQmMqGlbyW11A8NsY
	 uv0CP3iCCwzYBkzNxZPphguCc2JipSYaiNL90q9TcrrV9Z5qNx+BQ9ChAANXbMnMJU
	 BFZRWgo1GtmlEeYDM6JZ5lDr6VCzSxniOu9jF4NORg4dVYNZ1Sf03u/y9cvr+vOc3c
	 jOxxLqoAg8Ou0l9rbyvb2Uu4U3DnrfE9NBkFxgNRtf3o8xqSNgHv+8qup7lbJfZUMn
	 1TnTACBdf1BXg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 17:48:37 +0100
Message-Id: <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Dave Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
In-Reply-To: <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>

On Fri Feb 20, 2026 at 2:09 AM CET, Gary Guo wrote:
> On 2026-02-19 16:24, Danilo Krummrich wrote:
>> I feel like it makes a bit more sense to have an entry for the entire cl=
ass of
>> "RUST [FFI]" infrastructure.
>
> I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` =
crate
> defining FFI types, we have `CStr`/`CString` which in Rust std is inside =
`std::ffi`,
> etc.

The idea is not that everything that somehow has an FFI interface falls und=
er
this category, as this would indeed be the majority.

The idea is rather everything that is specifically designed as a helper to
implement FFI interactions. (Given that maybe just "RUST [FFI HELPER]"?)

For instance, this would also apply to Opaque and ForeignOwnable. But also =
CStr
and CString, as you say.

But there's also lots of stuff that does not fall under this category, such=
 as
pin-init, alloc, syn, num, bits (genmask), fmt, slice, revocable, list, ptr=
, assert,
print, arc, etc.

There are also things that are more on the "partially" side of things, such=
 as
transmute, error or aref.

> I feel that the FFI infra is the core responsibility of the top-level Rus=
t entry,
> while specific stuff can be splitted out.

I think the core responsibilities are compiler and general design topics, s=
uch
as abstraction design, (safety) documentation, etc., as well as core langua=
ge
infrastructure, such as pin-init, syn, alloc, arc, etc.

Given the definition "helper to implement FFI interactions" I feel like we =
have
much more infrastructure that is not for this specific purpose.
