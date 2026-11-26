Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691519;
	b=t1CTZllwShqoFWtggcfOHEZLqEMqqhcKAYIYXkiTjgrOek2ujBI6S1bv00qb+M/RUDHJ
	 3lWdqPa+qNMmZZFNND6UwHbK9jBMr1zHJY9ASD48A3b+BkWze0DUoBjNXjG3ML/RhJ/Cp
	 XXwfbDCoPW5QLezBFoywdHHWMilfoUqyyvQoqZgVH7yh5VE4vrCtrpfEDU4vQeaL3sEu2
	 LoLoVSODaLDsb7L0j15eLJzqEap8TyUvyEt+aESzR1TqL2IXO6+Aa1REDEMEG1jKBj88p
	 kQHwn5utUL0FB1BYZ0wCo06VEOTbtXwMWn8TYhFQQb2NS6IZxNXy+VoaQywyibudsyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691519;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eFEvD2f69EGvl7kFF0s0fPq9jUBZzVmpblExY89cSXs=;
	b=LXGcnMa8PfLSDO/E84EKsib5sTWpMBxbwgJX7k/5uxiqhATuxKPIS/F40l/kD8WdwrCl
	 qL40KtiD3MsN5AJfqiUmPmL5I8uxr/iSCEdDBpFsLYulGlg8bNpfa4oZSBR9+NaVCth/V
	 YwrIL+uD+Pz9nAvbn3qNIP6DCSLijpvBd6l3ZVHTs/VvwJEUBHdG1JqcebvPp/kiXrPMX
	 CYYeqOAkPcqaYvdbSPBfsp6+rDfHBnzPJDzac6iQBhqptQCY/CQcFp/N2juTFpwfH9/Ap
	 T4h83XTrn5XCvq6akMvYyaVTnxU6GdGdCqXevnpCILJnDcw7QqVCXbQgD/yqdWOuhWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ISo13rvf;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E698606A31E;
	Thu, 26 Nov 2026 11:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E698606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ISo13rvf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795691517;
	bh=nv6fHJRxI/wMvY18exOKTyH79016H33/Tf6oSya2kA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ISo13rvfIfERB1id+DoZpfb1QQAKfd+4wKtG66f+St7S4cekIXij8QrH39fPPsb2U
	 ObUM5KjBhdc2obQnNxQIFUIL8C+xK1ZtsxMJhLMRm5H2rKcJ/WLkKSNyPQp4ewmiNQ
	 MlkB/7yNDb3/VREO7BHfM9smXStBqImjixalwbBgG3ciFOVJGUrzk/XXzO2v/Ze681
	 3Lnson8feL1XewI2cKxFChI8KPSzciAdwRT5nW+J/BtZ1UczSfKgK9fsmul3+aU4sb
	 di5w4doCwKhNljq/HjEpKIsBkBX3QyJVpUKzch4ZkzqcLYnvI7dTq2L5yw/sf8w/m8
	 vrmSDRMMIx2qg==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AF4C17E0183;
	Thu, 26 Nov 2026 12:11:56 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: daniel.almeida@collabora.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	deborah.brouwer@collabora.com,
	dri-devel@lists.freedesktop.org,
	gary@garyguo.net,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH v7 3/3] drm/tyr: add Job IRQ handling
Date: Thu, 26 Nov 2026 12:11:45 +0100
Message-Id: <20261126111145.117769-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <03D5FC68-0E3B-47B4-A3E4-6F2EABD54096@collabora.com>
References: <03D5FC68-0E3B-47B4-A3E4-6F2EABD54096@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 11/24/26 21:49, Daniel Almeida wrote:
>
> Hi Laura,
>
>> On 23 Nov 2026, at 11:58, Laura Nao <laura.nao@collabora.com> wrote:
>>
>> The Job IRQ reports requests from the CSF firmware, including global
>> interface requests and CSG attention bits. Only the GLB bit is currently
>> handled, as it will be used to check firmware readiness. CSG bits
>> handling will be added at a later stage. The Job IRQ handler masks the
>> interrupt in the primary IRQ handler, processes pending raw status in
>> the threaded handler, clears the handled bits, and reenables the mask
>> before returning.
>> Add JobIrqEvents to hold the wait queue and the ready flag used to
>> signal firmware readiness when the GLB bit is set.
>>
>> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>> drivers/gpu/drm/tyr/fw.rs     |   1 +
>> drivers/gpu/drm/tyr/fw/irq.rs | 148 ++++++++++++++++++++++++++++++++++++++++++
>> drivers/gpu/drm/tyr/irq.rs    |   1 -
>> 3 files changed, 149 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
>> index f2e0404addf2..ecf2ea171bc9 100644
>> --- a/drivers/gpu/drm/tyr/fw.rs
>> +++ b/drivers/gpu/drm/tyr/fw.rs
>> @@ -69,6 +69,7 @@
>>     vm::Vm, //
>> };
>>
>> +pub(crate) mod irq;
>> mod parser;
>>
>> pub(super) const CSF_MCU_SHARED_REGION_START: u32 = 0x04000000;
>> diff --git a/drivers/gpu/drm/tyr/fw/irq.rs b/drivers/gpu/drm/tyr/fw/irq.rs
>> new file mode 100644
>> index 000000000000..a736d8cd4374
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tyr/fw/irq.rs
>> @@ -0,0 +1,148 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +
>> +//! IRQ handling for the Job IRQ.
>> +//!
>> +//! The Job IRQ signals events from the MCU, including global interface acknowledgements.
>> +#![allow(dead_code)]
>
> In general, please prefer expect(dead_code) instead.
>

Ack.

>> +
>> +use kernel::{
>> +    device::Bound, //
>> +    io::Io,
>> +    new_waitqueue,
>> +    platform,
>> +    prelude::*,
>> +    sync::{
>> +        atomic::{
>> +            ordering,
>> +            Atomic, //
>> +        },
>> +        Arc,
>> +        WaitQueue, //
>> +    },
>> +    time::{
>> +        Delta,
>> +        Msecs, //
>> +    },
>> +};
>> +
>> +use crate::{
>> +    irq::{
>> +        TyrIrqRegistration,
>> +        TyrIrqTrait, //
>> +    },
>> +    regs::job_control::{
>> +        JOB_IRQ_CLEAR,
>> +        JOB_IRQ_MASK,
>> +        JOB_IRQ_RAWSTAT,
>> +        JOB_IRQ_STATUS, //
>> +    },
>> +    driver::IoMem,
>
> rustfmt produces a (small) diff here.
>

Ack - I forgot to do a final rustfmt run before submitting, I'll fix
this in the next revision.

>> +    reset::HwGate, //
>> +};
>> +
>> +/// The firmware events published by the Job IRQ handler, and the queue used to announce them.
>> +#[pin_data]
>> +pub(crate) struct JobIrqEvents {
>> +    #[pin]
>> +    wait: WaitQueue,
>> +    /// Set once the firmware has signalled that the global interface is ready.
>> +    ready: Atomic<bool>,
>> +}
>> +
>> +impl JobIrqEvents {
>> +    /// Creates a new, empty set of Job IRQ events.
>> +    pub(crate) fn new() -> Result<Arc<Self>> {
>
> There is an ongoing effort[0] to get rid of Arcs in places they are not needed
> using self-ref pin init.
>
> Since I expect other users to be able to take a reference to this field as
> applicable, lets drop this Arc for the time being.
>
>

Makes sense, thanks for the pointer. I this this also means 
job_irq_init needs to return Result<impl PinInit<Self, Error> + 'a>
instead of a fully constructed Result<Pin<KBox<TyrIrqRegistration<'a, JobIrq>>>>,
right?

With [0], Firmware is no longer wrapped in Arc. Iiuic, combined with the
above, this will let us embed both the firmware and the job IRQ 
registration as plain #[pin] fields in the same TyrDrmRegistrationData 
struct. The job IRQ can then borrow a reference to the firmware's 
JobIrqEvents directly within that same struct, instead of cloning it
through Arc.

If that's correct, I'll change both job_irq_init() and 
TyrIrqRegistration::request() to return a 
Result<impl PinInit<Self, Error> + 'a>.

>> +        Arc::pin_init(
>> +            pin_init!(JobIrqEvents {
>> +                wait <- new_waitqueue!(),
>> +                ready: Atomic::new(false),
>> +            }),
>> +            GFP_KERNEL,
>> +        )
>> +    }
>> +
>> +    /// Clears the firmware-ready state.
>> +    #[expect(dead_code)]
>> +    pub(crate) fn clear_ready(&self) {
>> +        self.ready.store(false, ordering::Relaxed);
>> +    }
>> +
>> +    /// Waits until the firmware signals readiness via the GLB IRQ bit, or the timeout expires.
>> +    pub(crate) fn wait_ready(&self, timeout_ms: Msecs) -> Result {
>> +        self.wait.wait_event_timeout(
>> +            || self.ready.load(ordering::Acquire),
>> +            Delta::from_millis(timeout_ms.into()).to_jiffies_timeout(),
>> +        )?;
>> +
>> +        Ok(())
>> +    }
>> +
>> +    /// Updates state and wakes up waiters
>> +    fn signal(&self, status: u32) {
>> +        // TODO: handle other Job IRQ events (e.g. CSG attention bits) here once
>> +        // support for them is added.
>> +
>> +        // The GLB bit only signals firmware readiness once, at power up
>> +        if JOB_IRQ_RAWSTAT::from_raw(status).glb() && !self.ready.load(ordering::Relaxed) {
>> +            self.ready.store(true, ordering::Release);
>> +        }
>> +
>> +        self.wait.wake_up_all();
>> +    }
>> +}
>> +
>> +// The Job IRQ, signalling requests or notification from the MCU.
>> +pub(crate) struct JobIrq {
>> +    /// Firmware events signalled by this IRQ.
>> +    events: Arc<JobIrqEvents>,
>
> If we get rid of the Arc, this would become 
>
> events: &‘a JobIrqEvents.
>
>
>
>> +}
>> +
>> +
>> +/// Requests a threaded IRQ registration for the Job IRQ.
>> +///
>> +/// # Safety
>> +///
>> +/// Callers must not `mem::forget()` the resulting registration or otherwise prevent its
>> +/// [`Drop`] implementation from running.
>> +pub(crate) unsafe fn job_irq_init<'a>(
>> +    pdev: &'a platform::Device<Bound>,
>> +    hw: Arc<HwGate<'a>>,
>> +    events: Arc<JobIrqEvents>,
>> +) -> Result<Pin<KBox<TyrIrqRegistration<'a, JobIrq>>>> {
>> +    let job_irq = JobIrq { events };
>> +    // Ensure interrupt sources are disabled until the handler is registered.
>> +    job_irq.clear_mask(hw.access().iomem());
>> +
>> +    // SAFETY: The caller guarantees the resulting registration will not be leaked.
>> +    unsafe { TyrIrqRegistration::request(pdev, c"job", job_irq, hw) }
>> +}
>> +
>> +impl TyrIrqTrait for JobIrq {
>> +    fn read_status(&self, io: &IoMem<'_>) -> u32 {
>> +        io.read(JOB_IRQ_STATUS).into_raw()
>> +    }
>> +
>> +    fn clear_mask(&self, io: &IoMem<'_>) {
>> +        io.write_reg(JOB_IRQ_MASK::zeroed());
>> +    }
>> +
>> +    fn reenable_mask(&self, io: &IoMem<'_>) {
>> +        io.write_reg(JOB_IRQ_MASK::from_raw(self.mask()));
>> +    }
>> +
>> +    fn read_raw_status(&self, io: &IoMem<'_>) -> u32 {
>> +        io.read(JOB_IRQ_RAWSTAT).into_raw()
>> +    }
>> +
>> +    fn clear_status(&self, io: &IoMem<'_>, status: u32) {
>> +        io.write_reg(JOB_IRQ_CLEAR::from_raw(status));
>> +    }
>> +
>> +    fn mask(&self) -> u32 {
>> +        JOB_IRQ_MASK::zeroed().with_glb(true).into_raw()
>> +    }
>> +
>> +    fn handle(&self, status: u32) {
>> +        self.events.signal(status);
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/tyr/irq.rs b/drivers/gpu/drm/tyr/irq.rs
>> index 4a065c6272c5..5632f50b0a13 100644
>> --- a/drivers/gpu/drm/tyr/irq.rs
>> +++ b/drivers/gpu/drm/tyr/irq.rs
>> @@ -1,7 +1,6 @@
>> // SPDX-License-Identifier: GPL-2.0 or MIT
>>
>> //! Threaded IRQ wrapper shared by all Tyr interrupt sources.
>> -#![allow(dead_code)]
>> use core::marker::PhantomPinned;
>>
>> use kernel::{
>>
>> -- 
>> 2.39.5
>>
>>
>
> With the changes,
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>
> [0]: https://lore.kernel.org/rust-for-linux/DN2ZFO94BZMF.2XTCCKEUDLZSB@kernel.org/T/#t
>

Thanks,

Laura
