Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758828726E
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771602113; cv=pass; b=AQspuFyeXhj15Zw6JJmr6eI9TXPR4Ejjw/twjuDUVbCu8nef3zUjwUSRNe2Yh8tTkofnapbWM5yfExd1jE2Zaf1+3z+/gB0J4tFyhM4bPqd1IsNA8zSdsAP7Ml8Sinw05l3RGvcDIHAXK8vbxIKLdHJdf45YivtkKJe1oBoy9Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771602113; c=relaxed/simple;
	bh=RFa1RFU8v8Qn0p9MaXypZhOAiQabkkOlC3nSdqx0/Ng=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rzkwXm4ERPk81lZ1ipkVGf+A1B2qBTn17wjPMIs68Z0I4DoN3l4hAnn5LLiTnaO4LlTVfnRi3vCtZhcCHYGFlirNThfFO3V8QvQtLFpmDlCHiBsvUu4SMrlENS+OXcIWSC21T9GZqiV1Bos2m67PJx2XNeUUj0NqKM7adXjOtJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=blBBUvRV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="blBBUvRV"
ARC-Seal: i=1; a=rsa-sha256; t=1771602105; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BX1BO0YLnjIggdkKUqZk7VGj6l8xDbWUqLpdKOL8j1YiwrsZXwkseCPjoXGMtBv5eg56uHrapYHkAtcY25Ogv58RzBaxUQdt41+oJaRPrRc/Kk9PT9wk5zK9m/v0KJEnoHpOlAxBIK3hbwSMSSIdLlwfF2tDG/mrrfaWjH/dIUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771602105; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rrCr3rMtN5X7RDG+lszzKvxXugEivTxgvZ+z254iq/w=; 
	b=lLsNwdVOLQ/t3UvgWIFZch79fMqzXcYGCnKKczzrCvNWhAC02bIyP1008dLyEe9qsO3pct70nLqSoQLDlG47vPL2/HcaKiqexT4wz84h2ygUo639U1bj5I4EfaSyQd7MrmeF9lZEjX2gzifxvCEIjBFwFAdjVX0cyhl1QyqUw9o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771602105;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=rrCr3rMtN5X7RDG+lszzKvxXugEivTxgvZ+z254iq/w=;
	b=blBBUvRVeQSvkoiX43BE/wq1EvQpjIaeFOsJh78+SfxEXHNp/q+saprKkYG/tOXA
	wx+w2LsZ2nOjteGqQTwRVGu/hvjbdp72CiRlr6VCZc508NZQW35QEx/U8I4JVIz6oW7
	cQiYL+qIQ0WRZLlX83Rl8cv/f4XrkZpMMjbderFk=
Received: by mx.zohomail.com with SMTPS id 1771602103205457.33180772414937;
	Fri, 20 Feb 2026 07:41:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212120538.13f81d8a@fedora>
Date: Fri, 20 Feb 2026 12:41:28 -0300
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 beata.michalska@arm.com,
 lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1860FEC-0ADD-4095-A7D8-DEED40640172@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
 <20260212120538.13f81d8a@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 12 Feb 2026, at 08:05, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> On Wed, 11 Feb 2026 17:37:09 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
>=20
>> +
>> +impl Mmu {
>> +    pub(crate) fn new(
>> +        pdev: &platform::Device,
>> +        iomem: ArcBorrow<'_, Devres<IoMem>>,
>> +        gpu_info: &GpuInfo,
>> +    ) -> Result<Arc<Mmu>> {
>=20
> Maybe the Mmu should be wrapped in a Devres, like we do with other HW
> components that require the underlying device to be bound to access
> registers. I mean, we do have iomem wrapper into a Devres, so maybe
> that's not needed, dunno.


Isn=E2=80=99t it enough to have the mmio range wrapped in Devres? =
That=E2=80=99s the
actual device resource that goes away when the device goes away.

>=20
>> +        let slot_count =3D =
gpu_info.as_present.count_ones().try_into()?;
>> +        let as_manager =3D AddressSpaceManager::new(pdev, iomem, =
gpu_info.as_present)?;
>> +        let mmu_init =3D try_pin_init!(Self{
>> +            as_manager <- new_mutex!(SlotManager::new(as_manager, =
slot_count)?),
>> +        });
>> +        Arc::pin_init(mmu_init, GFP_KERNEL)
>> +    }
>=20

