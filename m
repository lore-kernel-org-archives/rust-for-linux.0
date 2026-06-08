Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69840370AEC;
	Mon,  8 Jun 2026 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919561; cv=none; b=j9RVnQLI+suSvMHg4ERNynAjGjS7lYoZ0MtrFTmls4tcND4g5EP8SCqDtSoLhkpv8F5LpW/2HOLv674+9b+/IfqzJWh/JEImyWRNs0bMJ3nDILDQIAqGs8AbmM3rDMUaBiq08G71CYd2ujfSaW9Ct/xzGV/oIKiOn9xlbtG91T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919561; c=relaxed/simple;
	bh=lcIbECbsUj0IFQQBITkraegJET6kGL2W2wJlfCYMyR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kZ6pwkRM+zPOzvJkURvNzfvTbAf3vxUAouHELstvLhO9jMQaIhBLRhUnL3CpSdp64LlZZWyYytdgOrGYM0fo4pVMfTJIUMzc8wC6hb5wIj0TeGqxMgZRVwIXp/k3njE2mQiwxtqx9EzD60ZfqPCAAPmI34ZXyJB+k39RqdNlKws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyF+RS9F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyF+RS9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF56F1F00898;
	Mon,  8 Jun 2026 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919560;
	bh=3KWuOy7voSP744PFUJMTm5c8hlbp5Ww8oclzL+Nyr48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WyF+RS9FIR/gagStaLWJmAjPujcI2J5fYQ8HiW21jj3UjSmcfzexSsU8Or1KjA3Rr
	 jY4zyfsmUJbFWXl3Km1l9qePylngPWumBjEkdMEoNPDM0YmUpNUoNF0pEocQiamWNP
	 1gp7MEa7LISgOpZJ/mGvQ8eg9Zk5mA4xjc0xd5bpe8ubXD5xnHHMHFpIxPfMZCIGlz
	 sG5AWLzbwBrapVTPkXBt10E3K72/aj+tjyfHP1cRDpkjm8nKVbbS1g86BgsQ2uM2bm
	 fLru4qiN5PZsLPneMucnUMEqjQz1cTO5ybfYH0U7K8Id3gjZtlKcEVtckmjfa+AAZH
	 TJKinrZLQ+QeQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rust: add a wrapper for the `nr_online_nodes` C
 function
In-Reply-To: <DJ3MAHWC1974.1MKBKAXGMNAJG@garyguo.net>
References: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org>
 <20260605-cpu-helpers-v2-2-0ad227f0d91b@kernel.org>
 <DJ3MAHWC1974.1MKBKAXGMNAJG@garyguo.net>
Date: Mon, 08 Jun 2026 13:52:29 +0200
Message-ID: <87wlw9gsg2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Fri Jun 5, 2026 at 1:54 PM BST, Andreas Hindborg wrote:
>> This function returns the number of online NUMA nodes.
>>
>> The wrapper is needed by the Rust null block driver.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/lib.rs  |  1 +
>>  rust/kernel/numa.rs | 19 +++++++++++++++++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index b72b2fbe046d..00713b2adcac 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -97,6 +97,7 @@
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>>  pub mod num;
>> +pub mod numa;
>>  pub mod of;
>>  #[cfg(CONFIG_PM_OPP)]
>>  pub mod opp;
>> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
>> new file mode 100644
>> index 000000000000..760db072a6c1
>> --- /dev/null
>> +++ b/rust/kernel/numa.rs
>> @@ -0,0 +1,19 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! NUMA topology utilities.
>> +//!
>> +//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
>> +
>> +use crate::bindings;
>> +
>> +/// Returns the number of online NUMA nodes.
>> +#[inline]
>> +pub fn num_online_nodes() -> u32 {
>> +    // NOTE: In some configurations, we can read this variable without an unsafe block.
>> +    // SAFETY: When NUMA is enabled, this is a global mutable static. We do as C and just read it,
>> +    // even though it might race.
>
> Can we do better and do a relaxed load instead?

Yes, that sounds reasonable.

But what are the semantics of a relaxed load when other writers are not
using atomic primitives? Does it make a difference?


Best regards,
Andreas Hindborg



