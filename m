Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C364C042B
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550168; cv=none; b=Dd4OtbcwrfIzOPXvbmb3AF4ArvNtCWaewRmNJzVWCA0kzW5ScaZHL8uLp6i/lNO1ftBlT1xW74thxn9pN4GqsFWzSDtwXbhHmm9jPgLmZYwv1bPP9xu2ftr36QzIqeCZTnCk/d7b0WxYH8FHb2FNqAhvaCF3xUJQkejRD/BIAOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550168; c=relaxed/simple;
	bh=KBy84uMAMuFGu2qwhkvT2IahUyIdmV6CPQxj5EZZp+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SIe6btj/urrHTm+IHjU/W4C7aEaijeX3szcMuNTOTsqbTKkX8qMxEmWwthvytDhxhdmRCbhm4URsTQ2KDls+I5uk3hKeazSzPB4cwdNcdMxvM2WlazkkJLJrmXfpsu+HNOnGC9oBxuj5YexuXzRcRtOIK4KOfHQ2tcJu2TpdGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKf7/kHu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKf7/kHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07C51F000FF;
	Fri,  9 Oct 2026 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791550162;
	bh=oKF77xMQie4pmIGIMJHs9lvnjxCtJGpO5NsLgq+6sDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=JKf7/kHuwUvn6M8hGJSSY+s7tzull1ht+ZR11ejLj4g6OawXC8QHhL/0ej/+3gJx0
	 OZSVrGtNdDF15VzcQzVQ2NlmVCIYU/pXuUwhk5kS7/YTqtovSZxHul97n4MRW6szUW
	 vMjbWWjtlmYpU5vs15PJ1AF+5v5ImmQYsUtnsPqcqMDGr/ocmDq8IeqeIaHgQfG4gf
	 1YZOmPK8NRv7j9GEyiAbpsM4shJmOrhNufTDoKIl3YiJgXYXhlM3jogxz1Wr6o94ol
	 6DzSa3xDWKb6ePN2D+SqE8OFczACd07kGS+k1SxlsesXK/YTUxiL94mufJILFIU0B2
	 BjKVyNlTp8KSQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>, Breno Leitao <leitao@debian.org>
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu, pgovind2@uci.edu,
 ojeda@kernel.org
Subject: Re: [PATCH 0/1] rust: configfs: Fix reference creation from
 uninitialized data in `Attribute::show`
In-Reply-To: <87v77bcg0m.fsf@kernel.org>
References: <cUqSvTsTaMYu_TRrAABCYTNz0HZf5JeFdIq_Vv4e_-GFMgI5NwVfZJDcy8CTgc4fH_1OoiiMg2I2LIzQX1y3Rg==@protonmail.internalid>
 <cover.1790981219.git.pgovind2@uci.edu> <87v77bcg0m.fsf@kernel.org>
Date: Fri, 09 Oct 2026 14:49:11 +0200
Message-ID: <87se2fca48.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Hi Priya,
>
> "Priya Bala Govindasamy" <pgovind2@uci.edu> writes:
>> Dear Linux kernel maintainers,
>>
>> We are developing a tool called FerroLens to detect potential
>> unsound behavior in Rust code in the Linux kernel. The tool
>> internally uses an LLM to detect bugs.
>> We then perform manual analysis to verify these reports.
>> FerroLens reported the following bug in rust/kernel/configfs.rs:
>>
>> When a configfs attribute is written and then read through the
>> same open file, the read reuses the buffer allocated for the write.
>> This buffer is not zero-initialized. Writes to the attribute go
>> through `fill_write_buffer()`, which allocates
>> the buffer with `kmalloc`, and initializes only the input bytes
>> and a trailing NUL byte.
>> The read in `Attribute::show` callback creates an `&mut [u8; PAGE_SIZE]`
>> to the buffer. This is unsound because the reference may include
>> uninitialized bytes.
>>
>> Here is a kernel module and a python script that interacts with it
>> to demonstrate the bug:
>>
>>   // SPDX-License-Identifier: GPL-2.0
>>
>>   //! Rust configfs sample.
>>
>>   use kernel::alloc::flags;
>>   use kernel::configfs;
>>   use kernel::configfs::configfs_attrs;
>>   use kernel::new_mutex;
>>   use kernel::page::PAGE_SIZE;
>>   use kernel::prelude::*;
>>   use kernel::sync::Mutex;
>>
>>   module! {
>>       type: RustConfigfs,
>>       name: "rust_configfs",
>>       authors: ["Rust for Linux Contributors"],
>>       description: "Rust configfs sample",
>>       license: "GPL",
>>   }
>>
>>   #[pin_data]
>>   struct RustConfigfs {
>>       #[pin]
>>       config: configfs::Subsystem<Configuration>,
>>   }
>>
>>   #[pin_data]
>>   struct Configuration {
>>       message: &'static CStr,
>>       #[pin]
>>       bar: Mutex<(KBox<[u8; PAGE_SIZE]>, usize)>,
>>   }
>>
>>   impl Configuration {
>>       fn new() -> impl PinInit<Self, Error> {
>>           try_pin_init!(Self {
>>               message: c"Hello World\n",
>>               bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
>>           })
>>       }
>>   }
>>
>>   impl kernel::InPlaceModule for RustConfigfs {
>>       fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
>>           pr_info!("Rust configfs sample (init)\n");
>>
>>           // Define a subsystem with the data type `Configuration`, two
>>           // attributes, `message` and `bar` and child group type `Child`. `mkdir`
>>           // in the directory representing this subsystem will create directories
>>           // backed by the `Child` type.
>>           let item_type = configfs_attrs! {
>>               container: configfs::Subsystem<Configuration>,
>>               data: Configuration,
>>               child: Child,
>>               attributes: [
>>                   message: 0,
>>                   bar: 1,
>>               ],
>>           };
>>
>>           try_pin_init!(Self {
>>               config <- configfs::Subsystem::new(
>>                   c"rust_configfs", item_type, Configuration::new()
>>               ),
>>           })
>>       }
>>   }
>>
>>   #[vtable]
>>   impl configfs::GroupOperations for Configuration {
>>       type Child = Child;
>>
>>       fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<Child>, Error>> {
>>           // Define a group with data type `Child`, one attribute `baz` and child
>>           // group type `GrandChild`. `mkdir` in the directory representing this
>>           // group will create directories backed by the `GrandChild` type.
>>           let tpe = configfs_attrs! {
>>               container: configfs::Group<Child>,
>>               data: Child,
>>               child: GrandChild,
>>               attributes: [
>>                   baz: 0,
>>               ],
>>           };
>>
>>           Ok(configfs::Group::new(name.try_into()?, tpe, Child::new()))
>>       }
>>   }
>>
>>   #[vtable]
>>   impl configfs::AttributeOperations<0> for Configuration {
>>       type Data = Configuration;
>>
>>       fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
>>           pr_info!("Show message\n");
>>           let data = container.message.to_bytes();
>>           page[0..data.len()].copy_from_slice(data);
>>           Ok(data.len())
>>       }
>>   }
>>
>>   #[vtable]
>>   impl configfs::AttributeOperations<1> for Configuration {
>>       type Data = Configuration;
>>
>>       fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
>>           pr_info!(
>>               "Show bar: page addr = {:p}, capacity = {} bytes\n",
>>               page.as_ptr(),
>>               page.len()
>>           );
>>
>>           let is_zeroed = page.iter().all(|&b| b == 0);
>>           pr_info!("Show bar: page is zero-initialized: {}\n", is_zeroed);
>>
>>           pr_info!("Show bar: first 8 initial bytes = {:x?}\n", &page[..8]);
>>
>>           let guard = container.bar.lock();
>>           let data = guard.0.as_slice();
>>           let len = guard.1;
>>
>>           if len > PAGE_SIZE {
>>               return Err(kernel::error::code::EINVAL);
>>           }
>>
>>           page[..len].copy_from_slice(&data[..len]);
>>
>>           // 4. Verify post-write state
>>           pr_info!("Show bar: wrote {} bytes into page\n", len);
>>
>>           Ok(len)
>>       }
>>
>>       fn store(container: &Configuration, page: &[u8]) -> Result {
>>           pr_info!(
>>               "Store bar: container={:#x} bar={:#x}\n",
>>               container as *const Configuration as usize,
>>               &container.bar as *const _ as usize,
>>           );
>>           let mut guard = container.bar.lock();
>>           pr_info!(
>>               "Store bar: interpreted buf={:#x} old_len={}\n",
>>               guard.0.as_slice().as_ptr() as usize,
>>               guard.1
>>           );
>>           guard.0[0..page.len()].copy_from_slice(page);
>>           guard.1 = page.len();
>>           Ok(())
>>       }
>>   }
>>
>>   // `pin_data` cannot handle structs without braces.
>>   #[pin_data]
>>   struct Child {}
>>
>>   impl Child {
>>       fn new() -> impl PinInit<Self, Error> {
>>           try_pin_init!(Self {})
>>       }
>>   }
>>
>>   #[vtable]
>>   impl configfs::GroupOperations for Child {
>>       type Child = GrandChild;
>>
>>       fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<GrandChild>, Error>> {
>>           // Define a group with data type `GrandChild`, one attribute `gc`. As no
>>           // child type is specified, it will not be possible to create subgroups
>>           // in this group, and `mkdir`in the directory representing this group
>>           // will return an error.
>>           let tpe = configfs_attrs! {
>>               container: configfs::Group<GrandChild>,
>>               data: GrandChild,
>>               attributes: [
>>                   gc: 0,
>>               ],
>>           };
>>
>>           Ok(configfs::Group::new(
>>               name.try_into()?,
>>               tpe,
>>               GrandChild::new(),
>>           ))
>>       }
>>   }
>>
>>   #[vtable]
>>   impl configfs::AttributeOperations<0> for Child {
>>       type Data = Child;
>>
>>       fn show(_container: &Child, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
>>           pr_info!("Show baz\n");
>>           let data = c"Hello Baz\n".to_bytes();
>>           page[0..data.len()].copy_from_slice(data);
>>           Ok(data.len())
>>       }
>>   }
>>
>>   // `pin_data` cannot handle structs without braces.
>>   #[pin_data]
>>   struct GrandChild {}
>>
>>   impl GrandChild {
>>       fn new() -> impl PinInit<Self, Error> {
>>           try_pin_init!(Self {})
>>       }
>>   }
>>
>>   #[vtable]
>>   impl configfs::AttributeOperations<0> for GrandChild {
>>       type Data = GrandChild;
>>
>>       fn show(_container: &GrandChild, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
>>           pr_info!("Show grand child\n");
>>           let data = c"Hello GC\n".to_bytes();
>>           page[0..data.len()].copy_from_slice(data);
>>           Ok(data.len())
>>       }
>>   }
>>
>> poc.py:
>>
>> ```
>> import os
>>
>> fd = os.open("/sys/kernel/config/rust_configfs/bar", os.O_RDWR)
>> try:
>>     os.write(fd, b"x")
>>     os.lseek(fd, 0, os.SEEK_SET)
>>     print(repr(os.read(fd, 4096)))
>> finally:
>>     os.close(fd)
>> ```
>>
>> output:
>> [  257.079636] rust_configfs: Rust configfs sample (init)
>> [  269.778979] rust_configfs: Store bar: container=0xffffffffa0740100 bar=0xffffffffa0740110
>> [  269.779273] rust_configfs: Store bar: interpreted buf=0xffff888129ce4000 old_len=0
>> [  269.779332] rust_configfs: Show bar: page addr = 0x00000000fca4e938, capacity = 4096 bytes
>> [  269.779352] rust_configfs: Show bar: page is zero-initialized: false
>> [  269.779358] rust_configfs: Show bar: first 8 initial bytes = [78, 0, fb, 4f, 83, 88, ff, ff]
>> [  269.779374] rust_configfs: Show bar: wrote 1 bytes into page
>>
>> This output demonstrates that the bytes of the page that have not
>> been written to by `Attribute::store` are not zero-initialized,
>> which is UB when creating a reference to it.
>
> The buffer is zeroed on allocation during file open, so all the bytes in
> the page are initialized.
>
> The fact that bytes are not zeroed in a write -> seek -> read sequence
> does not mean they are not initialized. They are just not zero.

Actually there may be a problem, but I think it may be in C configfs. If
you take a look at the function that reads data from the iov_iter:

  static int fill_write_buffer(struct configfs_buffer *buffer,
            struct iov_iter *from)
  {
    int copied;

    if (!buffer->page)
      buffer->page = kmalloc(PAGE_SIZE, GFP_KERNEL); // <- HERE
    if (!buffer->page)
      return -ENOMEM;

    copied = copy_from_iter(buffer->page, SIMPLE_ATTR_SIZE - 1, from);
    buffer->needs_read_fill = 1;
    /* if buf is assumed to contain a string, terminate it by \0,
    * so e.g. sscanf() can scan the string easily */
    buffer->page[copied] = 0;
    return copied ? : -EFAULT;
  }

This function does not zero the page that is written into. This,
combined with the buffer being per file handle means that you can read
the original data in the page. The `kmalloc` should be probably be
replaced with a `kzalloc`. This should be a problem for C modules as
well.

Cc: Breno Leitao <leitao@debian.org>

Looks like I only replied Priya when replying, so I'm adding back
everyone from the original email.

Best regards,
Andreas Hindborg


