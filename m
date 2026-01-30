Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C4F34FF7C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772910; cv=none; b=mHlzE2cOI6uiFZVvL51I7UA/tMivqqeYeM/rtkJfdq+kBBAmlY9bftp1V47hChdqZsxPPWbuTWuld++3X8GBQtNp7MC2vfVnZ443OSk6EXWgfigNWO4jYdDLAC3KyJq3c/Ghl/1kND1nzQ6965Cj8ouklinFoQS5oxkC5ixfiwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772910; c=relaxed/simple;
	bh=n2kuZK+AmdnpiUxueVhxbinZ2/SypyxHxjQmPVjfQfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b/9gyjdsnP6IKtANVpT8NKgeuv+zmNvwOECc4WqzaPUKjZmjOUTwnU0le3W10KU4iahppgIUgfI8MTYalNrkAFx0ojvE1xKvpRJDmE26qKd290R05RANMd9fSc42VApTWXpnb/wGeMt6R7AR/aYvmthfpznRsn66N4+2YbZKPho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 30 Jan 2026 20:34:58 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: heesu0025.kim@lge.com
Received: from unknown (HELO heesu0025-kim-aosp-rust-binder.beeworker.bee-live.svc.cluster.local) (10.159.44.90)
	by 156.147.1.127 with ESMTP; 30 Jan 2026 20:34:58 +0900
X-Original-SENDERIP: 10.159.44.90
X-Original-MAILFROM: heesu0025.kim@lge.com
From: heesu0025.kim@lge.com
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jongan.kim@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com,
	tamird@gmail.com,
	tkjos@android.com,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se,
	yury.norov@gmail.com
Subject: Re: [PATCH v2 2/3] rust: pid: add Pid abstraction and init_pid_ns helper
Date: Fri, 30 Jan 2026 20:34:57 +0900
Message-Id: <20260130113457.21521-1-heesu0025.kim@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aXs3OjlGzQVABAwR@google.com>
References: <aXs3OjlGzQVABAwR@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jan 29, 2026 at 10:32:26AM +0000, Alice Ryhl wrote:
> On Thu, Jan 29, 2026 at 05:41:18PM +0900, jongan.kim@lge.com wrote:
>> From: HeeSu Kim <heesu0025.kim@lge.com>
>> 
>> Add a new Pid abstraction in rust/kernel/pid.rs that wraps the
>> kernel's struct pid and provides safe Rust interfaces for:
>> - find_vpid_with_guard: Find a pid by number under RCU protection
>> - pid_task_with_guard: Get the task associated with a pid under RCU
>>   protection
>> 
>> Also add init_pid_ns() helper function to pid_namespace.rs to get
>> a reference to the init PID namespace.
>> 
>> These abstractions use lifetime-bounded references tied to RCU guards
>> to ensure memory safety when accessing RCU-protected data structures.
>> 
>> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
>
> This looks really nice, thanks!
>
>> +//! Process identifiers (PIDs).
>> +//!
>> +//! C header: [`include/linux/pid.h`](srctree/include/linux/pid.h)
>> +
>> +use crate::{bindings, ffi::c_int, sync::rcu, task::Task, types::Opaque};
>
> Currently we use this formatting for imports:
>
> use crate::{
>     bindings,
>     ffi::c_int,
>     sync::rcu,
>     task::Task,
>     types::Opaque, //
> };
>
>> +/// Wraps the kernel's `struct pid`.
>> +///
>> +/// This structure represents the Rust abstraction for a C `struct pid`.
>> +/// A `Pid` represents a process identifier that can be looked up in different
>> +/// PID namespaces.
>> +#[repr(transparent)]
>> +pub struct Pid {
>> +    inner: Opaque<bindings::pid>,
>> +}
>
> I would implement Send, Sync, and AlwaysRefCounted for Pid too.
>
>> +            // SAFETY: `find_vpid` returns a valid pointer under RCU protection,
>> +            // and `Pid` is `#[repr(transparent)]` over `bindings::pid`.
>> +            Some(unsafe { &*(ptr as *const Self) })
>
> It would be nice to extract this cast into a Pid::from_raw().
>
>> +            // SAFETY: `pid_task` returns a valid pointer under RCU protection,
>> +            // and `Task` is `#[repr(transparent)]` over `bindings::task_struct`.
>> +            Some(unsafe { &*task_ptr.cast() })
>
> I think it would be nice to add a Task::from_raw() to avoid the cast
> here.
>
> 	Some(unsafe { Task::from_raw(task_ptr) })
>
>> +    pub fn pid_task_with_guard<'a>(&'a self, _rcu_guard: &'a rcu::Guard) -> Option<&'a Task> {
>> +    pub fn find_vpid_with_guard<'a>(nr: i32, _rcu_guard: &'a rcu::Guard) -> Option<&'a Self> {
>
> I think we can drop the 'with_guard' suffixes of these.
>
>> +/// Returns a reference to the init PID namespace.
>> +///
>> +/// This is the root PID namespace that exists throughout the lifetime of the kernel.
>> +#[inline]
>> +pub fn init_pid_ns() -> &'static PidNamespace {
>> +    // SAFETY: `init_pid_ns` is a global static that is valid for the lifetime of the kernel.
>> +    unsafe { PidNamespace::from_ptr(core::ptr::addr_of!(bindings::init_pid_ns)) }
>
> Simplifies to:
>
> 	PidNamespace::from_ptr(&raw const bindings::init_pid_ns)
>
> Alice

Thanks for the detailed review and feedback.

I agree with your suggestions. While our immediate use case only requires
RCU-protected access, implementing Send, Sync, and AlwaysRefCounted makes
sense from the broader rust/kernel perspective, as these abstractions
will likely be used in various contexts across the kernel.

I will incorporate all suggestions in the next revision.

Best Regards,
Heesu Kim
