Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6E30DEA9;
	Tue,  2 Dec 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671142; cv=none; b=AUIdY+Etw1d9qJa8bZI6OjsIUB7xOh9ta4A9qy6gywqjhYmmR1rUC5ZY6QpgSm96CezHvLGoko229p3kzuDSJBpmr8kC3jPjoMapZ7iIkLo/0xsGLRFvwqcpaPWuq9VFYZ/Uz0aPog1wDpao3X4b4Pj8EB/FIFhvWbf49eulWYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671142; c=relaxed/simple;
	bh=8lTZU/HyfdYlDG92zJ38DX14b1y2rKJApb/uX5eJd7A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cydz3O9bs4vLTA/vPZE8cwfjJ50F4DbNbcGhhcVshsvbaB0m/omdwGHSaj7oDeOefMKFewoJQZHftltmudTdtMmE9DU5WkNKyzAfEd1ELm0S9jH24j37I+AsWYDjrrbSoUOZwCfFraDuFSl4U4ZJ5KNUhbDYvYsRkhzVzyst+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=UuQHiFMH; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="UuQHiFMH"
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1e:489c:0:640:8d6b:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id EC209C1890;
	Tue, 02 Dec 2025 13:20:24 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id HKgXvG9LOa60-BR37yYN1;
	Tue, 02 Dec 2025 13:20:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764670823;
	bh=hJjZl1M4yR3D6+GLX+gICtn9USEgkFcjGTBhKcErVaM=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=UuQHiFMHy0lrgJoYO5juGN005t4YcebpWupZaILDT+tDo5u4SNckezySSIPWLXA2w
	 p6kVWMVZ+km4hoqVxurGKQYZ1042SrlYjnnrDn2iGYv0YbahDgaYQBkvW+lejkxoZx
	 upqI85RHy7nFlmWrNDOz3jm7YcLHxSneINC/k9Ps=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 2 Dec 2025 13:20:16 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: kernel test robot <lkp@intel.com>
Cc: rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, lossin@kernel.org, lyude@redhat.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, felipe_life@live.com,
 daniel@sedlak.dev, daniel.almeida@collabora.com,
 thomas.hellstrom@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
Message-ID: <20251202132016.653e1fa0@nimda.home>
In-Reply-To: <202512020943.whFrDsXx-lkp@intel.com>
References: <20251201102855.4413-6-work@onurozkan.dev>
	<202512020943.whFrDsXx-lkp@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Dec 2025 09:49:34 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Onur,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tip/locking/core]
> [also build test ERROR on rust/rust-next linus/master v6.18
> next-20251201] [If your patch is applied to the wrong git tree,
> kindly drop us a note. And when submitting patch, we suggest to use
> '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:
> https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/rust-add-C-wrappers-for-ww_mutex-inline-functions/20251201-184152
> base:   tip/locking/core patch link:
> https://lore.kernel.org/r/20251201102855.4413-6-work%40onurozkan.dev
> patch subject: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx
> and MutexGuard config: arm64-randconfig-001-20251202
> (https://download.01.org/0day-ci/archive/20251202/202512020943.whFrDsXx-lkp@intel.com/config)
> compiler: clang version 22.0.0git
> (https://github.com/llvm/llvm-project
> b3428bb966f1de8aa48375ffee0eba04ede133b7) rustc: rustc 1.88.0
> (6b00bc388 2025-06-23) reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20251202/202512020943.whFrDsXx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202512020943.whFrDsXx-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0609]: no field `ww_class` on type `ww_acquire_ctx`
>    --> rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs:110:41
>    |
>    110 |         let class_ptr = unsafe { (*ctx).ww_class };
>    |                                         ^^^^^^^^ unknown field
>    |
>    = note: available field is: `_address`
> --
> >> error[E0609]: no field `ww_class` on type `ww_acquire_ctx`
>    --> rust/kernel/sync/lock/ww_mutex.rs:252:49
>    |
>    252 |             let ctx_class = unsafe { (*ctx_ptr).ww_class };
>    |                                                 ^^^^^^^^ unknown
> field |
>    = note: available field is: `_address`
> 

I got a different error:

  CLIPPY L rust/kernel.o
error[E0583]: file not found for module `lock_set`
  --> rust/kernel/sync/lock/ww_mutex.rs:27:1
   |
27 | mod lock_set;
   | ^^^^^^^^^^^^^
   |
   = help: to create the module `lock_set`, create file
  "rust/kernel/sync/lock/ww_mutex/lock_set.rs" or
  "rust/kernel/sync/lock/ww_mutex/lock_set/mod.rs" = note: if there is
  a `mod lock_set` elsewhere in the crate already, import it with `use
  crate::...` instead

I will fix this in the next version. It only appears in the 5th
patch of the series.

But I have no idea about the "no field `ww_class`" error yet. We have
this [1] change so I assume something didn't work properly with the
bindgen generation? I will look more into that later.

[1]: https://github.com/intel-lab-lkp/linux/commit/23ba7e6a3f593455a

-Onur
