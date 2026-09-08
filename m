Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF3D2F7EE1
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877536; cv=none; b=E2UQg4wPMtF1l0IOewdcusYxw4tF3uAvv1oerd9En5FQzyBoAWmwZRbyseYYxnWlr6Di7B1Y4MHuhjtwC5s7RBVWOlvmzEBnh6tuXVA8OVSViVg+6cDkJgJg1gfAcG9cL6e53VmaI5p2mGsmJena0jS6WoPbqUey8sG93Xjeobg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877536; c=relaxed/simple;
	bh=lB6ADInmwINs9qRDDS5D7SYp9+41Judvy+epNhkXocs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEDZbB6KQcORpHZY/zioPhxAV5wE5tN41EQ7lQSdxFaY0tqGpuWi+m4GIptAESQeD6W0LWGO35P8bgyOhdbemMB9bAoDVsboVVb824HfhhFUfM3GuEXjAshtp+yp3Mjk4V/hCOpiZcIXqVUz95oiMQwhLBBCP/VYD6XNeJgdO/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HccNCXs6; arc=none smtp.client-ip=91.218.175.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HccNCXs6"
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lB6ADInmwINs9qRDDS5D7SYp9+41Judvy+epNhkXocs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788877516; v=1; x=1789482316;
 b=HccNCXs6AQB/0pyAXQxEQ0Fcd2fPfmL9ZXgcFMx6xko7qSlHmIFoYVUo0voAOTYNMyX5MYJN
 3tlq0xHyEnzDcKnWJr4Z0K98Z+cijL9aQM0MhK3gd6/KAvAKU5mWvD+J4nPw1pstbvL6lDE2Bab
 RrOfAjhRRMfBbaqBOqtnwfXQ=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a2bb85ab9f24cd7b;
	Tue, 08 Sep 2026 14:25:16 +0000
X-Mizu-Trace-ID: a2bb85ab9f24cd7b
X-Migadu-Flow: FLOW_OUT
Message-ID: <cbe03927-afdb-4558-9196-e57d899b8d01@linux.dev>
Date: Tue, 8 Sep 2026 22:24:56 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/tyr: add BO-related ioctls
To: Daniel Almeida <daniel.almeida@collabora.com>, sunke@kylinos.cn
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
References: <20260902-tyr-ioctls-v1-0-e0fdbf8bd108@kylinos.cn>
 <20260902-tyr-ioctls-v1-9-e0fdbf8bd108@kylinos.cn>
 <FDEDAB25-FBF2-438C-9C1C-F72DC851E88C@collabora.com>
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <FDEDAB25-FBF2-438C-9C1C-F72DC851E88C@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/5/26 04:35, Daniel Almeida wrote:
>
>> On 1 Sep 2026, at 13:09, Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org> wrote:
>>
>> From: Alvin Sun <alvin.sun@linux.dev>
>>
>> Expose buffer creation and BO mmap offset retrieval.
>>
>> - BO_CREATE page-aligns the size and returns a handle with
>>   write-combined mapping.
>> - BO_MMAP_OFFSET provides the offset for the DRM generic mmap
>>   path, rejecting NO_MMAP objects and non-zero pad.
>>
>> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> Same comment as the previous patches, please write a few
> more things here about why the changes are needed.
>
> With that addressed,
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Hi Daniel,

Thanks for the review — your comments on patches 7 and 9 (the 
conditional Reviewed-bys) are addressed in v2:

https://lore.kernel.org/all/20260908-tyr-ioctls-v2-0-88bea777df67@kylinos.cn

Best regards,
Alvin


>
>> ---
>> drivers/gpu/drm/tyr/driver.rs |  2 ++
>> drivers/gpu/drm/tyr/file.rs   | 70 +++++++++++++++++++++++++++++++++++++++++++
>> drivers/gpu/drm/tyr/gem.rs    |  7 +++++
>> 3 files changed, 79 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
>> index b3145526ada06..fc8d11c9ba1ca 100644
>> --- a/drivers/gpu/drm/tyr/driver.rs
>> +++ b/drivers/gpu/drm/tyr/driver.rs
>> @@ -224,6 +224,8 @@ impl drm::Driver for TyrDrmDriver {
>>          (PANTHOR_VM_DESTROY, drm_panthor_vm_destroy, ioctl::RENDER_ALLOW, TyrDrmFileData::vm_destroy),
>>          (PANTHOR_VM_BIND, drm_panthor_vm_bind, ioctl::RENDER_ALLOW, TyrDrmFileData::vm_bind),
>>          (PANTHOR_VM_GET_STATE, drm_panthor_vm_get_state, ioctl::RENDER_ALLOW, TyrDrmFileData::vm_get_state),
>> +        (PANTHOR_BO_CREATE, drm_panthor_bo_create, ioctl::RENDER_ALLOW, TyrDrmFileData::bo_create),
>> +        (PANTHOR_BO_MMAP_OFFSET, drm_panthor_bo_mmap_offset, ioctl::RENDER_ALLOW, TyrDrmFileData::bo_mmap_offset),
>>      }
>> }
>>
>> diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
>> index 157bc40e1cac4..16abf2968299c 100644
>> --- a/drivers/gpu/drm/tyr/file.rs
>> +++ b/drivers/gpu/drm/tyr/file.rs
>> @@ -252,6 +252,76 @@ pub(crate) fn vm_get_state(
>>              Ok(0)
>>          })
>>      }
>> +
>> +    pub(crate) fn bo_create(
>> +        ddev: &TyrDrmDevice<Registered>,
>> +        _reg_data: &TyrDrmRegistrationData<'_>,
>> +        bocreate: &mut uapi::drm_panthor_bo_create,
>> +        file: &TyrDrmFile,
>> +    ) -> Result<u32> {
>> +        if bocreate.size == 0
>> +            || bocreate.pad != 0
>> +            || bocreate.flags & !uapi::drm_panthor_bo_flags_DRM_PANTHOR_BO_NO_MMAP != 0
>> +            || bocreate.exclusive_vm_id != 0
>> +        {
>> +            dev_err!(
>> +                ddev.as_ref(),
>> +                "Invalid BO_CREATE params: size={}, pad={}, flags={:#x}, exclusive_vm_id={}\n",
>> +                bocreate.size,
>> +                bocreate.pad,
>> +                bocreate.flags,
>> +                bocreate.exclusive_vm_id
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let size = usize::try_from(bocreate.size).map_err(|_| {
>> +            dev_err!(
>> +                ddev.as_ref(),
>> +                "BO_CREATE size {:#x} too large\n",
>> +                bocreate.size
>> +            );
>> +            EINVAL
>> +        })?;
>> +        let bo = crate::gem::new_object(ddev, size, bocreate.flags)?;
>> +        bocreate.handle = bo.create_handle(file)?;
>> +        bocreate.size = bo.size() as u64;
>> +
>> +        Ok(0)
>> +    }
>> +
>> +    pub(crate) fn bo_mmap_offset(
>> +        ddev: &TyrDrmDevice<Registered>,
>> +        _reg_data: &TyrDrmRegistrationData<'_>,
>> +        bommap: &mut uapi::drm_panthor_bo_mmap_offset,
>> +        file: &TyrDrmFile,
>> +    ) -> Result<u32> {
>> +        if bommap.pad != 0 {
>> +            dev_err!(
>> +                ddev.as_ref(),
>> +                "BO mmap offset pad not zero: {}\n",
>> +                bommap.pad
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let bo = crate::gem::lookup_handle(file, bommap.handle).inspect_err(|_| {
>> +            dev_err!(ddev.as_ref(), "Invalid BO mmap handle: {}\n", bommap.handle);
>> +        })?;
>> +        if bo.create_flags() & uapi::drm_panthor_bo_flags_DRM_PANTHOR_BO_NO_MMAP != 0 {
>> +            dev_err!(ddev.as_ref(), "BO mmap offset on NO_MMAP object\n");
>> +            return Err(EPERM);
>> +        }
>> +        bommap.offset = bo.create_mmap_offset().inspect_err(|_| {
>> +            dev_err!(
>> +                ddev.as_ref(),
>> +                "Failed to create mmap offset for handle {}\n",
>> +                bommap.handle
>> +            );
>> +        })?;
>> +
>> +        Ok(0)
>> +    }
>> }
>>
>> fn vm_bind_exec_op(vm: &Vm<'_>, file: &TyrDrmFile, op: &VmBindOp) -> Result {
>> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
>> index d9ddcb287f52b..f404139f54f32 100644
>> --- a/drivers/gpu/drm/tyr/gem.rs
>> +++ b/drivers/gpu/drm/tyr/gem.rs
>> @@ -38,6 +38,13 @@ pub(crate) struct BoData {
>>      flags: u32,
>> }
>>
>> +impl BoData {
>> +    /// Returns the flags the BO was created with.
>> +    pub(crate) fn create_flags(&self) -> u32 {
> I would prefer flags() instead of create_flags(), which reads a bit more like a constructor.
>
>> +        self.flags
>> +    }
>> +}
>> +
>> /// Provides a way to pass arguments when creating BoData
>> /// as required by the gem::DriverObject trait.
>> pub(crate) struct BoCreateArgs {
>>
>> -- 
>> 2.43.0
>>
>>
>>
