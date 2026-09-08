Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC34915B4
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 22:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908247; cv=none; b=fv+ZouN2PLRCL6V08wN/U1uNWx5Eyc1rJzZR+0uWq7dS4zllCnjFo9ubj7DiGjtpX/XTPe7n/kQhApmCjD/ro2n3/wD0pBq/WRfI7rxeZmNRCAXdDxmutjoWhgSuYEUoH6trWuWsKjkhf5K1OTkOInEXnX0JIkzF4FH1MOTFBrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908247; c=relaxed/simple;
	bh=Lr4ZIAL+LIO3Foj4FD3rmUM15kJfPl3Ocr65uD8DFvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EM0zAIBTpaaNG+72VXbkvktp/318XCCnnM+PrMmNJkj4m8dEDvBtpNpzYUwtpf8LvieQc87RMnly40gKTRR2sBf1DxleTZY8P9jPz6vxP1SR8rISIpoDaxLgm1efU+Bka2shWCJbCjNzkv6inb9sQV5j3rF6nASXT2rLZrRufd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=Y25l6ymt; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="Y25l6ymt"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so3992798a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1788908244; x=1789513044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8Ots96zTv4WZm+iO+fA67JGzY1EoUFxcIurn0THTv0=;
        b=Y25l6ymtT7GteDV0UHPQ+2JbZxLA7cg0D0OgI3uqa8hjjiczuA37oA6k2XyaQA13HC
         yA+6sppuketkwuS2UGo3VZqdaq3vSHTvzHeKnNoAawnu5wtW/hzYMeVVS1gcgvabEQt8
         59LnXQTK67witCdlIOODI4UYqyvPKAwZj5pLcURipjq6eMA/+Wg/VgCKrJb2CWxPPYRW
         V/i8ISz0jD/2rSDjKTCwGuP+86kRBTkHeiCUJwsuItilVe7npYEqHFa6WcMdRBxDqG54
         5bjBmnSSfRpaUyBOl91VWcgRLGyttRTNGLwZIrTAMlSKBzXYUpz0ZHZS/t5anKsyCacE
         yaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908244; x=1789513044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8Ots96zTv4WZm+iO+fA67JGzY1EoUFxcIurn0THTv0=;
        b=fcZ43VMsxwauRRRxJuCJFYTVv0Jlv+C0dA4gxlK/+Mt+Gu2qNyOveXFmggAISFma0C
         MMOFyiHE2nSEcpUuyN+T7fGEb+FbJoxBut/E73pmFN0Jeb4X4OHAeqV4dfKSkBXG/GHU
         clOh5cOj7qCf84WdLFuX+BbgNY9pH+IV2fVWT9FML75VuAWraz8dkRce1XI5x6FISOlH
         yA9nhLc+sjl+QWVEp8bktj0/PGsqOdMVwosJ6IfkuwVYz9Me6cs2iX8y6gCpe/mTOnaZ
         QFmMBHFZ0Irp2Xx6IDunvff3QPDAL1qGNTRCWt/iRl9PvFFKAMeRKftSf6sRxvOyiaaX
         fVeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1Zab+2Z/MfdOwAbm7a0ZIhgoWqTODqFN+mHjfIb8rI1oSRK+9zNCFXeXqg7XRSqAN2wN4QzG5eBGZIlXztA==@vger.kernel.org
X-Gm-Message-State: AFuF++mG5KAekT6yBNRIblXqgBmhiMi7ql5TRs+iGU+EnrrwFyuuDLvQ
	nMbkKP42RAOobcATA6hZJucf45FpgeEnWGbQuqIAOdQITMR7L/3lY6wmaztmdEXvhxg=
X-Gm-Gg: AYBFou1ExrGRszgXPyDOqkqNWQBf7/HKwi+0kaLVFHO21Clsjg2q3tsVXTRgKQWZo/I
	oBe/H84ssoM5qURLnXOn2USSVT4g6QoQBBdckA5d/Hg0N0xDFoARL+U0FMX6t5YaTQ4e3fSNP+k
	/8TqL2SxIrg79+g1JUqZeV+0Yi8Ertp5uWKtOFcKibzjoV1Pmeftieh+Gd0KwxCdev1Zn+ikEdx
	wZbHWX4NrSMELVee8hgL31gOcGRd2vwnS92xP8MeiwfGvWITOYmpXSsryCwZa4a9MVnA0V1ISdk
	k7QsEsP1cAs5Tnhj4ZtZOPiujw8NlUvY3F4zCTPz/6c05ZbJqmK9l08GeV8aG+6CPchgKD6xTAY
	wKMmESFQefF1zzyU2Dwqsyp8wV3pcn+O+gX/OrJniQBrloNZVf0l/hU8Q1nv8UKTd40FbESUE7Q
	j+Ubf5IrFWC+Uet1rXEV1d0exuiirfRxSctvJj/isb784+BH7wDzAJxZh9ZObFuU228JD79Wb7q
	HJb2zhFYuxTKLIVWXEnrO7cyb4aGKbCoyvk
X-Received: by 2002:a05:6a21:6f12:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3da39fdfe0cmr47590687637.13.1788908243592;
        Tue, 08 Sep 2026 15:57:23 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm19881462eec.5.2026.09.08.15.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:23 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: io: Fix `Region::drop` trying to release nested resources from the wrong parent
Date: Tue,  8 Sep 2026 22:57:21 +0000
Message-Id: <cover.1788901318.git.pgovind2@uci.edu>
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

