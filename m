Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E947F762
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 23:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791502939; cv=none; b=kklFwLwF4KOp0w94qWcgWLVPCOoZTDXwqWjrSOI6zorDz2P0Vjv5F3/xUQM3cTtycCzztpQckFfcJn6OCn/MJwJh/ebvMctYg9/BWjtKr8VudpivEzawrM8iXTxL3iqoZmwuQ0TT02Mf2QoZ5nFfMSqWoiae1vw3bwa6w+M9/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791502939; c=relaxed/simple;
	bh=Usvx5D8OCN6ugyMo/wZfv+cyYvLAxTBVZyq/IbDE1gA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oe/aT2KoKMWoIWAcSGhcMYilVD6wf9QhScyRugukK5ssWm7aGgzd8CvVR6v9MjPa6z7GIUPK5sbNazmk+bQouIyGmbFMDnloLwl7H34pAiHC306ZmBI2RIxMoAEv5vQtNzkkp5tdQVT2vGoIYlZ9i00mi3bbaR2Jju9LgmLSpOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=lPolgDOi; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="lPolgDOi"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so5039231c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Oct 2026 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1791502937; x=1792107737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+N8ubJM/3qvcE6yT7JqGcjcViWSd/bv+0mrjneOcroQ=;
        b=lPolgDOilORoi77bLKUvay6C+hoIwx/tK7Qf7pGwAnpE178kOVXnUV5UNknalWTIMQ
         UXxMSAwL46gc5l7ckPEo4FkxJtGWzcK3WB7/g28z25ijnC6JDn8N41ArKxyTDS77S/+Z
         EGitqZQNur6lIzTiQ4ngYzBSACh8QD5sl85Xbe7xNlM90CC/rUkXCTgOUMzTdgPGHMUN
         cnoF4q/g2XK3/N2D6h29Z+B2Ei98T1v17Hbsh16lUTZjgX5izdPpM5YgfOHfdQSFbZ1t
         5VP7De7utD94mhqehc3vDsMiVHeaYzFtfeZ3LQADlaoqUg2YMjiVDIg1FpgG0ekPxGFK
         XTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791502937; x=1792107737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+N8ubJM/3qvcE6yT7JqGcjcViWSd/bv+0mrjneOcroQ=;
        b=cIkn4bDMS9C69+xX63dcRW3WtgP5OfEwU7Ioi2vDDf6on4MFSxCP+RXQE7iNgK6hIZ
         ipOig5Qidyo1DJ90MQmhTQSSlYGHiw5DdkJ/jByCN3dESvuvv0A/OY+UC1uujSVrPhw3
         UoL+RnM/ns8lrx95rvl0B3uH14zANwsZ47zTu0M/cbKTOXuGLteVw7u45VOzBvHYH4/N
         wHB36TmSzRaB2g+0Emjq3rnvQ/gLDznDbd2NMeHaELNVd3lxHgoWhuvOcL+qJVyOCHpV
         OSoMRrOKMPMoggD46ks6jatZwu0N27Y6cHVlhzlQqb6OClExC0X6yK0tZyqXzU7SXx/+
         H8QQ==
X-Forwarded-Encrypted: i=1; AKwUvByxM2t+o0gsZRcKgMK29dvm537vADOFZdnJcBpU6RLOZKaOT7Q2gG9P3AuMqRS82CVCG5TCDb/4ldM5r567nw==@vger.kernel.org
X-Gm-Message-State: AFuF++m1o9ePtUCduswNDagSSgUW/8qtP8S8Akmrghvap4qY3rcy3l4l
	5LKmCYSQTwpoUOOn1TrrbdVq29mN6HMr77E95eQ5RdSzn+GZTqGObMoylM6HaUkS43A=
X-Gm-Gg: AYBFou00NxaDobj2OivbGTd/MKAPqqlRBazu7AsH3DvD+ZEc0qyxkM0oHoumEUC2P0y
	dQGozsMWbUuwi2oxVqOckgTseG/0OitWz4k3+JAEjtLLg3fG4afiaPb96PFh/MULJmlM+fv0gdE
	NM6bcFMI0mN5tIDfSbH3OWinZpSwh6rlUkoZj1zhtdSokwIkADbCkT46rbwYwFxYMu+j72IdVYA
	dm4aevomuGWo5ASkmz91OadEOH8uLbpSNBWU4cE0LaaHFNrnGy+XC6ir20ubcxvzC1CRtEe8Xja
	0d4eWxeW1GhsDPfIScT0ijW0LyBb/EZjmcbovEKI6G0jFGm06AcX4sN5Lkpt9tXSpRRbcUnx4pT
	75LSL+lYvLD7RcOr4XpahV87J1Ns++WtgWd7P51WqhDw2agHmMmlQIMCcwRwZK1Iyj96D7ATKJ9
	o8na1nJ48CahP6IuQxgUfeDVQ/9MFZxxNWn7InUhVZws+5+zMuTZ2z+FjT6LCln5woxVCdcVim8
	s54SsLomSy54uNKWWJqvB0JGx+04/krtcNxfV69QMzHnQ==
X-Received: by 2002:a05:701b:270e:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-16a5c5f20f0mr164640c88.13.1791502936589;
        Thu, 08 Oct 2026 16:42:16 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1699718c547sm1483557c88.3.2026.10.08.16.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 16:42:16 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: configfs: Fix reference creation from uninitialized data in `Attribute::show`
Date: Thu,  8 Oct 2026 23:42:13 +0000
Message-Id: <cover.1790981219.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential 
unsound behavior in Rust code in the Linux kernel. The tool 
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports. 
FerroLens reported the following bug in rust/kernel/configfs.rs:

When a configfs attribute is written and then read through the 
same open file, the read reuses the buffer allocated for the write.
This buffer is not zero-initialized. Writes to the attribute go
through `fill_write_buffer()`, which allocates
the buffer with `kmalloc`, and initializes only the input bytes 
and a trailing NUL byte. 
The read in `Attribute::show` callback creates an `&mut [u8; PAGE_SIZE]`
to the buffer. This is unsound because the reference may include 
uninitialized bytes.

Here is a kernel module and a python script that interacts with it 
to demonstrate the bug:

  // SPDX-License-Identifier: GPL-2.0

  //! Rust configfs sample.

  use kernel::alloc::flags;
  use kernel::configfs;
  use kernel::configfs::configfs_attrs;
  use kernel::new_mutex;
  use kernel::page::PAGE_SIZE;
  use kernel::prelude::*;
  use kernel::sync::Mutex;

  module! {
      type: RustConfigfs,
      name: "rust_configfs",
      authors: ["Rust for Linux Contributors"],
      description: "Rust configfs sample",
      license: "GPL",
  }

  #[pin_data]
  struct RustConfigfs {
      #[pin]
      config: configfs::Subsystem<Configuration>,
  }

  #[pin_data]
  struct Configuration {
      message: &'static CStr,
      #[pin]
      bar: Mutex<(KBox<[u8; PAGE_SIZE]>, usize)>,
  }

  impl Configuration {
      fn new() -> impl PinInit<Self, Error> {
          try_pin_init!(Self {
              message: c"Hello World\n",
              bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
          })
      }
  }

  impl kernel::InPlaceModule for RustConfigfs {
      fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
          pr_info!("Rust configfs sample (init)\n");

          // Define a subsystem with the data type `Configuration`, two
          // attributes, `message` and `bar` and child group type `Child`. `mkdir`
          // in the directory representing this subsystem will create directories
          // backed by the `Child` type.
          let item_type = configfs_attrs! {
              container: configfs::Subsystem<Configuration>,
              data: Configuration,
              child: Child,
              attributes: [
                  message: 0,
                  bar: 1,
              ],
          };

          try_pin_init!(Self {
              config <- configfs::Subsystem::new(
                  c"rust_configfs", item_type, Configuration::new()
              ),
          })
      }
  }

  #[vtable]
  impl configfs::GroupOperations for Configuration {
      type Child = Child;

      fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<Child>, Error>> {
          // Define a group with data type `Child`, one attribute `baz` and child
          // group type `GrandChild`. `mkdir` in the directory representing this
          // group will create directories backed by the `GrandChild` type.
          let tpe = configfs_attrs! {
              container: configfs::Group<Child>,
              data: Child,
              child: GrandChild,
              attributes: [
                  baz: 0,
              ],
          };

          Ok(configfs::Group::new(name.try_into()?, tpe, Child::new()))
      }
  }

  #[vtable]
  impl configfs::AttributeOperations<0> for Configuration {
      type Data = Configuration;

      fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
          pr_info!("Show message\n");
          let data = container.message.to_bytes();
          page[0..data.len()].copy_from_slice(data);
          Ok(data.len())
      }
  }

  #[vtable]
  impl configfs::AttributeOperations<1> for Configuration {
      type Data = Configuration;

      fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
          pr_info!(
              "Show bar: page addr = {:p}, capacity = {} bytes\n",
              page.as_ptr(),
              page.len()
          );

          let is_zeroed = page.iter().all(|&b| b == 0);
          pr_info!("Show bar: page is zero-initialized: {}\n", is_zeroed);

          pr_info!("Show bar: first 8 initial bytes = {:x?}\n", &page[..8]);

          let guard = container.bar.lock();
          let data = guard.0.as_slice();
          let len = guard.1;
          
          if len > PAGE_SIZE {
              return Err(kernel::error::code::EINVAL);
          }

          page[..len].copy_from_slice(&data[..len]);

          // 4. Verify post-write state
          pr_info!("Show bar: wrote {} bytes into page\n", len);

          Ok(len)
      }

      fn store(container: &Configuration, page: &[u8]) -> Result {
          pr_info!(
              "Store bar: container={:#x} bar={:#x}\n",
              container as *const Configuration as usize,
              &container.bar as *const _ as usize,
          );
          let mut guard = container.bar.lock();
          pr_info!(
              "Store bar: interpreted buf={:#x} old_len={}\n",
              guard.0.as_slice().as_ptr() as usize,
              guard.1
          );
          guard.0[0..page.len()].copy_from_slice(page);
          guard.1 = page.len();
          Ok(())
      }
  }

  // `pin_data` cannot handle structs without braces.
  #[pin_data]
  struct Child {}

  impl Child {
      fn new() -> impl PinInit<Self, Error> {
          try_pin_init!(Self {})
      }
  }

  #[vtable]
  impl configfs::GroupOperations for Child {
      type Child = GrandChild;

      fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<GrandChild>, Error>> {
          // Define a group with data type `GrandChild`, one attribute `gc`. As no
          // child type is specified, it will not be possible to create subgroups
          // in this group, and `mkdir`in the directory representing this group
          // will return an error.
          let tpe = configfs_attrs! {
              container: configfs::Group<GrandChild>,
              data: GrandChild,
              attributes: [
                  gc: 0,
              ],
          };

          Ok(configfs::Group::new(
              name.try_into()?,
              tpe,
              GrandChild::new(),
          ))
      }
  }

  #[vtable]
  impl configfs::AttributeOperations<0> for Child {
      type Data = Child;

      fn show(_container: &Child, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
          pr_info!("Show baz\n");
          let data = c"Hello Baz\n".to_bytes();
          page[0..data.len()].copy_from_slice(data);
          Ok(data.len())
      }
  }

  // `pin_data` cannot handle structs without braces.
  #[pin_data]
  struct GrandChild {}

  impl GrandChild {
      fn new() -> impl PinInit<Self, Error> {
          try_pin_init!(Self {})
      }
  }

  #[vtable]
  impl configfs::AttributeOperations<0> for GrandChild {
      type Data = GrandChild;

      fn show(_container: &GrandChild, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
          pr_info!("Show grand child\n");
          let data = c"Hello GC\n".to_bytes();
          page[0..data.len()].copy_from_slice(data);
          Ok(data.len())
      }
  }
    
poc.py:

```
import os

fd = os.open("/sys/kernel/config/rust_configfs/bar", os.O_RDWR)
try:
    os.write(fd, b"x")
    os.lseek(fd, 0, os.SEEK_SET)
    print(repr(os.read(fd, 4096)))
finally:
    os.close(fd)
```

output:
[  257.079636] rust_configfs: Rust configfs sample (init)
[  269.778979] rust_configfs: Store bar: container=0xffffffffa0740100 bar=0xffffffffa0740110
[  269.779273] rust_configfs: Store bar: interpreted buf=0xffff888129ce4000 old_len=0
[  269.779332] rust_configfs: Show bar: page addr = 0x00000000fca4e938, capacity = 4096 bytes
[  269.779352] rust_configfs: Show bar: page is zero-initialized: false
[  269.779358] rust_configfs: Show bar: first 8 initial bytes = [78, 0, fb, 4f, 83, 88, ff, ff]
[  269.779374] rust_configfs: Show bar: wrote 1 bytes into page

This output demonstrates that the bytes of the page that have not 
been written to by `Attribute::store` are not zero-initialized, 
which is UB when creating a reference to it.

Priya Bala Govindasamy (1):
  rust: configfs: Fix reference creation from uninitialized data in
    `Attribute::show`

 rust/kernel/configfs.rs | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.34.1

