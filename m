Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D98339708
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803819; cv=none; b=mfQ02wNOjyiyelcf2XjNgHDFp4he/0NXKiORxmHtm2cGadkxji1vKgsE49VEOtIwAHhfjuT4pcQWyLxIug8K9lEWlk9EZej0WqqCM6fQ8aJURwuAF7amdE6f11gKawuwfvRKYnWXpDoQbmXBfl9IEAfiE9j4LYvBogI41TVxERc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803819; c=relaxed/simple;
	bh=pOOemPkiRmVrNw736454WE7iU9wJf2OhG+4ZzNrZOYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sy4Tm3k/rh9QybdDuI5CijXlmodIpN2ZkWteX1tUBffoKioklNJDdygkIYFKr4QbZF3p+uDbsfsw0Pz5zfaEaVski3fweenjzO89q+NfA7INh9Du+jlFkKr61ZG2QmnPjfCAiv5M63dkSvazYSLEzrHHglDJmuX0RdqPFF5eloA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1g+ocJd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1g+ocJd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c821a50615so21023705ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 00:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782803817; x=1783408617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYyn+xEil0xBM3TxCBPpfEJHabNu7Ptyac8XpJ/du0M=;
        b=c1g+ocJdQzazLnnZUFrRkofNfRH3QfI3AOh029LM94d02z8xlVzliMeCMdY22haFsg
         VqCVwjJkm9QDXfWmI6nprfxMsKaXFnf0t7ko5GOioHeru1Gfwgs7lEDqHQomR2F2ut77
         49dJSrYxOa0ivgjcQpxrAQYwpaMru7JIp0L27Jqxn3xySuzOrIM8CsXVQ8aTYc5A1Ta7
         xZfFq659GQJ1l60OiNWE0N1Aq9O9luH4PDQPElmC5Jz+tfXXeQNhGwwWhy05E7ZHJx71
         EwMPUxdT9jXQ142OCvx3+nbt8yr80VEz9dijseJgstaWh+aazjZQbEMOKHJ3XtvF2rRC
         7pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803817; x=1783408617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYyn+xEil0xBM3TxCBPpfEJHabNu7Ptyac8XpJ/du0M=;
        b=NHa7WTLOnT5vt+ehEU+ebAgZFGfZqwKfr8Yul9fpc3eBo7Jz0YvzD30VMnRemkcYT+
         WOxr73dncdxkwPXSZqUCFI9Yrr/QBO62FErUDRKBtWQQ/z/vH5sd2rlCAzgse1Kvf+Jz
         ycBg88kXplRjiac/yvv8OnbT7/yZMK06jAnb1oCmUIJHTiIY9fmx0ZDJojjsUoES01Yx
         K4RdKRbYAWWXDSUPbeIRqoZlInG1hfKfKZ610Qpl1YH2mJbrEC1gdUbQY/ekMvdmE6Jc
         CYaz+bv5ha6HOjLVcyWx58tTePgerI9bZfxko4U6OYhNR+eVpAcQ+596bLStb8WdiagP
         wtJA==
X-Forwarded-Encrypted: i=1; AHgh+Rrtz8vv7RjbY4/aMypWgBqE4FY/+IzISyMJNrNyzypLUs8wXmN3GsAItaZQp1hVmNn/GXEpklJa39Bqxd1i0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyMMQwcl+9Nn0Sh4rscLaoRI6eIpsPjJBR0rhqupsf9SjUq6Tu
	skv62ke2nnTz2iLr3x0QXT2mOWaZ1aEhJQSweRog5UlzfODCCQlEiUly
X-Gm-Gg: AfdE7ck7UKA8J06wZp/H4vcOL7W1rqQE/dJ2LTdJoBn0XZj/esmhsCeWXbqPo/77soj
	Kf7HXeci0ryPK/gxnMLI8Hl8n3zRS4EY0xo97K/uQsvyN2TKlilfpL5XMf4GrGKcNHPTAr+oWqa
	vuNnh5XQyKZgNGx8t0GKTY+441D+z7SGyEW6Jdjq23AWNttlyeLMHaOlQKsPKTsO/4DsAy/a9lh
	60P5vOSjmMwV3XJ7/1Wn++1zTY4UJEcuVkG7Lzmo2ufiWxPQ+tVBEVmjzDGO8r8Vp2QeKVys9BX
	f7b6lviB26xEEJX5zK2X8GYaDOFEEdNvDFvbu8lx1bSinC05O4oJtUFNXSZ/pXvoCWIoSOGw7UE
	8aTWnG1gC5l5FQNfnLZAthZZacEG8sDQbTnPR6WZfMD7y+NzRacpcnDSvD5yZezucG2mJ7N7SnX
	wLcN1sj68neQp1cU2H
X-Received: by 2002:a17:903:4b4c:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2ca2d52b530mr17635735ad.7.1782803816961;
        Tue, 30 Jun 2026 00:16:56 -0700 (PDT)
Received: from [10.42.12.77] ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70c37sm7870915ad.5.2026.06.30.00.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 00:16:56 -0700 (PDT)
Message-ID: <a0e5782a-e1ee-4e12-8f78-d202184568f8@gmail.com>
Date: Tue, 30 Jun 2026 15:16:49 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] KVM: rust: add Rust reimplementation of eventfd
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, pbonzini@redhat.com, seanjc@google.com,
 ojeda@kernel.org
References: <20260626083212.39611-1-leixiang@kylinos.cn>
 <20260629082930.23182-1-work@onurozkan.dev>
Content-Language: en-US
From: ninol <leenollei@gmail.com>
In-Reply-To: <20260629082930.23182-1-work@onurozkan.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/29/26 16:29, Onur Özkan wrote:
> On Fri, 26 Jun 2026 16:29:34 +0800
> leixiang <leenollei@gmail.com> wrote:
> 
>> From: ninol <leenollei@gmail.com>
>>
>> Introduce a Rust reimplementation of virt/kvm/eventfd.c, providing
>> irqfd (interrupt injection via eventfd) and ioeventfd (MMIO/PIO write
>> to eventfd signal) functionality with full C ABI compatibility.
>>
>> The Rust implementation leverages RAII guards for SRCU, mutex, and
>> spinlock management, reducing the risk of resource leaks on error
>> paths. It is selectable via CONFIG_RUST_KVM_EVENTFD and replaces
>> the C eventfd.o with a shim providing only weak default functions.
>>
>> Signed-off-by: ninol <leenollei@gmail.com>
>> ---
>>
>> Hi all,
>>
>> This is an experimental/exploratory RFC for a Rust reimplementation of
>> virt/kvm/eventfd.c. It is intended as a learning exercise and a proof
>> of concept to explore whether Rust can be practically applied to KVM
>> subsystem components.
>>
>> I fully understand this may not be the direction the KVM community
>> wants to take. If you feel this is not worth your time, please ignore
>> it entirely. If, however, you find this approach interesting or have
>> any feedback on the implementation, I would greatly appreciate
>> your comments.
>>
>> The patch provides functionally equivalent irqfd and ioeventfd support,
>> gated behind CONFIG_RUST_KVM_EVENTFD. It uses RAII guards for lock and
>> resource management and maintains full ABI compatibility with the C
>> implementation.
>>
>> Testing: Built and boot-tested on x86_64 with KVM enabled.
>>
>> Thanks for your time.
>>
>>  rust/bindgen_parameters         |    2 +
>>  rust/bindings/bindings_helper.h |   18 +
>>  rust/helpers/eventfd.c          |   34 +
>>  rust/helpers/helpers.c          |    7 +
>>  rust/helpers/kvm.c              |  221 +++++
>>  rust/helpers/seqcount.c         |   30 +
>>  rust/kernel/kvm/eventfd.rs      | 1419 +++++++++++++++++++++++++++++++
>>  rust/kernel/kvm/mod.rs          |    8 +
>>  rust/kernel/lib.rs              |    2 +
>>  virt/kvm/Kconfig                |   15 +
>>  virt/kvm/Makefile.kvm           |    7 +-
>>  virt/kvm/eventfd_shim.c         |   52 ++
>>  12 files changed, 1814 insertions(+), 1 deletion(-)
>>  create mode 100644 rust/helpers/eventfd.c
>>  create mode 100644 rust/helpers/kvm.c
>>  create mode 100644 rust/helpers/seqcount.c
>>  create mode 100644 rust/kernel/kvm/eventfd.rs
>>  create mode 100644 rust/kernel/kvm/mod.rs
>>  create mode 100644 virt/kvm/eventfd_shim.c
>>
>> diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
>> index 6f02d9720ad2..c433a6ca5336 100644
>> --- a/rust/bindgen_parameters
>> +++ b/rust/bindgen_parameters
>> @@ -14,6 +14,8 @@
>>  --opaque-type alt_instr
>>  --opaque-type x86_msi_data
>>  --opaque-type x86_msi_addr_lo
>> +--opaque-type hv_.*
>> +--opaque-type IO_APIC_route_entry
>>  
>>  # If SMP is disabled, `arch_spinlock_t` is defined as a ZST which triggers a Rust
>>  # warning. We don't need to peek into it anyway.
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
>> index 446dbeaf0866..2d65f2b1672d 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -65,8 +65,12 @@
>>  #include <linux/io-pgtable.h>
>>  #include <linux/ioport.h>
>>  #include <linux/iosys-map.h>
>> +#include <linux/irqbypass.h>
>>  #include <linux/jiffies.h>
>>  #include <linux/jump_label.h>
>> +#include <kvm/iodev.h>
>> +#include <linux/kvm_host.h>
>> +#include <linux/kvm_irqfd.h>
>>  #include <linux/mdio.h>
>>  #include <linux/mm.h>
>>  #include <linux/miscdevice.h>
>> @@ -94,6 +98,20 @@
>>  #include <linux/xarray.h>
>>  #include <trace/events/rust_sample.h>
>>  
>> +#ifdef CONFIG_RUST_KVM_EVENTFD
>> +/* Custom helpers for eventfd.rs */
>> +unsigned long rust_helper_spin_lock_irqsave(spinlock_t *lock);
>> +void rust_helper_spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags);
>> +void rust_helper_hlist_add_head_rcu(struct hlist_node *n, struct hlist_head *h);
>> +void rust_helper_hlist_del_init_rcu(struct hlist_node *n);
> 
> [...]
> 
>> +#[cfg(CONFIG_LOCKDEP)]
>> +#[inline(always)]
>> +unsafe fn spin_acquire(
>> +    map: *mut bindings::lockdep_map,
>> +    subclass: c_int,
>> +    trylock: c_int,
>> +    ip: core::ffi::c_ulong,
>> +) {
>> +    // SAFETY: Caller holds the corresponding lock; this is a lockdep annotation only.
>> +    unsafe { bindings::rust_helper_spin_acquire(map, subclass, trylock, ip) }
>> +}
>> +
>> +// RAII Guards
>> +
>> +/// RAII Guard for SRCU read lock.
>> +struct SrcuGuard {
>> +    srcu: *mut bindings::srcu_struct,
>> +    idx: core::ffi::c_int,
>> +    _not_thread_safe: crate::types::NotThreadSafe,
>> +}
>> +
> 
>> +impl SrcuGuard {
>> +    /// # Safety
>> +    /// Caller must ensure `srcu` is a valid pointer.
>> +    unsafe fn new(srcu: *mut bindings::srcu_struct) -> Self {
>> +        // SAFETY: Caller guarantees `srcu` is valid.
>> +        let idx = unsafe { bindings::srcu_read_lock(srcu) };
>> +        Self {
>> +            srcu,
>> +            idx,
>> +            _not_thread_safe: crate::types::NotThreadSafe,
>> +        }
>> +    }
>> +}
>> +
>> +impl Drop for SrcuGuard {
>> +    fn drop(&mut self) {
>> +        // SAFETY: We hold the lock `idx` on `srcu`.
>> +        unsafe { bindings::srcu_read_unlock(self.srcu, self.idx) };
>> +    }
>> +}
> 
> You are adding things that are already being implemented in much better way. For
> example, for SRCU we already have v10 [1]. But even before that I think this
> patch has even more serious problems. It has multiple fundamental issues and
> things seem to be placed randomly all around.
> 
> Regards,
> Onur
> 
> [1]: https://lore.kernel.org/all/20260613065348.96750-1-work@onurozkan.dev
> 

Hi Onur,

Thanks for the review.

I'm sorry that I hadn't seen the SRCU v10 series [1] before sending,
so the custom guards and the scattered structure are reinventing what's
already in flight. I'll rethink this on top of the existing work and
do my best to ensure that my patch is bug-free.

Have a very nice day,
ninol

>> +
>> +/// RAII Guard for mutex lock.
>> +struct MutexGuard {
>> +    lock: *mut bindings::mutex,
>> +}
>> +
>> +impl MutexGuard {
>> +    /// # Safety
>> +    /// Caller must ensure `lock` is a valid pointer.
>> +    unsafe fn new(lock: *mut bindings::mutex) -> Self {
>> +        // SAFETY: Caller guarantees `lock` is valid.
>> +        unsafe { bindings::mutex_lock(lock) };
>> +        Self { lock }
>> +    }
>> +}
>> +
>> +impl Drop for MutexGuard {
>> +    fn drop(&mut self) {
>> +        // SAFETY: We hold the lock.
>> +        unsafe { bindings::mutex_unlock(self.lock) };
>> +    }
> 
> [...]
> 
>> +#include <linux/kvm_irqfd.h>
>> +#include <linux/irqbypass.h>
>> +
>> +bool __weak kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args)
>> +{
>> +	return true;
>> +}
>> +
>> +int __weak kvm_arch_set_irq_inatomic(
>> +				struct kvm_kernel_irq_routing_entry *irq,
>> +				struct kvm *kvm, int irq_source_id,
>> +				int level,
>> +				bool line_status)
>> +{
>> +	return -EWOULDBLOCK;
>> +}
>> +
>> +#if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
>> +void __weak kvm_arch_irq_bypass_stop(
>> +				struct irq_bypass_consumer *cons)
>> +{
>> +}
>> +
>> +void __weak kvm_arch_irq_bypass_start(
>> +				struct irq_bypass_consumer *cons)
>> +{
>> +}
>> +
>> +void __weak kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
>> +					  struct kvm_kernel_irq_routing_entry *old,
>> +					  struct kvm_kernel_irq_routing_entry *new)
>> +{
>> +}
>> +#endif
>> +
>> +/*
>> + * The Rust implementation provides kvm_irq_has_notifier via #[no_mangle].
>> + * Symbol export for KVM-internal use must be done from C.
>> + */
>> +extern bool kvm_irq_has_notifier(struct kvm *kvm, unsigned int irqchip,
>> +				 unsigned int pin);
>> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_irq_has_notifier);
>> -- 
>> 2.43.0
>>

