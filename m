Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD0CC7EE24
	for <rust-for-linux@archiver.kernel.org>; Mon,  5 Jun 2023 13:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbjFENmS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 5 Jun 2023 09:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjFENmR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 5 Jun 2023 09:42:17 -0400
X-Greylist: delayed 317 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 06:42:15 PDT
Received: from a27-22.smtp-out.us-west-2.amazonses.com (a27-22.smtp-out.us-west-2.amazonses.com [54.240.27.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4D5A7
        for <rust-for-linux@vger.kernel.org>; Mon,  5 Jun 2023 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685972218;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=hkpdiSoW+mGqIvlaFllmMn9CkxjsOcZVRTGAA3vsW/M=;
        b=iUIIWGa+3aTX2ruggOdr5g6EaL8FhH3jLZSMzjGyJZ7bRKf0tnGfQCr0Nieso8ow
        mgBRVajfNW5Z1Q+hnpphbwsg1PuFGdlkRHsqET4UQVXhXGFcFc7pTgcDQCO6X/KKI17
        3xQbCCm+qW12g0S+YqK5pT+BOm+XSbrBBvFH5HGrzgLvImO/6PRr6PkC7NjnDzSJFyD
        h1uh37leymbkprHJmDVqu61XF2SkCtUou+qp9SSprNZ9pJid9POxOTaHfeUe4OQOuOZ
        IajNPuwCFH0Hoj0l7kWYn5wSAUAiBSv0aM934mVTYkBgkxWjvfDhr23tW7WYzBN0kjS
        MxyHiQcQjw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685972218;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=hkpdiSoW+mGqIvlaFllmMn9CkxjsOcZVRTGAA3vsW/M=;
        b=SXiBE7dOAZz96WZY91pDEKhahuKgDvuSEaNlwgyS2bHjssM1wISJtNd29PS61Oh6
        ZOq1sGiO81GM1Vp+HD0wFvcN8mnm5nhawVU303TA4rBXFhN4ymm2HvELwAvMvorub2u
        ON1FD0dMSu8jY9KGI7frJx/4ZFvn+fzvseFYOpwU=
Date:   Mon, 5 Jun 2023 13:36:57 +0000
Message-ID: <010101888bc66fbb-3147ad0d-0c98-4f20-a277-949955e3b035-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     tomo@exabit.dev, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230604124735.1378859-1-aliceryhl@google.com>
References: <01010188843259bd-eaff4dc9-c029-4da4-8c5b-2489fd34ffdf-000000@us-west-2.amazonses.com>
        <20230604124735.1378859-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.05-54.240.27.22
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Thanks a lot for reviewing!

On Sun,  4 Jun 2023 12:47:35 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> FUJITA Tomonori writes:
>> +/// Corresponds to the kernel's `struct net_device`.
>> +///
>> +/// # Safety
>> +///
>> +/// The kernel uses a `net_device` object with various functions like `struct net_device_ops`.
>> +/// This object is passed to Rust callbacks while these functions are running.
>> +/// The C API guarantees that `net_device` isn't released while this function is running.
>> +pub struct Device(*mut bindings::net_device);
> 
> You don't implement `Send` or `Sync` for this type. But maybe that's
> intentional since you don't know what kind of private data it stores?

I totally forgot. The type of private data is required to be Send and Sync
so it's ok to implement Send and Sync for Device, right?


>> +// SAFETY: `Registration` does not expose any of its state across threads.
>> +unsafe impl<D: DriverData, T: DeviceOperations<D>> Sync for Registration<T, D> {}
>> +// SAFETY: `Registration` is not restricted to a single thread,
>> +unsafe impl<D: DriverData, T: DeviceOperations<D>> Send for Registration<T, D> {}
> 
> This does expose the `D::Data` object across threads as far as I can
> tell. That type is required to be Send/Sync, so this is still ok, but I
> would mention that here.

I should have updated the comments.

// SAFETY: `Registration` expose sthe `D::Data` object across threads
// but that type is required to be Send and Sync.
unsafe impl<D: DriverData, T: DeviceOperations<D>> Send for Registration<T, D> {}
unsafe impl<D: DriverData, T: DeviceOperations<D>> Sync for Registration<T, D> {}


>> +impl<D: DriverData, T: DeviceOperations<D>> Registration<T, D> {
>> +    /// Creates new instance of registration.
>> +    pub fn try_new(tx_queue_size: u32, rx_queue_size: u32, data: D::Data) -> Result<Self> {
>> +        // SAFETY: FFI call.
>> +        match from_err_ptr(unsafe {
>> +            bindings::alloc_etherdev_mqs(
>> +                core::mem::size_of::<*const core::ffi::c_void>() as i32,
>> +                tx_queue_size,
>> +                rx_queue_size,
>> +            )
>> +        }) {
>> +            Ok(ptr) => {
>> +                // SAFETY: the kernel allocated the space for a pointer.
>> +                unsafe {
>> +                    let priv_ptr = bindings::netdev_priv(ptr) as *mut usize;
>> +                    core::ptr::write(priv_ptr, data.into_foreign() as usize);
>> +                }
>> +                Ok(Registration {
>> +                    dev: Device(ptr),
>> +                    is_registered: false,
>> +                    _p: PhantomData,
>> +                })
>> +            }
>> +            Err(err) => Err(err),
>> +        }
>> +    }
> 
> This method can be simplified using the question mark operator (also
> known as the try operator).

Oops, it will be fixed in the next version.


> Also, it is unclear to me why you are converting the pointers into an
> usize. I would recommend keeping them as void pointers instead.
> Especially considering that you're using a void pointer for the
> `sizeof_priv` argument. You can do that like this:

Ah, it will be fixed in the next version.


>> +    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
>> +        ndo_init: if <T>::HAS_INIT {
>> +            Some(Self::init_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_uninit: if <T>::HAS_UNINIT {
>> +            Some(Self::uninit_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_open: if <T>::HAS_OPEN {
>> +            Some(Self::open_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_stop: if <T>::HAS_STOP {
>> +            Some(Self::stop_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_start_xmit: if <T>::HAS_START_XMIT {
>> +            Some(Self::start_xmit_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_features_check: None,
>> +        ndo_select_queue: None,
>> +        ndo_change_rx_flags: None,
>> +        ndo_set_rx_mode: None,
>> +        ndo_set_mac_address: None,
> 
> Bindgen is set up to generate `Default` implementations for these types,
> so you can do this to omit the remaining fields:

It can work with const?


>> +impl Drop for SkBuff {
>> +    fn drop(&mut self) {
>> +        // SAFETY: The safety requirement ensures that the pointer is valid.
>> +        unsafe {
>> +            bindings::kfree_skb_reason(
>> +                self.0,
>> +                bindings::skb_drop_reason_SKB_DROP_REASON_NOT_SPECIFIED,
>> +            )
>> +        }
>> +    }
>> +}
> 
> What are these drop reasons used for?

ndo_start_xmit() passes a sk_buff object to a driver. The driver is
responsible for freeing the object after sending the data in the
sk_buff. I expect a device driver to keep the SkBuff object until the
completion of transfer then drops the object (kfree_skb is called).


