Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4703B8D44
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896289; cv=none; b=Deo6oix6wTbjQWEo30VQa62wEgP6S5RytjYbwcFvEMy2j+3f09Zn1gYzFRyORAI9CO5lOj3v4BuSOt/Y0J/uxE6eR0RNtTRzgdTwMUOUlbSMmy0SLzvUkdQjccthS4GiVQ8uYQxMKqAJb2pKF0zdAqvBYcIR1f6QCJ4HiuuWx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896289; c=relaxed/simple;
	bh=P+SC1Lv8GtKFMmDmSP1puIAFS8fxxtphwLdKaMU0tBM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uUanS64SdLKUwadDagmCtlwFQDV5wSyRQZa/tXCBIakqNb1o2WZLEUuNxiS4cbi6ME+rVIY1m7QfkGeE6muf22o/6o6X0a9iuhAaluqTsCaboHFvBMQRM1Iajp4PIrnp3Ne23h0XQOq5zYcXyQLzqo1H+5xwlRaJom9G5jvO4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZBNbTWeS; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZBNbTWeS"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4325cc15176so3448440f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768896286; x=1769501086; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4fFtv+H37c+9JHNHcFH2S2lHNgEGMW4y4wNCwUNdFE=;
        b=ZBNbTWeShKEKgpjwsZeh4IyEMegy8tJw9RqODzg5Jx7P1/jcCuo+0pKgcd/bdoEKJS
         Ziv/wPKFDrriCqsgGeeujUX4YjjMaYk+3XBOSBTyZauT22hebbqEQJq1IMbSUW099kxc
         yUr392NnBMHrcBGPuqkNv1WW06P0aQkjpAJhtQhHmbDLKuTv6f7rBMNqmO8y3xnvCsAF
         kAhGnpz1izmWuDWsdJo+LflzFvohQ6pdbqdGuRONtX2unJ8mIKVhEr2sIVz+Al4arS/D
         LId4az1oto9RRS2vXh12gl5VhyNcsvKF4abGrIwANyZfVAD7FVwXltesdM0VPYIE3A4E
         Flfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768896286; x=1769501086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4fFtv+H37c+9JHNHcFH2S2lHNgEGMW4y4wNCwUNdFE=;
        b=gSTrArQPoBu28/1sQXvNxCOhu0VaItn0BU0pO1B8/UoS8Ft5rgHDZWKwRkPFwrLs57
         ixazazZQf9wMu5XJvbmKDawEquXDRMrBAEDOV4Ru2KnCge8NI/whPk7CxQ5h8HfThMIq
         0KfDDNKMx4SZlJ4CxXoo9YNY3UdLZu3TDiRlp9jt7XPTVKG2E2ixkOckKatVi7HpAJhX
         HRBC3b/YzvFrDQmvn/tVD2cPobeCc5au6Dk682XqfCtVdzwCZQwMnE3BPP4Yct/n2VDa
         DcK4spBCb9USBAHqsTd54Vo0B+KU5Sa5nqnfucczd8VX/yuuYTVdqiIfYI+Y75nOsD+f
         x+EA==
X-Gm-Message-State: AOJu0YyZnGK3Uk/X7y5eXxjpXAZtOFhJ/6syes4V4+PchW1D/m+aTELR
	Uu35qwsG6/sfhmZGCrFQQq86dLe5XweUvEhkureJ1WNYXQenvBp/Df98uegq2r2pCZMM7h0mn58
	BoaBRepM4mfcB1Bmz1A==
X-Received: from wmgb2.prod.google.com ([2002:a05:600c:1502:b0:477:9801:6a64])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0d:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-4803e803c1amr13091405e9.36.1768896286451;
 Tue, 20 Jan 2026 00:04:46 -0800 (PST)
Date: Tue, 20 Jan 2026 08:04:45 +0000
In-Reply-To: <20260119202250.870588-3-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260119202250.870588-1-zhiw@nvidia.com> <20260119202250.870588-3-zhiw@nvidia.com>
Message-ID: <aW83HV4lVR5MQlDd@google.com>
Subject: Re: [PATCH v10 2/5] rust: io: separate generic I/O helpers from MMIO implementation
From: Alice Ryhl <aliceryhl@google.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dakr@kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	markus.probst@posteo.de, helgaas@kernel.org, cjia@nvidia.com, 
	smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, acourbot@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 19, 2026 at 10:22:44PM +0200, Zhi Wang wrote:
> The previous Io<SIZE> type combined both the generic I/O access helpers
> and MMIO implementation details in a single struct. This coupling prevented
> reusing the I/O helpers for other backends, such as PCI configuration
> space.
> 
> Establish a clean separation between the I/O interface and concrete backends
> by separating generic I/O helpers from MMIO implementation.
> 
> Introduce two traits to handle different access capabilities:
> - IoCapable<T> trait provides infallible I/O operations (read/write)
>   with compile-time bounds checking.
> - IoTryCapable<T> trait provides fallible I/O operations
>   (try_read/try_write) with runtime bounds checking.
> - The Io trait defines convenience accessors (read8/write8, try_read8/
>   try_write8, etc.) that forward to the corresponding IoCapable<T> or
>   IoTryCapable<T> implementations.
> 
> This separation allows backends to selectively implement only the operations
> they support. For example, PCI configuration space can implement IoCapable<T>
> for infallible operations while MMIO regions can implement both IoCapable<T>
> and IoTryCapable<T>.
> 
> Move the MMIO-specific logic into a dedicated Mmio<SIZE> type that
> implements Io and the corresponding `IoCapable<T>` and `IoTryCapable<T>` traits.
> Rename IoRaw to MmioRaw and update consumers to use the new types.
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Bjorn Helgaas <helgaas@kernel.org>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Overall looks good to me. Some comments below:

> +/// Trait representing infallible I/O operations of a certain type.
> +///
> +/// This trait is used to provide compile-time bounds-checked I/O operations.
> +/// Different I/O backends can implement this trait to expose only the operations they support.
> +///
> +/// For example, a PCI configuration space may implement `IoCapable<u8>`, `IoCapable<u16>`,
> +/// and `IoCapable<u32>`, but not `IoCapable<u64>`, while an MMIO region on a 64-bit
> +/// system might implement all four.
> +pub trait IoCapable<T> {
> +    /// Infallible read with compile-time bounds check.
> +    fn read(&self, offset: usize) -> T;
> +
> +    /// Infallible write with compile-time bounds check.
> +    fn write(&self, value: T, offset: usize);
> +}
> +
> +/// Trait representing fallible I/O operations of a certain type.
> +///
> +/// This trait is used to provide runtime bounds-checked I/O operations.
> +/// Backends that do not support fallible operations (e.g., PCI configuration space)
> +/// do not need to implement this trait.
> +pub trait IoTryCapable<T> {
> +    /// Fallible read with runtime bounds check.
> +    fn try_read(&self, offset: usize) -> Result<T>;
> +
> +    /// Fallible write with runtime bounds check.
> +    fn try_write(&self, value: T, offset: usize) -> Result;
> +}

I still think it would make sense to have `IoCapable<T>: IoTryCapable<T>`,
but it's not a big deal.

> +    /// Infallible 64-bit read with compile-time bounds check.
> +    #[cfg(CONFIG_64BIT)]
> +    fn read64(&self, offset: usize) -> u64
> +    #[cfg(CONFIG_64BIT)]
> +    fn try_read64(&self, offset: usize) -> Result<u64>

These don't really need cfg(CONFIG_64BIT). You can place that cfg on
impl blocks of IoCapable<u64>.

e.g., remove above but keep here:

> +// MMIO regions on 64-bit systems also support 64-bit accesses.
> +#[cfg(CONFIG_64BIT)]
> +impl<const SIZE: usize> IoCapable<u64> for Mmio<SIZE> {
> +    define_read!(infallible, read, readq -> u64);
> +    define_write!(infallible, write, writeq <- u64);
> +}

> +#[cfg(CONFIG_64BIT)]
> +impl<const SIZE: usize> IoTryCapable<u64> for Mmio<SIZE> {
> +    define_read!(fallible, try_read, readq -> u64);
> +    define_write!(fallible, try_write, writeq <- u64);
> +}

Alice
