Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8413C4B64;
	Tue, 13 Oct 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=132.226.202.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901069; cv=none; b=MbJJwWnaygJWpaMBoV2AdqP5Oo+G9c7VptjQleOJCH2xo6FqVN2TNqHlQPnjxgIUpJivvzeAkgfQzfl15up54d3+x+Y/zlFhCIhqpA0++fDgUT2a3QqtHSb81Ogv9saqHxUZCKlWtbfF4UwNl8aRnmlybffkqAbbAmUjI/U44us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901069; c=relaxed/simple;
	bh=rD+l7/yTL+2zXi0Sc4MvyDWAcyjPW8oDjR3dZ5I49P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owEU578Q2o1Q8IwcxwgiP58nntCyl+2Kbl//uQKTCDqsPCxEKbZfbgcNmT4dfZhDE8iwPDhKK/+HvkNqe5C8vgfPs1br7JJqZrAC64BO56JlwFOOQdcM6e1Ad6gcbkofdmI6+LwnuTNYdmIj/TUetj4w1dCRjgOUw2Sz9Jr5ThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=132.226.202.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBmrqR+Pc5qrBPDAA--.31410S2;
	Tue, 13 Oct 2026 22:17:34 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBnYCd2Pc5qZq4bAA--.47606S2;
	Tue, 13 Oct 2026 22:17:29 +0800 (CST)
Message-ID: <40ffea3e-a3f0-4949-9f7d-331490c29e36@hust.edu.cn>
Date: Tue, 13 Oct 2026 22:17:26 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: workqueue: replace deprecated system_wq with
 system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlos Llamas <cmllamas@google.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMBmrqR+Pc5qrBPDAA--.31410S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWfXr1rJr4rXFyxCw4kKryUZFb_yoWkJF4kpr
	WrA34jqa18JF4UA39Iga1xJFyxWws7uw47W34xAw17Ar4qvrZ0gryftr15WFWUZr95uasx
	tFW0ka9rZw1jvrDanT9S1TB71UUUU1DqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1q6r43M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVW8ZVWrXwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUO6MNUUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/13/26 9:51 PM, Alice Ryhl wrote:
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
> 	[    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unbound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> This patch was previously sent as part of other workqueue series [1][2].
> However it's a fix that is independent of those series, so it's sent on
> its own here.
>
> [1] https://lore.kernel.org/all/20260726223613.1242940-3-dakr@kernel.org
> [2] https://lore.kernel.org/all/20260807165252.3849875-2-dakr@kernel.org
>
> Changes since [2]:
>    - Rebase on v7.3-rc7 and also convert the new SpinLockIrq KUnit test,
>      which calls workqueue::system() and otherwise fails to build.
>    - Add Fixes: tag for the commit that made system_wq warn.
>    - Collect Reviewed-by from Daniel.
> ---
>   Documentation/rust/testing.rst                    |  2 +-
>   Documentation/translations/zh_CN/rust/testing.rst |  2 +-
>   drivers/android/binder/process.rs                 |  4 +--
>   rust/kernel/sync/completion.rs                    |  2 +-
>   rust/kernel/sync/lock/spinlock.rs                 |  2 +-
>   rust/kernel/workqueue.rs                          | 42 +++++++++++++++--------
>   6 files changed, 33 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
> index e3943aceceb9..73046523a9a2 100644
> --- a/Documentation/rust/testing.rst
> +++ b/Documentation/rust/testing.rst
> @@ -97,7 +97,7 @@ operator are also supported as usual, e.g.:
>   
>   	/// ```
>   	/// # use kernel::{spawn_work_item, workqueue};
> -	/// spawn_work_item!(workqueue::system(), || pr_info!("x\n"))?;
> +	/// spawn_work_item!(workqueue::system_dfl(), || pr_info!("x\n"))?;
>   	/// # Ok::<(), Error>(())
>   	/// ```
>   


LGTM in terms of documentation part.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>


> diff --git a/Documentation/translations/zh_CN/rust/testing.rst b/Documentation/translations/zh_CN/rust/testing.rst
> index 6747d0012991..fdd88fa2fe40 100644
> --- a/Documentation/translations/zh_CN/rust/testing.rst
> +++ b/Documentation/translations/zh_CN/rust/testing.rst
> @@ -93,7 +93,7 @@ KUnit 测试即文档测试
>   
>   	/// ```
>   	/// # use kernel::{spawn_work_item, workqueue};
> -	/// spawn_work_item!(workqueue::system(), || pr_info!("x\n"))?;
> +	/// spawn_work_item!(workqueue::system_dfl(), || pr_info!("x\n"))?;
>   	/// # Ok::<(), Error>(())
>   	/// ```
>   
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 5372bfbd93b3..de5bca7f9fc7 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1728,7 +1728,7 @@ pub(crate) fn release(this: Arc<Process>, _file: &File) {
>           if should_schedule {
>               // Ignore failures to schedule to the workqueue. Those just mean that we're already
>               // scheduled for execution.
> -            let _ = workqueue::system().enqueue(this);
> +            let _ = workqueue::system_percpu().enqueue(this);
>           }
>   
>           drop(binderfs_file);
> @@ -1745,7 +1745,7 @@ pub(crate) fn flush(this: ArcBorrow<'_, Process>) -> Result {
>           if should_schedule {
>               // Ignore failures to schedule to the workqueue. Those just mean that we're already
>               // scheduled for execution.
> -            let _ = workqueue::system().enqueue(Arc::from(this));
> +            let _ = workqueue::system_percpu().enqueue(Arc::from(this));
>           }
>           Ok(())
>       }
> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
> index 35ff049ff078..1771bfc0ade2 100644
> --- a/rust/kernel/sync/completion.rs
> +++ b/rust/kernel/sync/completion.rs
> @@ -38,7 +38,7 @@
>   ///             done <- Completion::new(),
>   ///         }), GFP_KERNEL)?;
>   ///
> -///         let _ = workqueue::system().enqueue(this.clone());
> +///         let _ = workqueue::system_dfl().enqueue(this.clone());
>   ///
>   ///         Ok(this)
>   ///     }
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
> index aafc80125f59..92ad133262b6 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -450,7 +450,7 @@ fn run(this: Arc<Self>) {
>       fn spinlock_irq_condvar() -> Result {
>           let testdata = Test::new()?;
>   
> -        let _ = workqueue::system().enqueue(testdata.clone());
> +        let _ = workqueue::system_dfl().enqueue(testdata.clone());
>   
>           // Let the updater know when we're ready to wait
>           let mut state = testdata.state.lock();
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..7bc07ccd1ebb 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -67,7 +67,7 @@
>   //! /// This method will enqueue the struct for execution on the system workqueue, where its value
>   //! /// will be printed.
>   //! fn print_later(val: Arc<MyStruct>) {
> -//!     let _ = workqueue::system().enqueue(val);
> +//!     let _ = workqueue::system_dfl().enqueue(val);
>   //! }
>   //! # print_later(MyStruct::new(42).unwrap());
>   //! ```
> @@ -121,11 +121,11 @@
>   //! }
>   //!
>   //! fn print_1_later(val: Arc<MyStruct>) {
> -//!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 1>(val);
> +//!     let _ = workqueue::system_dfl().enqueue::<Arc<MyStruct>, 1>(val);
>   //! }
>   //!
>   //! fn print_2_later(val: Arc<MyStruct>) {
> -//!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
> +//!     let _ = workqueue::system_dfl().enqueue::<Arc<MyStruct>, 2>(val);
>   //! }
>   //! # print_1_later(MyStruct::new(24, 25).unwrap());
>   //! # print_2_later(MyStruct::new(41, 42).unwrap());
> @@ -171,13 +171,13 @@
>   //! /// This method will enqueue the struct for execution on the system workqueue, where its value
>   //! /// will be printed 12 jiffies later.
>   //! fn print_later(val: Arc<MyStruct>) {
> -//!     let _ = workqueue::system().enqueue_delayed(val, 12);
> +//!     let _ = workqueue::system_dfl().enqueue_delayed(val, 12);
>   //! }
>   //!
>   //! /// It is also possible to use the ordinary `enqueue` method together with `DelayedWork`. This
>   //! /// is equivalent to calling `enqueue_delayed` with a delay of zero.
>   //! fn print_now(val: Arc<MyStruct>) {
> -//!     let _ = workqueue::system().enqueue(val);
> +//!     let _ = workqueue::system_dfl().enqueue(val);
>   //! }
>   //! # print_later(MyStruct::new(42).unwrap());
>   //! # print_now(MyStruct::new(42).unwrap());
> @@ -1024,20 +1024,32 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for ARef<T>
>   {
>   }
>   
> -/// Returns the system work queue (`system_wq`).
> +/// Returns the system per-cpu work queue (`system_percpu_wq`).
>   ///
>   /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are
>   /// users which expect relatively short queue flush time.
>   ///
>   /// Callers shouldn't queue work items which can run for too long.
> -pub fn system() -> &'static Queue {
> -    // SAFETY: `system_wq` is a C global, always available.
> -    unsafe { Queue::from_raw(bindings::system_wq) }
> +#[inline]
> +pub fn system_percpu() -> &'static Queue {
> +    // SAFETY: `system_percpu_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_percpu_wq) }
> +}
> +
> +/// Returns the system default (unbound) work queue (`system_dfl_wq`).
> +///
> +/// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
> +/// are executed immediately as long as `max_active` limit is not reached and resources are
> +/// available.
> +#[inline]
> +pub fn system_dfl() -> &'static Queue {
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
>   }
>   
>   /// Returns the system high-priority work queue (`system_highpri_wq`).
>   ///
> -/// It is similar to the one returned by [`system`] but for work items which require higher
> +/// It is similar to the one returned by [`system_percpu`] but for work items which require higher
>   /// scheduling priority.
>   pub fn system_highpri() -> &'static Queue {
>       // SAFETY: `system_highpri_wq` is a C global, always available.
> @@ -1046,8 +1058,8 @@ pub fn system_highpri() -> &'static Queue {
>   
>   /// Returns the system work queue for potentially long-running work items (`system_long_wq`).
>   ///
> -/// It is similar to the one returned by [`system`] but may host long running work items. Queue
> -/// flushing might take relatively long.
> +/// It is similar to the one returned by [`system_percpu`] but may host long running work items.
> +/// Queue flushing might take relatively long.
>   pub fn system_long() -> &'static Queue {
>       // SAFETY: `system_long_wq` is a C global, always available.
>       unsafe { Queue::from_raw(bindings::system_long_wq) }
> @@ -1065,7 +1077,7 @@ pub fn system_unbound() -> &'static Queue {
>   
>   /// Returns the system freezable work queue (`system_freezable_wq`).
>   ///
> -/// It is equivalent to the one returned by [`system`] except that it's freezable.
> +/// It is equivalent to the one returned by [`system_percpu`] except that it's freezable.
>   ///
>   /// A freezable workqueue participates in the freeze phase of the system suspend operations. Work
>   /// items on the workqueue are drained and no new work item starts execution until thawed.
> @@ -1078,7 +1090,7 @@ pub fn system_freezable() -> &'static Queue {
>   ///
>   /// It is inclined towards saving power and is converted to "unbound" variants if the
>   /// `workqueue.power_efficient` kernel parameter is specified; otherwise, it is similar to the one
> -/// returned by [`system`].
> +/// returned by [`system_percpu`].
>   pub fn system_power_efficient() -> &'static Queue {
>       // SAFETY: `system_power_efficient_wq` is a C global, always available.
>       unsafe { Queue::from_raw(bindings::system_power_efficient_wq) }
> @@ -1097,7 +1109,7 @@ pub fn system_freezable_power_efficient() -> &'static Queue {
>   
>   /// Returns the system bottom halves work queue (`system_bh_wq`).
>   ///
> -/// It is similar to the one returned by [`system`] but for work items which
> +/// It is similar to the one returned by [`system_percpu`] but for work items which
>   /// need to run from a softirq context.
>   pub fn system_bh() -> &'static Queue {
>       // SAFETY: `system_bh_wq` is a C global, always available.
>
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> change-id: 20261013-rust-workqueue-system-fix-5f9020c90f27
>
> Best regards,

