Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66F379EF5
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600906; cv=none; b=BjHnrGlZPuaMMqD+aBbKgwex+z50Tle+lV8ractBzAC5wswSjq2pux3t8i8iQ99L7X+wcq0L/4dzrT4qyZ9oq3m0PObzC9CyZqY1z908LC3aawUgneWTdZJi093GXKSBELz4el62K4Fn0DLpn79g91Revd/KMBtH7klVxFHuaEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600906; c=relaxed/simple;
	bh=hNQJwkNnRZM1onHW6fMZZPv9B0rh1E85+i3frTbTWco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izVfPx3gmPY1nxHn2lMw5oU4IgvJWT4X6CfzAW+NnqzkiUUdRiPA/qzCNsxRb2v1iI2JDSFM+jYErmCZb4PC5UwXn1BVREfQVgM4KjTfT0+HVkN/VaqRiDIZbaQqaP8ZJQRXE6gU53ecAncnhBFuPbrU3HQf3hY/2zna0zF7DJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rf8jZuVy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rf8jZuVy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2055573c8cso603782666b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 12:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787600903; x=1788205703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irfg0xHDxtBcVMGyL6ULAXhB1SaYDLc0s9Lgku2rCW8=;
        b=Rf8jZuVyj6iImfGSdnlxB78FWH1w8CsWGzOQlYIVoiwNNQ80H1Q9cLyZ7I8Woq40ah
         pRvWfT3PNz+DJadDv/n7qr93tphQZztI/YiezksQsLV89XcPJ0uVqFhMV/zbZtMNvul2
         SH0lmfhHFi3qK0LXI+5zgAsc69nQZS9FYbkfXicmN4JUdYQ3lMrnwLy5ZZxPiZ8fZPcs
         OXgA9NyFXtnfYgwzQjwZPozzcENzZWEHxLPNur/tNbsWev8z0PM8MC9gRl+WpJP3wd3a
         CBRKyNv/ph8xJscqi8ZRONeIi0qJDNlrXoodYE51WnfgCZH7y9yZn9QUw50SQ2bMgpTO
         Zo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787600903; x=1788205703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=irfg0xHDxtBcVMGyL6ULAXhB1SaYDLc0s9Lgku2rCW8=;
        b=l01HxhnoJcNR2TwzjfSbjN8S5dTaxz3MjRSDlYHYlNTnpdsLwtpI1cgkTszs14s+il
         OOSAN0Kjq/Y1Mqjq26f9684K6QpmVHJ959FBP73MjHJVRQF1KSDXJmjKS8aqUL5y+Fmj
         0Y/2AR//3NBWPQYqT0jS95HU2kvbYGIF2P+xtCmstl/PEVZqgctUXxGFhHtvTpTjgU5B
         /JeD4bKpOYjcnXGXilFJu6dzeNfzF+wGAgqccjw7Jdj/Y+9XQzBPhNUoB1ixm21MVIr6
         +BB4HMO5FurxHwvZrWG4/bKhawhGSrx2mosAP77t5RZWSFzcHjZZloK5kcFugR/vdPNg
         Bc3w==
X-Forwarded-Encrypted: i=1; AHgh+RqSyWYrveuyZZoTG8wqOnys1aTDyuLhESC8GrZAUzpbkCMI5n3UK/e0hALjW7U8XXgjiAYEPKqzP4x5QfnSDg==@vger.kernel.org
X-Gm-Message-State: AFuF++lnwhOWFG3rov86szxp39oDkowkXpuPTAP/Y/f+u4qc1QLSdgWw
	KiKZVQpQf/bp8/1QNQigjmUWyyHBZPkkWFq/inNmj/MRCYGNHufl6FPo
X-Gm-Gg: AR+sD12P1F0cNnrVyDmK8eywmOzBTk0EOFVLu68sgwtIGaGFaLEUC12jmkZdDge0v3w
	+yXp1gPEjZFrzp+KLG6qve+rUjacC/2PRxa/OjbgAAs7uwXkUQ6aDXX2WCBwEDzrgTxlRM54pgV
	+wJmvtIiV9gZ0qjybS44CxAQhh2a6GX6dGr05FSLQL+T3SUHmeqYK67xAHltilOMjhD6QvCAb8Y
	uwg29tr4SP654pH/JFlDpWdUomV3lbOa38Jyro5PruWWndF3n1/Tw5U339QfwPE0Io9buy7eU4W
	tvYI6DvCxFYSFSAvW0m3os53xQfx/MQsK8a1ClTTphBqFTNxCSRfXmOv0BxUiMAQ0gJCfBPyF6m
	S/Uknl2LvVaaY05obNAsFISTp7SyoyoBD9SZvo41kXkvUsF0xf/5YPx3jL8lBqOvMWolP50K4AA
	KpC1uUQbdXa7jzUhRzEpwOkp5mGOyVXzenTrhqeoGbQ4G/D/qAHpIEIgxB7AHISLqPSJlE2mX2M
	Wvb2+a+gPJ2y8a/E+Pk9FVsKYNswZ5Za89uIibyCgCE6Cx9JXKN
X-Received: by 2002:a17:907:7a8e:b0:c16:9043:7973 with SMTP id a640c23a62f3a-c249257c10amr2243253266b.4.1787600902724;
        Mon, 24 Aug 2026 12:48:22 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-2.dynamic.spd-mgts.ru. [46.138.191.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f6ad2sm1426659766b.30.2026.08.24.12.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:48:22 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jann Horn <jannh@google.com>,
	Carlos Llamas <cmllamas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Deborah Brouwer <deborah.brouwer@collabora.com>,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust_binder: check ownership before using vma
Date: Mon, 24 Aug 2026 22:48:08 +0300
Message-ID: <20260824194808.216021-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218-binder-vma-check-v2-1-60f9d695a990@google.com>
References: <20260218-binder-vma-check-v2-1-60f9d695a990@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Feb 18, 2026, Alice Ryhl wrote:
> The plan is to introduce more vma
> abstractions to avoid this unsafe access to vm_ops and vm_private_data,
> but for now let's start with the simplest possible fix.
[...]
> (We probably still want to do both, but
> the vm_ops->close callback will be added later as part of the follow-up
> vma API changes.)

Alice, is that follow-up still on your list, or would you rather someone
else took it?

I'd like to add the missing pieces to kernel::mm::virt: a VmOperations
trait with open, close and fault, a typed way to install it together
with the private data on a VmaNew, a VmFault wrapper, and a PFN-map
typestate next to VmaMixedMap with vmf_insert_pfn_prot() on it. Binder
would then drop BINDER_VM_OPS and the raw vm_ops pointer compare and get
a close callback like the C driver has. Tyr needs the fault and PFN-map
half of that for its user MMIO mmap. The first two patches of
Collabora's Tyr series are the pgprot_noncached and pgoff helpers; they
have had no replies since 7 May, so I'd build on those rather than
duplicate them:

  https://lore.kernel.org/all/20260507-tyr-mmap-v1-0-eec048a23c25@collabora.com/

One design question first, for you and Lorenzo. f_op->mmap is
deprecated in favour of mmap_prepare, where a driver sets desc->vm_ops
instead of touching the vma, and the Rust side only has the old mmap
path today. Should the vm_ops abstraction be built around mmap_prepare
from the start, with a Rust mmap_prepare hook for miscdevice next to
it, or is landing it on the existing VmaNew an acceptable first step?

Artem
