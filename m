Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41261A9F97
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818246; cv=none; b=hbTZZ+z4IwcmfmTyQFw4cHfmx7u4QfDQRVrPRHA0LtFw4lWI+SvOMgEDPvp45C4jqvjZqK81p7WBlWJgdBe+93e91eCenx9cZtHHF+W2M41OqDprYrHpW8nLu7bHvR7F2JkgLaYQ6eakK73Z1w+c6OcaubvY3ZT3rTtNaynvNhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818246; c=relaxed/simple;
	bh=0cIaYkeyUjjiU2nhtPN1N3DQIRS3hiEuBd58WC6s2A0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=piPG5kgJcwpBQH8ia4nbieWJbz1I7SP/FidhZu3al4MVhbAYT5Llf/nJ+6xuxqjS/ZFiIUuVzWcKc6RgVxxqosP594epRRyB6mHukWAqWi6RQ9yXptnk5G9B+zEXYxKBGByuBr1WIBsOhJPzh2xUVvd3duXnV8j0eNmKS4qIkvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4xC6phT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4xC6phT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F65C4CEF7;
	Sat, 31 Jan 2026 00:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769818245;
	bh=0cIaYkeyUjjiU2nhtPN1N3DQIRS3hiEuBd58WC6s2A0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=W4xC6phTp+UHC9MMZ2soFrScfG9X0Z5P8LlEWBD3vuZHAMZnT5R0htxtSonkbZ+TL
	 EK7lPrgm/K7WxdWUtowaqCktkAoar/kY8Htrj//g7WZi65pJJZYCxZIPxRCvvh/6B6
	 WB3sElNSALd97+1aLxprLAcRb5bc4T54P6WYCKQ80Bqqe0CeFs2jPiSNzJ/J1rIc7+
	 pwqmg64onemwibh5LIAnPctm1s9qP8pWxqqG3Q0X9Cz+pjYDnfnHXpkmwZW1iMFdGX
	 JqlYMW03HZmzS3JIITA+J03YAWQuDRBLbkqwShv9l83jJ58dG0IEux7R1r0FGTI9XR
	 FD/PkqOyim7sA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 01:10:41 +0100
Message-Id: <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Cc: "Timur Tabi" <ttabi@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
In-Reply-To: <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>

On Sat Jan 31, 2026 at 12:58 AM CET, Gary Guo wrote:
> On Fri Jan 30, 2026 at 11:36 PM GMT, Timur Tabi wrote:
>> I think there might be a problem with this code that I don't know how to=
 resolve.
>>
>> If CONFIG_NOVA_CORE_DEBUGFS=3Dn, then DEBUGFS_ROOT is None, and so the .=
as_ref() will also be
>> none, and the .expect will cause a panic.  We don't want that.
>>
>> If I remove the .expect(), then log_parent becomes None, but then the .s=
cope() won't compile.
>>
>> I could wrap the whole thing in #[cfg(CONFIG_NOVA_CORE_DEBUGFS)], but my=
 understanding is that
>> the call to .scope() is necessary to ensure that LogBuffers is not dropp=
ed at the end of this
>> function.
>>
>> It seems like I'm going to need to do something like this in struct Gsp:
>>
>> 	#[cfg(CONFIG_NOVA_CORE_DEBUGFS)]
>> 	#[pin]
>> 	logs: debugfs::Scope<LogBuffers>,
>>
>> 	#[cfg(not(CONFIG_NOVA_CORE_DEBUGFS))]
>> 	logs: LogBuffers,  // Just own them directly, no debugfs
>>
>> But the design of debugfs is to have it not care if debugfs is disabled.
>>
>> Any suggestions?
>
> I think the rationale behind current debugfs design is that when it is di=
sabled
> in its entirety, then all of the code are compiled out and you're leaved =
with
> ZST, so code don't have to care at all and you'll still have no codegen i=
n the
> end.
>
> However, when debugfs is enabled, but CONFIG_NOVA_CORE_DEBUGFS=3Dn, then =
using
> debugfs functionalities would *not* be compiled out (so, for the `Dir::em=
pty()`
> patch in the previous iteration, all of the debugging facility would stil=
l be
> around with CONFIG_DEBUG_FS=3Dy and CONFIG_NOVA_CORE_DEBUGFS=3Dn, which i=
s not
> desirable).
>
> The straightforward solution is thus sprinkle `#[cfg(CONFIG_NOVA_CORE_DEB=
UGFS)]`
> everywhere where debugfs is touched, which is non-ideal.
>
> One idea is to create types that look exactly like `Dir` but always ZST a=
nd
> no-op regardless whether CONFIG_DEBUG_FS is enabled... But that feel a bi=
t..
> weird. Matthew, what do you think?

There is no need for CONFIG_NOVA_CORE_DEBUGFS in the first place. The only
Kconfig we need is for retaining the GSP log buffers after driver unbind.
