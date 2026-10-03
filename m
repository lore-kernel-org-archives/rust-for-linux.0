Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB04C283CAF
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791035958; cv=none; b=QF8RgzKdPEy9nN1+bCqeUig2KnnxBxc34toGe1V2edWRMysJ64pMp2gYFOuK01P1LLDEtMye2fB3CjEWQM/3Of4Ta4AhBhVyz5ITJ7Y2YDRWb1H1jlw+QTsq1HQ1kQXzw2Xm4vfzQWninGFg0SWn2e5KL1F6C0ed29Mnp7O7MAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791035958; c=relaxed/simple;
	bh=eencmhks016ST+HELA03ORjEIzoW1nMsvN2JU/zK9kU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Y6qNIqIFMJIxZWwjvdVt4V0+mKWIrgYG3SZ0BNP0gGMFc2/wm1v62/ri7ALslYKAVbXjkxrVeZ0lZMspGeLlWUf5MAOuQjwL8aIBVe9l05ozozxW5EIhLFmVZZK3W6UVOD7/Bt5BQZKKUxXutziUv2/YdYypxsBTQ85zx2hJmyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=h2954FIy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UIQk176r; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="h2954FIy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UIQk176r"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B01421400134
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 09:59:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 03 Oct 2026 09:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791035954;
	 x=1791122354; bh=q1i0K0XPXHEsjJcqq1fNvWtHR6ZnG8Kkar+fqAuaKj4=; b=
	h2954FIyV55gfFdLJY8kMj6K7bdElViL1/6zJY7d+k+KDA3vOo+WbMaxEvpkBwLL
	2HMVpDbz2vjkcK7juR4F7tJhV71E2wqibIjAKLVp08MA9ODlTpV0dXHgZN6aJCZw
	j4Q3yQK672IZ5U5+r4iHlkTtJl/gd2Wj8RFVogO9qMRsh0HyXirncYq/d9tgAQ+0
	DluO4/ierFZL9oKNYycu6X82tyKttgPjZxm7eYYaYQ8BxUfkiZmVKa5feJrguvdT
	DCuSDXRJTN3bIL+HCe6148uPmyN2QUB2B0Iw2VWksfbkhTX5Kr9JiTn2II0ktmpB
	26mIZHJ0ndMF39hzMA9ctg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791035954; x=
	1791122354; bh=q1i0K0XPXHEsjJcqq1fNvWtHR6ZnG8Kkar+fqAuaKj4=; b=U
	IQk176rUka9+1k+O2+7WK80MZJ3rqpU1M4VIIHaP8so9PIsojbxNzOmwlE0HqdL4
	EbkSFj20pK0/kM+fo85A8qV+WO6IW7I5dqym4sJgGSxKbprSY9F0iIXe1nt7XG9Z
	+hoYqFPNaD9h9rk0kjAbYp6+4Yebvtmc0zdZdeJfmd+aVHTiZXPyMNUYeocz5/1i
	WaT7hruMTWx/QDzm3FyVif4lHzp0pZs2ES+wR5M0DMs6PKF+o81op075fGfuG7B5
	F0kpMYNFPWGY6TklRdFN8f4W2ds62PZs3BPzZOQp6naky01bAk0PrPPx2qZww8KM
	eR75oNIB/dPmSipB70edg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791035954; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:Yjjn2RwpOJ/SQBL//j3KpBUkH/Io26mWrxpEw1/B3DwQTcu
	uMYj7z8pSwBIcYa8MEUI2vZpkdo0t/pCrQ/Lwsbmd2aKbiDKJK5WB2/4qHXBapFq
	he+NmERyzgpDKFZUUK1LTAFPJ8bHwLT7pOKfPyDgF0wqcU8cnp7V1Xer+U7IHKX/
	12we2fFsEqadafUd1n9tqAu7k4BY1lhRZO3SsSYKMGQrxXe8H+BvxGmObIQhRKZx
	Ee0WtYWBk8dteQZ5NZ4bMhONR5F1Gvx2MHG5hrVYD6rAph+KHjNcSj9mJmCZVXe+
	dr6BRxH/QM0KBW1t9DcoF8TbkTuE2j/c6qY0jnA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:v3vkRCp/DO/xom8Qdkn1I0co8bZIuEliPn4knBRfhlk=:eencmhks016ST+HELA03ORjEIzoW1nMsvN2JU/zK9kU=;
X-ME-Sender: <xms:MgrBau3lNP2x8o3NP3eivsFZ1l8oFQJefMBaHziAaaKIMTW_Quxy0Q>
    <xme:MgrBahhHPwa7pCliolDh52Itu1EKB6_LbqDTryyuxZY14Ps-JOWuYgfvzDW8M9E39
    9tyETuGwjbdgIpUaI-Blx0oBjmKOxJF3eR4DWJtlEyZ2M2_ECqKL1ri>
X-ME-Received: <xmr:MgrBampF1D28XXkZAU7a3pkhHldvMklwUxwhHmCM99t8OCSYKHp1aF_zZ00bDpVQdXpIPggb3Y4Wn7eAjajhPRHw>
X-ME-Proxy-Cause: dmFkZTEGlQF11KnTTTZuIdKdis1U+hL6340TBjtso4GWO10CHsf2an7yfoCCdDYuWlFjea
    nnY229JUlQL8DN8Wd9eoL+RhKA5K7GviUvZGmOl49D45p6omUrn+s9mz9s+U/OsVD9Za7I
    cx3z3j3uZ6EocRSgIdbtlUwmvKbfvz964klPXntf4otWyWZWwdz6FqeS3k1qYBW30ZGh6F
    T0LL9W14IsDZR4udiQ7hGdEIdmUC+HTE36xLhxahOugjXC63JVul3Mda+6zDJMfE2XcCWI
    F7/4tU7Xf8mv0s5HiREWhMc2cTjhtj/KN/nQwnfbtaiWVmtrvVe5MhJbSSqzAP68CvfqJE
    DFS+qXpSQZ6Z/H5H6R1TLuxYNXQsTpimVJJC41n3W7aDCmkda9SnZMduQf8znvexP7Hppu
    otxvW3hY6el4Yb/wXVCANMP85BpckqQmKzm65q787SzQksYWZ+wWQKVmZOgjRzciENeKZt
    LQDfHEieLavkJn0wpAyxfPnH7PoeZ9u4uIS2I4vqLbP9EElaT1KFLO7jAX9XtKmNDJEwMb
    BETDhz4cMxuuUH4/x8pZ/59fxSDt+TaqablNAeGdPjwKs+0aB+mceu2O8c8fiG7Lb20H3s
    tRsDrSrf1fEGRzjGCgdOmBXHz8t8qO3YDJ7/bpxtN1938aibLzpqDq/aCrmw
X-ME-Proxy: <xmx:MgrBasOZCEoGpEaNV2Ekp_g-dl9fX3gBHIBAOsO_2heOslO1E-ZoaQ>
    <xmx:MgrBaq20PTS5scbo3M7zqNpLbh2lGin6Hlh-NvaSpIv7MHbx1-QQdA>
    <xmx:MgrBaiq7yPfvS9b27OC6n9wLoUUge770T4G2h3hqBgDnOsbUGe_D1w>
    <xmx:MgrBasf0qOMawJLE3pCG39n0Ogn5JPbMF0wrdrHwYzGQKIqJnmlXUg>
    <xmx:MgrBatsh8sr_UA89KACOUp0OISmMApOWO35uK3e9-Raipc-8eAVOWwLv>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Oct 2026 09:59:10 -0400 (EDT)
Date: Sat, 03 Oct 2026 22:59:08 +0900 (JST)
Message-Id: <20261003.225908.849032593774477105.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, ojeda@kernel.org, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DLV8NYP3W5IC.WI8BE5QRCN6R@garyguo.net>
References: <20261003124828.119912-1-tomo@flapping.org>
	<DLV8NYP3W5IC.WI8BE5QRCN6R@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 03 Oct 2026 14:31:22 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Sat Oct 3, 2026 at 1:48 PM BST, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>

[...]

>> ---
>>  rust/compiler_builtins.rs                     | 93 +------------------
>>  .../intrinsics.rs}                            | 26 ++----
>>  rust/kernel/lib.rs                            |  2 +
>>  3 files changed, 12 insertions(+), 109 deletions(-)
>>  copy rust/{compiler_builtins.rs => kernel/intrinsics.rs} (74%)
>>
>> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
>> index fc6b54636dd5..87c19c22b107 100644
>> --- a/rust/compiler_builtins.rs
>> +++ b/rust/compiler_builtins.rs
>> @@ -6,15 +6,9 @@
>>  //! Since we do not need the vast majority of them, we avoid the dependency
>>  //! by providing this file.
> 
> The above paragraph needs some rewording too.

How about the following?

//! Rust provides [`compiler_builtins`] as a port of LLVM's [`compiler-rt`].
//! Since we do not need the vast majority of them, we avoid the dependency.
//! But `rustc` still needs a `#![compiler_builtins]` crate for every crate it
//! builds, so this crate is provided and left empty. The few builtins that
//! `core` needs are in the `kernel` crate (`rust/kernel/core_builtins.rs`).

>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 7225abc64084..b19d07f0c6f7 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -88,6 +88,8 @@
>>  pub mod init;
>>  pub mod interop;
>>  pub mod interrupt;
>> +#[cfg(not(testlib))]
>> +mod intrinsics;
> 
> We might want to explicit that this for redirected intrinsics from
> libcore?

How about renaming it to core_builtins.rs? core_intrinsics is also an
option, but I think that it could be confused with the
core::intrinsics module.
