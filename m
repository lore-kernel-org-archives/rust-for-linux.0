Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A39A34CFBA;
	Thu, 19 Feb 2026 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518296; cv=none; b=OBIohSMo+0X0//oqA88sfvDtN1ZB7mgIGorzQBoVVcc6K4h4evgARLRnje1SvXiy1bJs0fQRjJNFKGPLlWh0LD3H68uOz/Tewo0Hi/rSMeQqRVh9RuwhBxrL8JmSZXl8kMThtMw9WQ8Qy5b2PQf8P99zAQiQ+tZG0mYgRVjdCC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518296; c=relaxed/simple;
	bh=OCRBu9qsD2GHhHV+NJGvV6X8iN1sZS9eqVlDPCtnB9E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lqHl7D1xh3mWb0RjfCa065M9/7JUKn2bXtuDLel7ipkgwsVu+4UcfIbrXKN4k58PDZThRV0Z+lsRpuKVEEogP4Gtp7kLvy+8+yODCTYzB4RsOZIW71pMyjOSjpEmwJPd48bfTNqkRNVCgXkjq6XcqtHrngY+lMwPbriye/+LTmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIboqRIW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIboqRIW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CD2C4CEF7;
	Thu, 19 Feb 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771518296;
	bh=OCRBu9qsD2GHhHV+NJGvV6X8iN1sZS9eqVlDPCtnB9E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lIboqRIWWI0Nl11/uAb1VygPApq8lQgg+bC6qBlJREYwyEDXFh+Dofxp3rOm5PPWC
	 dLp215UoDS1K1KqVDFaU6waG4ydZq2m1U7C3dGvt1uQ8i6w2xDBLqgkG3mrxcMgHse
	 tlDJsS1OHKsdaa0Etb6zN7zn2l9MBt4WUK89r0gxOryHFoRNRHpssPK4uLayAAZZzQ
	 JdLWT3UZXTBrmlJET+6UvN8q6ZcBfYRVtI3ZYR3nCQCCM2tYtkag39OXGCG9l1D7Eg
	 YUwwql64EkbFNnVDCrsWk8iMbekXQtMs24PBIhpmiIbo2aG+q34Uw9lBE+0NgAZaMY
	 +5djkniION80w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 17:24:50 +0100
Message-Id: <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Dave Airlie"
 <airlied@redhat.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Koen Koning" <koen.koning@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nikola Djukic" <ndjukic@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
In-Reply-To: <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>

On Thu Feb 19, 2026 at 4:44 PM CET, Joel Fernandes wrote:
>
>
> On 2/19/2026 10:27 AM, Joel Fernandes wrote:
>> On Thu, Feb 19, 2026 at 12:21:56PM +0100, Danilo Krummrich wrote:
>>> On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
>>>> +RUST TO C LIST INTERFACES
>>> Maybe this should just be "RUST [FFI]" instead (in case Alex and you wa=
nt to
>>> sign up for looking after FFI helper infrastructure in general)?
>>
>> Good idea, done.
>
> Actually, I am not sure we want to commit to entire RUST FFI infra though=
 its
> pretty tiny right now. Most of this infra right now is clist, let us star=
t with
> keeping it as is "RUST TO C LIST INTERFACES" ? Or we could make it "C LIS=
T
> INTERFACES [RUST]" sections.

I feel like it makes a bit more sense to have an entry for the entire class=
 of
"RUST [FFI]" infrastructure.

I could imagine that we will find quite some more cases where an FFI abstra=
ction
layer makes sense; at some point it might even go the other way around.

Once that happens, I think it would be good to have people looking after
intermediate FFI layers in general. But it does not have to be you of cours=
e.

Maybe we can create the "RUST [FFI]" entry already with the following
constraint:

	RUST [FFI]
	M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
	M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
	L:	rust-for-linux@vger.kernel.org
	S:	Maintained
	F:	rust/kernel/ffi/
