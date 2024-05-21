Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDC258AB9
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 23:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716335635; cv=none; b=KqUOPbGgIzxOcSfP55F53aKg63OwfNJNO8pQkpW36+rLW/ITd8DBDo59ubHBetATxc4mnCzVZUzdwqDGEpC92dyChlQh7JvyBho9bViYg+dm2ZXfpJ/usM83RllB5jrmcihQHcezMWuuArKwnOQSzT/rLCMbezswanagJfTAzUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716335635; c=relaxed/simple;
	bh=AtTCU3M6ANl6nV9vnjDbYExleyEysYCppZl15M0Zczc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=E4bo6lNbAKFW8OqDnGWkV+u+vGqzz9ypRTikmFCaDnFIPle/8Wp5iL7maaRljp+oNDc+QBRP9BMVtjIGgjGRtzT3Gy2t0AOzpl7ImJOQqNdYHzxpOC7P/VeCtExDqBb1Y/BXiu//hmqU1kqiJmVoaatXJxdOqZLVakaohTY22DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJgPQqjT; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJgPQqjT"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f676798c13so20881b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 16:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716335633; x=1716940433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DaQiKjnAD9KHri/cIxiGqQpOy5cgH7zfvkMt74Lem4=;
        b=iJgPQqjTKBB7OcZy3CO/MEfsX/c50TAiraFFpHFHe7RLKZRDVaziEDxpjTNv9/IS7+
         XLo7ocFBvG+HdIxeJWvmHbEqJ9y/XHjfLq1+yIsAvINRSGVWHXkVFzbGo9GQ7279xbxE
         Ny60hPgPsmrNOWOZJDgjdjXoEuFNwSfOE9PMqX1ovEzH5MCI1Zk2lDfkcZcM7YJWdYdX
         OZSDTmYqgdYcsUtaFPHaJY7WnCRrzFgEUUqsg6ZKEwvEcdYie/ES0yeQFpDwZv4YaJ6z
         o6TBRXP6FVBiZFbIgLS9WmW3p5x9HY5h6U8uW6aP0e9kxdBS2jhW9D4DQDAb/mhHNtbX
         T5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716335633; x=1716940433;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3DaQiKjnAD9KHri/cIxiGqQpOy5cgH7zfvkMt74Lem4=;
        b=CPLFe5bDoAipBC7AYYUPl1aasVhWo4EPpJu3YbXKIrSuBWrGxmNdr8pBRoY0jB8sGT
         RkbMm5JpsEmys/AfNo9j2pZ6zNnG8M2gmV+MrESn+tz2m0qb/vt8qZ+g2Mw8Bt/nfMJQ
         05WVN2sbk3RcJWJNYQYlz8rEExvzGEV0JvrxWnEmWzTClva+exJlHp6RMhBHhfIp3Obv
         omXQImrm9ePK5ghi+rlS0yxDWANjhQwHyf6wK9kB8UiYQZy+fRJqNlRT9XsLRt+SXgrw
         7Tckx+QH8Aftxn0crMTAub4JpN3aCCr8E2HLhftudSVFZfS7hYm+bhNFHLof4jiTVs41
         zKrw==
X-Forwarded-Encrypted: i=1; AJvYcCXYNRj5cyaym8kE2XHoFuHMM6lyA5mAXxmZUyxXV6Te+pa0ZaSEnnevDc+Z6RzLk9U6I9KS9mrtkRLVcmUhliQ0vxHF86rfjIXae/Sgaro=
X-Gm-Message-State: AOJu0Yz55QhTSgjuJ7hueHBvjNgvEjw33udeKCMCYdmmkwP+0QJZb0ah
	J6m7NWXYW7cFv95CF4EEJT+5MIQj7SjNFVoS7n3084wfMgCppWhx
X-Google-Smtp-Source: AGHT+IEOOeLZlnYhzFqWE1WSa9IQ7YVO/q2usBXpvoQ8sXnxMguFBGZNx49vZsh8HCbkbAEl+ckjRg==
X-Received: by 2002:a05:6a00:2d87:b0:6f4:d050:4113 with SMTP id d2e1a72fcca58-6f6d61e2faamr425621b3a.3.1716335633096;
        Tue, 21 May 2024 16:53:53 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a828acsm21266408b3a.49.2024.05.21.16.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 16:53:52 -0700 (PDT)
Date: Wed, 22 May 2024 08:53:34 +0900 (JST)
Message-Id: <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20240520172422.181763-4-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
	<20240520172422.181763-4-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
Thanks for working on the firmware API!

On Mon, 20 May 2024 19:24:19 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> Add an abstraction around the kernels firmware API to request firmware
> images. The abstraction provides functions to access the firmware
> buffer and / or copy it to a new buffer allocated with a given allocator
> backend.
> 
> The firmware is released once the abstraction is dropped.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/firmware.rs         | 74 +++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |  1 +
>  3 files changed, 76 insertions(+)
>  create mode 100644 rust/kernel/firmware.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index b245db8d5a87..e4ffc47da5ec 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -14,6 +14,7 @@
>  #include <kunit/test.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
> +#include <linux/firmware.h>
>  #include <linux/jiffies.h>
>  #include <linux/mdio.h>
>  #include <linux/pci.h>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> new file mode 100644
> index 000000000000..700504fb3c9c
> --- /dev/null
> +++ b/rust/kernel/firmware.rs
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Firmware abstraction
> +//!
> +//! C header: [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
> +
> +use crate::{bindings, device::Device, error::Error, error::Result, str::CStr, types::Opaque};
> +
> +/// Abstraction around a C firmware struct.
> +///
> +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
> +/// firmware is released once [`Firmware`] is dropped.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> +/// driver_load_firmware(fw.data());
> +/// ```
> +pub struct Firmware(Opaque<*const bindings::firmware>);

Wrapping a raw pointer is not the intended use of Qpaque type?
