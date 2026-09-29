Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B8741E6CE
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703978; cv=none; b=ID1G8175Mz9o3fwkaigh2lzFIWtxo55jXb4HLhnySuwar255GQvlS8EPZOeTwBHt34btcHbGG8dAwMFdaEQEXSJNBiWJ6nU/Qux5Tljyl0EW8EtzAkfMpDAn23xCEOsYxKvwu4+gKbQE5wKRxfSlf0vzW3NjCpYijKWbl8oDncM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703978; c=relaxed/simple;
	bh=pX0O1N/iExQoutAb2M1W6KhpTgI/Vgqip3LabVNat2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WliKhi+Xtw92MZ2sM4wKBvNjJrH6iH0A841STHZNl+Ke3BRcRjoUE0XniZBQHH9nBMi8R1GueqOj/5sYESuLaG39AnK1rJDHHPadeTj1MV5X3LAH8XfeaTSeyiZxI2M8EXy/bmdp/skU/SlCsmPWUARM2JkvP4fIsCyTrE3IoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=YOQu/JNB; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="YOQu/JNB"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso4758677eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1790703976; x=1791308776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVgzFvrslYB1Eb5rNO5WS9AESHYq7uJ3gpsSGpcF1Vw=;
        b=YOQu/JNBp05IPdULY2P+eAGe6fpHoQAYPKulNdwf/nkiF2oQdyGU7wzE1nKjA8JKmo
         fUQj9wDnnXepn7SDiCx70/zQonanzHWpR26g26JD0jQ0d7MVjEzRKGhmFAL2MAXAD2Me
         STlJyaE+RSy468dq0/2LpmOReabQiOijpWi07gWlIaHqY94Oe9RBNTDBeDJlOt0rVH01
         m26/ihNf1JBs9Hrkp0pi5jcXvjDegAqEeQXeBMBqTTYQsOAK4xfPrQ7x4xe+TmNUL3vu
         ZqHvLM5CrCqAp5my60ReXd+xOIJRIrsbee1HV72PCEw99AZswN4OSyZy9/LXSsUUn4gm
         ppeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703976; x=1791308776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVgzFvrslYB1Eb5rNO5WS9AESHYq7uJ3gpsSGpcF1Vw=;
        b=F3FbMGgLD6RZJgBNJmCxnEPaHkTEvnv+z4XpYrm3TK9qe11g9yhn21Ni7KXOeoshih
         wwDs6XxG+Nmc6lniqgHj2ipEXV5HrAcJTQPHxbT/llIIw41JwmTjgBguKfVwAtYvc4cG
         srBSGMFfin1Fmchd4T+5+X5v7B0GRLT7G2K9XfuaYNrZfr1z5EKh55K3hSIG/y+r/JzI
         qBwuR/tTRrVNYPM6aoE7ZR1TSOe6UH/CkIkFo+BBwUayh27O48rTGZyCNZ/TFDK4FMDH
         5VSPAbSq1FnU9jmOcuu5Ew5T33Ip7i08Qh6IGRz3n+6vK3iYupPGHL3FnZSF/hvHhnZq
         gmeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy8ePu90vGehR+tjuS450B6jdsNgyulGRclx4mMJE5MckVH8fIAaxICpFKJ6Wmj+d8jTA2EnH4AOEUl+kexQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lfPtrYK1ghL7pat0haJOYNjVccpEggC/u4C+EYxGDAGsZPIbA2
	2wSWj5kQd+DIRQBOCotBKxQeneJ6OIMSQ4pRCLw2TAK+LFviJaL7QKK1Z/Gen4G1nbA=
X-Gm-Gg: AYBFou3PrkauR+d153SDjyMNfM6J/vLs+OOMKnsthW4gcn6/2jkjQrwKnpmfzogQ4Od
	q3PyfMZD9yx+/UXxLWJxayACra/23kNYOtQap433V97OCp0gZIoo/juXNcWZ/jImePrlDPZucKs
	jP0I+EvED3DHK1MGPx0TXpsFDginnrbguAH1jsXHHroXcD18x1NPNvcKXnpRWBZTlB2oxiDI5/q
	+nV2D2mmqyopX+8NRFF4jPDTlrI8JCcJ+y5Fas2aFCsT1wMrozjjIUzcWNwatvKbUkZrTtJjfCJ
	FRr8GVpkEZ0qqRIchbnT/NBxh13lOYIkpxplDsoAW55EHcPBWykeaWJN2IOGgQfBzQVYF8xg2VM
	db8gSNsVh8f0HY4GOYw37vUUdWco19tUwD5L59S+nFpOMpC32qQdhv19tds+paGE1ggAUHKGfWu
	p05T+LnC5d6yt36rF96W5Yx/CfOUsF+oUG3xR6ecemwK+CypeIOTkVlLXTqEr1OcDHRi46QLBVM
	cD3GjZRxrOILqEsNfZpKdAWoKtfDdrhE5E2zhVuX5+HvA==
X-Received: by 2002:a05:7300:51fa:b0:34a:cb0e:f4e5 with SMTP id 5a478bee46e88-34c6827ffebmr46251eec.40.1790703975628;
        Tue, 29 Sep 2026 10:46:15 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-34c32072ee7sm731120eec.0.2026.09.29.10.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:46:14 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	me@kloenk.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: io: Fix `Region::drop` releasing nested resources from the wrong parent
Date: Tue, 29 Sep 2026 17:46:12 +0000
Message-ID: <cover.1788901318.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20260929174612.Jss-fw-sa4kdEy7Hk2_uC8PLsUpZ-K_gGWyuz4Qc6_k@z>

Resending this because I think it was lost.

Dear Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential
unsound behavior in Rust code in the Linux kernel. The tool
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports.
FerroLens reported the following bug in rust/kernel/io/resource.rs:

Io resource regions can be requested beneath a specified parent 
resource. `Resource::request_region()` passes self as the parent to 
`__request_region()`. But `Region` does not retain that parent.

`Region::drop()` calls `release_mem_region()` or `release_region()`
to release the `Resource`.
Both of these functions start searching for the region to release 
from the global resource root. They also do not search inside busy 
regions. So they may not find a child region if it is nested 
under a busy parent. This leaves the child still allocated. But the 
remaining fields of the child `Region` are freed, including the 
`name` Cstring that it owned. 

Therefore, for nested regions, `Region::drop()` may fail to find 
and release the child region. 
This can lead to resource leaks and leaving the name pointer dangling.

Here is a PoC to demonstrate this issue:

// SPDX-License-Identifier: GPL-2.0

//! Demonstrate that `Region::drop` releases relative to the global resource
//! root instead of the parent passed to `Resource::request_region`.

use core::ptr;

use kernel::{
    bindings,
    io::{
        resource::Flags,
        PhysAddr, Resource, ResourceSize,
    },
    str::CStr,
    prelude::*,
};

module! {
    type: ResourceParentPoc,
    name: "resource_parent_poc",
    authors: ["Priya Govindasamy"],
    description: "PoC for releasing a nested Region with the wrong parent",
    license: "GPL",
    params: {
        start: u64 {
            default: 0x1000_0000,
            description: "Start of the temporary 4 KiB iomem reservation",
        },
    },
}

const PARENT_SIZE: ResourceSize = 0x1000;
const CHILD_OFFSET: PhysAddr = 0x100;
const CHILD_SIZE: ResourceSize = 0x100;

/// Obtain the underlying C resource pointer from its transparent Rust wrapper.
fn resource_to_raw(resource: &Resource) -> *mut bindings::resource {
    ptr::from_ref(resource).cast_mut().cast()
}

struct ResourceParentPoc;

impl kernel::Module for ResourceParentPoc {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        let start: PhysAddr = module_parameters::start
            .value()
            .try_into()
            .map_err(|_| EINVAL)?;
        let child_start = start.checked_add(CHILD_OFFSET).ok_or(EINVAL)?;

        // Check the complete parent interval too, since __request_region uses
        // `start + size - 1` internally.
        start.checked_add(PARENT_SIZE - 1).ok_or(EINVAL)?;

        // `Resource::from_raw` is crate-private. This is the equivalent cast
        // for this out-of-tree PoC.
        let iomem_root_ptr = ptr::addr_of_mut!(bindings::iomem_resource);
        // SAFETY:
        // - `iomem_resource` is a permanent, valid C `struct resource`.
        // - `Resource` is a transparent wrapper around that type.
        // - `Resource` uses interior mutability for access to the C object.
        let iomem_root = unsafe { &*iomem_root_ptr.cast::<Resource>() };

        // This parent is a normal busy region reachable from iomem_resource.
        // If the selected address conflicts with another busy resource, load
        // the module with a different `start=` value.
        let parent = iomem_root
            .request_region(
                start,
                PARENT_SIZE,
                c"resource-parent-poc-parent".to_cstring()?,
                Flags::IORESOURCE_MEM,
            )
            .ok_or(EBUSY)?;

        let parent_raw = resource_to_raw(&parent);

        // This call is safe Rust. Because Region dereferences to Resource, it
        // requests a busy child directly underneath the busy parent.
        let child = parent
            .request_region(
                child_start,
                CHILD_SIZE,
                c"resource-parent-poc-child".to_cstring()?,
                Flags::IORESOURCE_MEM,
            )
            .ok_or(EBUSY)?;

        let child_raw = resource_to_raw(&child);

        pr_info!(
            "resource_parent_poc: parent={:#x}-{:#x}, child={:#x}-{:#x}\n",
            start,
            start + PARENT_SIZE - 1,
            child_start,
            child_start + CHILD_SIZE - 1
        );
        pr_info!(
            "resource_parent_poc: dropping child; Region::drop will search from iomem_resource\n"
        );

        // Region::drop calls release_mem_region(child_start, CHILD_SIZE).
        // __release_region starts at iomem_resource, encounters the enclosing
        // busy parent, refuses to descend into it, and emits:
        //
        //   Trying to free nonexistent resource <...>
        //
        // Consequently the child remains linked under `parent`.
        drop(child);

        // SAFETY: `parent_raw` is still owned by `parent`, which is alive, and
        // no other code modifies this private child list during this PoC.
        let child_was_not_released = unsafe { (*parent_raw).child == child_raw };
        if !child_was_not_released {
            pr_err!("resource_parent_poc: child unexpectedly disappeared from its parent\n");
            return Err(EIO);
        }

        pr_info!(
            "resource_parent_poc: confirmed: child is still linked under the original parent\n"
        );

        //check if child's name was freed
        let name_ptr = unsafe { (*child_raw).name };

        if name_ptr.is_null() {
            pr_info!("resource_parent_poc: accessing the child's name now is: (null)\n");
        } else {
            let name = unsafe { CStr::from_char_ptr(name_ptr) };
            pr_info!("resource_parent_poc: accessing the child's name now is: {}\n", name);
        }

        // Clean up the allocation that Region::drop failed to release. Unlike
        // Region::drop, this supplies the parent used for the child request.
        //
        // SAFETY:
        // - `parent_raw` points to the live parent region.
        // - The exact child interval is currently a busy region immediately
        //   underneath that parent, as checked above.
        unsafe { bindings::__release_region(parent_raw, child_start, CHILD_SIZE) };

        // SAFETY: `parent_raw` remains valid until `parent` is dropped below.
        if !unsafe { (*parent_raw).child.is_null() } {
            pr_err!("resource_parent_poc: explicit child cleanup failed\n");
            return Err(EIO);
        }

        pr_info!("resource_parent_poc: explicit cleanup with the correct parent succeeded\n");

        // This parent was requested relative to iomem_resource, so its normal
        // Region::drop path is correct now that it has no child.
        drop(parent);

        Ok(Self)
    }
}

impl Drop for ResourceParentPoc {
    fn drop(&mut self) {
        pr_info!("resource_parent_poc: unloaded\n");
    }
}



Output:
[423973.510861] resource_parent_poc: resource_parent_poc: parent=0xff000000-0xff000fff, child=0xff000100-0xff0001ff
[423973.510929] resource_parent_poc: resource_parent_poc: dropping child; Region::drop will search from iomem_resource
[423973.510985] resource: Trying to free nonexistent resource <0x00000000ff000100-0x00000000ff0001ff>
[423973.511029] resource_parent_poc: resource_parent_poc: confirmed: child is still linked under the original parent
[423973.511032] resource_parent_poc: resource_parent_poc: accessing the child's name now is: 
[423973.511055] resource_parent_poc: resource_parent_poc: explicit cleanup with the correct parent succeeded


Priya Bala Govindasamy (1):
  rust: io: Fix `Region::drop` releasing nested resources from the wrong
    parent

 rust/kernel/io/mem.rs      |  4 ++--
 rust/kernel/io/resource.rs | 38 ++++++++++++++++++++------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.34.1

