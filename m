Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7523112A5
	for <rust-for-linux@vger.kernel.org>; Wed,  6 May 2026 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049778; cv=none; b=KHRGFMyOxbsZb/9/zDhWWiUsjvljocI7ovLPAjQSfpxBN+AwPV2mrVYG2n6qvTg2ELWLpbSNCFK76jaKeFK7donjCV619J9tmzkKBaPpeVATwfAbXVSqYzXlvo3HymO0QXtD5LsTQZ+kuvj41lRHVnpiX2ePBGpHRE8MIhoZYyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049778; c=relaxed/simple;
	bh=EsXdIPl3W9CPP3GjdVuBeIR5G2uGYIYefgJGLLApzhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A1lkD7nwwEyEZ8r6B8BcZoeeyguRmNlTdqGCIHShp6Ck6fn3nh4T9fnm+SCp6hanzWAr0OVCckv/6VrWNYsU03ylSSmSOQgV4aydUYHXAEZgYyCoyIwX37tywXRzhiul7PqmtfYCNVHP5zPKQ94xdBJtdS2AC1BLGER0utye9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=YYRuOUe4; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="YYRuOUe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778049767; x=1778308967;
	bh=q2TXCLAE2mPGzfy+dmYtqTEvX4ADjVRcu962o0Qm+Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YYRuOUe4hzQg3hZX3rBASWhHtohhj/47mncF5Iz2Us36uYCxYb7GI6UsGCojnD8jG
	 MBhR6pzqpTAEE5AlnDDfy2KRR6cZKiO1cjzTP6D2IRgVczUfOibvZpeYyNg6KNNHNv
	 vh9CDp3hLLi5f8JPEE1zDu0Cour7wa38jDdw1RJsBuAIkaYSHa3QH8Y/wLwYBS0azS
	 DNWKFq8UmEKKywpFKI75nWd+rHAk6/yR0g7Y+59KKb2Qfi4Ac0kUxHXLRhl1HHbCFF
	 WbbowqgK46V0zycJpYY2JgWH4JSCQPoKNQZG9ikhjLtAZXUx017dukn+pU5C2oXQmy
	 tO6hZsRYMm+Jw==
X-Pm-Submission-Id: 4g9Qmd4dR6z2Scpx
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	=?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Philipp Stanner <pstanner@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/gpuvm: rust: add drm_gpuvm_exec support
Date: Wed,  6 May 2026 09:42:33 +0300
Message-ID: <20260506064240.29720-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260505-gpuvm-drm-exec-v1-2-958306ded36e@google.com>
References: <20260505-gpuvm-drm-exec-v1-0-958306ded36e@google.com> <20260505-gpuvm-drm-exec-v1-2-958306ded36e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 05 May 2026 13:29:37 +0000=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> This adds support for simple usage of drm_gpuvm_exec() for locking all=0D
> of the dma reservations and adding fences to them. For more complex=0D
> usage that does not involve locking all reservations, it is expected=0D
> that the ww-mutex abstractions will be used instead.=0D
> =0D
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>=0D
> ---=0D
>  rust/bindings/bindings_helper.h |  2 ++=0D
>  rust/helpers/drm_gpuvm.c        |  6 ++++=0D
>  rust/kernel/dma_buf/mod.rs      | 17 ++++++++++=0D
>  rust/kernel/drm/gpuvm/mod.rs    | 71 +++++++++++++++++++++++++++++++++++=
++++++=0D
>  4 files changed, 96 insertions(+)=0D
> =0D
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h=0D
> index 1124785e210b..3978682a6f2e 100644=0D
> --- a/rust/bindings/bindings_helper.h=0D
> +++ b/rust/bindings/bindings_helper.h=0D
> @@ -151,6 +151,8 @@ const vm_flags_t RUST_CONST_HELPER_VM_MIXEDMAP =3D VM=
_MIXEDMAP;=0D
>  const vm_flags_t RUST_CONST_HELPER_VM_HUGEPAGE =3D VM_HUGEPAGE;=0D
>  const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE =3D VM_NOHUGEPAGE;=0D
>  =0D
> +const u32 RUST_CONST_HELPER_DRM_EXEC_INTERRUPTIBLE_WAIT =3D DRM_EXEC_INT=
ERRUPTIBLE_WAIT;=0D
> +=0D
>  #if IS_ENABLED(CONFIG_GPU_BUDDY)=0D
>  const unsigned long RUST_CONST_HELPER_GPU_BUDDY_RANGE_ALLOCATION =3D GPU=
_BUDDY_RANGE_ALLOCATION;=0D
>  const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TOPDOWN_ALLOCATION =3D G=
PU_BUDDY_TOPDOWN_ALLOCATION;=0D
> diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c=0D
> index 4130b6325213..30fb1777fbf2 100644=0D
> --- a/rust/helpers/drm_gpuvm.c=0D
> +++ b/rust/helpers/drm_gpuvm.c=0D
> @@ -23,4 +23,10 @@ bool rust_helper_drm_gpuvm_is_extobj(struct drm_gpuvm =
*gpuvm,=0D
>  	return drm_gpuvm_is_extobj(gpuvm, obj);=0D
>  }=0D
>  =0D
> +__rust_helper=0D
> +void rust_helper_drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)=0D
> +{=0D
> +	drm_gpuvm_exec_unlock(vm_exec);=0D
> +}=0D
> +=0D
>  #endif // CONFIG_RUST_DRM_GPUVM=0D
> diff --git a/rust/kernel/dma_buf/mod.rs b/rust/kernel/dma_buf/mod.rs=0D
> index b66e747c35ad..234936ba8265 100644=0D
> --- a/rust/kernel/dma_buf/mod.rs=0D
> +++ b/rust/kernel/dma_buf/mod.rs=0D
> @@ -5,3 +5,20 @@=0D
>  pub mod dma_fence;=0D
>  =0D
>  pub use self::dma_fence::Fence;=0D
> +=0D
> +/// How the fences from a `dma_resv` obj are used.=0D
> +///=0D
> +/// Please see [the C-side documentation][dma_resv_usage] for more detai=
ls.=0D
> +///=0D
> +/// [dma_resv_usage]: https://docs.kernel.org/driver-api/dma-buf.html#c.=
dma_resv_usage=0D
> +#[repr(u32)]=0D
> +pub enum DmaResvUsage {=0D
> +    /// For in kernel memory management only (e.g. copying, clearing mem=
ory).=0D
> +    Kernel =3D bindings::dma_resv_usage_DMA_RESV_USAGE_KERNEL,=0D
> +    /// Implicit write synchronization for userspace submissions.=0D
> +    Write =3D bindings::dma_resv_usage_DMA_RESV_USAGE_WRITE,=0D
> +    /// Implicit read synchronization for userspace submissions.=0D
> +    Read =3D bindings::dma_resv_usage_DMA_RESV_USAGE_READ,=0D
> +    /// No implicit sync (e.g. preemption fences, page table updates, TL=
B flushes).=0D
> +    Bookkeep =3D bindings::dma_resv_usage_DMA_RESV_USAGE_BOOKKEEP,=0D
> +}=0D
> diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs=
=0D
> index ae58f6f667c1..a52fb25f22ff 100644=0D
> --- a/rust/kernel/drm/gpuvm/mod.rs=0D
> +++ b/rust/kernel/drm/gpuvm/mod.rs=0D
> @@ -16,6 +16,7 @@=0D
>          Flags as AllocFlags, //=0D
>      },=0D
>      bindings,=0D
> +    dma_buf::{DmaResvUsage, Fence},=0D
=0D
This can be handled vertically.=0D
=0D
>      drm,=0D
>      drm::gem::IntoGEMObject,=0D
>      error::to_result,=0D
> @@ -216,6 +217,30 @@ pub fn obtain(=0D
>          Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())=0D
>      }=0D
>  =0D
> +    /// Prepare this GPUVM.=0D
> +    ///=0D
> +    /// The parameter indicates how many fences to preallocate space for=
.=0D
> +    #[inline]=0D
> +    pub fn prepare(&self, num_fences: u32) -> impl PinInit<GpuVmExec<'_,=
 T>, Error> {=0D
> +        try_pin_init!(GpuVmExec {=0D
> +            exec <- Opaque::try_ffi_init(|exec: *mut bindings::drm_gpuvm=
_exec| {=0D
> +                // SAFETY: exec is valid but unused memory, so we can wr=
ite.=0D
> +                unsafe {=0D
> +                    ptr::write_bytes(exec, 0u8, 1usize);=0D
> +                    ptr::write(&raw mut (*exec).vm, self.as_raw());=0D
> +                    ptr::write(&raw mut (*exec).flags, bindings::DRM_EXE=
C_INTERRUPTIBLE_WAIT);=0D
> +                    ptr::write(&raw mut (*exec).num_fences, num_fences);=
=0D
> +                }=0D
> +=0D
> +                // SAFETY: If successful, this `struct drm_gpuvm_exec` r=
emains valid until this is=0D
> +                // unlocked because it's pinned and unlocks it in drop. =
The contained pointer to=0D
> +                // `self` remains valid because `GpuVmExec` borrows from=
 `self`.=0D
> +                to_result(unsafe { bindings::drm_gpuvm_exec_lock(exec) }=
)=0D
> +            }),=0D
> +            _gpuvm: PhantomData,=0D
> +        })=0D
> +    }=0D
> +=0D
>      /// Clean up buffer objects that are no longer used.=0D
>      #[inline]=0D
>      pub fn deferred_cleanup(&self) {=0D
> @@ -326,3 +351,49 @@ fn deref(&self) -> &GpuVm<T> {=0D
>          &self.0=0D
>      }=0D
>  }=0D
> +=0D
> +/// The exec token for preparing the objects.=0D
> +///=0D
> +/// # Invariants=0D
> +///=0D
> +/// Owns a GPUVM exec context.=0D
> +#[pin_data(PinnedDrop)]=0D
> +pub struct GpuVmExec<'vm, T: DriverGpuVm> {=0D
> +    #[pin]=0D
> +    exec: Opaque<bindings::drm_gpuvm_exec>,=0D
> +    _gpuvm: PhantomData<&'vm mut GpuVm<T>>,=0D
> +}=0D
> +=0D
> +impl<'vm, T: DriverGpuVm> GpuVmExec<'vm, T> {=0D
> +    /// Add a fence.=0D
> +    ///=0D
> +    /// The caller must ensure that the preallocated space for fences is=
 sufficient.=0D
> +    #[inline]=0D
> +    pub fn resv_add_fence(=0D
> +        &self,=0D
> +        fence: &Fence,=0D
> +        private_usage: DmaResvUsage,=0D
> +        extobj_usage: DmaResvUsage,=0D
> +    ) {=0D
> +        // SAFETY: This method takes a refcount on the fence, so it's on=
ly required to be valid for=0D
> +        // the duration of this method. If there is not enough space for=
 the pre-allocated fence,=0D
> +        // then this leads to a BUG_ON() but does not trigger UB.=0D
=0D
Did you think about tracking the space of fences? We can store num_fences f=
rom=0D
prepare and a counter added_fences then compare them in this function to av=
oid=0D
this risk.=0D
=0D
> +        unsafe {=0D
> +            bindings::drm_gpuvm_resv_add_fence(=0D
> +                (*self.exec.get()).vm,=0D
> +                &raw mut (*self.exec.get()).exec,=0D
> +                fence.as_raw(),=0D
> +                private_usage as u32,=0D
> +                extobj_usage as u32,=0D
> +            )=0D
> +        }=0D
> +    }=0D
> +}=0D
> +=0D
> +#[pinned_drop]=0D
> +impl<'vm, T: DriverGpuVm> PinnedDrop for GpuVmExec<'vm, T> {=0D
> +    fn drop(self: Pin<&mut Self>) {=0D
> +        // SAFETY: We hold the lock, so it's safe to unlock.=0D
> +        unsafe { bindings::drm_gpuvm_exec_unlock(self.exec.get()) };=0D
> +    }=0D
> +}=0D
> =0D
> -- =0D
> 2.54.0.545.g6539524ca2-goog=0D
> =0D
