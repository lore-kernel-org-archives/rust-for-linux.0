Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3830BB94;
	Fri,  5 Dec 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928213; cv=none; b=ZYB69DC9wYmigu/6GJsfl9BaT6F+J3JvKBg2eNnpGde6DvOujI58o4DZPI5W9IeNP8+7Ib5eVrQ3QpS0uDiFCve7ndYCe9kjo08I/GAhtq7v2jMeQtPMcV5VYbjfOIVda+uAG2omLIZsxoUZCXgBPIQGYXRAPolsgIvfbXozp5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928213; c=relaxed/simple;
	bh=qfeFoWxW9ehKbe3EzIwQGdG2yZayU/tIkONBJcT+Ru0=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:MIME-Version; b=dSpG/Q0jeJ/Z4HOqJIfR2sGuV3vgXAcwnVAsSps5+crGscG3sGIbsHFrTMJ6szB8KXXKuR3B6gZsxBMH0pRaUAFQYG0UEt63tLhZo4x3eg/cETf+LPUOlb7VlzcTXc81A0YV/uf43Uix+bGlV65eZcF4Kkho6E1fb1DYHry8zcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEy9Y/SS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEy9Y/SS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB90C4CEF1;
	Fri,  5 Dec 2025 09:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764928210;
	bh=qfeFoWxW9ehKbe3EzIwQGdG2yZayU/tIkONBJcT+Ru0=;
	h=Date:Cc:To:From:Subject:From;
	b=tEy9Y/SSRxJiVUSMPtIUrHV7jGffyNCZuGLyql4mnEIZFvoG7DUag4BribejAmB5L
	 YEyjNn2YZd3e8okTKAbQagH5zL1QOR/ctA0o4RQcEaf05LJuOoUM9+LFLXXY3Ay5IK
	 i4Bjf7FoouE7jH6LBY4y+Nvs0+KFm18Ks8cBM9jSWV2Ps7Oyr7E+F1tzYfu6+KS/Jd
	 rILZM8d0UD7UsS9YRcZ76HNFekl30krL++j+J/ldJ+q3rW8Bi4A/On577gFmxKnjXC
	 OgPcFmXb8pY3EuEYI2RbYbciAFj5puRTeCPDsZYXi7w4svth0olR/45Sm3QXByC/yw
	 HQcDulgnwYyOQ==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Dec 2025 22:50:06 +1300
Message-Id: <DEQ6U11MLIQW.370OVLWEKUIKV@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Driver core changes for 6.19-rc1
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=0
X-Identity-Key: id8
Fcc: imap://kernel%40dakr.org@imap.dakr.org/Sent
X-TUID: iFuKszWfwZxw

Hi Linus,

Please pull these driver-core changes.

There are a few conflicts with other trees: There are in total four minor i=
mport
conflicts with the DRM and Rust trees. Additionally, there is a conflict wi=
th
the tip tree replacing Rust native atomics in the debugfs code (the resolut=
ion
in linux-next should be fine).

In order to avoid non-trivial conflicts, the PR also contains a few patches
usually going through other trees, i.e. the introduction of I2C Rust
infrastructure, a few uaccess patches, as well as one (more minor) patch ea=
ch of
FS, pin-init and timekeeping.

All changes have been in linux-next for at least five rounds; two (rather
trivial) regression fixes [1][2] for two rounds.

- Danilo

[1] https://patch.msgid.link/20251202070927.14198-1-dev@null.aaront.org
[2] https://patch.msgid.link/20251202210501.40998-1-dakr@kernel.org

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa=
:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-6.19-rc1

for you to fetch changes up to 473b9f331718267815649cd93801da832200db71:

  rust: pci: fix build failure when CONFIG_PCI_MSI is disabled (2025-12-04 =
00:24:47 +1300)

----------------------------------------------------------------
Driver core changes for 6.19-rc1

- Arch Topology:
  - Move parse_acpi_topology() from arm64 to common code for reuse in RISC-=
V

- CPU:
  - Expose housekeeping CPUs through /sys/devices/system/cpu/housekeeping
  - Print a newline (or 0x0A) instead of '(null)' reading
    /sys/devices/system/cpu/nohz_full when nohz_full=3D is not set

- debugfs
  - Remove (broken) 'no-mount' mode
  - Remove redundant access mode checks in debugfs_get_tree() and
    debugfs_create_*() functions

- Devres:
  - Remove unused devm_free_percpu() helper
  - Move devm_alloc_percpu() from device.h to devres.h

- Firmware Loader:
  - Replace simple_strtol() with kstrtoint()
  - Do not call cancel_store() when no upload is in progress

- kernfs:
  - Increase struct super_block::maxbytes to MAX_LFS_FILESIZE
  - Fix a missing unwind path in __kernfs_new_node()

- Misc:
  - Increase the name size in struct auxiliary_device_id to 40 characters
  - Replace system_unbound_wq with system_dfl_wq and add WQ_PERCPU to
    alloc_workqueue()

- Platform:
  - Replace ERR_PTR() with IOMEM_ERR_PTR() in platform ioremap functions

- Rust:
  - Auxiliary:
    - Unregister auxiliary device on parent device unbind
    - Move parent() to impl Device; implement device context aware parent()=
 for
      Device<Bound>
    - Illustrate how to safely obtain a driver's device private data when
      calling from an auxiliary driver into the parant device driver

  - DebugFs:
    - Implement support for binary large objects

  - Device:
    - Let probe() return the driver's device private data as pinned initial=
izer,
      i.e. impl PinInit<Self, Error>
    - Implement safe accessor for a driver's device private data for
      Device<Bound> (returned reference can't out-live driver binding and
      guarantees the correct private data type)
    - Implement AsBusDevice trait, to be used by class device abstractions =
to
      derive the bus device type of the parent device

  - DMA:
    - Store raw pointer of allocation as NonNull
    - Use start_ptr() and start_ptr_mut() to inherit correct mutability of =
self

  - FS:
    - Add file::Offset type alias

  - I2C:
    - Add abstractions for I2C device / driver infrastructure
    - Implement abstractions for manual I2C device registrations

  - I/O:
    - Use "kernel vertical" style for imports
    - Define ResourceSize as resource_size_t
    - Move ResourceSize to top-level I/O module
    - Add type alias for phys_addr_t
    - Implement Rust version of read_poll_timeout_atomic()

  - PCI:
    - Use "kernel vertical" style for imports
    - Move I/O and IRQ infrastructure to separate files
    - Add support for PCI interrupt vectors
    - Implement TryInto<IrqRequest<'a>> for IrqVector<'a> to convert an
      IrqVector bound to specific pci::Device into an IrqRequest bound to t=
he
      same pci::Device's parent Device
    - Leverage pin_init_scope() to get rid of redundant Result in IRQ metho=
ds

  - PinInit:
    - Add {pin_}init_scope() to execute code before creating an initializer

  - Platform:
    - Leverage pin_init_scope() to get rid of redundant Result in IRQ metho=
ds

  - Timekeeping:
    - Implement abstraction of udelay()

  - Uaccess:
    - Implement read_slice_partial() and read_slice_file() for UserSliceRea=
der
    - Implement write_slice_partial() and write_slice_file() for UserSliceW=
riter

- sysfs
  - Prepare the constification of struct attribute

----------------------------------------------------------------
Aaron Thompson (3):
      debugfs: Remove redundant access mode checks
      debugfs: Remove broken no-mount mode
      debugfs: Fix default access mode config check

Aaron Tomlin (3):
      sysfs/cpu: Use DEVICE_ATTR_RO for nohz_full attribute
      tick/nohz: avoid showing '(null)' if nohz_full=3D not set
      tick/nohz: Expose housekeeping CPUs in sysfs

Alice Ryhl (4):
      rust: io: define ResourceSize as resource_size_t
      rust: io: move ResourceSize to top-level io module
      rust: scatterlist: import ResourceSize from kernel::io
      rust: io: add typedef for phys_addr_t

Andy Shevchenko (2):
      devres: Remove unused devm_free_percpu()
      devres: Move devm_alloc_percpu() and related to devres.h

Benno Lossin (1):
      add `[pin_]init_scope` to execute code before creating an initializer

Danilo Krummrich (32):
      rust: pci: implement TryInto<IrqRequest<'a>> for IrqVector<'a>
      rust: pci: move I/O infrastructure to separate file
      rust: pci: move IRQ infrastructure to separate file
      rust: driver: let probe() return impl PinInit<Self, Error>
      rust: device: narrow the generic of drvdata_obtain()
      rust: device: introduce Device::drvdata()
      rust: auxiliary: consider auxiliary devices always have a parent
      rust: auxiliary: unregister on parent device unbind
      rust: auxiliary: move parent() to impl Device
      rust: auxiliary: implement parent() for Device<Bound>
      samples: rust: auxiliary: misc cleanup of ParentDriver::connect()
      samples: rust: auxiliary: illustrate driver interaction
      rust: usb: fix broken call to T::disconnect()
      rust: fs: add file::Offset type alias
      rust: uaccess: add UserSliceReader::read_slice_partial()
      rust: uaccess: add UserSliceReader::read_slice_file()
      rust: uaccess: add UserSliceWriter::write_slice_partial()
      rust: uaccess: add UserSliceWriter::write_slice_file()
      rust: debugfs: support for binary large objects
      rust: debugfs: support blobs from smart pointers
      samples: rust: debugfs: add example for blobs
      rust: debugfs: support binary large objects for ScopedDir
      samples: rust: debugfs_scoped: add example for blobs
      rust: auxiliary: fix false positive warning for missing a safety comm=
ent
      rust: pci: get rid of redundant Result in IRQ methods
      rust: platform: get rid of redundant Result in IRQ methods
      rust: debugfs: Implement BinaryReader for Mutex<T> only when T is Unp=
in
      rust: io: cleanup imports and use "kernel vertical" style
      rust: pci: use "kernel vertical" style for imports
      rust: dma: make use of start_ptr() and start_ptr_mut()
      rust: dma: use NonNull<T> instead of *mut T
      rust: pci: fix build failure when CONFIG_PCI_MSI is disabled

FUJITA Tomonori (3):
      rust: simplify read_poll_timeout's example code
      rust: add udelay() function
      rust: Add read_poll_timeout_atomic function

Greg Kroah-Hartman (1):
      Merge 6.18-rc3 into driver-core-next

Igor Korotin (4):
      rust: i2c: add basic I2C device and driver abstractions
      rust: i2c: add manual I2C device creation abstractions
      samples: rust: add Rust I2C sample driver
      samples: rust: add Rust I2C client registration sample

Jane Chu (1):
      fs/kernfs: raise sb->maxbytes to MAX_LFS_FILESIZE

Joel Fernandes (1):
      rust: pci: Allocate and manage PCI interrupt vectors

Kaushlendra Kumar (2):
      firmware_loader: Only call cancel when upload is active
      firmware_loader: Replace simple_strtol() with kstrtoint()

Marco Crivellari (2):
      driver core: replace use of system_unbound_wq with system_dfl_wq
      driver core: WQ_PERCPU added to alloc_workqueue users

Markus Probst (1):
      rust: Add trait to convert a device reference to a bus device referen=
ce

Miguel Ojeda (1):
      rust: i2c: prepare for `core::ffi::CStr`

Pei Xiao (1):
      platform: Use IOMEM_ERR_PTR for ioremap error returns

Peter Colberg (3):
      rust: pci: refer to legacy as INTx interrupts
      rust: pci: normalise spelling of PCI BAR
      samples: rust: fix module name for Rust PCI driver sample

Raag Jadav (1):
      mod_devicetable: Bump auxiliary_device_id name size

Thomas Wei=C3=9Fschuh (7):
      sysfs: attribute_group: allow registration of const attribute
      sysfs: transparently handle const pointers in ATTRIBUTE_GROUPS()
      sysfs: introduce __SYSFS_FUNCTION_ALTERNATIVE()
      sysfs: attribute_group: enable const variants of is_visible()
      samples/kobject: add is_visible() callback to attribute group
      samples/kobject: constify 'struct foo_attribute'
      sysfs: simplify attribute definition macros

Vincent Liu (1):
      driver core: Check drivers_autoprobe for all added devices

Will Rosenberg (1):
      kernfs: fix memory leak of kernfs_iattrs in __kernfs_new_node

Yunhui Cui (1):
      arch_topology: move parse_acpi_topology() to common code

 Documentation/ABI/testing/sysfs-devices-system-cpu |  11 +
 Documentation/admin-guide/kernel-parameters.txt    |   6 +-
 Documentation/driver-api/driver-model/devres.rst   |   1 -
 MAINTAINERS                                        |  10 +
 arch/arm64/include/asm/topology.h                  |   3 +
 arch/arm64/kernel/topology.c                       | 101 --------
 drivers/base/arch_topology.c                       |  96 +++++++-
 drivers/base/base.h                                |  16 ++
 drivers/base/bus.c                                 |   3 +-
 drivers/base/core.c                                |   2 +-
 drivers/base/cpu.c                                 |  26 +-
 drivers/base/dd.c                                  |  12 +-
 drivers/base/devres.c                              |  25 --
 drivers/base/firmware_loader/sysfs.c               |  10 +-
 drivers/base/firmware_loader/sysfs_upload.c        |   6 +-
 drivers/cpufreq/rcpufreq_dt.rs                     |   4 +-
 drivers/gpu/drm/nova/driver.rs                     |   4 +-
 drivers/gpu/drm/nova/file.rs                       |   2 +-
 drivers/gpu/drm/tyr/driver.rs                      |   4 +-
 drivers/gpu/nova-core/driver.rs                    |  42 ++--
 fs/debugfs/inode.c                                 |  36 +--
 fs/debugfs/internal.h                              |  13 -
 fs/kernfs/dir.c                                    |   5 +-
 fs/kernfs/mount.c                                  |   1 +
 fs/sysfs/group.c                                   |  10 +-
 include/linux/arch_topology.h                      |   5 +
 include/linux/device.h                             |  19 --
 include/linux/device/devres.h                      |  17 ++
 include/linux/mod_devicetable.h                    |   2 +-
 include/linux/platform_device.h                    |   6 +-
 include/linux/sysfs.h                              |  48 ++--
 lib/Kconfig.debug                                  |   9 +-
 rust/bindings/bindings_helper.h                    |   7 +
 rust/helpers/pci.c                                 |  14 +-
 rust/helpers/time.c                                |   5 +
 rust/kernel/auxiliary.rs                           | 120 +++++----
 rust/kernel/cpufreq.rs                             |   4 +-
 rust/kernel/debugfs.rs                             | 110 ++++++++-
 rust/kernel/debugfs/file_ops.rs                    | 146 ++++++++++-
 rust/kernel/debugfs/traits.rs                      | 238 +++++++++++++++++=
-
 rust/kernel/device.rs                              | 130 +++++++++-
 rust/kernel/devres.rs                              |  18 +-
 rust/kernel/dma.rs                                 |  29 ++-
 rust/kernel/driver.rs                              |   4 +-
 rust/kernel/fs/file.rs                             |   5 +
 rust/kernel/i2c.rs                                 | 586 +++++++++++++++++=
+++++++++++++++++++++++++++
 rust/kernel/io.rs                                  |  32 ++-
 rust/kernel/io/mem.rs                              |  36 +--
 rust/kernel/io/poll.rs                             |  93 ++++++-
 rust/kernel/io/resource.rs                         |  31 +--
 rust/kernel/lib.rs                                 |   2 +
 rust/kernel/pci.rs                                 | 231 ++++-------------
 rust/kernel/pci/id.rs                              |   5 +-
 rust/kernel/pci/io.rs                              | 144 +++++++++++
 rust/kernel/pci/irq.rs                             | 252 +++++++++++++++++=
++
 rust/kernel/platform.rs                            |  63 +++--
 rust/kernel/scatterlist.rs                         |   2 +-
 rust/kernel/time/delay.rs                          |  37 +++
 rust/kernel/uaccess.rs                             |  85 +++++++
 rust/kernel/usb.rs                                 |  25 +-
 rust/pin-init/src/lib.rs                           |  87 +++++++
 samples/kobject/kset-example.c                     |  44 ++--
 samples/rust/Kconfig                               |  25 +-
 samples/rust/Makefile                              |   2 +
 samples/rust/rust_debugfs.rs                       |  34 ++-
 samples/rust/rust_debugfs_scoped.rs                |  14 +-
 samples/rust/rust_dma.rs                           |  37 ++-
 samples/rust/rust_driver_auxiliary.rs              |  59 +++--
 samples/rust/rust_driver_i2c.rs                    |  74 ++++++
 samples/rust/rust_driver_pci.rs                    |  53 ++--
 samples/rust/rust_driver_platform.rs               |   6 +-
 samples/rust/rust_driver_usb.rs                    |   5 +-
 samples/rust/rust_i2c_client.rs                    | 147 +++++++++++
 73 files changed, 2876 insertions(+), 720 deletions(-)
 create mode 100644 rust/kernel/i2c.rs
 create mode 100644 rust/kernel/pci/io.rs
 create mode 100644 rust/kernel/pci/irq.rs
 create mode 100644 samples/rust/rust_driver_i2c.rs
 create mode 100644 samples/rust/rust_i2c_client.rs
