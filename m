Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DC3F0742;
	Thu,  5 Feb 2026 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301762; cv=pass; b=ANiDdLX+ofM8EdnWjBEMIU0k7shbxKHHQ+/HIJlsgnbb0C+f+7pxNhgZeRcl7v/A1gvr0h0ASdw0XYWsE6nO/QsTFMlXsVj7FPV378KoHnkoCHLo6UmsjMan78LysiUY6h3rlrJYt2POmdEAOl/yArkgR+qO0k210L9k7hZquSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301762; c=relaxed/simple;
	bh=Qc1uiAFxrbLUJY1lZJ2hPTXPxu1uxTuoB4PMQ6ccxF4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fw5p6NWuKOxqOqhgWp7eflYhC8ntgYhRGyE/P12uBHNfrud0FQJCV9LqQkaH/DK5G0x/LltDLoY/dNob+oOhh4beZIFreYyLXoRGGTBdpH+uwxMFU7OQGA5NINP8X8MSf/opDX+/UzYdTQcL+7xzf/uoyWgpvqhhKoWIfM8P0NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Nd7mF5t7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Nd7mF5t7"
ARC-Seal: i=1; a=rsa-sha256; t=1770301713; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QSHFHjAa99OTsHyo5WeoPv5AV9EjQ0E9CCqkc/P1ek8zbHF5ygGvwJsFdiHrgoqhy2ugUygi/WQgy4RwlfB+hfiKtivaqNSl/OQ3WwEEEGA1lzyUikm+2T9E25w7B08IgE5gF8u5o1sYJumHLR699+/8Fazs0E3KTlkOzs90yHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770301713; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Qc1uiAFxrbLUJY1lZJ2hPTXPxu1uxTuoB4PMQ6ccxF4=; 
	b=l6oEINuDc/5/QcYD7ikomuZP+zz6goGoswPCOJfahIgja7xnNIFEq4XQIs2zljH5faIZoq9qRCu57RkO69KPLkB2xIyyUC2st/zHMv9rcdghcDo6vT/0YZJtNuVUZXO1fmhlnXany0Gi6ZRv1Mc4Asdpke/3Mnu+/qFLfbe2VFo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770301713;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Qc1uiAFxrbLUJY1lZJ2hPTXPxu1uxTuoB4PMQ6ccxF4=;
	b=Nd7mF5t7UX1hhdRejJ5dTJ8sBkXzpqebV9DrOCx4zQtMOdHVWEpIsk/77WhSq4gz
	6oSg6CWjheB2LaN1fTXIpTEKtjxYScZ+PHimltaStwkZcQHucBZRbnOVv0owIsRavB4
	GuqXAOZ1UuNjygzxQSH7pMYGYhq/1lFrAyCFw0B8=
Received: by mx.zohomail.com with SMTPS id 1770301712607806.8941192551862;
	Thu, 5 Feb 2026 06:28:32 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
Date: Thu, 5 Feb 2026 11:28:12 -0300
Cc: Link Mauve <linkmauve@linkmauve.fr>,
 rust-for-linux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
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
Message-Id: <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 4 Feb 2026, at 12:18, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>> Another option would be to call u32::swap_bytes() on the data being
>> read/written, but these helpers make the Rust code as ergonomic as =
the C
>> code.
>>=20
>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>=20
> The I/O stuff recently changed quite significantly, please have a look =
at the
> driver-core-next branch [1] in the driver-core tree.
>=20
> Also, instead of providing additional *be() methods, we should just =
create a new
> type io::Endianness and use it to indicate the device endianness when =
requesting
> the I/O resource.
>=20
> For instance, for your driver we could have
>=20
> request.iomap_exclusive_sized::<8>(Endianness::Big)?

Can we please structure this in a way that LittleEndian is the default?
Perhaps using a const generic that is defaulted, or something along =
these lines.

>=20
> and then let the I/O backend choose the correct accessors based on =
this.
>=20
> I.e. the device is either big or little endian, hence we don't need to =
provide
> both accessors at the same time.
>=20
> [1] =
https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.gi=
t/log/?h=3Ddriver-core-next
>=20

