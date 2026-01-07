Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FC13A7F4E
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803586; cv=none; b=Od6fZBysNCdWMWnXq6oEAgcw9u5IFrlFJ4ZJj3om09TKHPgtv/IuIuusLfP6zQJLn9D6FR6zNbIEohBaqnV3FVTUK6wrdsYoE9xeztkZYDwih+JkwaT7CPVY5NpiwYz+sN5jmFqHVVPBbLetc6/DjWFTd+Ty8fsybZeuEzS27/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803586; c=relaxed/simple;
	bh=Ylqfh+TJjegPEk9aD63ABRBsETtBUTp9+uJMKX5IjPg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KoAgIbnA1WgFlUDVoM5quPAu9nv3sl+w5S6punvQVVpj/mJNpKQrRAIxsgOPzxb8xIFuz8I/JL/uMeG4lw7i4LyxGnPARlHP4JXA7fWIvhAnMJl79ektu3smge6wFA6+Y3pPN1htM9L1kl1AVJhND7W8bS1KxpmXaNerEeB9HVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISsF2NCS; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISsF2NCS"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b1bfd4b3deso193283185a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 08:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803575; x=1768408375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V74QBoiaIokZEZXv4naUX8IYVCPZvYYUxNJDmaeu4lE=;
        b=ISsF2NCSkBqY1loJpXVPuNpPAwFsM8gr8vTNo/HOZlVm2MLWJKzSd7j5KADykE3fJw
         kT6iNVzV5eRiDYk4AU9ntDZ80bVP0gQ6nflxlvjsf2R//asAPxjmnBweAZLvOC+MyXgO
         201klL2zeaKHGBDvbbnWKNQty0chz6ekgfiCCaEEkuNSTrSCoIzvcaRkRArd+sHHX7xi
         GrZfirCdOMhb1pFjmSp/BINrpZw6munT7yVw3u0016QApWfefLXr/QCoCmtfnwjrSq4b
         +VbvcWPCmfCcahYslx1sznrYCVofC1mI8SF5iKJvrdBFDxbw4Y/8pVJy2ksFOVeQ4bmr
         a0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803575; x=1768408375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V74QBoiaIokZEZXv4naUX8IYVCPZvYYUxNJDmaeu4lE=;
        b=cci7eAO3gGoMUgkvn/9RYeS/xk8wMITXnqNpJCdgLOD13sh+DBhHF8PxcXcoHuPWi7
         EqOBpP54jmx54TPLnMyiseHjHhkq4u7KTtQvli3sczFQXijyEMzwN9MM+zbfCa70Pgji
         fsT8P12Mxcg9gTtFPNxNkDzpBJuIkQmt2JAbpmHVDyBWi82UE+utHO+q7ah7LT3pRDZB
         +7+7N44rWmOcgsu566pjvCC1nOIBpOcQxV2yfFB9BFvQXqDWuDx3IM70xYqc9uFYChl0
         PA0FH1KBpS29+vGUdjjrEQiMBPYkJQ1f+ZKhs2rxGySkchb6leZe+bfSu210ZPPw1Wxk
         +VTw==
X-Forwarded-Encrypted: i=1; AJvYcCUXZrzzQ6LJDkT6GfBZ/6bEidDZYAo6RCsmoIUyf/OcBBlE97KbD7iMJS4gHJ6C3zgcqhkje4zOfRA6if9Fyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmQnFS9lMrgSOLS4L+TpqxYi0BOrVgQhd65zZl1mylp5wmAZ8E
	vLJRlyufEClLD6HyKFIKpax3aTkzqsu3aqK80F+jTb/JW4voqBqltU9nOb9mgA==
X-Gm-Gg: AY/fxX7CK+J1dftbEJPZAF620TPctrfa1pAXZRMR5dsbOIGUaTkdaL7P/c/HH4MKmR0
	9te5xDL/CFw6iOtSuJTbj5DGyopw4lQvJboYc4s6Otq/wuR/Qmvdef+rwXnr7bPoGnLue1HO8H4
	gY0ERgcmcpDpHr1W33mEzCP8nEIw6g60wvKRFQqn8lFkwP/UsKELCDQtBF/pJedJ609gjDUsdZt
	zDblbhYqP+6YE/HLwA0FKHaBsZCr0DxWm1Mr7qNA0zAqM41NoTMtGNFRrN5IMS+5fIP4b+sADvQ
	ub88mxtH7Woa152rPSgWTlFRiA8IlWgUPSuZ0vbs1FhSZvx3RkAoVqmTQuXJ9KZ1ErA9Xb+QANn
	XLIUh46QimC5nwOju5fb3gffXL2VBa2r1xxPIjX/513l9kjTlMueQwkMoNChhZZvgwOsaPl4yeo
	1a8F1Pnmt46+aYeoLvNXXfnd9XGI6z
X-Google-Smtp-Source: AGHT+IHO1B7pLAzmJ6wLxgXtaO+W+HHVEV9FLh1Py/Ua+ID0bIyLjqIZ10smbdCbZDSuEgCkVO+QSQ==
X-Received: by 2002:a17:903:9cf:b0:296:4d61:6cdb with SMTP id d9443c01a7336-2a3ee43de38mr24543175ad.27.1767796794253;
        Wed, 07 Jan 2026 06:39:54 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:4a:8f9d:b0b5:f6be:9de8:e39b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e26sm52577155ad.48.2026.01.07.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:39:53 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef and AlwaysRefCounted
Date: Wed,  7 Jan 2026 20:09:35 +0530
Message-Id: <20260107143935.5757-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jan 03, 2026 at 05:28:31AM +0100, kernel test robot wrote:
> Hi Shankari,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on staging/staging-testing]
> [also build test ERROR on staging/staging-next staging/staging-linus rust/rust-next usb/usb-testing usb/usb-next usb/usb-linus next-20251219]
> [cannot apply to linus/master v6.16-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Shankari-Anand/rust-i2c-Update-ARef-and-AlwaysRefCounted-imports-to-use-sync-aref/20260103-061451
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/20260102202714.184223-5-shankari.ak0208%40gmail.com
> patch subject: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef and AlwaysRefCounted
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260103/202601030523.4eFrzaYI-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030523.4eFrzaYI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601030523.4eFrzaYI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0432]: unresolved import `crate::types::ARef`
>    --> rust/kernel/device/property.rs:17:13
>    |
>    17 |     types::{ARef, Opaque},
>    |             ^^^^ no `ARef` in `types`
>    |
>    = help: consider importing this struct instead:
>    crate::sync::aref::ARef
> --


Hello Miguel and all,

> >> error[E0432]: unresolved import `crate::types::ARef`
>    --> rust/kernel/scatterlist.rs:41:13
>    |
>    41 |     types::{ARef, Opaque},
>    |             ^^^^ no `ARef` in `types`
>    |
>    = help: consider importing this struct instead:
>    crate::sync::aref::ARef
> --

This change has already been made in [1]. Probably it has showed up on the linux-next
recently which has caused the kernel bot to detect the error.


> >> error[E0405]: cannot find trait `AlwaysRefCounted` in module `crate::types`
>    --> rust/kernel/device/property.rs:362:27
>    |
>    362 | unsafe impl crate::types::AlwaysRefCounted for FwNode {
>    |                           ^^^^^^^^^^^^^^^^ not found in `crate::types`
>    |
>    help: consider importing this trait
>    |
>    7   + use crate::sync::aref::AlwaysRefCounted;
>    |
>    help: if you import `AlwaysRefCounted`, refer to it directly
>    |
>    362 - unsafe impl crate::types::AlwaysRefCounted for FwNode {
>    362 + unsafe impl AlwaysRefCounted for FwNode {
>    |
> 
> --

I haven't raised a patch for this file change I suppose. Should I do it in the same patch v3
or put up a separate patch and reference it there?
 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


Please let me know which one would be appropriate and accordingly I'll send the revised patch.
I'll try to complete this refactoring soon. Sincere apologies that this has been going since quite a while now.

Thanks a lot!

Regards,
Shankari
