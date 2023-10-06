Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4221D554
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2fVgY8R"
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082CDB9
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 08:57:46 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c87a85332bso18526505ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Oct 2023 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696607865; x=1697212665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMaXSdjxbXsiAirTGof/GcimC3N7kI+/btaqyHpj49Y=;
        b=E2fVgY8R3+SrEKIJeL7dJ9LlVJhVTqUfqR0csS40j4TjmZ2dfr12ooQwfDX2gTACR1
         sU66rcof2/WXeqCbYUXLygi0pJm+m3qrUPTCHTsXHa9+btpewka2aAZHoYhB6eagoAWy
         2xIpMrnXURbKgRFVPk68YqVBQxlfK9MugOhTfp5D4xppcwY/5DCraIfSZH6eZhbSu4ZU
         vgt82nyToWIqkcMDrZYmMoH8G9aUtgQOEKPc54pSz8Yiry9VrFrnR2W3PQNaTCjB7iHX
         13YZ/Ip4csnue0hQNk9rykETJ23f48+7HiRwmM7rCMMx8/06FBYOvxleridAFyIQzzgv
         eZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696607865; x=1697212665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMaXSdjxbXsiAirTGof/GcimC3N7kI+/btaqyHpj49Y=;
        b=o7+mcaXjLAmDZU+kYo7+QVswQUtQ2HWW4njP0yrM/cRDciLXrNpG/y8Tx/gRRGMKut
         nzVz+/KTLoleEKoPVn5ZYk/2vNqx55ipTHITezmM0BXQN9A7qJ9NgTdWcTORHVX+vlS6
         SMlpbSW0UYssmHkPnl3PIQlwNOZ2KUZYUC9EJYINkcBtD6NveqKth6hHX4IUwmcNGbY+
         8/R+1GnZZtoWa0yQpL4W8O19FyP496SLG502Ca62TZdc02jrG7YYmy8cJDT1Uke4T5Sd
         /Phs5iKvB0r4XbbZqX3Zs+vhaJ1HaPlt8G2sc7BXYfqtTHAqVw02DJ4UswU8uPoKCkOe
         DsxA==
X-Gm-Message-State: AOJu0YxCAQOtTy9N9Mwh23wR06nmc2AtpAKdVKz+EbxRoHTSinbMMSIa
	I3S6xlxiB9AYZzMwtuFMTnQ=
X-Google-Smtp-Source: AGHT+IEhBhuGTi2CtNQboZ4D7jHQZWBTQVsg1o+NrcmVE4/6qmh4tDyC3SB+mQ4mPpSIDN7aN2NiWw==
X-Received: by 2002:a17:903:124b:b0:1c8:791c:d78b with SMTP id u11-20020a170903124b00b001c8791cd78bmr8760716plh.29.1696607865385;
        Fri, 06 Oct 2023 08:57:45 -0700 (PDT)
Received: from tx3000mach.io (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902eac400b001aaf2e8b1eesm4040797pld.248.2023.10.06.08.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 08:57:45 -0700 (PDT)
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 0/1] rust: crates in other kernel directories
Date: Fri,  6 Oct 2023 12:57:36 -0300
Message-ID: <20231006155739.246381-1-yakoyoku@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This RFC provides makes possible to have bindings for kernel subsystems
that are compiled as modules.

Previously, if you wanted to have Rust bindings for a subsystem, like
AMBA for example, you had to put it under `rust/kernel/` so it came
part of the `kernel` crate, but this came with many downsides. Namely
if you compiled said subsystem as a module you've a dependency on it
from `kernel`, which is linked directly on `vmlinux`.

So instead of overpopulating `kernel` with a gazillion modules that
throws you into dire straits you should rather have the bindings in the
same directory as the subsystem you want to bind with and link it to
it.

For now I don't have a completely working example but I have an MWE as
following...

    # Add this line to drivers/usb/core/Kconfig
    config USB_RUST
    	bool "Rust USB bindings"
    	depends on USB && RUST
    	default n
    	help
    	  Enables Rust bindings for USB.

    # Add this line to drivers/usb/core/Makefile
    usbcore-$(CONFIG_USB_RUST)		+= usb.rlib

    # Create this file drivers/usb/core/usb.rs
    // SPDX-License-Identifier: GPL-2.0
    
    //! USB devices and drivers.
    //!
    //! C header: [`include/linux/usb.h`](../../../../include/linux/usb.h)
    
    use kernel::bindings;
    
    /// Check if USB is disabled.
    pub fn disabled() -> bool {
        // SAFETY: FFI call.
        unsafe { bindings::usb_disabled() != 0 }
    }

    # Compile the .rlib with
    make drivers/usb/core/usb.rlib LLVM=1

If everything went well then you should have
`drivers/usb/core/usb.rlib` ready to be linked.

As of now this PR won't compile the kernel fully as it serves as an
starting point and it's going to change in the future.

Martin Rodriguez Reboredo (1):
  scripts: Build per module Rust crates

 Makefile               |  4 ++--
 scripts/Makefile.build | 10 +++++++++-
 scripts/Makefile.lib   | 19 +++++++++++++------
 3 files changed, 24 insertions(+), 9 deletions(-)

-- 
2.42.0

