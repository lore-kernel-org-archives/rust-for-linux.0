Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE3308F39;
	Tue, 21 Jul 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784638736; cv=pass; b=JhA5teNVBQF1P0Eb8YgoYsgdIShQy+yqyAvUKeK5eoT+/a9QjSbf1izQHHQ+FP1ja2ZEdVjajYQeFer4RcHvikEN5LawSv5gElAevxfSY4H/uDYApTz0fG/H/IcMqQruJmwn7XqPG/GS2DS3/5AaS3qa54zg6yrOk6u/YKjsyiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784638736; c=relaxed/simple;
	bh=jNtdBTkhuWquc6XdFZGO9lmJ8vbOSY0kXy9zZrxnmZ4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Sk+79j58uSkEWPGMu0+lq3927X6J3BUkLbrpE66+oHI0JUw+aukNvwVobwPKlWTB/JeBESYV/dQB9VhGnQsaKji1Fr/cpzjD5PiAQOKrCQXK9/urmfBXhHB4nl1jw/1/jz1jWkqwpkNh9vTK1cN4Ae5VyVjjG10DV/tI2F6VZXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=FYQnZ4zj; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="FYQnZ4zj"
ARC-Seal: i=1; a=rsa-sha256; t=1784638711; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kyy0TPdF1plsn4Ic0UOhWmEtT5qmaYlup27lWW2guTs7dl+A1CNmPACFRrs8aWuLU7aRtIjYBD0r91u2MkYCRRRtkqhAp3hnB6wlilOw4qgyeiXEV5XtrAZaij2K1m4ObOrm0d5UxhvCKhSeWhLWNCCL7/HGCeEbkaNPCDr2cys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784638711; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Or+Me5cZ7CrMs/kaTLaDjw9hJ9A/0iRRfmQNIWbl90E=; 
	b=cQNlBrx21PbwFn/iszGO8whYq52uOMx78DyNo3zJCPCfyn6qOcsOcSlmBgPzUXE5u4Mtd3/ZXYiqV2dhVlo+5z6KkyG3GIAQ3f9Fs1wp+T1hnuHSrWBaOV2potPwgCIovnNagA5u5+twJ2rBT45S1ZpqTAwz/hXBjT8u7S7BhRQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784638711;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=Or+Me5cZ7CrMs/kaTLaDjw9hJ9A/0iRRfmQNIWbl90E=;
	b=FYQnZ4zj1UT+KJZv8TA7MiTwbY2TJ8KeloxgOy29SyzUEXJDHhjsoVbHDPw8nbMD
	ZtwcYoRWbFi4yR03S/R+vyQ6fHvh8xwobIbVX09YLDVLs+xUjfhKWYd4qvVEoaBFA/7
	PLMmC6C2SpXB2iivb8CBAMBpOAATkztGqq36C6b8=
Received: by mx.zohomail.com with SMTPS id 1784638708437117.33108404810582;
	Tue, 21 Jul 2026 05:58:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 4/7] drm/tyr: add GPU virtual memory (VM) support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <0CC97E4D-4D6B-4733-870B-35030714D99B@collabora.com>
Date: Tue, 21 Jul 2026 09:58:10 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 boris.brezillon@collabora.com,
 samitolvanen@google.com,
 work@onurozkan.dev,
 acourbot@nvidia.com,
 lyude@redhat.com,
 laura.nao@collabora.com,
 beata.michalska@arm.com,
 alvin.sun@linux.dev,
 steven.price@arm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <75EF3D0C-F9EF-4FB8-AC66-0722A6B22504@collabora.com>
References: <20260713-fw-boot-b4-v7-0-afd8dc1494dd@collabora.com>
 <20260713-fw-boot-b4-v7-4-afd8dc1494dd@collabora.com>
 <0CC97E4D-4D6B-4733-870B-35030714D99B@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External


>> +/// Maps a physical address range into the page table at the =
specified virtual address.
>> +///
>> +/// This function maps `len` bytes of physical memory starting at =
`paddr` to the
>> +/// virtual address `iova`, using the protection flags specified in =
`prot`. It
>> +/// automatically selects optimal page sizes to minimize page table =
overhead.
>> +///
>> +/// If the mapping fails partway through, all successfully mapped =
pages are
>> +/// unmapped before returning an error.
>> +///
>> +/// Returns the number of bytes successfully mapped.
>> +fn pt_map(
>> +    pt: &IoPageTable<'_, ARM64LPAES1>,
>> +    iova: u64,
>> +    paddr: u64,
>> +    len: u64,
>> +    prot: u32,
>> +) -> Result<u64> {
>> +    let mut segment_mapped =3D 0u64;
>> +    while segment_mapped < len {
>> +        let remaining =3D len - segment_mapped;
>> +        let curr_iova =3D iova + segment_mapped;
>> +        let curr_paddr =3D paddr + segment_mapped;
>> +
>> +        let (pgsize, pgcount) =3D get_pgsize(curr_iova | curr_paddr, =
remaining);
>> +
>> +        // SAFETY:
>> +        // No other io-pgtable operation can currently access this =
range because Tyr holds
>> +        // the gpuvm_unique mutex for the entire sm_map() operation.
>> +        // The addresses being mapped won't overlap any existing =
mappings in this
>> +        // page table because drm_gpuvm_sm_map() checks each =
requested mapping and either unmaps
>> +        // or remaps any overlap before creating the new mapping.
>> +        let (mapped, result) =3D unsafe {
>> +            pt.map_pages(
>> +                curr_iova as usize,
>> +                (curr_paddr as usize).try_into().unwrap(),

Let=E2=80=99s please not have unwraps() anywhere. We really don=E2=80=99t =
want to panic.

