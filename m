Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0B2264A3
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Aug 2025 22:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756420808; cv=none; b=sWLi40gzbkV9abOhAdEfzSjbAC5SLbO8kylunhs3AyIvckGc7Rn4DHU6wfWVlzBdPzxDIVryHxwnpsEF7kaNj/KEFa5J4gv4RF9izQRUIyWpSgc37jnfZKcWFWBVnMkZoiLoXdXlDfnrqJQhJGG8r6VHKEvmZLZDuUjhJkHTsag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756420808; c=relaxed/simple;
	bh=iJRZCQfP+MFjyJb2+w5YiQpoJarcACLwB92Tcc+vJ3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o990vkZlBnTJSYOMxGBYHYyEuBcJsz/HR2JlyIDwWDylXilIINgnSA6HWvo5+4GO0ivUwpXqQ8/upZuTaZh3p37abP+wWFczK+/IbtqkE0BJlYLrzBzvOzCF+WSkjdXuoE0k/VNbp44QVZbtEx6ims2NAhQeuE3wno0/M6gw+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWcM0xcP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWcM0xcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75347C4CEEB;
	Thu, 28 Aug 2025 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756420808;
	bh=iJRZCQfP+MFjyJb2+w5YiQpoJarcACLwB92Tcc+vJ3U=;
	h=From:To:Cc:Subject:Date:From;
	b=rWcM0xcP4IHPvvzjCbWVPT50je7NCa/UL3lKYg29oR8CFzZv15/DT+m09op9ZX4Ae
	 fif8DcWTUKNN9MF3wnO9cYYQhaGjUFTOQvgn3sbkCDp2umu/KJIltYyY88vYL8g02P
	 HJeGShkgDiiZDho61n4MPI2CTYzSzPQ8TRSoXP/i0tF8HpMOB2h8acFDaXuiN8fmu2
	 8RhNBjXBUs+BxOnKd+U48oB1trb1MnlceBL8MwYd/YZ2tn+uUo/a9OAccgwirPLQcY
	 jlf+9tilkmCSVlUunnMvsE6Vx+R3fTrNSA9ZanB2T4p6ZMgs63ABrviexIAk+Fw/YP
	 190vFvhs88xTg==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] gpu: nova-core: depend on CONFIG_64BIT
Date: Fri, 29 Aug 2025 00:39:40 +0200
Message-ID: <20250828223954.351348-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If built on architectures with CONFIG_ARCH_DMA_ADDR_T_64BIT=y nova-core
produces that following build failures:

    error[E0308]: mismatched types
      --> drivers/gpu/nova-core/fb.rs:49:59
       |
    49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle())?;
       |                              -----------------------      ^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
       |                              |
       |                              arguments to this method are incorrect
       |
    note: method defined here
      --> drivers/gpu/nova-core/fb/hal.rs:19:8
       |
    19 |     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result;
       |        ^^^^^^^^^^^^^^^^^^^^^^^
    help: you can convert a `u32` to a `u64`
       |
    49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle().into())?;
       |                                                                            +++++++

    error[E0308]: mismatched types
      --> drivers/gpu/nova-core/fb.rs:65:47
       |
    65 |         if hal.read_sysmem_flush_page(bar) == self.page.dma_handle() {
       |            -------------------------------    ^^^^^^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
       |            |
       |            expected because this is `u64`
       |
    help: you can convert a `u32` to a `u64`
       |
    65 |         if hal.read_sysmem_flush_page(bar) == self.page.dma_handle().into() {
       |                                                                     +++++++

    error: this arithmetic operation will overflow
       --> drivers/gpu/nova-core/falcon.rs:469:23
        |
    469 |             .set_base((dma_start >> 40) as u16)
        |                       ^^^^^^^^^^^^^^^^^ attempt to shift right by `40_i32`, which would overflow
        |
        = note: `#[deny(arithmetic_overflow)]` on by default

This is due to the code making assumptions on the width of dma_addr_t to
be 64 bit.

While this could technically be handled, it is rather painful to deal
with, as the following example illustrates:

	pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> DmaAddress {
	    let addr = u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08())
	        << FLUSH_SYSMEM_ADDR_SHIFT
	        | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
	            << FLUSH_SYSMEM_ADDR_SHIFT_HI;

	    addr.try_into().unwrap_or_else(|_| {
	        kernel::warn_on!(true);

	        0
	    })
	}

At the same time there's not much value for nova-core to support 32-bit,
given that the supported GPU architectures are Turing and later, hence
depend on CONFIG_64BIT.

Cc: John Hubbard <jhubbard@nvidia.com>
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/lkml/20250828160247.37492-1-ojeda@kernel.org/
Fixes: 6554ad65b589 ("gpu: nova-core: register sysmem flush page")
Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions and base code")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 8726d80d6ba4..20d3e6d0d796 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -1,5 +1,6 @@
 config NOVA_CORE
 	tristate "Nova Core GPU driver"
+	depends on 64BIT
 	depends on PCI
 	depends on RUST
 	depends on RUST_FW_LOADER_ABSTRACTIONS

base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
-- 
2.51.0

