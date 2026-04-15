Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F338B7DF
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 20:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776285272; cv=none; b=ILD5I09EL94VJiRajxLulKQ3nVDe0f397gZdSZEqTn9ISH2l4x4r4lBJhQKBvuogkBFOldczoAA0LGLOn/BLLdwcUf1uY3KqQzrcqbR436a280f9fp/zJN4DfnlBIMeR3B09weIxCa1vi1hGvN7lwq/i5qdJDllJsOZJmZ9wBBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776285272; c=relaxed/simple;
	bh=xQo/sKhbzjSAEdzKX8rHCXcoUQ9ddyQfWmpVa9phgrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8tcMNkMxWyZxJsCGohxjkZa13izJtD38atOSvfh4uARAe+8BPpY7Y+CSwtboT1R63GZ2KGmvxs0BYpgyyCtato14kddlqgMCn2Kyxf3VBKjWC5k7UvsoFDzbFUgWkriCnD/aGTpjWj+oQy25j9kui240x+n5fHGNpcg95xI1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYHlJ1nQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYHlJ1nQ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-823c56765fdso4028587b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776285271; x=1776890071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=evPdVc7JX1/GCJya2uVD7AD+qpQmSg6Z2GMNsgZnKSs=;
        b=jYHlJ1nQZg/SI8VruvWeb9dUHkLv4LtfmR3JYu/NqU0/at8FBMFZR1Ku2rbnxnzvlT
         fPWlpU25rmY1o6kDkrrWnyuEQ8SRNDWk8U7Fq/KvB26Ia622ynG6B50H+VtAQeSaA6oc
         MxRxJytlbiYOH1R6OomeZLaN8FtpM4Khn5ZiKIRQznuKTAuEWD6sJ5q7mtiEMjjKFP6Y
         6D7EE9sKqbF6/senuK2yj9NWL1kmlx9ppECoO2xqtUFfKk003LX8SlzpoeSQGdJkqIBN
         mojlc4hKuu5PW00QaQfiKmXUZykiYS/ulVqKM2nRJDLbibJosHt+ceS+SDT3uHgKTQUL
         qKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776285271; x=1776890071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evPdVc7JX1/GCJya2uVD7AD+qpQmSg6Z2GMNsgZnKSs=;
        b=Q1IVIFWhZoaonZ2tQwGzotf40pEvQzat341ZsBPwYfzMTuIONo97TpVo3KhcuukzZr
         onKJIK2G0BXCzzPoxppsKRKn46V5LqGbLuNdsWr9zIVHjL6ZY9QG8IkJXxxvPNwe/lXY
         +4NDGSfV7jDt34AvZyIjOV6EkdyzxzXrHBA6BLORDuu0K6VHmGN/nUqWQDSXF9nR4gPj
         l5yduWTgOIbv6+eHVhK0t8ct2cgc5G/aQHcptQ9VG5AwFSBG64qCkTVGuNI8Ea0gAuYa
         7JoNsnJinYg+Q8zR2FVtL4O8K7nykvHa5tWi4T3wAGfTkcVz/AR6zdBtn7mnUSn5rdLb
         0MCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YWjrxHxVwzrZKPSr9KV6jQcpfUbs8bf7FgoApmUa3qSaDpTEQycXYNFr+jKcLfrgMLeqM9BG2fWCoGwnq4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0IlRG1L9qUIeTim418ZTL1K+RuUO2Gb/LfJOjT2RiTuxIYDr
	UreCTOyJxJvCjyp6Vb++SQ9K6xBdkSexM/QbJGltiivD2T0orWLOJtb3
X-Gm-Gg: AeBDiesvQ02xkizeKRzXFORTwyQBF3vu+zYukzWrANEmL04/0I5+XsHzYiuif00J+hS
	7j7166v6XBrpVeXJyqpMW3c5nh5BNVIntwmFN7L5Dfbh5aq6W7sbpZz0AxtXC3ARBmXZhoqrUyg
	cogS1CMWaTVm14MWGJvK2u5ZakLkzTR90NLUwU9qTCNk8cHtrtBjyX2cGk+4RGFd/ApJC+ODcHe
	yyNzEdcRtzD14HiIaUxreYEz4RWuovISd3KCDvYws34DxBo6myKgZFCsRA3nJqzi/o++9/pqY2c
	TKFEQ2NI5MkQiBtMe9ju9eXKmBVUP4xBqOQAit+9vBkPas2w0pQoTUGE0KOfMrBhE7JeeLqwosh
	3llRE1IhxlcZQ2UxnI0bngLWu2BzViOWyL6Ry71NY/c/t2Am2CUIWWViPC120Ho46N7rE7VjNBU
	TCz8MS4VLEUuEozqdVc8FlsPeaKuueWfadZPFh4fdHALLWV42K2RSLKYZ2My9vnHljHR+2reODB
	fVj8+RcrNbpk6mx/hIJm3/x51qR3t7iaqBGxozyqjfPK96ivP4=
X-Received: by 2002:a05:6a00:99a:b0:82f:453e:3863 with SMTP id d2e1a72fcca58-82f453e4382mr12834428b3a.22.1776285270267;
        Wed, 15 Apr 2026 13:34:30 -0700 (PDT)
Received: from Cyndaquil.localdomain ([131.107.1.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6728d5d3sm2997490b3a.25.2026.04.15.13.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:34:29 -0700 (PDT)
Date: Wed, 15 Apr 2026 13:34:28 -0700
From: Mitchell Levy <levymitchell0@gmail.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Boqun Feng <boqun@kernel.org>, Tyler Hicks <code@tyhicks.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v5 7/8] rust: percpu: Add pin-hole optimizations for
 numerics
Message-ID: <ad_2VOc2hjhTYMQk@Cyndaquil.localdomain>
References: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
 <20260410-rust-percpu-v5-7-4292380d7a41@gmail.com>
 <adm6rmerdgVtclo5@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adm6rmerdgVtclo5@yury>

On Fri, Apr 10, 2026 at 11:06:22PM -0400, Yury Norov wrote:
> On Fri, Apr 10, 2026 at 02:35:37PM -0700, Mitchell Levy wrote:
> > The C implementations of `this_cpu_add`, `this_cpu_sub`, etc., are
> > optimized to save an instruction by avoiding having to compute
> > `this_cpu_ptr(&x)` for some per-CPU variable `x`. For example, rather
> > than
> > 
> >     u64 *x_ptr = this_cpu_ptr(&x);
> >     *x_ptr += 5;
> > 
> > the implementation of `this_cpu_add` is clever enough to make use of the
> > fact that per-CPU variables are implemented on x86 via segment
> > registers, and so we can use only a single instruction (where we assume
> > `&x` is already in `rax`)
> > 
> >     add gs:[rax], 5
> > 
> > Add this optimization via a `PerCpuNumeric` type to enable code-reuse
> > between `DynamicPerCpu` and `StaticPerCpu`.
> > 
> > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > ---
> >  rust/kernel/percpu.rs         |   1 +
> >  rust/kernel/percpu/dynamic.rs |  10 ++-
> >  rust/kernel/percpu/numeric.rs | 138 ++++++++++++++++++++++++++++++++++++++++++
> >  samples/rust/rust_percpu.rs   |  36 +++++++++++
> >  4 files changed, 184 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
> > index 72c83fef68ee..ff04607ee047 100644
> > --- a/rust/kernel/percpu.rs
> > +++ b/rust/kernel/percpu.rs
> > @@ -6,6 +6,7 @@
> >  
> >  pub mod cpu_guard;
> >  mod dynamic;
> > +pub mod numeric;
> >  mod static_;
> >  
> >  #[doc(inline)]
> > diff --git a/rust/kernel/percpu/dynamic.rs b/rust/kernel/percpu/dynamic.rs
> > index 40514704b3d0..a717138b93dc 100644
> > --- a/rust/kernel/percpu/dynamic.rs
> > +++ b/rust/kernel/percpu/dynamic.rs
> > @@ -28,7 +28,7 @@
> >  /// the memory location on any particular CPU has been initialized. This means that it cannot tell
> >  /// whether it should drop the *contents* of the allocation when it is dropped. It is up to the
> >  /// user to do this via something like [`core::ptr::drop_in_place`].
> > -pub struct PerCpuAllocation<T>(PerCpuPtr<T>);
> > +pub struct PerCpuAllocation<T>(pub(super) PerCpuPtr<T>);
> >  
> >  impl<T: Zeroable> PerCpuAllocation<T> {
> >      /// Dynamically allocates a space in the per-CPU area suitably sized and aligned to hold a `T`,
> > @@ -162,6 +162,14 @@ pub fn new_from(mut initer: impl FnMut(CpuId) -> T, flags: Flags) -> Option<Self
> >      }
> >  }
> >  
> > +impl<T> DynamicPerCpu<T> {
> > +    /// Gets the allocation backing this per-CPU variable.
> > +    pub(crate) fn alloc(&self) -> &Arc<PerCpuAllocation<T>> {
> > +        // SAFETY: This type's invariant ensures that `self.alloc` is `Some`.
> > +        unsafe { self.alloc.as_ref().unwrap_unchecked() }
> > +    }
> > +}
> > +
> >  impl<T> PerCpu<T> for DynamicPerCpu<T> {
> >      unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
> >          // SAFETY:
> > diff --git a/rust/kernel/percpu/numeric.rs b/rust/kernel/percpu/numeric.rs
> > new file mode 100644
> > index 000000000000..13b4ab4a794d
> > --- /dev/null
> > +++ b/rust/kernel/percpu/numeric.rs
> > @@ -0,0 +1,138 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//! Pin-hole optimizations for [`PerCpu<T>`] where T is a numeric type.
> > +
> > +use super::*;
> > +use core::arch::asm;
> > +
> > +/// Represents a per-CPU variable that can be manipulated with machine-intrinsic numeric
> > +/// operations.
> > +pub struct PerCpuNumeric<'a, T> {
> > +    // INVARIANT: `ptr.0` is a valid offset into the per-CPU area and is initialized on all CPUs
> > +    // (since we don't have a CPU guard, we have to be pessimistic and assume we could be on any
> > +    // CPU).
> > +    ptr: &'a PerCpuPtr<T>,
> > +}
> > +
> > +macro_rules! impl_ops {
> > +    ($ty:ty, $reg:tt) => {
> > +        impl DynamicPerCpu<$ty> {
> > +            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
> > +            /// variable.
> > +            #[inline]
> > +            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
> > +                // The invariant is satisfied because `DynamicPerCpu`'s invariant guarantees that
> > +                // this pointer is valid and initialized on all CPUs.
> > +                PerCpuNumeric { ptr: &self.alloc().0 }
> > +            }
> > +        }
> > +        impl StaticPerCpu<$ty> {
> > +            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
> > +            /// variable.
> > +            #[inline]
> > +            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
> > +                // The invariant is satisfied because `StaticPerCpu`'s invariant guarantees that
> > +                // this pointer is valid and initialized on all CPUs.
> > +                PerCpuNumeric { ptr: &self.0 }
> > +            }
> > +        }
> > +
> > +        impl PerCpuNumeric<'_, $ty> {
> > +            /// Adds `rhs` to the per-CPU variable.
> > +            #[inline]
> > +            pub fn add(&mut self, rhs: $ty) {
> > +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> > +                // pointer relative to the `gs` segment register) by the invariants of this type.
> > +                unsafe {
> > +                    asm!(
> > +                        concat!("add gs:[{off}], {val:", $reg, "}"),
> > +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> > +                        val = in(reg) rhs,
> 
> So, every user of .add() now will be only compilable against x86_64? 
> I don't think it's right. Can you make it in a more convenient way:
> implement a generic version, and then an x86_64-optimized.
> 
> How bad the generic x86_64 version looks comparing to the optimized
> one?

Currently, all of `mod percpu` is behind `#[cfg(X86_64)]`, so usage of
per-CPU variables in general is only compatible against x86_64.

I believe a generic implementation would require implicitly creating a
`CpuGuard` since in general you require two steps: computing the pointer
to the per-CPU variable's slot in the current CPU's area and actually
doing the write. On x86_64 we can get around this because segment
register relative writes let us combine these two ops into one
instruction which can't be torn across CPUs. But in the general case you
could have the task get preempted between those two operations and end
up with a data race.

As I understand it, x86 is the only arch where this is possible, so even
once `mod percpu` supports more architectures, I think it'd still make
some sense to have `PerCpuNumeric` specifically be x86 exclusive. This
means that the user must always explicitly disable preemption rather
than having a `PerCpuNumeric` type that sometimes does and sometimes
doesn't.

Thanks,
Mitchell

> Thanks,
> Yury
> 
> > +                    );
> > +                }
> > +            }
> > +        }
> > +        impl PerCpuNumeric<'_, $ty> {
> > +            /// Subtracts `rhs` from the per-CPU variable.
> > +            #[inline]
> > +            pub fn sub(&mut self, rhs: $ty) {
> > +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> > +                // pointer relative to the `gs` segment register) by the invariants of this type.
> > +                unsafe {
> > +                    asm!(
> > +                        concat!("sub gs:[{off}], {val:", $reg, "}"),
> > +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> > +                        val = in(reg) rhs,
> > +                    );
> > +                }
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +macro_rules! impl_ops_byte {
> > +    ($ty:ty) => {
> > +        impl DynamicPerCpu<$ty> {
> > +            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
> > +            /// variable.
> > +            #[inline]
> > +            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
> > +                // The invariant is satisfied because `DynamicPerCpu`'s invariant guarantees that
> > +                // this pointer is valid and initialized on all CPUs.
> > +                PerCpuNumeric { ptr: &self.alloc().0 }
> > +            }
> > +        }
> > +        impl StaticPerCpu<$ty> {
> > +            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
> > +            /// variable.
> > +            #[inline]
> > +            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
> > +                // The invariant is satisfied because `StaticPerCpu`'s invariant guarantees that
> > +                // this pointer is valid and initialized on all CPUs.
> > +                PerCpuNumeric { ptr: &self.0 }
> > +            }
> > +        }
> > +
> > +        impl PerCpuNumeric<'_, $ty> {
> > +            /// Adds `rhs` to the per-CPU variable.
> > +            #[inline]
> > +            pub fn add(&mut self, rhs: $ty) {
> > +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> > +                // pointer relative to the `gs` segment register) by the invariants of this type.
> > +                unsafe {
> > +                    asm!(
> > +                        "add gs:[{off}], {val}",
> > +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> > +                        val = in(reg_byte) rhs,
> > +                    );
> > +                }
> > +            }
> > +        }
> > +        impl PerCpuNumeric<'_, $ty> {
> > +            /// Subtracts `rhs` from the per-CPU variable.
> > +            #[inline]
> > +            pub fn sub(&mut self, rhs: $ty) {
> > +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> > +                // pointer relative to the `gs` segment register) by the invariants of this type.
> > +                unsafe {
> > +                    asm!(
> > +                        "sub gs:[{off}], {val}",
> > +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> > +                        val = in(reg_byte) rhs,
> > +                    );
> > +                }
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +impl_ops_byte!(i8);
> > +impl_ops!(i16, "x");
> > +impl_ops!(i32, "e");
> > +impl_ops!(i64, "r");
> > +impl_ops!(isize, "r");
> > +
> > +impl_ops_byte!(u8);
> > +impl_ops!(u16, "x");
> > +impl_ops!(u32, "e");
> > +impl_ops!(u64, "r");
> > +impl_ops!(usize, "r");
> > diff --git a/samples/rust/rust_percpu.rs b/samples/rust/rust_percpu.rs
> > index 5adb30509bd4..90f5debd3c7a 100644
> > --- a/samples/rust/rust_percpu.rs
> > +++ b/samples/rust/rust_percpu.rs
> > @@ -28,6 +28,26 @@
> >  define_per_cpu!(UPERCPU: u64 = 0);
> >  define_per_cpu!(CHECKED: RefCell<u64> = RefCell::new(0));
> >  
> > +macro_rules! make_optimization_test {
> > +    ($ty:ty) => {
> > +        let mut test: DynamicPerCpu<$ty> = DynamicPerCpu::new_zero(GFP_KERNEL).unwrap();
> > +        {
> > +            let _guard = CpuGuard::new();
> > +            // SAFETY: No other usage of `test`
> > +            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| *val = 10);
> > +            test.num().add(1);
> > +            // SAFETY: No other usage of `test`
> > +            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 11));
> > +            test.num().add(10);
> > +            // SAFETY: No other usage of `test`
> > +            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 21));
> > +            test.num().sub(5);
> > +            // SAFETY: No other usage of `test`
> > +            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 16));
> > +        }
> > +    };
> > +}
> > +
> >  impl kernel::Module for PerCpuMod {
> >      fn init(_module: &'static ThisModule) -> Result<Self, Error> {
> >          pr_info!("rust percpu test start\n");
> > @@ -228,6 +248,22 @@ fn init(_module: &'static ThisModule) -> Result<Self, Error> {
> >  
> >          pr_info!("rust dynamic percpu test done\n");
> >  
> > +        pr_info!("rust numeric optimizations test start\n");
> > +
> > +        make_optimization_test!(u8);
> > +        make_optimization_test!(u16);
> > +        make_optimization_test!(u32);
> > +        make_optimization_test!(u64);
> > +        make_optimization_test!(usize);
> > +
> > +        make_optimization_test!(i8);
> > +        make_optimization_test!(i16);
> > +        make_optimization_test!(i32);
> > +        make_optimization_test!(i64);
> > +        make_optimization_test!(isize);
> > +
> > +        pr_info!("rust numeric optimizations test done\n");
> > +
> >          // Return Err to unload the module
> >          Result::Err(EINVAL)
> >      }
> > 
> > -- 
> > 2.34.1
