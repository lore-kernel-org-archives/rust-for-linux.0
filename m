Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F95388
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 08:39:03 +0000 (UTC)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE55310F1
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 01:38:58 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1dd770d7b5eso606055fac.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695976738; x=1696581538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JUdJwfn544ieet4OV9X2rggUD+/yU1ONlKhpvEewSQ=;
        b=AM02XvFSo7a+Mt9wbzSRAe2YyiUdkYCMLS0HVArSEXg2O97YLioMl//RPPbMTtzf5g
         6W16ctTwxhXTQYhXl9tC/DGy9n+Ru7Z+U730A4C4A/aJujCbZZV207co4/HcXGTzVmJz
         KK52jeuIcH0RO6imJx5V4OVRE3omj3N7Xg5UU8ijH4xyJNF6hvuxAW9PcYfGJJhi711E
         4EtGjz53eOTSjdQo1YByUNzH281D6gbttwyTGud4yBkieXZoY5mrX+KHSDYj5pPPnxMm
         oAdaGktR2imiz8TwJPLq209BnfjCXgDQIzHAHS/WaeS8EXsgmBvODGY9NaREi+f9tyo8
         QJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695976738; x=1696581538;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2JUdJwfn544ieet4OV9X2rggUD+/yU1ONlKhpvEewSQ=;
        b=LIRO9N2AA1Khw1TRjQ8RJL21AoDXlVHSJtjb91KI1vvFRhcTgcTGAXYMcWabMn3S5j
         6jlwCmzeh6LbH0wmMORM7CoV/qsWOPhtWJkmTmvHff28kXcUTCgjvndFcdQI+a6Ssdiy
         Wdv9J6GC0D9Q29o4gd0O7q42YTedOjradsm1M0MVjo4i4L9YXOWOpLT/2qffhNDCxWw+
         KZCZHgEF782anz/gxWfukwHfnFdSTVShH5ciwC+6Z0l/jdd5irKwyVXx20sg76X2nfHt
         DBSJhLxCR8lQVDrgY+OJK5ZkZLjRxc9wF+kxdtiEG1tMG8uehyVDzrc+eDUz95hlmBaY
         MzHw==
X-Gm-Message-State: AOJu0YyN8KqdGKOHrFtvslmcErUUEwzuQZ5BEhT0Pp98SVwylIM4Z84l
	X63Z3SIfxVCjG4fAzyJMa1I=
X-Google-Smtp-Source: AGHT+IH+rO9zXBCXE59w/oDchdYv01gUOOuT+JZ60o3OSk1OWklsgeQD1hAN6iy5sAa38JlSCQzVJg==
X-Received: by 2002:a05:6870:b527:b0:1c3:c45b:92a7 with SMTP id v39-20020a056870b52700b001c3c45b92a7mr4209556oap.0.1695976737709;
        Fri, 29 Sep 2023 01:38:57 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id c3-20020a637243000000b005742092c211sm13786656pgn.64.2023.09.29.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:38:57 -0700 (PDT)
Date: Fri, 29 Sep 2023 17:38:56 +0900 (JST)
Message-Id: <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
To: gregkh@linuxfoundation.org
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com,
 benno.lossin@proton.me, wedsonaf@gmail.com
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2023092900-manpower-runaround-859a@gregkh>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
	<20230928225518.2197768-2-fujita.tomonori@gmail.com>
	<2023092900-manpower-runaround-859a@gregkh>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Fri, 29 Sep 2023 08:03:33 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Sep 29, 2023 at 07:55:16AM +0900, FUJITA Tomonori wrote:
>> +/// Corresponds to the kernel's `enum phy_state`.
>> +#[derive(PartialEq)]
>> +pub enum DeviceState {
>> +    /// PHY device and driver are not ready for anything.
>> +    Down,
>> +    /// PHY is ready to send and receive packets.
>> +    Ready,
>> +    /// PHY is up, but no polling or interrupts are done.
>> +    Halted,
>> +    /// PHY is up, but is in an error state.
>> +    Error,
>> +    /// PHY and attached device are ready to do work.
>> +    Up,
>> +    /// PHY is currently running.
>> +    Running,
>> +    /// PHY is up, but not currently plugged in.
>> +    NoLink,
>> +    /// PHY is performing a cable test.
>> +    CableTest,
>> +}
>> +
>> +/// Represents duplex mode.
>> +pub enum DuplexMode {
>> +    /// Full-duplex mode
>> +    Half,
>> +    /// Half-duplex mode
>> +    Full,
>> +    /// Unknown
>> +    Unknown,
>> +}
> 
> How are these enums going to be kept in sync with the C code?  This
> doesn't seem like a good idea and will quickly cause very strange bugs
> that will be impossible to debug :(

enum DeviceState is guaranteed to be kept in sync with enum phy_state
in C. If the C code is changed without updating the Rust code,
compiling the Rust code fails. This is because a rustified enum is
generated from C's phy_state enum at compile time.

enum DuplexMode refers to C's defines in include/uapi/linux/ethtool.h:

#define DUPLEX_HALF             0x00
#define DUPLEX_FULL             0x01
#define DUPLEX_UNKNOWN          0xff

So we can't use the same trick. But I guess that these DUPLEX_* values
are unlikely be changed.

There was a good discussion about handling enum during the v1
review. IMHO, we could create guidelines on how to use enum on the C
code, which works nicely for Rust. It also needs to work nicely for C.


>> +/// Wraps the kernel's `struct phy_device`.
> 
> This is going to get very tricky as you are "inheriting" a "struct
> device" from the driver core which has lifespan rules of its own.  How
> are you ensuring that those are correct?

We know phy::Device cannot go away from underneath us. We use this
Device object only with callbacks in phy_driver. For example,
get_features() callback works like:

- The C side calls phy_driver->get_features(struct phy_device *phydev)
- The Rust side creates this Device object from the phydev pointer then
calls Rust callback for get_features() with the object.
- The Rust side destroies the object at the end of the callback.
- The C side continues.

>> +///
>> +/// # Invariants
>> +///
>> +/// `self.0` is always in a valid state.
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::phy_device>);
>> +
>> +impl Device {
>> +    /// Creates a new [`Device`] instance from a raw pointer.
> 
> meta-comment, how is the proliferation of "Device" implementations all
> across the kernel going to be able to be kept apart when searching the
> code?  This feels like a tough namespace issue over time or am I just
> not used to how rust does this?

In Rust, you need a path to use those in the code. If you use pci's
Device and phy's Device, your code would be like:

fn some_function(pdev: pci::Device, phydev: net::phy::Device)

So a clever tool can search them properly. Note that there are ways to
avoid repeating these paths.


>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>> +    /// may read or write to the `phy_device` object.
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
>> +        unsafe { &mut *ptr.cast() }
>> +    }
> 
> Why not rely on the driver model reference counting to ensure that you
> get a reference to the object, use it, and then you can drop it?  That
> way you "know" it can not go away from underneath you?

As I wrote above, we use this Device only where we don't need
reference couting.


>> +    /// Gets the id of the PHY.
>> +    pub fn id(&mut self) -> u32 {
>> +        let phydev = self.0.get();
>> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
>> +        unsafe { (*phydev).phy_id }
>> +    }
>> +
>> +    /// Gets the state of the PHY.
>> +    pub fn state(&mut self) -> DeviceState {
>> +        let phydev = self.0.get();
>> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
>> +        let state = unsafe { (*phydev).state };
>> +        match state {
>> +            bindings::phy_state::PHY_DOWN => DeviceState::Down,
>> +            bindings::phy_state::PHY_READY => DeviceState::Ready,
>> +            bindings::phy_state::PHY_HALTED => DeviceState::Halted,
>> +            bindings::phy_state::PHY_ERROR => DeviceState::Error,
>> +            bindings::phy_state::PHY_UP => DeviceState::Up,
>> +            bindings::phy_state::PHY_RUNNING => DeviceState::Running,
>> +            bindings::phy_state::PHY_NOLINK => DeviceState::NoLink,
>> +            bindings::phy_state::PHY_CABLETEST => DeviceState::CableTest,
> 
> Again, this feels like a maintance nightmare.

As I wrote above, it's guaranteed that C and Rust code never
diverge. However, as you said, suley it's troublesome to maintain this.

We could directly use enum generated from C's enum at compile
time. Then we can remove this conversion. The names are not pretty
from Rust's view though.

Any concerns from Rust side?

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index d11c82a9e847..f3556f320302 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -88,7 +88,7 @@ fn soft_reset(dev: &mut phy::Device) -> Result {
     fn link_change_notify(dev: &mut phy::Device) {
         // Reset PHY, otherwise MII_LPA will provide outdated information.
         // This issue is reproducible only with some link partner PHYs.
-        if dev.state() == phy::DeviceState::NoLink {
+        if dev.state() == phy::DeviceState::PHY_NOLINK {
             let _ = dev.init_hw();
             let _ = dev.start_aneg();
         }
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 335dfd7c9ddf..e9ac8986fd83 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -8,25 +8,24 @@
 use core::marker::PhantomData;
 
 /// Corresponds to the kernel's `enum phy_state`.
-#[derive(PartialEq)]
-pub enum DeviceState {
-    /// PHY device and driver are not ready for anything.
-    Down,
-    /// PHY is ready to send and receive packets.
-    Ready,
-    /// PHY is up, but no polling or interrupts are done.
-    Halted,
-    /// PHY is up, but is in an error state.
-    Error,
-    /// PHY and attached device are ready to do work.
-    Up,
-    /// PHY is currently running.
-    Running,
-    /// PHY is up, but not currently plugged in.
-    NoLink,
-    /// PHY is performing a cable test.
-    CableTest,
-}
+///
+///  PHY device and driver are not ready for anything.
+///  PHY_DOWN
+///  PHY is ready to send and receive packets.
+///  PHY_READY
+///  PHY is up, but no polling or interrupts are done.
+///  PHY_HALTED
+///  PHY is up, but is in an error state.
+///  PHY_ERROR
+///  PHY and attached device are ready to do work.
+///  PHY_UP
+///  PHY is currently running.
+///  PHY_RUNNING
+///  PHY is up, but not currently plugged in.
+///  PHY_NOLINK
+///  PHY is performing a cable test.
+///  PHY_CABLETEST
+pub use bindings::phy_state as DeviceState;
 
 /// Represents duplex mode.
 pub enum DuplexMode {
@@ -66,19 +65,9 @@ pub fn id(&mut self) -> u32 {
 
     /// Gets the state of the PHY.
     pub fn state(&mut self) -> DeviceState {
-        let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        let state = unsafe { (*phydev).state };
-        match state {
-            bindings::phy_state::PHY_DOWN => DeviceState::Down,
-            bindings::phy_state::PHY_READY => DeviceState::Ready,
-            bindings::phy_state::PHY_HALTED => DeviceState::Halted,
-            bindings::phy_state::PHY_ERROR => DeviceState::Error,
-            bindings::phy_state::PHY_UP => DeviceState::Up,
-            bindings::phy_state::PHY_RUNNING => DeviceState::Running,
-            bindings::phy_state::PHY_NOLINK => DeviceState::NoLink,
-            bindings::phy_state::PHY_CABLETEST => DeviceState::CableTest,
-        }
+        let phydev = self.0.get();
+        unsafe { (*phydev).state }
     }
 
     /// Returns true if the link is up.

