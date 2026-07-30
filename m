Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71623FF1B5
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jul 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422454; cv=pass; b=HeN1oYNDlYRfnBMcDW393RH6lTgnh52h2J1vCMW8exHD4Av38tErTcc3Xkq4jYlda3H65Ep00ZkzHQpn0dvRmXszHR1LfGqlZloV/8P0vGqRzuxSLRVPq39ICdzblHi9V7PaTeWQmyFMFTqA9rP3OdRJ38K5I8I68J5GzSSIAko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422454; c=relaxed/simple;
	bh=fZdZAF1APMOtwxbP6JCTb6P0d1Ok7BxFAmEp+Cgdt2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftXOcDLQYsZoRDC0N8JZp56FVAmthIIId4wSvCwz0+6pYmwbZSfcZT3cXZLRgHr8ulsACcOgDwYxxCD1z1wlcwxA33aYPnMrn5vXamtS1sx6xohlCbgLnB19EuEMS+2kaGAcYnZnkcmcfEBdZprMr2YYGLSReIa72e4wkXiMo5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ScDOuYNV; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ScDOuYNV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954aff6088so20239615e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Jul 2026 07:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785422451; cv=none;
        d=google.com; s=arc-20260327;
        b=F+6RVTPwtKmQA7s4FK3khMFo2NusCHNe0v4XOU19TUahkO+IG7dAc05/hPTMV6IIBN
         qAiRlbPYvbhLqkATYjEExr9WMrRzX62BQ9iVxUYpTimbd4RoHYJW8OcdZ7EP+QE6uznr
         MTH27KfmbO9kWiCwqf19HvKrLkSzk6Ys6+R492pgQV/Gz7CVh4idFnkyFc+wqFAg4Bp8
         BX/PB2a80Uhhl10vDhrUM8MABCMPn+frkMx/CRDBBvfL6WEG0MgXJF+HLKxcYrtDs0hM
         Pd0hOqq9AVFjCEzTLgGClRBzVvRpE/f/P0QjD02rO+EK10HNwVVDd7tlEZnyqdE5CBCw
         FPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0h4L6ZZlh4KX9plECryTj4sQK3uBKcjPF4+NlpXzhRY=;
        fh=kVOpNFC+4WOzu4IVLQ5a8pGliiqZWPHasOF6/9i7r14=;
        b=lFHciNSp6zGtD/2ri4lED6wjqSMmT68N1TcXSmrHUwp0KqJdqU8Fp+KviHuV+WjE8P
         meThDTX4rufGDB3FakB0sXi0ZZr64nTYDc3d/8LW12budjly29i8jnudMfCf3OGI1uxw
         sCkYlmUrSPQUEf116MXTbo1ZijEHWEpS4REh5WQ7cvutdMC6AZ6nPMVZETaTEzDfHB4j
         8CLLvtgZrh2M//ny31gyWy0q9KI88eSPqVxEDgvoMolrV9dPLYcrM7J9m3CI8026DQz9
         w+UYX1j4yvJZQvBE6tjmO+7tV2d+oXxvrtL1DaLWwWtJyQqEDqwJW8qw0KRRbsJhuyth
         7TPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785422451; x=1786027251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0h4L6ZZlh4KX9plECryTj4sQK3uBKcjPF4+NlpXzhRY=;
        b=ScDOuYNVmhR6LwNPvL1RWO/qxgmJLUdtiLKBE0n1yGcGYPmUWDQ7a8sxlL23i2+Nl5
         OkAJ49ZYaHBIH+EHR/FtlSKURFc4SALe9nY6b3imuaZzpChNkD6Qu2YaH505Zlm0zteS
         tSNz0IGbXyz9ONJOuT6scwScxdCwPmw9ep5Qa6l9U+3C1dlKx+GGv1Bt7e6hhu8ZuJJl
         4qYktb3aPAENhCgVsF8kQQG4cGZmXIfH1t4QfcMof9yubgktIEXkEGUItt9yzzuABTTQ
         7/AAClXcMy+BVaiIulm48vO/M6Ecl7JpJqUx9PZy8LhoyZEET/osnYUfdGCuPqmWQ+pV
         nJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785422451; x=1786027251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0h4L6ZZlh4KX9plECryTj4sQK3uBKcjPF4+NlpXzhRY=;
        b=NWxWwGUZL+w5eD2WS2wwINQ05P0WTtqfuWKViC+/REZdhj/i3pfM11u4xbBKB7ux2Q
         EJa2cI7VnJgt1hhfq+yMDbyXCLY6zJC0sQtRlYiTz0ajA6fN9WxzmydyhZFOiZ21o5AM
         VLL2raPkkw0cxQ/fkQGM+gfg1PKuiAOUXl/q1ZCQN0T0wXGstwntGjz2+6j2QE8VZ6/0
         Zuj5/6znRMXk0a2vvpREg87D/dFAM9W9qA52qAY5AGAOUnOavcf8Mtlqj4hrqBcEUSTF
         rLXPasgDT9JXm7KFIUaUqLiv1xpHGKoBRU65JwHDXvIsjxlMMwOTyTBD39knb95oR6zn
         C2cw==
X-Forwarded-Encrypted: i=1; AHgh+RoLcAhXbWewub+Ul8ZINPDPNi9JFN9FWqOsb5o1BcU3LPOwz0tuiDwDdefZ+dJ2AdVSmvI9YqUxilUZn3jbsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLQwWLz1mjvc3VIbZCj9JgR1s41lO3/XeGttD/M51bRuRzhFj
	kHAik9p4wiAc/dDscAAMU0S3+wDVnrAVILyxLerNsW8SeCu8kXBqzIe4j2VQOMI/AOR3Yx02byG
	n1iOKaCJYKS64Q9KhITbiqbLe2HLVZ5r0P7Gm7wSV
X-Gm-Gg: AR+sD1155orpE9rIBstl1qUfoU3Z+puWDuEIafa0yTVQplECgkN4J04feFhgvCV7LPJ
	8lYJg6KWO4zmeMfAmT1zzzlz80sWE0199i+9cUb6l3diWoB3U7ek6bCEVZPfUvDZw/eE/wpMqmY
	u7GUIEJwVNwFpcM210R2bN8n+7BVpDE4hJ2Tos9pZeCFb/cNrm7ZYWV1weLbgRh2J1BAREULKV4
	58yT0jd37jWlsszhkCO5OOghSTL+JTfjzOvKTn74WoKkfokNSEkAEY5SLMBWHvfRffmIaENIHAm
	+ELRp3FIfTaY0aG0gatBSMsCkF4onBEgv06/E4ZsrAeRp/DWhzsT6kFOubH9PIcnQJdMdbnjIBB
	lVgBnDI8MhZT4PR2B5EwOUxaCkw7z5nonW/8nBehJ/g==
X-Received: by 2002:a05:600c:1f90:b0:497:fecd:5b00 with SMTP id
 5b1f17b1804b1-49800e74e48mr38422095e9.9.1785422449384; Thu, 30 Jul 2026
 07:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-fw-boot-b4-v10-0-9187aefa3f2f@collabora.com> <20260728-fw-boot-b4-v10-4-9187aefa3f2f@collabora.com>
In-Reply-To: <20260728-fw-boot-b4-v10-4-9187aefa3f2f@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 30 Jul 2026 16:40:36 +0200
X-Gm-Features: AUfX_mzyNLZGudhHOpdwT2kf52dlUa7XXgnvD89wbxfCaynMAVOKUqhjF20Pn20
Message-ID: <CAH5fLgjDoWT09Kdp0Jtg=XtmWVdnUM71yT_TsQG+TX1RJ6GqaQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] drm/tyr: add GPU virtual memory (VM) support
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, laura.nao@collabora.com, 
	samitolvanen@google.com, lyude@redhat.com, beata.michalska@arm.com, 
	boris.brezillon@collabora.com, steven.price@arm.com, alvin.sun@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 8:39=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> Add GPU virtual address space management using the DRM GPUVM framework.
> Each virtual memory (VM) space is backed by ARM64 LPAE Stage 1 page table=
s
> and can be mapped into hardware address space (AS) slots for GPU executio=
n.
>
> The implementation provides memory isolation and virtual address
> allocation. VMs support mapping GEM buffer objects with configurable
> protection flags (readonly, noexec, uncached) and handle both 4KB and 2MB
> page sizes. A new_dummy_object() helper is provided to create a dummy GEM
> object for use as a GPUVM root.
>
> The vm module integrates with the MMU for address space activation and
> provides map/unmap/remap operations with page table synchronization.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

There's a 32-bit build failure :(

error[E0308]: mismatched types
   --> /home/runner/work/linux/linux/linux/drivers/gpu/drm/tyr/vm.rs:873:17
    |
871 |             pt.map_pages(
    |                --------- arguments to this method are incorrect
872 |                 curr_iova,
873 |                 curr_paddr,
    |                 ^^^^^^^^^^ expected `u32`, found `u64`
    |
note: method defined here
   --> /home/runner/work/linux/linux/linux/rust/kernel/iommu/pgtable.rs:152=
:19
    |
152 |     pub unsafe fn map_pages(
    |                   ^^^^^^^^^
help: you can convert a `u64` to a `u32` and panic if the converted
value doesn't fit
    |
873 |                 curr_paddr.try_into().unwrap(),
    |                           ++++++++++++++++++++
