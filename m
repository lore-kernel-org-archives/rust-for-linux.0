Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A43B1EFE;
	Mon, 14 Sep 2026 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789428968; cv=pass; b=XYw+pIR+4oKPPOIR2r1N9kDdqcHybKLqrtCgEt+ZRMaipfTCjUYwxoKkQDep2/bS7tmwXbG5P2OtfEfRS53/WTM/cyv3Jd6rsuLVLU6uBozwwU/fD+RdkqS5IZso9wvuluGrjVP13064x9+KkvCblAJB7xOtnzzjzLoSrwRbbDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789428968; c=relaxed/simple;
	bh=2GL7gZbRPGYP2kPYcdTfTJL1C45MXQSYyFMWWx+cP8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSCvHgb66ju3SMzraqV/OKJtkX5kGj7N8BUQOnddtr0f4HdLJR2o5tretrvHP5TsvQblXC9H5Pfs5SXv8DyyAKLESEv6kHzKDNUsux1BSpJeAapz7yWCTLbtRZ6+rTodCwj9hadlkHHnWao7b2XvsD7206Qs+Ok7TiqrqRLEnyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=OoTfsuDy; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="OoTfsuDy"
ARC-Seal: i=1; a=rsa-sha256; t=1789428910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LSHS6BC3dWP6eznSoy8j1egaGsjlnPjSD1CJWZPB1QTh5jo8u4sbqEAJHkWlVwcgcED4VIyaSv9+45ierbl/unAW41XYCTLl1IOsljqozUJ2sr4Gh94Pcb8T6MDKmKLsGcx7+HPLEVAYlN+xQOndiKvToWguhQ3B5IyOYte668E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789428910; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y1+bLayvqBv4MV0slcJVabg6OUZ/SWSBRrrghbeWpKs=; 
	b=AKAehefUruhp86yYje3KCs5BomHQQV1+06HOzveEtvLRv8LG902jy+qTWBeHuwzPhM6qHgPDGx4C4ppOdLf4wKs723Mnem+wq8Z9aj5dxkOiDYq/y68witiyEOZaGjCBecDkre/Ol3Z4mpbl2vEmjaJYE0TWQvA8VOH/fkshzNk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789428910;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=y1+bLayvqBv4MV0slcJVabg6OUZ/SWSBRrrghbeWpKs=;
	b=OoTfsuDyiU/DVuXFCmHz9FBK+XcPRr4Rosl/MjgpL9zhdGyy7I+UrOGVY/bQ/GG1
	r4lsUOpP/39wqktSwm82B/ZmH6p2KCsPCnIt4fee/O+cPeAhS3wuJ+15q2c9xPyRvus
	rcCVmAeI6ytYJ2wNJQq/gPQRfu9hU8nECKoTrltE=
Received: by mx.zohomail.com with SMTPS id 1789428909278665.3306979354372;
	Mon, 14 Sep 2026 16:35:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:35:07 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
	Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v2 4/9] drm/tyr: add per-file VM pool
Message-ID: <aqiEqzhZy6_AwSvS@um790>
References: <20260908-tyr-ioctls-v2-0-88bea777df67@kylinos.cn>
 <20260908-tyr-ioctls-v2-4-88bea777df67@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-tyr-ioctls-v2-4-88bea777df67@kylinos.cn>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.404.0

On Tue, Sep 08, 2026 at 12:47:51AM +0800, Ke Sun wrote:
> From: Alvin Sun <alvin.sun@linux.dev>
> 
> Userspace needs multiple independent GPU address spaces per file,
> addressed by ID through the VM ioctls as in panthor. Store them in an
> IdPool (capped at 32 for panthor parity) plus an XArray. Each VM is
> stored with its VmOwner, so it is killed exactly once - on destroy or
> file close - regardless of remaining shared references.
> 
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  drivers/gpu/drm/tyr/vm.rs | 157 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 156 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
> index c5e307b1e2416..ae58135eeffdc 100644
> --- a/drivers/gpu/drm/tyr/vm.rs
> +++ b/drivers/gpu/drm/tyr/vm.rs
> @@ -8,6 +8,7 @@
>  //! mapped into hardware address space (AS) slots for GPU execution.
>  
>  use core::marker::PhantomData;
> +use core::mem::ManuallyDrop;
>  use core::ops::Range;
>  
>  use kernel::{
> @@ -33,6 +34,7 @@
>          }, //
>      },
>      fmt,
> +    id_pool::IdPool,
>      impl_flags,
>      io::PhysAddr,
>      iommu::pgtable::{
> @@ -53,7 +55,11 @@
>          ArcBorrow,
>          Mutex, //
>      },
> -    uapi, //
> +    uapi,
> +    xarray::{
> +        AllocKind,
> +        XArray, //
> +    }, //
>  };
>  
>  use crate::{
> @@ -154,6 +160,57 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
>      }
>  }
>  
> +/// Owns a [`Vm`]'s destruction: the VM is killed exactly once, when this
> +/// value is dropped, regardless of how many `Arc<Vm>` references remain.
> +///
> +/// Callers that only need to use the VM take an `Arc<Vm>` via
> +/// [`VmOwner::get()`], which keeps it alive but does not kill it.
> +pub(crate) struct VmOwner<'drm>(ManuallyDrop<Arc<Vm<'drm>>>);
> +
> +impl<'drm> VmOwner<'drm> {
> +    /// A reference for callers that want to use the VM, not own it.
> +    #[expect(dead_code)]
> +    pub(crate) fn get(&self) -> Arc<Vm<'drm>> {
> +        Arc::clone(&self.0)
> +    }
> +
> +    /// Transfers the VM to the pool without killing it, leaving only the
> +    /// shared reference. The pool reconstructs the owner with
> +    /// [`VmOwner::from_shared()`] when the VM is removed.
> +    fn into_shared(mut self) -> Arc<Vm<'drm>> {
> +        // SAFETY: `self.0` is initialized, and `forget(self)` below prevents
> +        // the outer wrapper from being dropped, so the taken `Arc` is moved
> +        // out exactly once and nothing is leaked or double-dropped.
> +        let vm = unsafe { ManuallyDrop::take(&mut self.0) };
> +        core::mem::forget(self);

This looks a bit more complicated than what Daniel suggested.
But also I am concerned that the ioctl series might not be the right place to
rework the whole VM ownership/lifetime model. I definitely think it's
worth looking at but I wonder if you could send the ioctl series first
without changing VM ownership, and then follow up with a series proposing
these kinds of changes. It is a significant change that deserves its own
scrutiny.

> +        vm
> +    }
> +
> +    /// Reconstructs an owner from a shared reference.
> +    ///
> +    /// The caller must currently own the VM's destruction.
> +    fn from_shared(vm: Arc<Vm<'drm>>) -> Self {
> +        Self(ManuallyDrop::new(vm))
> +    }
> +}
> +
> +impl<'drm> core::ops::Deref for VmOwner<'drm> {
> +    type Target = Vm<'drm>;
> +
> +    fn deref(&self) -> &Vm<'drm> {
> +        &self.0
> +    }
> +}
> +
> +impl Drop for VmOwner<'_> {
> +    fn drop(&mut self) {
> +        self.0.kill();
> +        // SAFETY: `self.0` is initialized and we are in `drop`, so it is safe
> +        // to drop the inner `Arc` now that the VM has been killed.
> +        unsafe { ManuallyDrop::drop(&mut self.0) };
> +    }
> +}
> +
>  /// Arguments for a virtual memory map operation.
>  struct VmMapArgs<'drm> {
>      /// Access permissions and caching behavior for the mapping.
> @@ -948,3 +1005,101 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
>  
>      Ok(())
>  }
> +
> +/// Maximum number of VMs a single file may hold, matching panthor's
> +/// `PANTHOR_MAX_VMS_PER_FILE`.
> +const MAX_VMS_PER_FILE: usize = 32;
> +
> +/// Per-open-file pool of VMs.
> +#[pin_data(PinnedDrop)]
> +pub(crate) struct VmPool<'drm> {
> +    #[pin]
> +    ids: Mutex<IdPool>,
> +    #[pin]
> +    vms: XArray<Arc<Vm<'drm>>>,
> +}
> +
> +impl<'drm> VmPool<'drm> {
> +    /// Creates a new [`VmPool`].
> +    #[expect(dead_code)]
> +    pub(crate) fn new() -> impl PinInit<Self> {
> +        let ids = IdPool::new();
> +        pin_init!(Self {
> +            ids <- new_mutex!(ids),
> +            vms <- XArray::new(AllocKind::Alloc),
> +        })
> +    }
> +
> +    /// Takes ownership of `vm` and stores it, returning the allocated ID.
> +    ///
> +    /// On failure - ID space exhausted or store failure - the VM is killed
> +    /// here and only the error is returned.
> +    // TODO: allocate IDs with the XArray directly (once it grows range
> +    // allocation, the equivalent of C's `XA_LIMIT`) and drop the IdPool.
> +    #[expect(dead_code)]
> +    pub(crate) fn add(&self, vm: VmOwner<'drm>) -> Result<u32> {
> +        let id = {
> +            let mut ids = self.ids.lock();
> +            let unused = ids.find_unused_id(1).ok_or(ENOSPC)?;
> +            if unused.as_usize() > MAX_VMS_PER_FILE {
> +                return Err(ENOSPC);
> +            }
> +            unused.acquire()
> +        };
> +
> +        let vm = vm.into_shared();
> +        let mut vms = self.vms.lock();
> +        match vms.store(id, vm, GFP_KERNEL) {
> +            Ok(prev_vm) => {
> +                drop(prev_vm);
> +                Ok(id as u32)
> +            }
> +            Err(err) => {
> +                // Drop the XArray spinlock before acquiring the `ids` mutex.
> +                drop(vms);
> +                // Kill the VM and release the pooled id before returning.
> +                drop(VmOwner::from_shared(err.value));
> +                self.ids.lock().release_id(id);
> +                Err(err.error)
> +            }
> +        }
> +    }
> +
> +    /// Removes the VM with the given ID, handing back its owner.
> +    ///
> +    /// Dropping the returned [`VmOwner`] kills the VM immediately.
> +    #[expect(dead_code)]
> +    pub(crate) fn remove(&self, id: u32) -> Result<VmOwner<'drm>> {
> +        let mut vms = self.vms.lock();
> +        match vms.remove(id as usize) {
> +            Some(vm) => {
> +                drop(vms);
> +                self.ids.lock().release_id(id as usize);
> +                Ok(VmOwner::from_shared(vm))
> +            }
> +            None => Err(EINVAL),
> +        }
> +    }
> +
> +    /// Gets a shared reference to the VM with the given ID.
> +    #[expect(dead_code)]
> +    pub(crate) fn get(&self, id: u32) -> Option<Arc<Vm<'drm>>> {
> +        let vms = self.vms.lock();
> +        let borrow = vms.get(id as usize)?;
> +        Some(Arc::from(borrow))
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for VmPool<'_> {
> +    fn drop(self: Pin<&mut Self>) {
> +        let this = self.project();
> +        // Kill every VM still owned by the pool. The ID range is bounded by
> +        // `MAX_VMS_PER_FILE`, so this loop is cheap and runs at file close.
> +        for id in 1..=MAX_VMS_PER_FILE {
> +            // Release the XArray lock guard before killing: `kill()` may sleep.
> +            let vm = this.vms.lock().remove(id);
> +            drop(vm.map(VmOwner::from_shared));
> +        }
> +    }
> +}
> 
> -- 
> 2.43.0
> 
