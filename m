Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218C29E10C;
	Thu,  5 Feb 2026 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312626; cv=pass; b=Or6S4AxJt/iWPit5UaALnJ5rHmVTYqbXJh8u05e5VknYCp0sJNQAH9vkJrWux56wIE0Ohrwl9GIXix3KgxYjrvawA2IkYzvy6VJLwOlBLjg+9eGWVwLO1OEu4+FuaBn0+TnfGIDBYejDdpO5bk/O3wxBL93r4lDkvg727SEryKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312626; c=relaxed/simple;
	bh=M3obdoKTXeSYmymRy2ZWHekuDCWgCx8je6+4eO2cz9k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D0YTsRtoLuxhxjgn62+9lN6ZyStSq6wqb3zPHomtnu6TvD+2wpMdOvs8REVQj5R3oD8PxDxFB20hXA4NQB3x/ajpiHlhRJvMOPSGfrdw3pxPK/8CRIasCbg7W6RkvuYVREsIVNGPTyJpNsofl2xvHa7rKZ51Pp1/R+kYO6tcc+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Yc9/zHHe; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Yc9/zHHe"
ARC-Seal: i=1; a=rsa-sha256; t=1770312503; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KY6VO4SW0l1XxLDMZAUouQ9cD/iD79peHutQ0KQl5cAI58ncNvJiwtti9CY+/LYTVq8LVGaLx336qvFBW1nK0uYYN2FuP/dNcWPaFKQ6jtUH8q6nkX08vhqiZNfvamEqVNCEL490lsca1gNnCM+e8ABuf1gRRhdJeaEVBl/m0ds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770312503; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M3obdoKTXeSYmymRy2ZWHekuDCWgCx8je6+4eO2cz9k=; 
	b=AI9TcGWkwp+RSBSUD9nITIIqJfIVXzeaXrynOiGtGCeC7xga1Mx2FZqa545SafwUkohb0usPV2V+uykcUAtSnpNwHPaADnqfWKH5kkc58PPZkwlRvwUMF96l42SKABb/Ab8vR9WJ01ZMPFDwFKGvWfLr0+koo4PQJpOuC2fqL2E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770312503;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=M3obdoKTXeSYmymRy2ZWHekuDCWgCx8je6+4eO2cz9k=;
	b=Yc9/zHHe5skqGxSIwFV74mpj8b7Z8wpKWECEoqUHgcOO/reDAn1SN404GZ5Hqgyx
	WCLGah93CW5lnhrUrCd7P5HLtEWOa6Aq6dSg99urt9jhv8/vJFTRFq6KzJpIG68pkpU
	uWM6vu+6u0jcTtdMq20BY875GeV0LtkJT1Jsjj1M=
Received: by mx.zohomail.com with SMTPS id 1770312501926532.5023520135724;
	Thu, 5 Feb 2026 09:28:21 -0800 (PST)
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
In-Reply-To: <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
Date: Thu, 5 Feb 2026 14:28:01 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
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
Message-Id: <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 5 Feb 2026, at 12:16, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Thu Feb 5, 2026 at 2:28 PM GMT, Daniel Almeida wrote:
>>=20
>>=20
>>> On 4 Feb 2026, at 12:18, Danilo Krummrich <dakr@kernel.org> wrote:
>>>=20
>>> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>>>> Another option would be to call u32::swap_bytes() on the data being
>>>> read/written, but these helpers make the Rust code as ergonomic as =
the C
>>>> code.
>>>>=20
>>>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>>>=20
>>> The I/O stuff recently changed quite significantly, please have a =
look at the
>>> driver-core-next branch [1] in the driver-core tree.
>>>=20
>>> Also, instead of providing additional *be() methods, we should just =
create a new
>>> type io::Endianness and use it to indicate the device endianness =
when requesting
>>> the I/O resource.
>>>=20
>>> For instance, for your driver we could have
>>>=20
>>> request.iomap_exclusive_sized::<8>(Endianness::Big)?
>>=20
>> Can we please structure this in a way that LittleEndian is the =
default?
>> Perhaps using a const generic that is defaulted, or something along =
these lines.
>=20
> I think we should have everything default to little endian, and have =
wrapper
> types that do big endian which require expicit construction, similar =
to
> RelaxedMmio in Alex's series.
>=20
> Best,
> Gary
>=20

Ah yes, the RelaxedMmio pattern is definitely a good one. I agree that =
we should head in this direction.

=E2=80=94 Daniel

