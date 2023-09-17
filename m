Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3799804
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 06:30:13 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F012191
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Sep 2023 23:30:12 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68fc49ccbf2so1108328b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Sep 2023 23:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694932212; x=1695537012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqwgzcrCQK2r+CB+c2y2YE+MCy22xlH5wO2QmomfdBk=;
        b=m/bBWpCRFQyqydnkOcWc2kpcbwjnGrYB1YDM0uxUsb1a7LD+vBoN68sbP838EvJLxw
         tbWzrgHLsUiQ5it6YIQAwzKwbWZgl2C07KVGiWYKGCrlZGgXHsbSxSL8/gAqPK/Wo40M
         kjDjxokdMj6vGFLuz7MtoK1aHXO1BJqGBnIee8/z12qmpED/Exl2TlBIlDEaEkL2JWBd
         97HS22AXL9kParRrvegmNgsKo6FLaVsPF5Hqk6HM9z44+iFlddvWhk6lwFi3nyGDdR7z
         QK+8AMYYkNN8mHAQYidQlYFhI5S9UE3bcWYPTHKRhK4XcC8VZt9380C/iALQ3m4BZXjA
         Wtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694932212; x=1695537012;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qqwgzcrCQK2r+CB+c2y2YE+MCy22xlH5wO2QmomfdBk=;
        b=rlExup4Nw/W4xUtmuxa/mWWZcNu8NI3IqCzO3o10SNORwAkHly/U66KBTWQ9RTVkWU
         T2OLSTldozD1K+r111W6aJAxboJ4FDM5cm0PD3VC4o/96mAgg02eatm9Ij5q/IQ1vIlA
         CNUOB+YWJTzBFGa4KZi+1KN1Hmj88EyzIV8bbvqaOCuFB8pkLTM5JxVoZQfKKIQxtiMx
         vDFJ7D5Ixaj9I6QEufKhf5ECAho/J1Z68iYYka3c+qnIYiRsHYau2mzcaL7LQoxuqh2V
         26AEtMpIwgl0C6w6/yKJDxk579T2hUiT1XvrSlfIsMipUO4eQ3unnfzCYj9Iv5hito+B
         aUXQ==
X-Gm-Message-State: AOJu0YyjqJpOuyQk4YROXDVH/RKUcAbQSyfFFMFmEBbXQhNoRb5Yrn76
	+33aAdOAmmLGAbU5fb2N9PaqY4gYXdK6pfKh
X-Google-Smtp-Source: AGHT+IH17uhB6Iq66mkMQhkzjM9Wg8YNDdSuH+UeXk3fJyDtLX0D0DFwV3s5BLf5DqJ0zVqm3GQqKA==
X-Received: by 2002:a05:6a00:26c2:b0:68c:7089:cb8 with SMTP id p2-20020a056a0026c200b0068c70890cb8mr6393225pfw.2.1694932211766;
        Sat, 16 Sep 2023 23:30:11 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id n24-20020a62e518000000b00689f5940061sm5451869pff.17.2023.09.16.23.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 23:30:11 -0700 (PDT)
Date: Sun, 17 Sep 2023 15:30:10 +0900 (JST)
Message-Id: <20230917.153010.1023281411128238110.ubuntu@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch
Subject: Re: [RFC PATCH v1 2/4] rust: phy: add module device table support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47u3s1gyDLksk5M=7HwTK=-vjadWKbhZQDm6OpDXqcDUbg@mail.gmail.com>
References: <20230913133609.1668758-3-fujita.tomonori@gmail.com>
	<CALNs47s7wH8yFU-jbcQxVRiHta_pEdueSGo9mFOdYriT=o0SOQ@mail.gmail.com>
	<CALNs47u3s1gyDLksk5M=7HwTK=-vjadWKbhZQDm6OpDXqcDUbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Thu, 14 Sep 2023 03:23:56 -0400
Trevor Gross <tmgross@umich.edu> wrote:

> Actually, looking closer at the use of this macro
> 
> +kernel::phy_module_device_table!(
> +    __mod_mdio__asix_tbl_device_table,
> +    [(PhyAx88772A::PHY_ID_ASIX_AX88772A, 0xffffffff)]
> +);
> 
> Since the `paste!` macro is in kernel now this could be refactored
> more like `MODULE_DEVICE_TABLE`, i.e. just take "asix" rather than the
> clunky name.

Thanks! That's exactly what I had benn looking for.


> Maybe it would be good to have a trait for a MDIO device as well
> 
>     enum PhyIdMask {
>         Exact,
>         Model,
>         Vendor,
>         Custom(u32)
>     }
> 
>     impl PhyIdMask {
>         const fn as_int(self) -> u32 { /* ... */ }
>     }
> 
>     trait MdioDevice {
>         const PHY_ID: u32;
>         const PHY_ID_MASK: PhyIdMask;
>     }
> 
> Then the macro just becomes
> 
>     kernel::register_mdio_device!(asix: PhyAx88772A, PhyAx88772C, PhyAx88796B);

One driver doesn't always correspond to one device id entry. For
example, realtek PHY module supports tons of drivers but have only one
device id entry.

https://github.com/torvalds/linux/blob/f0b0d403eabbe135d8dbb40ad5e41018947d336c/drivers/net/phy/realtek.c#L1089

So I prefer to define the device id independently. I use the following
code now.

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 8e7f4aff5dfb..b69933f4d054 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -650,3 +650,77 @@ unsafe impl<const N: usize> Send for Registration<{ N }> {}
 
 // SAFETY: `Registration` does not expose any of its state across threads.
 unsafe impl<const N: usize> Sync for Registration<{ N }> {}
+
+pub enum DeviceMask {
+    Exact,
+    Model,
+    Vendor,
+    Custom(u32),
+}
+
+impl DeviceMask {
+    pub const fn as_int(self) -> u32 {
+        match self {
+            DeviceMask::Exact => !0,
+            DeviceMask::Model => !0 << 4,
+            DeviceMask::Vendor => !0 << 10,
+            DeviceMask::Custom(mask) => mask,
+        }
+    }
+}
+
+pub struct DeviceId {
+    pub id: u32,
+    pub mask: DeviceMask,
+}
+
+impl DeviceId {
+    pub const fn new_with_exact_mask(id: u32) -> Self {
+        DeviceId {
+            id,
+            mask: DeviceMask::Exact,
+        }
+    }
+
+    pub const fn new_with_model_mask(id: u32) -> Self {
+        DeviceId {
+            id,
+            mask: DeviceMask::Model,
+        }
+    }
+
+    pub const fn new_with_vendor_mask(id: u32) -> Self {
+        DeviceId {
+            id,
+            mask: DeviceMask::Vendor,
+        }
+    }
+
+    pub const fn new_with_custom_mask(id: u32, mask: u32) -> Self {
+        DeviceId {
+            id,
+            mask: DeviceMask::Custom(mask),
+        }
+    }
+}
+
+/// Defines module device table.
+///
+/// This corresponds to the kernel's MODULE_DEVICE_TABLE macro, which embeds the information
+/// for module loading into the module binary file.
+#[macro_export]
+macro_rules! phy_module_device_table {
+    (@replace_expr $_t:tt $sub:expr) => {$sub};
+
+    (@count_devices $($x:expr),*) => {
+        0usize $(+ $crate::phy_module_device_table!(@replace_expr $x 1usize))*
+    };
+
+    ($name:ident, [$($t:expr),+]) => {
+        ::kernel::macros::paste! {
+            #[no_mangle]
+            static [<__mod_mdio__ $name _device_table>]: [kernel::bindings::mdio_device_id; $crate::phy_module_device_table!(@count_devices $($t),+) + 1] =
+             [ $(kernel::bindings::mdio_device_id{phy_id: $t.id, phy_id_mask:$t.mask.as_int()}),+, kernel::bindings::mdio_device_id {phy_id:0, phy_id_mask:0}];
+        }
+    }
+}
