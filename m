Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794502872;
	b=JTQhyCw6Kwi/8MAIgf88aIkuG6JN0vNVgVcdwMXZDtauyZliUp2FVqjYsKyQ4g+NcbwZ
	 u6STzFePoOIQi6jjAsGdUcLELD5Z9E3RC1FedUiD6TeaS3sBs9xH8RYS8kSb5SLle4uZD
	 xE8faFSEqw0fnTStGLQ/rXUy1rglDb6OcJR4LssplnaJVsuVtswsWPBDeELNVufOFKGk2
	 2gvkzlP3T4iCYTijA1KhZCnXWURNK6clCFXIU2uVk1rXrOD7wACgISD41vM7H0j6mQnWC
	 t/rS6GuHAC0OKAgqokLAKkdr9AOeuNC0e4lr2fz+rHcLGjP7EtQ8mZVZhMWzGiCf/Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502872;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=S0Djhj317bAJw99HOfElnFwv7DFAEhfTOOS3rSerALU=;
	b=j+8kCLrIPqcv/9mbOb0TGxis+mtXqPEAYzi7pkkKo43jhQPqdS+2B1zLK6qkisk2DfMI
	 G+t3Wzq89d5UQ2Ff/qHQAK8zS6NOg95VtiyTv63+YRZglO0hdBYSkhHg9w7OyTOr0Xepw
	 QADtmdXhqVPWb0vIjRAWX49rt1JinGeyUCsSP6RzA3pgoVa4zuTkk1ifQLIyFPpLfUAph
	 /E9uHqHghr5YmTtgIzO3xbvFNIJ3Toa9srrCOasuWuIDh/VugGBBwNcElPYlwYbRcCgKM
	 LLIC3zBx/Sg5T/ji3vZ7X7uhrj04prNbZj2qXXUSh29P1W3cWIh8M9y3ylileLMEKwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b="A/s3fdqQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904B606A333;
	Thu, 12 Nov 2026 17:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2904B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=A/s3fdqQ
ARC-Seal: i=1; a=rsa-sha256; t=1794502839; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DAKREL9V0IlgieN5NFG8GJ8dbYMDyROTfXFO9KZ/cZvPj7KYx1LeO7Fg8WLF0QCvtdLpfybMZleouAfseg4tHpPgPfYMgbDAigzo4EtQjAB7uslZ1bfUsuz371OjTmflKzIaAqp8Jj7dUQV75YiuejMP7UfjggFIQ2i1jLvSSrc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794502839; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S0Djhj317bAJw99HOfElnFwv7DFAEhfTOOS3rSerALU=; 
	b=L8lIeUqDTOLAIUZrqB9adJMbV0J31J+E+687fzw5YYWxYeUkF07ZdC+aFe8ZRK3HDywS4qp44Y6oSdWdvd4ainhk4DGBN4sHntHpQxQq/+qSrslhVDHCyOCjawneVMgqKGzNyx28py5YWS/chcaIOGY7EpICrJIfCRM9iFQcMYw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=A/s3fdqQ5G5Uq2vSKyamL+hStPttYixO7TR9jq5/1RQyjJsop0RvUcKRPjNp2+eWNhI7K89EpkvSgCPtr2th/nacDpMwGPFUeYSNwmAHFeEnWWEFWdk2r85UOaaUeDglBjHTWrkW9+l+SDKUH3FDBRJv7eWERRtCKfnqFAA/wpY=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=S0Djhj317bAJw99HOfElnFwv7DFAEhfTOOS3rSerALU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794502835473479.78633642671866;
	Thu, 12 Nov 2026 09:00:35 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Date: Thu, 12 Nov 2026 14:00:07 -0300
Message-Id: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBuwMBddJVqYTjWBGloRRHfP6
 u2+xfsvSBSZErTFBZEOThx8RlUWYGbtJ0K22VCLWlV5OEjk4NyONjjNHkeptCLZCCMs5NcaaeT
 zK3b977QPC5ntzcB9Pyf+NtNzAAAA
X-Change-ID: 20261111-b4-iommu-domain-f46a6e450c0d
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: iommu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

This series adds a Rust abstraction for IOMMU paging domains. A driver
can allocate a domain, attach it to its device, map pages into it, and
install a handler for its faults.

This will be used by the upcoming rkvenc driver that my colleagues
Detlev Casanova, Nicolas Dufresne and I are working on. More details on
this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
[0].

As part of the security model, each client will have its own IOMMU
domain. This is needed as the submission model will let userspace set
most of the encoder's registers directly, so the kernel cannot check
every memory access that a job makes the encoder do. With a single
domain, one client could make the encoder read or write the memory of
another client.

With a domain per client, the encoder can only reach the memory of the
client whose job it is running, and any other access faults. The fault
handler added in patch 6 lets the driver identify the faulting client
and terminate its session.

Patches 1 and 2 prepare for Domain::map(). Patch 1 moves the protection
flags from the io-pgtable module to kernel::iommu, and patch 2 makes
SGTable::as_raw() visible to the crate.

Patch 3 adds Domain, a paging domain that is allocated for a bound
device and freed on drop. Domain::new() is unsafe: the caller must
ensure that the IOMMU driver behind its device sets a domain up fully
when it is allocated and allows concurrent use of it.

Patch 4 adds Domain::attach(), which returns an Attachment that
detaches the domain on drop. Devices that share their IOMMU group with
other devices are not supported.

Patch 5 adds Domain::map(), which maps pages at an IOVA chosen by the
caller and returns a Mapping that unmaps them on drop. The pages come
from a MapSource, initially a boxed SGTable that owns its pages.

Patch 6 adds Domain::with_fault_handler(), which allocates a domain
with a FaultHandler installed. One handler can serve several domains.

This is based on v7.4-rc1.

[0]: https://www.youtube.com/watch?v=75E15eHY7ac

---
Daniel Almeida (6):
      rust: iommu: move the protection flags to the module root
      rust: scatterlist: make SGTable::as_raw() visible to the crate
      rust: iommu: add the paging domain abstraction
      rust: iommu: add Domain::attach()
      rust: iommu: add Domain::map()
      rust: iommu: add Domain::with_fault_handler()

 rust/kernel/iommu/domain.rs  | 425 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/iommu/mod.rs     |  18 ++
 rust/kernel/iommu/pgtable.rs |  16 +-
 rust/kernel/scatterlist.rs   |   3 +-
 4 files changed, 446 insertions(+), 16 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-b4-iommu-domain-f46a6e450c0d

Best regards,
--  
Daniel Almeida <daniel.almeida@collabora.com>

