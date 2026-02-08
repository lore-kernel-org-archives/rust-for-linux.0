Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019DA25783C;
	Sun,  8 Feb 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770571161; cv=pass; b=sEFRJUP35O9IfhetIR7DtCwtY/A0PILmv8fy0XiVY3MTNCLyMUd4AzHLD2lKZsulhqvo5UHVPJBJSvAyqS3OK33kBjgFdWsEEPHs6b9qi8C27fxE0G/TbfhjV83P+kxjkJ91OVDjN9VVZ71ZEAZTrQnLROWkTSy8v2S953V/Gxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770571161; c=relaxed/simple;
	bh=3Q12OExE5KxhN5cBNcaLK/YXAM+qazI0MGsd+nLP3ao=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PjKZISIQh1zNchEMMBMr6+QczP75S/pkT8tY7bFrqhS2tU5AEFSrZY1hCL4HovdH3O2fNDR+AA6ixxpiz1dYMeLP/2a9LwRY3ra0+yNeXNj2kjRbxG4x5/799fzBMEZmrYQSXrfLl2UeCxTsc+KeHuZZg1/PaoAcOPZRGS6gxpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=AzepAojX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AzepAojX"
ARC-Seal: i=1; a=rsa-sha256; t=1770571078; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TjW8QXxKiPuz34T4Ff27H6By7JKuN3j/GdKLMnQezk4UHqxkfRTvmheqHPcxxMMxWd2sSOVSp/gaUKypM6juofHvfP2N52a3nvV40/0fcC7M6XjJF9PZ3W2Jk4qOzIRFvSq3AIC4soJ1mhhF5eLoJJ0ytPaRRo2lVHMGSaSDF0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770571078; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sicy4xMoxAuHL8RXwWOhV8FvUn+Eu6nJRWh8VCO7q58=; 
	b=ficZVusMXoRPFZBEOD/QeVgmgsmDJENvcChOAgxy+b2oXA+mzyJCHSLbTb2qzA+ZfNMQSbodFhaON9hdQNwQ1a6nAPzo9rO9fzznCRwa4PqAt/V6OjunUJAQNMt88M0mMos+/ndiSSGo7JKZXTrWlOFLAFkcsPWUBWez4HyfdIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770571078;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=sicy4xMoxAuHL8RXwWOhV8FvUn+Eu6nJRWh8VCO7q58=;
	b=AzepAojXyowkYf1LNyu3FRouaQaoqAP+TfpP/0B2kiHSrU5MRZpAZUngB6KLGCAN
	7tqQz3p4o4DIAW4qWYOfDPQ0PDXf6voDiK6Pms7jAz6Ezsj/ufn3vwr6d+NzfyMcXNv
	8Rp6CxcYG8lu1rsH9OSeTYMzQYYqYLWEFhLrLvik=
Received: by mx.zohomail.com with SMTPS id 1770571074486302.15984943030605;
	Sun, 8 Feb 2026 09:17:54 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DG7E46M9VINC.3KTNQ1T7USPVO@kernel.org>
Date: Sun, 8 Feb 2026 14:17:36 -0300
Cc: Gary Guo <gary@garyguo.net>,
 Link Mauve <linkmauve@linkmauve.fr>,
 rust-for-linux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Ard Biesheuvel <ardb@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Eric Biggers <ebiggers@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lyude Paul <lyude@redhat.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Tamir Duberstein <tamird@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 officialTechflashYT@gmail.com,
 Ash Logan <ash@heyquark.com>,
 Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
 =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <45A7698F-6AE9-46DA-8CB2-9E09F7223229@collabora.com>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
 <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>
 <DG7E46M9VINC.3KTNQ1T7USPVO@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 5 Feb 2026, at 19:43, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Thu Feb 5, 2026 at 11:31 PM CET, Gary Guo wrote:
>> On Thu Feb 5, 2026 at 7:05 PM GMT, Danilo Krummrich wrote:
>>>  (1) Devices are either little-endian or big-endian. Hence, having =
to write
>>>=20
>>> io.big_endian().write()
>>>=20
>>>      is excessive, we always want big-endian for a big-endian =
device.
>>=20
>> You don't need to always write this. You just need to do =
`big_endian()` once
>> when you obtain the io, and then keep using `BigEndian<Mmio>` instead =
of just
>> `Mmio`, and the rest of code is still `.write()`.
>=20
> <snip>
>=20
>>>  (2) It is error prone, if you forget to call big_endian() first, it =
is a bug.
>>=20
>> Moot point when `big_endian()` is only done once.
>=20
> Well, you need to do it at least once per driver entry point. For DRM =
IOCTLs for
> instance you also have to consider that it is always Devres<Mmio>.
>=20

Well, this is also the case for relaxed(). I basically made peace with =
the fact that

let mmio =3D mmio.relaxed();
< use mmio >

is going to be a reality per driver entrypoint, unless I misunderstood?

=E2=80=94 Daniel=
