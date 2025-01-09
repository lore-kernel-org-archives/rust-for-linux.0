Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707FC1E868;
	Thu,  9 Jan 2025 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429564; cv=pass; b=FccuRIOduTFkdq5k4FDXptmrC8hVdKRYdUaobq0iPg1TmsdGRY6OT6aoYuM8NLYnM3JmRlDsc9jzspcA55ERNbZ+pwz9rUlaxYkivtc/iyQoFMFWbfnQBLFz3VZNoki2RD92DL1k85Ft/HHvJHpmdz/mxCea457Fxi0eC+r793Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429564; c=relaxed/simple;
	bh=WBuI43QVMvt1n67v+pOkhQMwfv843+8To5kEgRqGTl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnyFpiV7crDlb5V+pRiu8qnw4N5ACVmLpq1xUG2JXGNUUBGHJ5mojEtOuH+aZJAxBCLbTXvE1SLvs/a6UZ8gaVlP1Kiphq2zQrunPzfaUU/EoejzMeGHN8GHPRc23r9M8f1k1lbKE1fOqNH982L08UiTaJomoQBRwfrPmlQctlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Koj2PacJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Koj2PacJ"
ARC-Seal: i=1; a=rsa-sha256; t=1736429541; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Auq6NDrWL00hHsNjcMiktpCkDVF3bf9JBwCoGAM14+ihtiB6LYdNWONzQp0yPzr0KfVMDBxFPMl9D+0ALLGJR0ytaLTGOaCaoEP6o1FmW8ei+AT0h3/tBHS+reaLXVdjIrPweGBk5AzKFzWjZNNtDbFdCwfoL6rfykCUpikz3vk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736429541; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P7SSJ4exsgkBYBEBhLnCdtrTJqrtCmZO/n184+fhSLM=; 
	b=Urz6wuBxX1A210a8rNSzHOh5BXdTG1FsTMSCoJ4tVR8uCyAwGGAiIcxbZy3a8oIQwnHhmGxWlpWr3uFLAzezE5kNaiqdIz67w2JDqzm37obrzLP4bUh6ZG08YeHDuIekQkoBpeuSHaeSXJBQr4P7uFZ4n8ngstuFBxYWIL8fCnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736429541;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=P7SSJ4exsgkBYBEBhLnCdtrTJqrtCmZO/n184+fhSLM=;
	b=Koj2PacJvb1qROhKNkCDOgBn66Y5O2dmPVtA6I10GT6stk48hkwwlwsRo6P9w2jE
	TlTrqKtbp3DMFbRuKlIPsa5GjjpTnyNGpNStrsduPSLiRQW4s23JF+K8gRhKiWr+PpV
	+DRNJJ/7V80rVOnjWrkbx7+FS9Twjd1LLxd+IMQ0=
Received: by mx.zohomail.com with SMTPS id 1736429539360744.9451633279679;
	Thu, 9 Jan 2025 05:32:19 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	boris.brezillon@collabora.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] rust: platform: add Io support
Date: Thu,  9 Jan 2025 10:30:52 -0300
Message-ID: <20250109133057.243751-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Changes in v4:

- Rebased on top of driver-core-next
- Split series in multiple patches (Danilo)
- Move IoMem and Resource into its own files (Danilo)
- Fix a missing "if exclusive {...}" check (Danilo)
- Fixed the example, since it was using the old API (Danilo)
- Use Opaque in `Resource`, instead of NonNull and PhantomData (Boqun)
- Highlight that non-exclusive access to the iomem might be required in some cases
- Fixed the safety comment in IoMem::deref()

Link to v3: https://lore.kernel.org/rust-for-linux/20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com/

Changes in v3:
- Rebased on top of v5 for the PCI/Platform abstractions
- platform_get_resource is now called only once when calling ioremap
- Introduced a platform::Resource type, which is bound to the lifetime of the
  platform Device 
- Allow retrieving resources from the platform device either by index or
  name
- Make request_mem_region() optional
- Use resource.name() in request_mem_region
- Reword the example to remove an unaligned, out-of-bounds offset
- Update the safety requirements of platform::IoMem

Changes in v2:
- reworked the commit message
- added missing request_mem_region call (Thanks Alice, Danilo)
- IoMem::new() now takes the platform::Device, the resource number and
  the name, instead of an address and a size (thanks, Danilo)
- Added a new example for both sized and unsized versions of IoMem.
- Compiled the examples using kunit.py (thanks for the tip, Alice!)
- Removed instances of `foo as _`. All `as` casts now spell out the actual
  type.
- Now compiling with CLIPPY=1 (I realized I had forgotten, sorry)
- Rebased on top of rust-next to check for any warnings given the new
  unsafe lints.

Daniel Almeida (3):
  rust: io: add resource abstraction
  rust: io: mem: add a generic iomem abstraction
  rust: platform: allow ioremap of platform resources

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/io.c               |  17 +++++
 rust/kernel/io.rs               |   3 +
 rust/kernel/io/mem.rs           | 108 ++++++++++++++++++++++++++++++++
 rust/kernel/io/resource.rs      |  49 +++++++++++++++
 rust/kernel/platform.rs         |  98 ++++++++++++++++++++++++++++-
 6 files changed, 275 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/io/mem.rs
 create mode 100644 rust/kernel/io/resource.rs

-- 
2.47.1

