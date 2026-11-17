Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943956;
	b=sNFBfc42+oeVFpmjlaSc8FpzjvJOjlNb/dju/pxcuX5tO57YFEX2Ufpqdn3/cgNXWuWW
	 aE3ghrFjlln3VBMPw78Bn7wtvg9pmfl92cgZQyndmD+kLOVpaYTY272UL4NfTW89YkYvm
	 wsQcLHrKPjvouxb6tUKrUHxI/CLqLm0/6LIxH2whqpnAbTDOUJHzRzesc+XAFapZ47DIw
	 ijzG77yaxqQeLThgtgku860uJy4EytbWJRcy2TGaixjOSeh45YQSbUn6Hqql9gwiAufSg
	 W/MFDS0Izm75S08YV7B+pwSywUS6LJfY27Z9i0HPgX/lqRKUJXDh0aYwn1jenkcIozg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CWEIybWOyPQ+4rZV05KjYSAVt6nHfWxtoLBA9Fvcf20=;
	b=kkkJU2Q3Fj+hTpTCDd24aZkZrjanD3MGdzjsZ59qj8SnJCehfl8BcAtI1qoy0j56n4Ys
	 S0o2oJkCS0lp3uBd/M2MRhFRpJmp11J/YPnbf7RSJKvTe4bL4tcPENfUAHsBGsS7xu5s8
	 /3LznrE8yeWacejXbppZypFekcry9KgLoE6yRKr2qBmhUWisnFHgfMqm0z7vXDj8KNlBt
	 D+E4GTzfqWRYUsP+/Qln2IfWr2xume+AJF8MMyDQwhxmzFBAozbkgQAtO6gtQvfK/CsbB
	 xqj9nNdkrXJ9Hb8EwdAHt+IOMMl4nVVQLLQQ0L8NBtFao3HcbonoxcV4eNxTTYbviCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LOap06DJ;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E7760A260B
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 19:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E7760A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LOap06DJ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso57701f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 11:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794943954; x=1795548754; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CWEIybWOyPQ+4rZV05KjYSAVt6nHfWxtoLBA9Fvcf20=;
        b=LOap06DJg3ibAXIcvqMVQw8Ao0Y1NyxeIoRmnhaJfVJI6ryAuAMd2ifvJ8m2EVEWvP
         +TuEJIjfydWoMmZ+30PzqA8jUo1Z2Jy+KoMAQrbAydEUcw0LSPSOxxVBGI2RiU6hj8lU
         gIQQuxyWRraBAcmSqYkb02T0NBNo+FrPNHlgeureOLNgSW4sFGyJE9h25tKZEOc1N2OU
         e6I0s/mT84+0q8ZGpDmuYMHDs2ucatwx5iE9++bmaE5CYb/1Gqc2gsnIB8C2jrEIxTTc
         rm04QkNUb9Ri8XHQLQfRpjTclpQEl55t1YGtJc+t+1ZzdKVie2vH1MVXfciPpnGmbSom
         wMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943954; x=1795548754;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWEIybWOyPQ+4rZV05KjYSAVt6nHfWxtoLBA9Fvcf20=;
        b=DPxSvqEEjhAIEmN+sirIHIMODViLi+akdQKjVe94Vu2SX66jTF2YS7ZDFxuZkKGFsH
         3xxpEs2dgbyUoYy/vXAdQf9MEUl31kZ/PK8/RSeqtGfmhgKmH84nft99+QuzJq9Wq7ut
         zrbhV1rnLwtZQv+3kLdVhrzzwJUA2AoOtG31lwoFrcLPDC5e7tyPTYSEz4j0VGrY5Cw5
         PHhpCk03Vr57tEeH3/8/7i8p9w2JRaNZAV37ihAMPVXPg0ZbFS1wl7t3+ScGeQTlDbSo
         ibll/ZJEDx9yFw82L0PoquGq07ZpxxYLnam2IVxt9/DjV7ZPeN7l5yxnoNP4WC1K2+Af
         7D6A==
X-Forwarded-Encrypted: i=1; AL+hErFItFqzRah/Mi9MkZwbzt3WxY/Au4M9K6qWoKHvd+lAws4toJ9Ldk2pXFyxHpgPNDsuEbkshkv94EQUZeEW8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+VDUqtKBDFLJ2oa8GjIGAwg9tuW7JCN/2pZ1TjDj91Lu+ulSJ7
	Lot0XByD5pcTnGqgOXoi3vJxY4Es2ISfl0FaYk7R7l3y9yQa/7HAZgzj+NEuC2svGk6fPdxzIxY
	ozowVvd6Gx7q2FzHwpQ==
X-Received: from wrno8.prod.google.com ([2002:adf:eac8:0:b0:4a3:4620:1d69])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e193:0:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-4a63de52730mr1008245f8f.35.1794943953550;
 Tue, 17 Nov 2026 11:32:33 -0800 (PST)
Date: Tue, 17 Nov 2026 19:32:17 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMKr/GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mz3ZLKIt2i1NzEAl2j3CRd80RT4yQLE3PT5LRkJaCegqLUtMwKsHn RsbW1AOkuzV5fAAAA
X-Change-Id: 20261116-tyr-remap-2mb-7a53b8475cfc
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vSb8dcnD2eG8K9E1baNk0JXzV820WUHmszz9zfbL9p4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/KvIxRmUX8ES1X5aoMSyIxD/DGyKY46COBIZk
 l3WJbGYM6KJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCavyryAAKCRAEWL7uWMY5
 RlBYD/9LZxWa1EOICrXfCQo6+2FEaGCBTsGLsBCGNZt1aDkE705pnOcpv89yKcb61oL5jKTgTnW
 xpQGfS8/AHinHSIETT2reeDB4YrpfzKFFlHy+s5uCvqaMrDkS0xGr3eeSsaIDFJWASvdkEippTS
 96axYSKcL7IFwFLAmgcG6sX6tc0b5GG6YfPj75KMsMDqJ3kzAy4GDySRre+ze+MkIPI5rPoSdlC
 bDZ1yQZ+MrXVRxE2tuP33TmNT2izHdDsTxsdkPvzk7AGQ+oihOvv6lzCMkGxAhW+iBy91sIchkX
 /ewCL9ObYoq8wv3Fo0015JzMRoffi43yZVGOgl2jWFo/tAfMB0Q9JHTVRlIC6z2Mqwx6cGSbLJq
 2y2G/r950f+7EEb0Sk8FQDfRZbzval9lsEozVfD+HmJhsjPsowLG2Ts6hYCYggj1F6apuPx05oK
 bGAWMT2i3wIdIs47VBY+0nGf7hM4dTIQ8gTLYTtEEv3Uqup3mp+APnE3UgC20V73mFjgF+a+bd0
 ct/HDow4DEd8WlnxgPELic8aqxm7FxfePM7Mmc0Z9EsXXPs5ntYG4v696CXy794wL5Ab7FxxOSq
 vghzvQB8amoJ5I6nF85Ee23Zss/K18MPB4vI9M4+qLYN2grL4wfzZKk3nCZkI9DsMoWR6CGB/8j /nHigx3AoV+EAnA==
X-Mailer: b4 0.14.3
Message-ID: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
Subject: [PATCH 0/4] drm/tyr: fix partial 2MB block unmaps on GPUVM remap
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Tyr configures its ARM64 LPAE page tables with 4KB and 2MB block sizes,
but arm-lpae rejects unmapping part of a 2MB block. As a result, a
partial unmap or overlapping remap that splits a 2MB block in
GpuVmData::sm_step_remap() fails in __arm_lpae_unmap().

This series ports the remap fix and supporting accessors from tyr-dev
onto drm-rust-next, along with a defensive bounds check in pt_unmap():

1. Add the GpuVa::data_ref() accessor.
2. Add the IoPageTable::iova_to_phys() accessor.
3. Expand sub-block unmaps in sm_step_remap() to 2MB boundaries when
   the swept head/tail fragment is physically contiguous, widen the AS
   lock over the expanded range, rebuild the surviving fragments, and
   take the preallocated GPUVAs before mutating page tables.
4. Check the remaining-length subtraction in pt_unmap() against
   underflow.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Sami Tolvanen (4):
      rust: drm/gpuvm: add GpuVa::data_ref accessor
      rust: iommu: pgtable: add iova_to_phys
      drm/tyr: vm: expand sub-block unmaps to 2MB boundaries on remap
      drm/tyr: vm: check the remaining length in pt_unmap()

 drivers/gpu/drm/tyr/mmu.rs               |  13 +++
 drivers/gpu/drm/tyr/mmu/address_space.rs |  29 ++++++
 drivers/gpu/drm/tyr/vm.rs                | 152 ++++++++++++++++++++++++++++---
 rust/kernel/drm/gpuvm/va.rs              |   6 ++
 rust/kernel/iommu/pgtable.rs             |  23 +++++
 5 files changed, 209 insertions(+), 14 deletions(-)
---
base-commit: 8045d0e7d208ad389a387f1407ce0db9070805af
change-id: 20261116-tyr-remap-2mb-7a53b8475cfc

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

