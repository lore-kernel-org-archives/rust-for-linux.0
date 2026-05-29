Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE43A873C
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 06:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036518; cv=none; b=BgR7OT1qPUHbRHVWpKZoqyNiAwFc1rMhU1s3oDmhbKsWGBKQEi0ZGiaCSHjFE/lnZX4bWtDLF1+t5f//r4O3zAHTKo/ywS6lxOlSRfmfbRrBj4m4nlBXphfT9cElABbF4qXjPZoLQqZOFmQ/D1dHTx+5ZqgIBa46Nh6cprZNdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036518; c=relaxed/simple;
	bh=UB0vYNs5kE1ipo7MlQ9MpYkZ5a7jIsorqawZA5IC6z8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E8CiN1SKlDWYtfPGGnf+oj2Osj49NT1HofXfPlH5ipMOOc1oouu689aVdLh+KLDUJU8axvyzLRDzRa13NMaeECPpJzUekqwqiUXN5f7VmOaZZJ5laoX9nK5F2TM77xU/9qeES3se/dJEWi28ja8r7LI3fRX/C9FzJafokStzGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QBNJtwJ9; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QBNJtwJ9"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-bcbb3e56f10so222107666b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 23:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780036516; x=1780641316; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsWxvz1VFMbQ4Xbd8745ryXSBXJl1E8yn89Av4WaNmY=;
        b=QBNJtwJ91t6x/X4zW97mfDtdvotXtSENy1gDk9vNCQRz2N4v80Tmv1gJ/qFzeoCoeh
         wvyF0OoB/tuaH9PzRaW4gxbmp3WAwpjhHQyc0/6KdtSs5rBREZifkTJOiiWtO609cAsF
         rsr16UWAJcnpi5FvyTjBPK74OzBnjfxeZ6PXwHvudUqltD8qJrtaaH07r0pn/nPrR8ea
         B4HLdKbcAcuoPm/2IbWNBRpsKB8SCq3Xjjp9H8R9NMPpI8C2KE52mowUcvMs6jEqM48e
         R5B2NbgNxNn423Mvj3kpY3K+GPOdNssRqZG2hguPeG1kyj7NuxQisLhSdfv0CGR3T45t
         4RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036516; x=1780641316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsWxvz1VFMbQ4Xbd8745ryXSBXJl1E8yn89Av4WaNmY=;
        b=BKVjJlfRS0eNilLYUclpl5SmHSu5+V58bhwOOkQLK23lBBdjkQ4B95emMHR1e8YwSO
         eeAowpamKY2NSrs4DKvS6/dj9vG2z6nUXygCNttENRxZAzKY8ePAwXDtbxqiU8uomQaT
         +M7GI+sEj0JyU4ivIMDucybGKRG5OqkV4PErnOWMkQ17pKrIUggBdF/pKcg8T3uMd8tf
         9p10y4nhPntI07XJsSCpiVPVxkh9TBnmI8zBpSPG3YVX61dUDYmhyAcczFdmmKSgS9fU
         kX1n69vMJA2A4HwFqaIBSrIef/+DEImaCo1YftFPDGXxC5u5XSRDsZu6QMCquMyuHnq7
         cOVg==
X-Forwarded-Encrypted: i=1; AFNElJ9DUDeJlO4tOfUGiXmpX4BdUUBynb/UQZ+M6pfUGca9Hx+0tUMwI8wpcVUiAQ4tRvNCAa/H3PGiOWAlRhE4iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRtuWt/4xCWdnOVr4TBgZl+1+oep4nk4yIRPW6ayl+xZFU8BPt
	OdT3lXVwJ3/H7KSaJavuQ+qzIf6eFplRyDKZ+QHTp58ni5zOQ7uI3GwnyK3IKsKc94YZMoIoboB
	aHPYaL3inKuNzyDU3qQ==
X-Received: from edrw18.prod.google.com ([2002:a50:fa92:0:b0:68b:6a59:6df4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2499:b0:68a:f749:609c with SMTP id 4fb4d7f45d1cf-68c1271dee1mr590153a12.21.1780036515539;
 Thu, 28 May 2026 23:35:15 -0700 (PDT)
Date: Fri, 29 May 2026 06:35:14 +0000
In-Reply-To: <202605291041.seNEWvLQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <202605291041.seNEWvLQ-lkp@intel.com>
Message-ID: <ahkzosbjO4NdSyD8@google.com>
Subject: Re: [linux-next:master 3728/9137] samples/rust/rust_driver_auxiliary.o:
 warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: Alice Ryhl <aliceryhl@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: auxiliary: add registration data to auxiliary devices
> config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWvLQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module_dtor+0x1: call without frame pointer save/setup

This one looks like this bug:
https://github.com/rust-lang/rust/pull/156980

Alice
