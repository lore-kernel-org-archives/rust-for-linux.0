Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717663E00A4
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090014; cv=none; b=YPsnOK9z5jgh6eFvLWHqUKe5ccuMq+tINIudgxDGNMjQG0dXPrJRXLTUjQ3Sox0OxqFMCtTUioMlbow5dg1qNT74WheGD/fj8trTZFXAXPgdnxxObIPJTgbMLLU/jTMYxFOKRBTCzXla4gdfYfV5YxK9x9YsMbIsRj6/LeUUJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090014; c=relaxed/simple;
	bh=Jti1TUWEcWYh3W9J1xX34jyLUEgBYLLLqil7u7tITVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qsxh7COxsNMOrbkxUfS43eudpXaVOyt8LBIfMSR7N2Deag8ZM5zYp3KbVYqpXQ+7pBJ8ywveQ6TKAy3D9kvhsUbTXql4+HD0araKR1T78hIvMaHKTkhFPo4ri4f+QKE+3BC4GQtW9yNc02YziMalg/klBCZaCeJB4L1e0Kn6Y0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VyOxI4sd; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VyOxI4sd"
Message-ID: <9839e1fc-faa2-4e98-9f46-b6449bf0f35a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779090010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdTZ6I3r6p2N/vnsVvGebag/NENLhnQV+Vz8Nhz5itg=;
	b=VyOxI4sdXqvm+ZcsCpKi6HOLHcz7L74lLGM81q/UbSZ6NICDfn64E0Q2XA3Q6S55HTzTdx
	X0vbmzjL+AlcLXHAbBxfoKfOB+q/zj0k6Kuq58ERzuLeduSZZNGmcIPQsE4YvijYiUz6E3
	suaYsH1kiu+xOt5ccKYwzQF3JU2Eoac=
Date: Mon, 18 May 2026 15:39:56 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 08/13] rust: drm/gem: add GEM object query helpers for
 debugfs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
 <20260326-b4-tyr-debugfs-v1-8-074badd18716@linux.dev>
 <DIHXMUSMRHYB.39N8PCC9D86KM@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <DIHXMUSMRHYB.39N8PCC9D86KM@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/14/26 07:20, Danilo Krummrich wrote:
> On Thu Mar 26, 2026 at 7:53 AM CET, Alvin Sun wrote:
>> Add name(), refcount(), is_imported(), is_exported(), and mmap_offset()
>> to BaseObject so drivers can expose GEM state in debugfs.
>>
>> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
>> ---
>>   rust/kernel/drm/gem/mod.rs | 49 +++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 46 insertions(+), 3 deletions(-)
>>
>> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
>> index 276ba3c53475d..b6188c8873ece 100644
>> --- a/rust/kernel/drm/gem/mod.rs
>> +++ b/rust/kernel/drm/gem/mod.rs
>> @@ -21,9 +21,13 @@
>>       },
>>       error::to_result,
>>       prelude::*,
>> -    sync::aref::{
>> -        ARef,
>> -        AlwaysRefCounted, //
>> +    sync::{
>> +        aref::{
>> +            ARef,
>> +            AlwaysRefCounted, //
>> +        },
>> +        atomic::Relaxed,
>> +        Refcount, //
>>       },
>>       types::Opaque,
>>   };
>> @@ -177,6 +181,45 @@ fn size(&self) -> usize {
>>           unsafe { (*self.as_raw()).size }
>>       }
>>   
>> +    /// Returns the name of the object.
>> +    #[inline]
>> +    fn name(&self) -> i32 {
>> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a valid `struct drm_gem_object`.
>> +        unsafe { (*self.as_raw()).name }
>> +    }
>> +
>> +    /// Returns the reference count of the object.
>> +    #[inline]
>> +    fn refcount(&self) -> u32 {
>> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a valid `struct drm_gem_object`.
>> +        let raw_refcount = unsafe { &raw mut (*self.as_raw()).refcount }.cast::<Refcount>();
>> +        // SAFETY: `raw_refcount` has the same layout as `Refcount`.
>> +        let refcount = unsafe { &*raw_refcount };
>> +
>> +        refcount.as_atomic().load(Relaxed) as u32
>> +    }
> How is this reference count useful in debugfs? In any case, please don't expose

I'm just following the pattern of Panthor's debugfs output.

> object reference counts, it motivates abuse.
>
> Can't we just prove a common Debug impl for GEM objects instead of providing all
> those accessors?

A generic Debug impl for GemObject? Other drivers like Nova might need 
different
output in a different style.

How about a dedicated debugfs data structure for GEM Object instead? Say, a
get_debugfs_info() method that handles synchronization internally and avoids
exposing unnecessary interfaces?

>
>> +
>> +    /// Returns true if the object is imported.
>> +    #[inline]
>> +    fn is_imported(&self) -> bool {
>> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a valid `struct drm_gem_object`.
>> +        !unsafe { (*self.as_raw()).import_attach }.is_null()
>> +    }
>> +
>> +    /// Returns true if the object is exported.
>> +    #[inline]
>> +    fn is_exported(&self) -> bool {
>> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a valid `struct drm_gem_object`.
>> +        !unsafe { (*self.as_raw()).dma_buf }.is_null()
>> +    }
>> +
>> +    /// Returns the offset for mmap, or 0 if no offset has been allocated.
>> +    #[inline]
>> +    fn mmap_offset(&self) -> u64 {
>> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a valid `struct drm_gem_object`.
>> +        unsafe { (*self.as_raw()).vma_node.vm_node.start }
>> +    }
>> +
>>       /// Creates a new handle for the object associated with a given `File`
>>       /// (or returns an existing one).
>>       fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
>>
>> -- 
>> 2.43.0
