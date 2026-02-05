Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E96219A71;
	Thu,  5 Feb 2026 22:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331436; cv=none; b=pKOgKkh7XW5+Q37Gi9CtxHpjWBSCcu1FEVlPH/yG0anr1OJvguGv8KteiHiRj/0B53JTElRLyYDlFz5Wj9F9LRW36CQOkT1WGTOm+ds3SqEzWjBbC8Riaup6lw1kLKFmbyjL48jv5eN+6IJ2p9GioYzTX+cXb6rUXskmxMOxC5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331436; c=relaxed/simple;
	bh=BLZubPyxzY4kDURUlK2y8s17DmJ2s1rb3y59eXB/ze4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KZVvP1cVF9YHy5lzEvUQrXSgHUaB/JZNF+CcGt/sJEBmWQapdcSy19z4uWPIIS58/PUYD2v34WCC6Rqf8GHJLsZjR9vOvKV/EGizO0iYYaY2DgGpAH59K2b+Sv70FvEjHGl3avkAC2BAgNM191ynLh21qwg+Pi3eWNLAmGlbZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cq4mDnAK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cq4mDnAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6563C4CEF7;
	Thu,  5 Feb 2026 22:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331435;
	bh=BLZubPyxzY4kDURUlK2y8s17DmJ2s1rb3y59eXB/ze4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Cq4mDnAKeu/gwoqwVhYxePHfG2GvzTbpMKt1srXw0uyYG+eviwnylSx+QdNqEmBx9
	 w7uKFgzxiB5d1vu9II/w6yi7+zx8DEnspzM7i0ySSYVdd2kM/y2IvRRV5FXvse43dH
	 HYDmUCYABz/Sbp2XEChzpMPNgEbDIbSxzp0yA4Q35iw7Zgnlq4M8szaInXVo85iqm0
	 J9SwfE3kadxaI4LHpssXYSAX2B4ACy9k82g2Z/tJVAPAZGkBIk0fjl19vm2uznHRzY
	 //uA36cI7MfNbkxBWu7pefjP5eTgymaNIC/KkpItKan1V26wo66Lh2WxHL5CLZeO1M
	 6+BF3NMP+qfqQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 23:43:48 +0100
Message-Id: <DG7E46M9VINC.3KTNQ1T7USPVO@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Link Mauve"
 <linkmauve@linkmauve.fr>, <rust-for-linux@vger.kernel.org>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Eric Biggers" <ebiggers@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Lyude Paul"
 <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
 <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>
In-Reply-To: <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>

On Thu Feb 5, 2026 at 11:31 PM CET, Gary Guo wrote:
> On Thu Feb 5, 2026 at 7:05 PM GMT, Danilo Krummrich wrote:
>>   (1) Devices are either little-endian or big-endian. Hence, having to w=
rite
>>
>> 	io.big_endian().write()
>>
>>       is excessive, we always want big-endian for a big-endian device.
>
> You don't need to always write this. You just need to do `big_endian()` o=
nce
> when you obtain the io, and then keep using `BigEndian<Mmio>` instead of =
just
> `Mmio`, and the rest of code is still `.write()`.

<snip>

>>   (2) It is error prone, if you forget to call big_endian() first, it is=
 a bug.
>
> Moot point when `big_endian()` is only done once.

Well, you need to do it at least once per driver entry point. For DRM IOCTL=
s for
instance you also have to consider that it is always Devres<Mmio>.
