Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F5436CDFD
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036814; cv=none; b=RR+FCQFy+0SqGNmhxll4SFDmoOt/3XIr7zvPDa+VIMB4BZxysouh2ZfKO+niXfyRomRFYEt8ETGCBAa0n1AJUtN+LXK9mP7I73mO/MKExGxiLwND1MzttvEbMHGNZ/2NhogEEYkbed0szcetWUKuj3Ls6DCHo8ybAuk++LYWARQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036814; c=relaxed/simple;
	bh=VfSPnwNmcCToeHVyoFgUNWFuPFuS15KmrkjsX/FSLlc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TdR4c0n18x+blR/ctImGkXn5eAwcvu4adj1ZmgTW4ImvQx9FGrezN4JyeLhXEY4+jnG4FmvywJ2bxWhES2eQ5G36hQJlfn/+rpimLSaHfoqoRDgCRamPhGntC+/teYumh9LiilEljgD7pKKUZeOCKElbUe4hSCpA1C96XvYbDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I/STDpG5; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I/STDpG5"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b9c1d1f7e5dso64654766b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775036811; x=1775641611; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1/nc0ehyBBXww3UZTY2ASuJAGtF/VPUjdEk4+NSwwA=;
        b=I/STDpG5Bk06iUfmrlCVkdFG0WBbJzlkF87KAn0AXaAfwF3jyuCx+MQRwQMDN+/d2P
         Bs/4yvivzjQpbiO6FKlNtQTrRiqE1DEdgzruUtt/wYs/R8ePxvskKWQwMOhyeDTlwwv8
         BgK3f3ht0bKK2h8Hmb3SUoWS5VdYCfWHuwI7Mv4HquOKKHuzyTUnBPIlFnn1wkbRsPnL
         Wg+s8ZZFxyyvAXV3Ci5q9dQRkuZbHBo3m6a4/OkW4pVJpo2CQ3HhPiEZZL9vj7OXzHgC
         t4QjgQeA2BAczsjWArii0JQLQzucI61B2mYZprbdsbS7ycvNGNGv09u++OZXZa7AKCMp
         KReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036811; x=1775641611;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1/nc0ehyBBXww3UZTY2ASuJAGtF/VPUjdEk4+NSwwA=;
        b=Ja0IGsEwsYftFyAevE7CakAqM4+5hzsT2IQwlPu52oOfDV6fyCeXvkC6u8QXHJXuyS
         OGoRDA+UVDqdvDcw3ANCdl4B1SgFZ2DVLkbs3oDwpd2De5ky2N3mUMRJ4l04x1c1yOKX
         qoWpx5YdeuuTMBUAg7+kfRZcaO5Znb8hXZx6wTa4IpCTFRDekYEyeFdc6dl9iiv6rsz2
         68iCwQzfiFFRVqUdjCBqWjD90lDvVRf9BfDFTftfq5bVPr48bvoJLSffOGBopHTLLqFe
         wCEwu9BO0eFFnYom+GawqIDppn4fDsVyHvbWijz68zmlYA60Uv30bWGup+Gsn5D6qRrT
         Di5A==
X-Forwarded-Encrypted: i=1; AJvYcCUY0IGv/shqjafwEHQ7/3wUl5LzyUA+ZAe3xcZrAisETLiKIQI6IsCSJ6Q257WE5NkUGX2jfCkFROnB17Icdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EI/vyEACdI+SF8RYY0/hQ6HVbl8A02etfSwCOIv7rFV5Pwua
	k9StfwdpJzWGOsyLnO9mTOSuGuBvf9yZEh25KE3PLWtBWnF7fI0kbULyhVLXKeQPD0jqX4/Oyot
	8qZ4gDwMjH2RTbAhtwQ==
X-Received: from ejccs11.prod.google.com ([2002:a17:906:dc8b:b0:b97:f2cc:8c21])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:5784:b0:b97:a0d6:f6b2 with SMTP id a640c23a62f3a-b9c137b59femr159048566b.4.1775036811331;
 Wed, 01 Apr 2026 02:46:51 -0700 (PDT)
Date: Wed, 1 Apr 2026 09:46:49 +0000
In-Reply-To: <20260331224319.107082-2-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331224319.107082-1-jhubbard@nvidia.com> <20260331224319.107082-2-jhubbard@nvidia.com>
Message-ID: <aczpifqz5CoOFB3N@google.com>
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
From: Alice Ryhl <aliceryhl@google.com>
To: John Hubbard <jhubbard@nvidia.com>, '@google.com
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 31, 2026 at 03:43:18PM -0700, John Hubbard wrote:
> The SZ_* constants are usize, matching the CPU pointer width. But
> device address spaces have their own widths (32-bit MMIO windows,
> 64-bit GPU framebuffers, etc.), so drivers end up casting these
> constants with SZ_1M as u64 or helper functions. This adds
> boilerplate with no safety benefit.
> 
> Add a DeviceSize trait with associated SZ_* constants, implemented
> for u32, u64, and usize. With the trait in scope, callers write
> u64::SZ_1M or u32::SZ_4K to get the constant in their device's
> native width. All SZ_* values fit in a u32, so every implementation
> is lossless. Each impl has a const assert to catch any future
> constant that would overflow.
> 
> A define_sizes! macro generates everything from a single internal
> list of names. The macro takes the target types as arguments, so
> adding a new target type requires changing only the call site.
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

The name `DeviceSize` seems overly specific to the use-case you had. It
also makes it sound like something you would implement *for* the device
type rather than for the integer type. Why not name it something more
generic such as SizeConstants?

Alice
