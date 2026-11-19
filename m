Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105426;
	b=yAhh7r8pMcVVoY3z8gs/zHsL/tQjRBOqm7Hswt0VRU3f1bIpiv1JoJWoM++mjbN4Fs3G
	 OS0fD+awwQaIT2an7s8fgOHWEGnnv4CnyCUSMP8/7ygEma0D81+BhDJ87b3unJQ8BvmTb
	 NI391EcYcRn7vcpS9CLmVXRDo0O5Y3DAsY9KYMf7HV6YKJH/dQ4dnyYi1IGe+3c1SxjUy
	 OjCWRvKa45Cq1Mbhi79rC23PF56ddsEdgoZ+E9JBcFbt+QEvEnr13oFX3NoI3VtJwOJgx
	 JmyqhrfH1Ix8GcS62wXLFI3CRj9NJlJLaLP7SJ1tEwQYxXfLMehkBzC7dw+gNidEDNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+PcaAwQ0PR5vU4PI0WrkTjiNqMUtnDUUt58Dd2LFEBo=;
	b=XOVSGxZl1smuMagzaGReVA8pPsds2J3PRw2i9VawjQZz+hg/CPr/4mFWB29s9tpWtfdL
	 ilZoOk7Mb9wTWlKHrM1CC7JIfl9YUxZC09m7WoXSjWN7EgtPc/TohFrk6MMlxq3n7n3HO
	 lxC8vw3NVEy2inRxshGPOs9HXkE9eyWkjFwCoQxTqxqNVW+/o498Al4InpnPPc5sa/Mcn
	 3IFBFccJcptzegD/hwnu8bUghhdIV3g6InK8GuHMrHDakfwY4JnQVHMrphThT78gj14Cj
	 jbhtNgtJyJpqyTnwVjpnPAMLpaziTJLMmgkRjDP/z53OTnMcSePvyuzy1ikCtlJ7HWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="NtKSe4Y/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989DC606A324
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 16:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989DC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NtKSe4Y/
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3edaso858138f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 08:23:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795105424; cv=none;
        d=google.com; s=arc-20260327;
        b=HErebiLVIYlKo9QBXzafTEyfG4zZPqn5o2wLC6c78jEaeNKnkb80d6iZdsfLuHqDXN
         HQ6LXaQTVOKhRtNtdZjPXh2e1G2wn1vYxB4s6uCjy8X9rtY6qt3ncSOXq8TMYNTobaxd
         CORQmNh8mB8Hx+0NFjWY3wUcjmWT/vizKwd5LzuThFug0l0Wydq/jenQi2TRjA1Ws+pp
         RoEmDyRymHink1DfZ1EvfUZoPrCR0zmlwoeyvZyRU0z4h7fDoe2y5RasuBIHWepH3LfZ
         dVpezsBEl+IoaNFNO1pnb+W3iByve+tQk0xmZjgfvlOrtutQ3nSsCd2oza2pSjDu6eS3
         Qtog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+PcaAwQ0PR5vU4PI0WrkTjiNqMUtnDUUt58Dd2LFEBo=;
        fh=kwEdNWeGoQ+qzejWY8qpkAe+WiVkBYVd/alE4AduOrw=;
        b=fc4Wz7Q/kki2/E4QFq7t7jJm1abXJYxz/L7KTa9rvtwUFl2GjTyncXIqCUl/aS1hMV
         pqtgHqlSOyqmID4xJiT5KQAnIOXDu0Q2mIPuXZUsV+cLxBcgxoAPKz7sXnyfTrVOJnPt
         JeJzIQT5+G9cR4L3Mifxs6M8raOeR6GiQXeDoHEBldD7surx6zOvTGFbyHbtHo2CFCxn
         UzoPFn9DkhGbnGmoguf1EzhCTbylQ2C/a0pOOmEg6zFxCzg5lj0dVcK9i2LDcBX++0U7
         MDdi4sKy3tAPBay8DuWC7hsSNGIAOwuWq/2hQ/UQrJS+qA5ajt55/z6AwFeekDhiGYN0
         S+qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795105424; x=1795710224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+PcaAwQ0PR5vU4PI0WrkTjiNqMUtnDUUt58Dd2LFEBo=;
        b=NtKSe4Y/hnOj0P0R1tYVUUitJCFSZHniX+6wzTl8PcZgRDH+nE1P7QrOm7MCun/sbZ
         zyKEeoTVIGC19JVAG7I0xGf6gHcIjbNo2eJuV10cIqv+WfDDuiHSM4TQ1y0tDWQNfXyV
         EYoP+PaXg4O9vVwij367syue8BDXdnsEf9gJprgryAV53+rBV2CSmjdQPgLeTDquxzY7
         e6iN8YmYqH2GnesvCtgoOcXZ1Y/7fB+lA/7PNvly2Dw9K1jJcsrit7Sc9tp7waT54w+g
         oavT/E/QERscgadunlxUj3WmA0ahiEqCGYHaT70lP2ofzZmXy5S1QiB8ncdi86FN/ldr
         HDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105424; x=1795710224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PcaAwQ0PR5vU4PI0WrkTjiNqMUtnDUUt58Dd2LFEBo=;
        b=C8zRVKRpZ3PFeuVEYDW4DiXTvhBCsT9VC0J5pSLeDfQkXT5oRgyyFEKDLaugG94ydh
         L7203iZolHPzdVNqhhXCXYilXQmLGGoyXoceUZyRtbiaXticGCDwdDrbvzLAoU8HV+VS
         W2smzagtJLq5KG02Zbngff+3mfKBUlVnfgk28xS86Rl672T4shoZl3PO/fbj0mmiTvQF
         34MYpQRNr2FCo0gto9muU18hrI2FJdspfO9lF/8arXT0nRlaTQ75SZnVeamcMv/+p4ps
         6Kt6apN/CYOYdm+OV5Q9FAIsM8LvGkP5QfF7LxD1BNdyV/lrFiifZZedss5cRDQa2OsT
         KmfA==
X-Forwarded-Encrypted: i=1; AL+hErFpxOWlkVWN5vMEFvxIF413TrmesZ72QpiH9nTJ+n4CZmNkLfMiej1N86MZpkGgc1us62tSWVEaWkbzqiO4nQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/BGKIFjI1auKh4bCsJOBFEd7/spVwwXTM0mKm22JV8krNmR1bs
	PQtNjIOffbOYBgxsobI8/uMs5GGy4R+E4nCBKO9rgE3heySJAKthUPxuL5kRRuh0uMrkgLL4s3H
	KwS8CszTbWgjLZCXUM2pTL01/qcAF/dgDGwY0+npu
X-Gm-Gg: AZFdTZfx98rFEu4/7r5Di8Fe9j247FtAPbUZSwKgzDvTMgLJDJFRAiAYvzLMiZ9I5U+
	YwG9cuVGkDIIVaSQvs76ANHPHsU4a7E8YauKG2R8IUxSDwMsM5rdEI2jHJE7o/JnkBPHazFLjM7
	jBRDuAS+ZxmzSmFHaM1e/eJCs4XHxB4kqfyxNimJSLfiMG7BCt5Ewq5ZG/WUHDWW7AaeXvgegn8
	tuNvLltyVmz7l3t+WIzEfEpURh9FhlKNMbGf/+IRrSDgga6tWdafaez2khQXGWi76y6dYmNC/Xx
	iIfk04ae2F6DlCAzgSpxFdr4BqjkTopuBOHk28Hla5uM4XYTNIuNkBYR9l0Q6kfI4FKFshFUZAb
	fCQel+WXe6BrE2mQcgOIr3xlxQuL8fB6zmJzZefG7RqhfIPGpubfio+qo+NT+DYZLCj8i8IcwiF
	Frxtb8LVBMCVvgIhER569xemREUlJ3KJw0/8BQD9nC+GeW
X-Received: by 2002:a05:6000:401f:b0:48e:7475:fe7b with SMTP id
 ffacd0b85a97d-4aa545e305fmr3959097f8f.6.1795105414756; Thu, 19 Nov 2026
 08:23:34 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com> <20261117-tyr-remap-2mb-v1-2-2a8efd4c8180@google.com>
In-Reply-To: <20261117-tyr-remap-2mb-v1-2-2a8efd4c8180@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 17:23:22 +0100
X-Gm-Features: Aa3M54q16wzTGtbS81z0CLg8Zo7Ll8Oq1HQJT0nxCo6CHGOwHrlaM2Dzo0-8z18
Message-ID: <CAH5fLgjwOypVwBGaac100KiyCCwb+SqQU6Fz=CO98tJCd3zG4w@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: iommu: pgtable: add iova_to_phys
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Robin Murphy <robin.murphy@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 8:32=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Tyr's VM_BIND remap path rebuilds the page-table mappings that a partial
> unmap sweeps away, recovering their backing from the still-present
> entries. Add IoPageTable::iova_to_phys(), which returns the physical
> address that an iova maps to.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [aliceryhl: split into separate gpuvm and iommu commits]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Joerg, Will, any objections to merging this through drm-rust-next?
