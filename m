Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3362B1A9F8C;
	Mon, 23 Feb 2026 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843456; cv=none; b=DCpAyzKiVcNda6IMy9zyy/wua2BRuBc+VwhDS00P3Uvl6Sp/k+/kyKTBs5XQaB3tntb49attOZ0tc2PLwrkUNn3HCi8cdDp1F2tLK5yYNj1E+/6PXFaUkES9GU0PnRgt/e+p79cPcapg5DlajBFBNLZvspCuF9GWp5/csjT0wnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843456; c=relaxed/simple;
	bh=I2TPyH8kVYSs3Pmk41GFNfxOJ1a88uMmQUTiHK41nSs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=q1j0mQ8C66lXDSaHh7yEf7dL/Yby0PFxV42x3uE3MId7aqUmRXXsWyf8yibJzb/MDalIrzrFv/InstWkK/Jw2hjRzM/fL9z9X4RjZ3ouYRVamf2Ot6ARUHKBOqaqOtBb/ee3MFi0kw7I4A+mLiD8oqWHRquQf/JP69/+b+XuD9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDpT+S00; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDpT+S00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABFDC116C6;
	Mon, 23 Feb 2026 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771843455;
	bh=I2TPyH8kVYSs3Pmk41GFNfxOJ1a88uMmQUTiHK41nSs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YDpT+S00IqEmW4255gAFmRaetxDpiwlNB3+qDv+AT+F33Mw4J6SeE3zV3RuYNGTXk
	 GtuykaO8LIjB61HcB1LgGSIptCjurSRksv1wnQwGu1F8O5mVM+mcoF7PG5ysRSA0hR
	 LaW8Uu/dRgCaWjLDYyXmSS3fJY8reHwiqtkIULVNS1i/XP2bNe6dw7b1u1a6BRW55D
	 hdLmvRqxkAzrEtG0s+WgF7KtQGWlv4gCm0MCbSLvuYcxTGVoDwjN1FXCWjZcPFkUUJ
	 D1gmkmiER/OaLxuhq4Q+LBP03RVFd0Ue4o0HNxCp8JrKJSD7ZLqBN5elkmOxRidzK6
	 ehaUP5UdlPnlQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 11:44:12 +0100
Message-Id: <DGMA3158PGED.1BQ63TEC2FC60@kernel.org>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org> <aZgYY_fetgz_GDR8@google.com>
 <DGJX3FI97W1G.371MAMC60FX24@kernel.org> <aZlw3SGmLetHwaTM@google.com>
 <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org> <aZwalt_6KlOIDzkN@google.com>
In-Reply-To: <aZwalt_6KlOIDzkN@google.com>

On Mon Feb 23, 2026 at 10:15 AM CET, Alice Ryhl wrote:
> On Sat, Feb 21, 2026 at 04:09:41PM +0100, Danilo Krummrich wrote:
>> On Sat Feb 21, 2026 at 9:46 AM CET, Alice Ryhl wrote:
>> > So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T>>?
>>=20
>> I wanted to avoid exposing the reference count, as I suspect drivers mig=
ht not
>> need it in Rust, but I don't know for sure.
>>=20
>> We could also define it as GpuVmBo<T>(ARef<GpuVmBoInner<T>>), where
>> GpuVmBoInner<T> is private, but I also don't want you to go back and for=
th with
>> this in case it turns out we do need drivers to be able to take a refere=
nce
>> count and I also don't think it hurts too much exposing the reference co=
unt,
>> even if not needed.
>>=20
>> So, either is fine with me, ARef<GpuVmBo<T>> or
>> GpuVmBo<T>(ARef<GpuVmBoInner<T>>).
>
> I don't think GpuVmBo<T>(ARef<GpuVmBoInner<T>>) works because we need to
> be able to talk about both ARef<GpuVmBoInner<T>> and &GpuVmBoInner<T>.
> The reference type is returned by several different APIs, so the Inner
> type can't be private.

I meant NonNull<GpuVmBoInner<T>>, analogous to the current GpuVmBoRegistere=
d.
