Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858936604A
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 05:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769750570; cv=none; b=eCwoz53VYuOCdN4qkep9TCos8DDL1QmkcysZeu0XosmFCbk6DBCB4JCbr32U20pLho3TpULICIMlGWkXLEBWWeZ2cA8Wk0SJnWNiBPF9dX8M0Z8iJsGVIjkTdYzYUsWJoyT/TmvDg1J/A2WjCCuFNRCWuUKqHNaUhOCLsUHLVv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769750570; c=relaxed/simple;
	bh=Hpkdrdws2pA6RkGtLCIjaoMfeR2lyLe7vEn4kLWaIqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rDTPSK7WStknbo35tuI29PjBA0Zc2+1vVYoV0wMfdMTfUkgK7Vr9r/9zvaRZT0hdqKDJ69KHXpq4IgjV9G7phvPFwDikksT3UiufpH16fgsx00Mn91qD+3jbc/kS3pFi7UoVgUvZnO1Dz3ufVguJa03qQpzziGVti7HbwcO8aac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 30 Jan 2026 14:22:44 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: heesu0025.kim@lge.com
Received: from unknown (HELO heesu0025-kim-aosp-rust-binder.beeworker.bee-live.svc.cluster.local) (10.159.44.92)
	by 156.147.1.151 with ESMTP; 30 Jan 2026 14:22:44 +0900
X-Original-SENDERIP: 10.159.44.92
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
Subject: Re: [PATCH v2 3/3] rust_binder: handle PID namespace conversion for freeze operation
Date: Fri, 30 Jan 2026 14:22:44 +0900
Message-Id: <20260130052244.834450-1-heesu0025.kim@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aXs4B7Rib0_dBNSY@google.com>
References: <aXs4B7Rib0_dBNSY@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jan 29, 2026 at 10:35:42AM +0000, Alice Ryhl wrote:
> On Thu, Jan 29, 2026 at 05:41:19PM +0900, jongan.kim@lge.com wrote:
>> From: HeeSu Kim <heesu0025.kim@lge.com>
>>
>> Port PID namespace conversion logic from C binder to the Rust
>> implementation.
>>
>> Without namespace conversion, freeze operations from non-init namespaces
>> can match wrong processes due to PID collision. This adds proper
>> conversion to ensure freeze operations target the correct process.
>>
>> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
>
> Overall looks good, thanks!
>
>> +/// Convert a PID from the current namespace to the global (init) namespace.
>> +fn convert_to_init_ns_tgid(pid: u32) -> Result<i32> {
>
> Let's use the typedef task::Pid (of bindings::pid_t) here, so you can
> avoid the `init_ns_pid as _` cast below.
>
>> +    let current = kernel::current!();
>> +    let init_ns = init_pid_ns();
>> +
>> +    if current.active_pid_ns().map(|ns| ns.as_ptr()) == Some(init_ns.as_ptr()) {
>
> I'd like to avoid comparing raw pointers for this. Perhaps we should just provide
> an implementation of `==` for PidNamespace that compares the address?
>
> Alice

Thanks for the review.

I will address both suggestions in the next revision:
- Use task::Pid typedef to avoid the cast
- Implement PartialEq for PidNamespace for direct comparison

Best Regards,
Heesu Kim
