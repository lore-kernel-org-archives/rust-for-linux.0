Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82634EB64DC
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Jun 2023 17:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjFYRHO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 25 Jun 2023 13:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFYRHN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 25 Jun 2023 13:07:13 -0400
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D10110D
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jun 2023 10:07:09 -0700 (PDT)
Date:   Sun, 25 Jun 2023 17:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1687712827; x=1687972027;
        bh=QExAZN0viDBP6uZhV+EBlZi29OCdmxjxCPTr3yF6zNY=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=dp/renVTAb5fLw0sRwnrbDWzoNPhOBIBNC00aJtvLkUt25C3YSOg2RHh4VjK5hV/O
         em0IVoalOH7hUYSuzvGHbV8D0OuZYbOjey78cebH+JQfg+2hNNXZNqVxe5F8E3SFGf
         fGCyLefQmxOcqWbjM1bgjN5x1DsFzvbjL8PTVNag0bIL2eUKD3k7DX1kNR0grqlPKi
         aA7nYDH8VZEADG712yCkdPW1Vhn9FP+XbdZ3uzpwmoEgXcunnG0+QoUYPHakuz4JTK
         kyaZHjPSV0CH4XzenanXnmmlOUTCtYhmWC4bhSDW+4yc0/N5hvZ5xr/zwM5A/WptfZ
         BtKBl9uSeBICA==
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch,
        miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
Message-ID: <69144cf1-6c07-868c-9577-e41db4c0cc75@proton.me>
In-Reply-To: <20230625.232736.235121744769257487.ubuntu@gmail.com>
References: <_kID50ojyLurmrpIpn_kNxCRqo5MAaqm9pE47mhFcLops8yDhSqmbkhJiUuHlAFSdgqX1dHdZGxUa95ZSHAPHesIKLci1J21cu6nmdQ3ZGg=@proton.me> <20230621.221349.1237576739913195911.ubuntu@gmail.com> <3ff6edec-c083-9294-d2df-01be983cd293@proton.me> <20230625.232736.235121744769257487.ubuntu@gmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 25.06.23 16:27, FUJITA Tomonori wrote:
> Hi,
>
> On Sun, 25 Jun 2023 09:52:53 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>
>>>>> +/// Trait for device driver specific information.
>>>>> +///
>>>>> +/// This data structure is passed to a driver with the operations fo=
r `struct net_device`
>>>>> +/// like `struct net_device_ops`, `struct ethtool_ops`, `struct rtnl=
_link_ops`, etc.
>>>>> +pub trait DriverData {
>>>>> +    /// The object are stored in C object, `struct net_device`.
>>>>> +    type Data: ForeignOwnable + Send + Sync;
>>>>
>>>> Why is this an associated type? Could you not use
>>>> `D: ForeignOwnable + Send + Sync` everywhere instead?
>>>> I think this should be possible, since `DriverData` does not define
>>>> anything else.
>>>
>>> With that approach, is it possible to allow a device driver to define
>>> own data structure and functions taking the structure as aurgument
>>> (like DevOps structutre in the 5th patch)
>>>
>>
>> In the example both structs are empty so I am not really sure why it has
>> to be two types. Can't we do this:
>> ```
>> pub struct MyDriver {
>>       // Just some random fields...
>>       pub access_count: Cell<usize>,
>> }
>>
>>
>> impl DriverData for Box<MyDriver> {}
>>
>> // And then we could make `DeviceOperations: DriverData`.
>> // Users would then do this:
>>
>> #[vtable]
>> impl DeviceOperations for Box<MyDriver> {
>>       fn init(_dev: Device, data: &MyDriver) -> Result {
>>           data.access_count.set(0);
>>           Ok(())
>>       }
>>
>>       fn open(_dev: Device, data: &MyDriver) -> Result {
>>           data.access_count.set(data.access_count.get() + 1);
>>           Ok(())
>>       }
>> }
>> ```
>>
>> I think this would simplify things, because you do not have to carry the
>> extra associated type around (and have to spell out
>> `<D::Data as ForeignOwnable>` everywhere).
>
> I'm still not sure if I correctly understand what you try to do.
>
> If I define DeviceOperations in dev.rs like the following:
>
> #[vtable]
> pub trait DeviceOperations<D: ForeignOwnable + Send + Sync> {
>      /// Corresponds to `ndo_init` in `struct net_device_ops`.
>          fn init(_dev: &mut Device, _data: D::Borrowed<'_>) -> Result {
> =09        Ok(())
>          }
> }
>
> And the driver implmeents DeviceOperations like the folloing:
>
> #[vtable]
> impl<D: ForeignOwnable + Send + Sync> DeviceOperations<D> for Box<DriverD=
ata> {
>      fn init(_dev: &mut Device, _data: &DriverData) -> Result {
>              Ok(())
>      }
> }
>
> I got the following error:
>
> error[E0053]: method `init` has an incompatible type for trait
>    --> samples/rust/rust_net_dummy.rs:24:39
>     |
> 24 |     fn init(_dev: &mut Device, _data: &DriverData) -> Result {
>     |                                       ^^^^^^^^^^^
>     |                                       |
>     |                                       expected associated type, fou=
nd `&DriverData`
>     |                                       help: change the parameter ty=
pe to match the trait: `<D as ForeignOwnable>::Borrowed<'_>`
>     |
>     =3D note: expected signature `fn(&mut Device, <D as ForeignOwnable>::=
Borrowed<'_>) -> core::result::Result<_, _>`
>                found signature `fn(&mut Device, &DriverData) -> core::res=
ult::Result<_, _>`
>

I thought you could do this:
```
#[vtable]
pub trait DeviceOperations: ForeignOwnable + Send + Sync {
     /// Corresponds to `ndo_init` in `struct net_device_ops`.
     fn init(_dev: &mut Device, _data: Self::Borrowed<'_>) -> Result {
         Ok(())
     }
}

#[vtable]
impl DeviceOperations<D> for Box<DriverData> {
     fn init(_dev: &mut Device, _data: &DriverData) -> Result {
         Ok(())
     }
}
```

>>>>> +    const fn build_device_ops() -> &'static bindings::net_device_ops=
 {
>>>>> +        &Self::DEVICE_OPS
>>>>> +    }
>>>>
>>>> Why does this function exist?
>>>
>>> To get const struct net_device_ops *netdev_ops.
>>
>> Can't you just use `&Self::DEVICE_OPS`?
>
> I think that it didn't work in the past but seems that it works
> now. I'll fix.
>
>
>>>>> +/// Corresponds to the kernel's `struct net_device_ops`.
>>>>> +///
>>>>> +/// A device driver must implement this. Only very basic operations =
are supported for now.
>>>>> +#[vtable]
>>>>> +pub trait DeviceOperations<D: DriverData> {
>>>>
>>>> Why is this trait generic over `D`? Why is this not `Self` or an assoc=
iated
>>>> type?
>>>
>>> DriverData also used in EtherOperationsAdapter (the second patch) and
>>> there are other operations that uses DriverData (not in this patchset).
>>
>> Could you point me to those other things that use `DriverData`?
>
> net_device struct has some like tlsdev_ops, rtnl_link_ops.. A device
> driver might need to access to the private data via net_device in
> these operations.

In my mental model you can just implement the `TLSOperations` trait
alongside the `DeviceOperations` trait. But I would have to see the
API that will be used for that to be sure. I do not think that you need
to have different private data for each of those operations traits.

--
Cheers,
Benno

>
>
> thanks,


