Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F229F4218AB;
	Wed,  4 Feb 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218428; cv=none; b=XwqgmkYrEigi8BiSwTvSv6dzRtEWpU2u7t+EN7Dnw7+aqbG5+N/s/qSsmZ7CMuTCzLrj1fH2JuCZxoT83BmLD+Vs+fqFpNBoo3qG7/Fr/Sw3ihL0OFAH9L6hmADOlKCA8pFwRhaDgeKpKmevrF6zbwitPK1tUu2V1WwmTScdKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218428; c=relaxed/simple;
	bh=LV83XAoHqKAShfT+AE1ovPhvCrwFlhSL6wBvyLgD+xY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=j2GE6jlBpIhJJTqasBRNvRcIFgjX+C9uKdne7qjMMSq13Ry3GgQRdTHZzzXtOlSdyfMhvmztdp7utafCOTcemdLm4U7kmHT7NeoyFY/FW00yXkmu8y+1ilxl+1hOk8PLzOz1RaPE96ufEtJ5qyPf8I2ahVgAo3ikwLdEAkRl1bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubXJVA9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubXJVA9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D537DC19423;
	Wed,  4 Feb 2026 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218427;
	bh=LV83XAoHqKAShfT+AE1ovPhvCrwFlhSL6wBvyLgD+xY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ubXJVA9IWQFsVT10MV2cX8xswhetEh26NAfls/hCUAlfrGGDCWcWxFPBf7Zi5FVzg
	 ZVvKGaDsLhtq4c0XyIq9GvAgi8sZDwd56jJXpJliLSsDtyM3l3d8PghQupdMMVALTD
	 8Z44+C7aR1EXkXVA28gk2mQVJomrAxQfxnLTTioF3nuWtawWMU3TwM5WaxQkV2/BtN
	 E3FbJj++4DNnvWR3TyGdZZ8lg1un5DVgh+693lqv/tDluv/nYwwYPr/ZEbhW/ZFpiv
	 Ng6eYhXiyLX3/BdlY/jMPTb+n99xaEWOjC0DtKeV8QVBBEnvpLvLec6vZetewHt2fT
	 KJrj0xGWmUGkA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 16:20:20 +0100
Message-Id: <DG6A23IKOR3S.E8UNRLDT8GRD@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
Cc: <rust-for-linux@vger.kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Ard Biesheuvel" <ardb@kernel.org>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, "Eric Biggers"
 <ebiggers@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Lyude Paul" <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
In-Reply-To: <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>

On Wed Feb 4, 2026 at 4:18 PM CET, Danilo Krummrich wrote:
> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>> Another option would be to call u32::swap_bytes() on the data being
>> read/written, but these helpers make the Rust code as ergonomic as the C
>> code.
>>
>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>
> The I/O stuff recently changed quite significantly, please have a look at=
 the
> driver-core-next branch [1] in the driver-core tree.
>
> Also, instead of providing additional *be() methods, we should just creat=
e a new
> type io::Endianness and use it to indicate the device endianness when req=
uesting
> the I/O resource.
>
> For instance, for your driver we could have
>
> 	request.iomap_exclusive_sized::<8>(Endianness::Big)?
>
> and then let the I/O backend choose the correct accessors based on this.
>
> I.e. the device is either big or little endian, hence we don't need to pr=
ovide
> both accessors at the same time.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-co=
re.git/log/?h=3Ddriver-core-next

Forgot to mention, please also consider this patch series [2] for your work=
.

[2] https://lore.kernel.org/all/20260202-io-v1-0-9bb2177d23be@nvidia.com/
