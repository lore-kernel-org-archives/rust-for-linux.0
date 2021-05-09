Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF306C433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 10:25:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A583613FA
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 10:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhEIK0Y (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 06:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhEIK0Y (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 06:26:24 -0400
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a0f:4ac0:0:1::cb2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42626C061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 03:25:21 -0700 (PDT)
From:   Finn Behrens <me@kloenk.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.de; s=mail;
        t=1620555915; bh=KEaSFjBWZR5IQ8TPkq/1WctnYvqT1lMfVH9gC3y9C+I=;
        h=From:Subject:Date:Cc:To;
        b=eskJV/epRPfX3orYeht3dOMURKQCOLVfdSPZzthOhE205QsqwhcbL3jZ5mV3MkNTw
         jQuPTniHA7Lvff5YTgigJc0+wTIMQVZ0qrmMNBEFUDPqsixeq1sf7pudnRjNGux0j9
         H0H1br6/WvToSZiALfrU/OdWfyFeLlgqjcy4uKl0=
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: PointerWrapper Trait vs croe::ops::Deref
Message-Id: <97E4F6F4-2391-4053-89FC-BB00F9184340@kloenk.de>
Date:   Sun, 9 May 2021 12:25:14 +0200
Cc:     rust-for-linux@vger.kernel.org
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, wedsonaf@google.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Howdy,

As discussed in the meeting yesterday, here are my two ways I can think =
of to get the internals in a good way.

### 2 Traits
The first one is this, where there are 2 traits (we can rename them to =
also keep our old PointerWrapper).

```rs
const EFAULT: u8 =3D 14;

struct Internal {
    pub number: u16,
}

trait PointerWrapper {
    type Output;

    /// Returns the raw pointer.
    fn get_pointer(&self) -> *const Self::Output;

    /// Returns the instance back from the raw pointer.
    ///
    /// # Safety
    ///
    /// The passed pointer must come from a previous call to =
[`PointerWrapper::into_pointer()`].
    unsafe fn from_pointer(ptr: *const Self::Output) -> Self;
   =20
    /// Returns a reference to to the internal struct
    fn get_internal(&self) -> Result<&Self::Output, u8> {
        let ptr =3D self.get_pointer();
       =20
        unsafe { ptr.as_ref() }.ok_or(EFAULT)
    }
}

trait PointerWrapperMut: PointerWrapper {
    /// Returns a mutable referecne to the internal struct
    fn get_internal_mut(&mut self) -> Result<&mut Self::Output, u8> {
        let ptr =3D self.get_pointer() as *mut Self::Output;
       =20
        unsafe { ptr.as_mut() }.ok_or(EFAULT)
    }
}=20

#[derive(Debug)]
struct Wrapper {
    ptr: *const Internal,
}

impl PointerWrapper for Wrapper {
    type Output =3D Internal;

    fn get_pointer(&self) -> *const Self::Output {
        self.ptr
    }
   =20
    unsafe fn from_pointer(ptr: *const Internal) -> Self {
        Self {
            ptr,
        }
    }
}

impl PointerWrapperMut for Wrapper { }

fn main() {
    let orig =3D Internal {
      number: 42,
    };
   =20
    let mut wrapper =3D unsafe { Wrapper::from_pointer(&orig as *const =
Internal) };
   =20
    println!("wrapper: {:?}", wrapper.get_internal().unwrap().number );
   =20
    wrapper.get_internal_mut().unwrap().number =3D 1337;
   =20
    println!("wrapper: {:?}", wrapper.get_internal().unwrap().number );
}
```

Link to playground: =
https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D2018&g=
ist=3D49a51f16e5202c84a05e4a8a56ee2fe3
This approach would of course not return `Result<&Self::Output, u8>` but =
instead an instance of `KernelResult`.
Maybe we could also remove the result, as it would possible be an =
invariant, and never happen as the pointer should already be valid.

### Using `core::ops::Deref{,mut}`

```rs
use core::ops::{Deref, DerefMut};

struct Internal {
    pub number: u16,
}

trait PointerWrapper<T> {
    /// Returns the raw pointer.
    fn get_pointer(&self) -> *const T;

    /// Returns the instance back from the raw pointer.
    ///
    /// # Safety
    ///
    /// The passed pointer must come from a previous call to =
[`PointerWrapper::into_pointer()`].
    unsafe fn from_pointer(ptr: *const T) -> Self;
}

#[derive(Debug)]
struct Wrapper {
    ptr: *const Internal,
}

impl Deref for Wrapper {
    type Target =3D Internal;
   =20
    fn deref(&self) -> &Self::Target {
        let ptr =3D self.get_pointer();
       =20
        unsafe { ptr.as_ref() }.unwrap()
    }
}

impl DerefMut for Wrapper {
    fn deref_mut(&mut self) -> &mut Self::Target {
        let ptr =3D self.get_pointer() as *mut Internal;
       =20
        unsafe { ptr.as_mut() }.unwrap()
    }
}

impl PointerWrapper<Internal> for Wrapper {
    fn get_pointer(&self) -> *const Internal {
        self.ptr
    }
   =20
     unsafe fn from_pointer(ptr: *const Internal) -> Self {
        Self {
            ptr,
        }
    }
}

fn main() {
    let orig =3D Internal {
      number: 42,
    };
   =20
    let mut wrapper =3D unsafe { Wrapper::from_pointer(&orig as *const =
Internal) };
   =20
    println!("wrapper: {:?}", wrapper.deref().number );
   =20
    wrapper.deref_mut().number =3D 1337;
   =20
    println!("wrapper: {:?}", wrapper.deref_mut().number );
}
```
=
https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D2018&g=
ist=3D47944d314e293ab50093b2540fb3f9e5


Pleas tell me what version you would favour.

CU,
Finn

